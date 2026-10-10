# Exact likelihood-family calculation for the original E3 in Fairfield and
# Charman (2025). No absolute causal likelihood is estimated or elicited here.
# Every grid coordinate is a possible specification, not an observation.
# Run: Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods/causal_ppc.R

script_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
stopifnot(length(script_arg) == 1L)
run_dir <- dirname(normalizePath(sub("^--file=", "", script_arg)))
out_dir <- file.path(run_dir, "results")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

weights <- read.csv(file.path(run_dir, "data", "published_weights.csv"),
                    stringsAsFactors = FALSE)
stopifnot(identical(weights$stage, c("prior", "E1", "E2", "E3", "E4")),
          !anyNA(weights), !anyDuplicated(weights$stage),
          is.numeric(weights$woe_db_sa_vs_ca),
          all(weights$origin == "published_author_judgment"))

odds_to_prob <- function(odds) odds / (1 + odds)
posterior_db <- sum(weights$woe_db_sa_vs_ca)
prior_odds <- 10^(weights$woe_db_sa_vs_ca[weights$stage == "prior"] / 10)
w <- odds_to_prob(10^(posterior_db / 10))
r <- 10^(weights$woe_db_sa_vs_ca[weights$stage == "E3"] / 10)
other_bf <- 10^(sum(weights$woe_db_sa_vs_ca[
  !weights$stage %in% c("prior", "E3")]) / 10)
stopifnot(r > 1, w > 0, w < 1)

# The free coordinate is a = P(E3 = 1 | SA, C), not a random parameter.
# Its corresponding CA likelihood is b = a/r. The observed E3 rules out a=0;
# zero is retained only as the limiting boundary of the closure.
likelihood_matrix <- function(a, r) {
  stopifnot(length(a) == 1L, is.finite(a), a >= 0, a <= 1,
            length(r) == 1L, is.finite(r), r > 1)
  b <- a / r
  matrix(c(a, 1 - a, b, 1 - b), nrow = 2L,
         dimnames = list(c("Y=1", "Y=0"), c("SA", "CA")))
}

predictive_probability <- function(a, w, r) (w + (1 - w) / r) * a

# Inverse from two Bayes factors for an event and its exact complement.
# r1=r0=1 leaves the scale unidentified; it must not return a point estimate.
invert_complement_bf <- function(r1, r0) {
  stopifnot(length(r1) == 1L, length(r0) == 1L,
            is.finite(r1), is.finite(r0), r1 >= 1, r0 >= 0, r0 <= 1)
  if (r1 == 1 && r0 == 1) return(c(a = NA_real_, b = NA_real_))
  stopifnot(r1 > 1, r0 < 1)
  b <- (1 - r0) / (r1 - r0)
  c(a = r1 * b, b = b)
}

# This optional generator is supplied for reproducibility but is never called
# in this script. No simulated outcome is presented as a historical observation.
# a must be specified from outside; this function does not choose or estimate it.
drawrep <- function(n, a, w, r) {
  stopifnot(length(n) == 1L, n >= 1, n == as.integer(n),
            a > 0, a <= 1, w >= 0, w <= 1, r > 1)
  h_is_sa <- rbinom(n, size = 1L, prob = w)
  y <- rbinom(n, size = 1L, prob = ifelse(h_is_sa == 1L, a, a / r))
  data.frame(H_rep = ifelse(h_is_sa == 1L, "SA", "CA"), Y_rep = y)
}

q_max <- predictive_probability(1, w, r)
alpha <- 0.05  # Diagnostic illustration, not a calibrated testing rule.
a_cut <- alpha / q_max
b_cut <- a_cut / r
r0_cut <- (1 - a_cut) / (1 - b_cut)

# 1001 strictly positive specifications plus the unattainable zero limit.
a_grid <- c(0, seq_len(1001L) / 1001)
b_grid <- a_grid / r
q_grid <- predictive_probability(a_grid, w, r)
valid <- a_grid > 0
family <- data.frame(
  a_sa = a_grid, b_ca = b_grid,
  p_y0_sa = 1 - a_grid, p_y0_ca = 1 - b_grid,
  posterior_sa = ifelse(valid, w, NA_real_),
  bf_y1 = ifelse(valid, r, NA_real_),
  bf_y0 = (1 - a_grid) / (1 - b_grid),
  ppc_y1 = q_grid, predictive_y0 = 1 - q_grid,
  status = ifelse(valid, "possible_specification_not_estimate", "zero_limit_not_admissible_after_observed_E3"),
  stringsAsFactors = FALSE
)

# Verification of the mathematics and of this implementation. These checks do
# not validate the sources' substantive judgments or the auxiliary generator.
tol <- 1e-12
stopifnot(length(a_grid[valid]) == 1001L,
          all(family$a_sa >= 0 & family$a_sa <= 1),
          all(family$b_ca >= 0 & family$b_ca <= 1),
          max(abs(family$a_sa + family$p_y0_sa - 1)) < tol,
          max(abs(family$b_ca + family$p_y0_ca - 1)) < tol,
          max(abs(family$ppc_y1 + family$predictive_y0 - 1)) < tol,
          max(abs(a_grid[valid] / b_grid[valid] - r)) < tol,
          max(abs(odds_to_prob(prior_odds * other_bf *
                             a_grid[valid] / b_grid[valid]) - w)) < tol)
