invisible(Sys.setlocale("LC_CTYPE", "en_US.UTF-8"))
args <- commandArgs(trailingOnly = TRUE)
base_dir <- if (length(args)) args[1L] else
  "quality_reports/research_pipeline/ppc_bpt/2026-10-11_carbon_application"
source_path <- file.path(base_dir, "data", "published_weights.csv")
published <- read.csv(source_path, stringsAsFactors = FALSE)
stopifnot(identical(published$stage, c("prior", "E1", "E2", "E3", "E4")),
          identical(published$woe_db_sa_vs_ca, c(6L, -4L, -3L, 12L, -7L)))
published$cumulative_db_sa_vs_ca <- cumsum(published$woe_db_sa_vs_ca)
published$odds_sa_vs_ca <- 10^(published$cumulative_db_sa_vs_ca / 10)
published$probability_sa <- published$odds_sa_vs_ca / (1 + published$odds_sa_vs_ca)
published$probability_ca <- 1 - published$probability_sa
dir.create(file.path(base_dir, "results"), recursive = TRUE, showWarnings = FALSE)
write.csv(published, file.path(base_dir, "results", "published_posterior_chain.csv"),
          row.names = FALSE, fileEncoding = "UTF-8")
writeLines(capture.output(sessionInfo()), file.path(base_dir, "results", "sessionInfo.txt"))
print(published)
