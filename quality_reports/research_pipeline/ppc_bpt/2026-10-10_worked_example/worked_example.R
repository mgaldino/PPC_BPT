# Exemplo retrospectivo autorizado: fonte -> codificação -> posterior -> PPC.
# Executar da raiz do projeto. Somente base R; nenhum número causal elicitado.
base_dir <- file.path('quality_reports', 'research_pipeline', 'ppc_bpt',
                      '2026-10-10_worked_example')
out_dir <- file.path(base_dir, 'results')
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
cohort <- read.csv(file.path(base_dir, 'data', 'cohort.csv'), stringsAsFactors = FALSE)
signatories <- read.csv(file.path(base_dir, 'data', 'signatories.csv'), stringsAsFactors = FALSE)
stopifnot(nrow(cohort) == 8L, nrow(signatories) == 6L,
          !anyNA(cohort), !anyNA(signatories), !anyDuplicated(cohort$company),
          !anyDuplicated(cohort$company_2015), !anyDuplicated(signatories$company_2015),
          identical(sort(unique(cohort$region)), c('Europe', 'US')))
cohort$signed <- as.integer(cohort$company_2015 %in% signatories$company_2015)
excluded <- setdiff(signatories$company_2015, cohort$company_2015)
stopifnot(identical(excluded, 'BG'))
write.csv(cohort, file.path(out_dir, 'coded_data.csv'), row.names = FALSE)
writeLines(paste('Fora da coorte:', excluded), file.path(out_dir, 'scope_exclusions.txt'))

eu <- cohort$region == 'Europe'; us <- cohort$region == 'US'
n <- nrow(cohort); k <- sum(cohort$signed)
stopifnot(sum(eu) == 5L, sum(us) == 3L, k == 5L,
          all(cohort$signed[eu] == 1L), all(cohort$signed[us] == 0L))
T_obs <- abs(mean(cohort$signed[eu]) - mean(cohort$signed[us]))

# Enumerar TODOS os 2^8 vetores de réplica: sem erro Monte Carlo.
ys <- as.matrix(expand.grid(rep(list(0:1), n)))
colnames(ys) <- cohort$company
kr <- rowSums(ys)
Tr <- abs(rowMeans(ys[, eu, drop = FALSE]) - rowMeans(ys[, us, drop = FALSE]))
tail_event <- Tr >= T_obs - 1e-12
same_total <- kr == k
stopifnot(nrow(ys) == 256L, sum(tail_event) == 2L,
          sum(same_total) == choose(n, k), sum(tail_event & same_total) == 1L)

prior_grid <- data.frame(prior = c('Beta(0.5,0.5)', 'Beta(1,1)', 'Beta(2,2)'),
                         a = c(.5, 1, 2), b = c(.5, 1, 2))
calc <- function(a, b) {
  ap <- a + k; bp <- b + n - k
  pr <- exp(lbeta(ap + kr, bp + n - kr) - lbeta(ap, bp))
  # Não há coeficiente binomial: cada linha é UM vetor rotulado, não uma contagem.
  stopifnot(abs(sum(pr) - 1) < 1e-12)
  pc <- sum(pr[tail_event & same_total]) / sum(pr[same_total])
  stopifnot(abs(pc - 1 / choose(n, k)) < 1e-12)
  c(a_post = ap, b_post = bp, mean_post = ap / (ap + bp),
    ppc_abs = sum(pr[tail_event]), ppc_conditional_total = pc,
    pr_same_total = sum(pr[same_total]))
}
summary <- cbind(prior_grid, as.data.frame(t(mapply(calc, prior_grid$a, prior_grid$b))))
write.csv(summary, file.path(out_dir, 'prior_sensitivity.csv'), row.names = FALSE)

ap <- 6; bp <- 4
pr <- exp(lbeta(ap + kr, bp + n - kr) - lbeta(ap, bp))
prediction <- data.frame(ys, K_rep = kr, T_rep = Tr, probability = pr,
                         same_total = same_total, extreme = tail_event)
write.csv(prediction, file.path(out_dir, 'all_predictive_vectors.csv'), row.names = FALSE)

xe <- 2:5
counts <- choose(5, xe) * choose(3, k - xe)
cond <- data.frame(european_signers = xe, us_signers = k - xe,
                   possible_subsets = counts, probability = counts / choose(n, k))
stopifnot(sum(counts) == 56, abs(sum(cond$probability) - 1) < 1e-12)
write.csv(cond, file.path(out_dir, 'conditional_ppc.csv'), row.names = FALSE)

# Revisão observacional M1: parâmetros por região, independentes sob o prior.
# É pós-hoc e ajustada aos mesmos dados; não representa validação independente.
ke <- rowSums(ys[, eu, drop = FALSE]); ku <- rowSums(ys[, us, drop = FALSE])
p_region <- exp(lbeta(6 + ke, 1 + 5 - ke) - lbeta(6, 1) +
                  lbeta(1 + ku, 4 + 3 - ku) - lbeta(1, 4))
stopifnot(abs(sum(p_region) - 1) < 1e-12)
p_region_T <- sum(p_region[tail_event])

# Checagens relevantes: integração direta independente da enumeração de vetores.
p_integral <- integrate(function(theta) {
  (theta^5 * (1 - theta)^3 + theta^3 * (1 - theta)^5) * dbeta(theta, 6, 4)
}, lower = 0, upper = 1, rel.tol = 1e-12)$value
p_exact <- sum(pr[tail_event])
stopifnot(abs(p_integral - p_exact) < 1e-12, abs(p_exact - 0.006005758947) < 1e-11)
# Limite para qualquer prior/posterior em theta sob M0: max em theta=.5.
stopifnot(p_exact <= 1 / 128 + 1e-12)

results <- c(N = n, signers = k, raw_fraction = k / n, posterior_mean = ap/(ap+bp),
             T_obs = T_obs, ppc_absolute = p_exact,
             ppc_conditional = 1 / choose(n, k), prior_robust_bound = 1 / 128,
             ppc_region_model = p_region_T,
             posterior_mean_Europe_M1 = 6/7, posterior_mean_US_M1 = 1/5)
write.csv(data.frame(quantity = names(results), value = as.numeric(results)),
          file.path(out_dir, 'results.csv'), row.names = FALSE)
capture.output(sessionInfo(), file = file.path(out_dir, 'sessionInfo.txt'))
print(results, digits = 12)
print(summary, digits = 10, row.names = FALSE)

# Gerador equivalente para quem quiser simular; não é necessário executá-lo.
draw_y_rep <- function() {
  theta_rep <- rbeta(1, shape1 = 6, shape2 = 4)
  setNames(rbinom(8, size = 1, prob = theta_rep), cohort$company)
}

pdf(file.path(out_dir, 'conditional_ppc.pdf'), width = 8.8, height = 5,
    family = 'Helvetica', useDingbats = FALSE)
par(mar = c(5.2, 5, 2, 1), family = 'sans', las = 1)
bars <- barplot(100 * cond$probability, names.arg = cond$european_signers,
                col = c('#44617A', '#44617A', '#44617A', '#B14332'),
                border = NA, ylim = c(0, 65), ylab = 'Probabilidade preditiva (%)',
                xlab = 'Empresas europeias entre cinco signatárias na coorte')
text(bars, 100 * cond$probability + 3,
     labels = c('10/56', '30/56', '15/56', '1/56'), cex = 1)
text(bars[4], 16, labels = 'Observado: 5', col = '#B14332', cex = 1)
arrows(bars[4], 12, bars[4], 100*cond$probability[4]+5,
       length = .08, col = '#B14332', lwd = 1.3)
box(bty = 'l')
dev.off()