for (a in a_grid) {
  lk <- likelihood_matrix(a, r)
  stopifnot(max(abs(colSums(lk) - 1)) < tol,
            abs(sum(lk["Y=1", ] * c(w, 1 - w)) -
                predictive_probability(a, w, r)) < tol)
}
inverse_values <- vapply(family$bf_y0[valid], function(r0) {
  invert_complement_bf(r, r0)
}, numeric(2L))
stopifnot(max(abs(inverse_values["a", ] - a_grid[valid])) < tol,
          max(abs(inverse_values["b", ] - b_grid[valid])) < tol,
          all(is.na(invert_complement_bf(1, 1))),
          abs(predictive_probability(a_cut, w, r) - alpha) < tol,
          abs(predictive_probability(a_cut * (1 - 1e-6), w, r)) < alpha,
          predictive_probability(a_cut * (1 + 1e-6), w, r) > alpha,
          a_cut > 0, a_cut < 1,
          abs(q_max - (w + (1 - w) / r)) < tol,
          posterior_db == 4)

posterior_chain <- data.frame(
  stage = weights$stage,
  published_woe_db = weights$woe_db_sa_vs_ca,
  cumulative_db = cumsum(weights$woe_db_sa_vs_ca),
  sa_probability = odds_to_prob(10^(cumsum(weights$woe_db_sa_vs_ca) / 10)),
  origin = "arithmetic_from_published_author_judgments"
)
results <- data.frame(
  quantity = c("posterior_db", "posterior_odds_sa_ca", "posterior_sa", "bf_E3", "max_ca_likelihood", "ppc_lower_infimum", "ppc_upper_maximum", "ppc_coefficient_for_a", "positive_grid_specifications", "diagnostic_convention", "sa_likelihood_at_convention", "ca_likelihood_at_convention", "complement_bf_at_convention"),
  value = c(posterior_db, 10^(posterior_db / 10), w, r, 1 / r, 0, q_max, q_max, sum(valid), alpha, a_cut, b_cut, r0_cut),
  interpretation = c(
    "Sum of published prior and evidence judgments; not empirical frequency",
    "Posterior odds reconstructed from published judgments",
    "Original aggregate SA/CA comparison; not transferable to a single firm",
    "Likelihood ratio for the exact original E3 and prefix C",
    "Upper bound implied by normalization and fixed E3 likelihood ratio",
    "Unattained limit; E3 observed forbids exactly zero probability",
    "Attained at a=1 and b=1/r; admissible does not mean source-supported",
    "q(a)=coefficient*a for each fixed specification",
    "Numerical grid of models, not observations or elicited responses",
    "Illustrative cutoff only; no calibrated frequentist decision claim",
    "Missing absolute likelihood at which q equals the illustrative cutoff",
    "Corresponding CA likelihood; no likelihood value has been selected",
    "Corresponding exact-complement ratio; not elicited or estimated"
  ), stringsAsFactors = FALSE
)
frontier <- data.frame(
  diagnostic_convention = alpha, a_sa_at_boundary = a_cut,
  b_ca_at_boundary = b_cut, r0_at_boundary = r0_cut,
  condition_for_q_below_convention = "a_sa < a_sa_at_boundary",
  condition_for_q_above_convention = "a_sa > a_sa_at_boundary",
  status = "algebraic_frontier_not_estimate_or_elicited_bound"
)

options(digits = 17)
write.csv(results, file.path(out_dir, "results.csv"), row.names = FALSE)
write.csv(family, file.path(out_dir, "family.csv"), row.names = FALSE, na = "NA")
write.csv(frontier, file.path(out_dir, "frontier.csv"), row.names = FALSE)
write.csv(posterior_chain, file.path(out_dir, "posterior_chain.csv"), row.names = FALSE)
capture.output(sessionInfo(), file = file.path(out_dir, "sessionInfo.txt"))

# Vector graphics use the built-in PDF device, avoiding a system X11 dependency.
pdf(file.path(out_dir, "ppc_family.pdf"), width = 8, height = 5.4,
    family = "Helvetica", useDingbats = FALSE)
par(mar = c(5.3, 5.0, 2.8, 1.3), mgp = c(3.3, 0.8, 0), las = 1,
    cex.axis = 0.95, cex.lab = 1.02)
plot(a_grid, q_grid, type = "n", xlim = c(0, 1), ylim = c(0, 1),
     xaxs = "i", yaxs = "i",
     xlab = "a = P(E3 | SA, C): escala ainda desconhecida",
     ylab = "Probabilidade preditiva de E3",
     main = "Mesmo Bayes factor, diferentes PPCs")
abline(h = seq(0.2, 1, by = 0.2), col = "#e5e7eb", lwd = 0.6)
abline(h = alpha, col = "#b45309", lty = 2, lwd = 1.4)
segments(a_cut, 0, a_cut, alpha, col = "#b45309", lty = 2, lwd = 1.4)
lines(a_grid, q_grid, col = "#1e40af", lwd = 2.4)
points(0, 0, pch = 21, bg = "white", col = "#1e40af", cex = 1.1, xpd = NA)
points(1, q_max, pch = 19, col = "#1e40af", cex = 1.1, xpd = NA)
text(0.98, q_max + 0.045, "Máximo: 0,733219", adj = 1, col = "#1e40af", cex = 0.96)
text(0.40, 0.085, "0,05: convenção ilustrativa", adj = 0, col = "#92400e", cex = 0.92)
text(0.35, 0.87, "Cada ponto é uma especificação possível.\nNenhum ponto foi escolhido ou estimado.",
     adj = 0, col = "#374151", cex = 0.97)
mtext("Zero é limite incompatível com atualizar após E3 observado.", side = 1,
      line = 4.25, cex = 0.82, col = "#4b5563")
invisible(dev.off())

cat("PASS: exact normalization, fixed Bayes factor, posterior invariance,\n",
    "complement inversion, and diagnostic frontier over 1001 positive specifications.\n", sep = "")
print(results[, c("quantity", "value")], row.names = FALSE)
