invisible(Sys.setlocale("LC_CTYPE", "en_US.UTF-8"))
args <- commandArgs(trailingOnly = TRUE)
base_dir <- if (length(args)) args[1L] else
  "quality_reports/research_pipeline/ppc_bpt/2026-10-11_carbon_application"
out_dir <- file.path(base_dir, "results")
x <- readRDS(file.path(out_dir, "central_exact_model.rds"))
fit <- x$model
cols <- c(SA = "#356792", CA = "#B56B31", HR = "#2B8273")
pct <- function(z, digits = 1) paste0(formatC(100 * z, digits = digits,
                                            format = "f", decimal.mark = ","), "%")

png(file.path(out_dir, "posterior_and_ppc.png"), width = 2450, height = 1100,
    res = 200, bg = "white")
layout(matrix(1:2, nrow = 1), widths = c(1.35, 1))
par(mar = c(4.3, 8.8, 4.6, 1.8), family = "sans", cex = 1.0)
bars <- cbind(
  c(fit$update0$prior, HR = 0),
  c(fit$update0$posterior, HR = 0),
  fit$update1$prior,
  fit$update1$posterior
)
bars <- bars[, 4:1]
centers <- barplot(bars, horiz = TRUE, col = cols, border = "white",
                  xlim = c(0, 1), axes = FALSE, space = .55,
                  names.arg = c("M1: posterior", "M1: prior", "M0: posterior", "M0: prior"),
                  las = 1, cex.names = .95, xlab = "Probabilidade da hipótese")
axis(1, at = seq(0, 1, .2), labels = pct(seq(0, 1, .2), 0), cex.axis = .9)
abline(v = 0, col = "#555555")
for (j in seq_len(ncol(bars))) {
  left <- 0
  for (i in seq_len(nrow(bars))) {
    if (bars[i, j] > .06) {
      text(left + bars[i, j] / 2, centers[j],
           paste0(rownames(bars)[i], ": ", pct(bars[i, j])),
           col = "white", cex = .80, font = 2)
    }
    left <- left + bars[i, j]
  }
}
title("Conclusão causal", line = 2.5, adj = 0, font.main = 2)
mtext("Exxon, primavera de 2021. Julgamentos centrais.", side = 3,
      line = 1.05, adj = 0, cex = .83)

par(mar = c(4.3, 5.0, 4.6, 2), family = "sans")
values <- c(fit$ppc0$tail_probability, fit$ppc1$tail_probability)
b <- barplot(values, names.arg = c("M0: SA e CA", "M1: inclui HR"),
             col = c("#708598", "#2B8273"), border = NA,
             ylim = c(0, .60), axes = FALSE, width = .6, space = .65,
             ylab = "Probabilidade posterior preditiva", cex.names = .93)
axis(2, at = seq(0, .6, .1), labels = pct(seq(0, .6, .1), 0), las = 1,
     cex.axis = .88)
abline(h = 0, col = "#555555")
text(b, values + .03, pct(values), font = 2, cex = 1.08)
title("Reprodução do relato", line = 2.5, adj = 0, font.main = 2)
mtext("PPC da discrepância T = presença do relato.", side = 3,
      line = 1.05, adj = 0, cex = .83)
dev.off()

rho <- seq(.02, .5, length.out = 241)
bf <- seq(.5, 12, length.out = 241)
surface <- outer(bf, rho, function(b, r) r * b / (1 - r + r * b))
png(file.path(out_dir, "judgment_sensitivity.png"), width = 2050, height = 1450,
    res = 200, bg = "white")
par(mar = c(5.3, 5.9, 4.4, 2), family = "sans", cex = 1)
palette <- colorRampPalette(c("#F6ECE0", "#B9D6CF", "#438F80", "#124F4B"))(100)
image(bf, rho, surface, col = palette, axes = FALSE,
      xlab = "Razão de verossimilhanças: HR / combinação de SA e CA",
      ylab = "Probabilidade inicial atribuída a HR",
      main = "Quando HR passa a receber a maioria da posterior?", cex.main = 1.12)
axis(1, at = c(1, 2, 4, 6, 8, 10, 12))
axis(2, at = seq(.05, .5, .05), labels = pct(seq(.05, .5, .05), 0), las = 1)
box(col = "#888888")
contour(bf, rho, surface, levels = c(.25, .50, .75),
        labels = c("25%", "50%", "75%"), add = TRUE,
        col = "#354746", lwd = c(1, 2.2, 1), labcex = .95)
central_bf <- x$results$BF_HR_vs_old
central_rho <- x$results$rho
points(central_bf, central_rho, pch = 21, bg = "#111111", col = "white",
       cex = 1.4, lwd = 1.5)
text(central_bf + .4, central_rho, "Central: 56,5%", pos = 4, font = 2,
     cex = .95, col = "#183C38")
mtext("O eixo horizontal inclui a probabilidade da desautorização, condicional ao relato.",
      side = 3, line = .5, adj = 0, cex = .79)
mtext("Cada ponto representa outro julgamento do pesquisador, sem ponderação uniforme sobre a superfície.",
      side = 1, line = 4.1, cex = .77)
dev.off()
