#!/usr/bin/env Rscript
# Hypothetical iid multinomial benchmark for finite-sample deviations.
# This is NOT a confidence interval, calibration test, or p-value for an LLM.
# LLM worlds within the same call may be dependent; iid is imposed only here.

options(stringsAsFactors = FALSE, digits = 17)
file_arg <- commandArgs(trailingOnly = FALSE)
file_arg <- file_arg[grepl("^--file=", file_arg)]
if (length(file_arg) != 1L) stop("Run this file using Rscript.")
pilot_dir <- dirname(dirname(normalizePath(sub("^--file=", "", file_arg))))
theory <- read.csv(file.path(pilot_dir, "results", "theory.csv"))
worlds <- read.csv(file.path(pilot_dir, "data", "worlds.csv"))
stopifnot(all(c("A", "B", "C") %in% worlds$arm))

n_worlds <- 32L
n_replicates <- 100000L
seed <- 2026101102L
RNGkind(kind = "Mersenne-Twister", normal.kind = "Inversion",
        sample.kind = "Rejection")
set.seed(seed)

key <- function(d) paste0(d$Q, d$K, d$A)
sim <- list()
observed <- list()

for (hypothesis in c("SA", "CA")) {
  ref <- theory[theory$H == hypothesis, ]
  stopifnot(nrow(ref) == 8L, abs(sum(ref$prob) - 1) < 1e-12)
  draws <- rmultinom(n_replicates, size = n_worlds, prob = ref$prob) / n_worlds
  event_rows <- ref$Q == 1L & ref$A == 1L
  sim[[paste0("tv_", hypothesis)]] <-
    colSums(abs(sweep(draws, 1L, ref$prob, FUN = "-"))) / 2
  sim[[paste0("likelihood_", hypothesis)]] <- colSums(draws[event_rows, ])
  for (arm in c("A", "B", "C")) {
    dat <- worlds[worlds$arm == arm & worlds$H == hypothesis, ]
    stopifnot(nrow(dat) == n_worlds)
    empirical <- as.numeric(table(factor(key(dat), levels = key(ref)))) / n_worlds
    observed[[paste(arm, "tv", hypothesis, sep = "_")]] <-
      sum(abs(empirical - ref$prob)) / 2
    observed[[paste(arm, "likelihood", hypothesis, sep = "_")]] <-
      mean(dat$Q * dat$A)
  }
}

sim$ppc_joint_fixed_weights <- 0.6 * sim$likelihood_SA + 0.4 * sim$likelihood_CA
for (arm in c("A", "B", "C")) {
  observed[[paste0(arm, "_ppc_joint_fixed_weights")]] <-
    0.6 * observed[[paste0(arm, "_likelihood_SA")]] +
    0.4 * observed[[paste0(arm, "_likelihood_CA")]]
}

targets <- c(tv_SA = 0, tv_CA = 0,
             likelihood_SA = 0.375, likelihood_CA = 0.25,
             ppc_joint_fixed_weights = 0.325)
analytic_sd <- c(tv_SA = NA_real_, tv_CA = NA_real_,
                 likelihood_SA = sqrt(0.375 * 0.625 / n_worlds),
                 likelihood_CA = sqrt(0.25 * 0.75 / n_worlds),
                 ppc_joint_fixed_weights =
                   sqrt((0.6^2 * 0.375 * 0.625 + 0.4^2 * 0.25 * 0.75) / n_worlds))

benchmark <- do.call(rbind, lapply(names(targets), function(metric) {
  values <- sim[[metric]]
  target <- targets[[metric]]
  obs_a <- observed[[paste0("A_", metric)]]
  obs_b <- observed[[paste0("B_", metric)]]
  obs_c <- observed[[paste0("C_", metric)]]
  stopifnot(abs(obs_b - obs_c) < 1e-12)
  qs <- quantile(values, probs = c(0.025, 0.05, 0.5, 0.95, 0.975),
                 names = FALSE, type = 1)
  fraction_a <- mean(abs(values - target) >= abs(obs_a - target) - 1e-12)
  fraction_b <- mean(abs(values - target) >= abs(obs_b - target) - 1e-12)
  data.frame(
    metric = metric,
    reference_assumption = "hypothetical_iid_worlds_not_established_for_LLM",
    target = target,
    n_per_hypothesis = n_worlds,
    replications = n_replicates,
    seed = seed,
    iid_mean = mean(values),
    iid_sd = sd(values),
    analytic_iid_sd = analytic_sd[[metric]],
    iid_q025 = qs[1L], iid_q05 = qs[2L], iid_q50 = qs[3L],
    iid_q95 = qs[4L], iid_q975 = qs[5L],
    observed_A = obs_a,
    observed_B = obs_b,
    observed_C = obs_c,
    iid_fraction_abs_error_ge_A = fraction_a,
    iid_fraction_abs_error_ge_B = fraction_b,
    fraction_A_Monte_Carlo_SE = sqrt(fraction_a * (1 - fraction_a) / n_replicates),
    fraction_B_Monte_Carlo_SE = sqrt(fraction_b * (1 - fraction_b) / n_replicates)
  )
}))
row.names(benchmark) <- NULL
write.csv(benchmark, file.path(pilot_dir, "results", "iid_benchmark.csv"),
          row.names = FALSE)
print(benchmark[c("metric", "iid_mean", "iid_q025", "iid_q975",
                  "observed_A", "observed_B",
                  "iid_fraction_abs_error_ge_A", "iid_fraction_abs_error_ge_B")],
      row.names = FALSE, digits = 6)
cat("This iid reference does not certify calibration or independence of the LLM.\n")
