# Independent algebraic audit. Does not source implementation functions.
args <- commandArgs(trailingOnly = TRUE)
base_dir <- if (length(args)) args[1L] else
  "quality_reports/research_pipeline/ppc_bpt/2026-10-11_carbon_application"
results <- file.path(base_dir, "results")
spec <- jsonlite::fromJSON(file.path(base_dir, "data", "model_spec.json"))
errors <- numeric()
counts <- integer()
check <- function(label, actual, expected, tol = 1e-10) {
  if (length(actual) != length(expected)) stop(label, ": unequal lengths")
  same_infinite <- is.infinite(actual) & is.infinite(expected) &
    sign(actual) == sign(expected)
  same_na <- is.na(actual) & is.na(expected)
  use <- !(same_infinite | same_na)
  if (anyNA(actual[use]) || anyNA(expected[use])) stop(label, ": NA mismatch")
  delta <- abs(actual[use] - expected[use])
  if (any(!is.finite(delta)) || any(delta > tol)) stop(label, ": numeric mismatch")
  errors[label] <<- if (length(delta)) max(delta) else 0
  counts[label] <<- length(actual)
}

audit_table <- function(name) {
  x <- read.csv(file.path(results, paste0(name, ".csv")))
  a <- x$epsilon_SA
  b <- x$epsilon_CA
  l <- x$lambda_R
  p <- x$pi
  r <- x$rho
  A <- a * x$d_SA
  B <- b * x$d_CA
  L <- l * x$d_R
  old <- p * A + (1 - p) * B
  new <- (1 - r) * old + r * L
  wanted <- list(
    M0_prior_predictive_account = p * a + (1 - p) * b,
    M0_prior_predictive_observed = old,
    M0_posterior_SA = p * A / old,
    M0_posterior_CA = (1 - p) * B / old,
    M0_PPC_account_tail = (p * A * a + (1 - p) * B * b) / old,
    M0_posterior_predictive_observed = (p * A^2 + (1 - p) * B^2) / old,
    M1_prior_predictive_account = (1 - r) * (p * a + (1 - p) * b) + r * l,
    M1_prior_predictive_observed = new,
    M1_posterior_SA = (1 - r) * p * A / new,
    M1_posterior_CA = (1 - r) * (1 - p) * B / new,
    M1_posterior_HR = r * L / new,
    M1_PPC_account_tail = ((1 - r) * (p * A * a + (1 - p) * B * b) + r * L * l) / new,
    M1_posterior_predictive_observed = ((1 - r) * (p * A^2 + (1 - p) * B^2) + r * L^2) / new,
    BF_HR_vs_old = L / old,
    rho_threshold_HR_majority = old / (old + L),
    lambda_threshold_HR_majority = (1 - r) * old / (r * x$d_R),
    dR_threshold_HR_majority = (1 - r) * old / (r * l)
  )
  for (nm in names(wanted)) check(paste(name, nm, sep = "/"), x[[nm]], wanted[[nm]])
  invisible(x)
}

central <- audit_table("central_results")
grid <- audit_table("sensitivity_full_grid")
focal <- audit_table("focal_sensitivity")
denial <- audit_table("denial_sensitivity")
endpoint <- audit_table("prior_endpoint_behavior")
recoding <- read.csv(file.path(results, "inconclusive_recoding.csv"))
stopifnot(all(recoding$joint_likelihood_omitted), all(is.na(recoding$observed_account_PPC)))
check("inconclusive_recoding", recoding$posterior, recoding$prior)
expected_n <- prod(vapply(spec$sensitivity, length, integer(1)))
stopifnot(nrow(grid) == expected_n)
parameter_names <- c(names(spec$sensitivity), "d_SA", "d_CA")
stopifnot(anyDuplicated(grid[parameter_names]) == 0)
for (nm in names(spec$sensitivity)) {
  stopifnot(all(vapply(grid[[nm]], function(v) any(abs(v - spec$sensitivity[[nm]]) < 1e-12), logical(1))))
}

k <- read.csv(file.path(results, "central_kernel.csv"))
cc <- spec$central
q <- c(SA = cc$epsilon_SA, CA = cc$epsilon_CA, HR = cc$lambda_R)
d <- c(SA = cc$d_SA, CA = cc$d_CA, HR = cc$d_R)
wantk <- ifelse(k$state == "no_account", 1 - q[k$hypothesis],
  ifelse(k$state == "account_no_denial", q[k$hypothesis] * (1 - d[k$hypothesis]),
    q[k$hypothesis] * d[k$hypothesis]))
check("central_kernel_likelihoods", k$likelihood, wantk)
normalizers <- aggregate(k$likelihood, k[c("model", "hypothesis")], sum)$x
check("kernel_normalization", normalizers, rep(1, length(normalizers)))

pred <- read.csv(file.path(results, "central_predictive_states.csv"))
for (m in unique(pred$model)) {
  km <- k[k$model == m, ]
  for (s in pred$state[pred$model == m]) {
    kk <- km[km$state == s, ]
    pr <- pred[pred$model == m & pred$state == s, ]
    check(paste(m, s, "predictive", sep = "/"),
          c(pr$prior_predictive, pr$posterior_predictive),
          c(sum(kk$prior * kk$likelihood), sum(kk$posterior * kk$likelihood)))
  }
}

frontiers <- read.csv(file.path(results, "majority_frontiers.csv"))
old <- with(frontiers, pi * epsilon_SA * d_SA + (1 - pi) * epsilon_CA * d_CA)
new <- with(frontiers, lambda_R * d_R)
check("frontier_equality", frontiers$rho_threshold_HR_majority * new,
      (1 - frontiers$rho_threshold_HR_majority) * old)

fc <- read.csv(file.path(results, "FC_completion_all_states.csv"), colClasses = c(state = "character"))
fc_summary <- read.csv(file.path(results, "FC_completion_sensitivity.csv"))
db <- unlist(spec$published_FC$evidence_db_SA_CA)
prior_odds <- 10^(spec$published_FC$prior_db_SA_CA / 10)
prior <- prior_odds / (1 + prior_odds)
post_odds <- prior_odds * prod(10^(db / 10))
posterior <- post_odds / (1 + post_odds)
for (anchor in unique(fc$favored_anchor)) {
  rows <- fc[fc$favored_anchor == anchor, ]
  stopifnot(nrow(rows) == 16, length(unique(rows$state)) == 16)
  pa <- pmin(1, 10^(db / 10)) * anchor
  pb <- pmin(1, 10^(-db / 10)) * anchor
  y <- as.matrix(rows[names(db)])
  # Evaluate every joint probability via independent log-Bernoulli arithmetic.
  la <- exp(y %*% log(pa) + (1 - y) %*% log(1 - pa))[, 1]
  lb <- exp(y %*% log(pb) + (1 - y) %*% log(1 - pb))[, 1]
  pred <- posterior * la + (1 - posterior) * lb
  check(paste(anchor, "FC_likelihood_SA"), rows$likelihood_SA, la)
  check(paste(anchor, "FC_likelihood_CA"), rows$likelihood_CA, lb)
  check(paste(anchor, "FC_predictive"), rows$posterior_predictive, pred)
  check(paste(anchor, "FC_normalization"), c(sum(la), sum(lb), sum(pred)), rep(1, 3))
  s <- fc_summary[fc_summary$favored_anchor == anchor, ]
  obs <- match("1111", rows$state)
  tail <- pred <= pred[obs] * exp(1e-10)
  stopifnot(identical(unname(rows$in_tail), unname(tail)))
  check(paste(anchor, "FC_summary"),
    unlist(s[c("posterior_SA", "posterior_CA", "prior_probability_observed",
               "posterior_probability_observed", "PPC_probability_mass_rank")]),
    c(posterior, 1 - posterior, prior * la[obs] + (1 - prior) * lb[obs], pred[obs], sum(pred[tail])))
}

reviewed_files <- c(
  "data/model_spec.json", "data/evidence_codebook.json", "data/judgment_ledger.csv",
  "scripts/exact_bayes.R", "scripts/analyze_application.R", "scripts/reproduce_published.R",
  "results/central_results.csv", "results/central_kernel.csv",
  "results/central_predictive_states.csv", "results/central_posterior_calculation.csv",
  "results/sensitivity_full_grid.csv", "results/focal_sensitivity.csv",
  "results/denial_sensitivity.csv", "results/prior_endpoint_behavior.csv",
  "results/inconclusive_recoding.csv", "results/majority_frontiers.csv",
  "results/FC_completion_all_states.csv", "results/FC_completion_sensitivity.csv",
  "results/FC_completion_item_likelihoods.csv", "agents/independent_audit.R")
stopifnot(all(file.exists(file.path(base_dir, reviewed_files))))
sha_lines <- system2("shasum", c("-a", "256", shQuote(file.path(base_dir, reviewed_files))), stdout = TRUE)
sha_values <- sub(" .*", "", sha_lines)
stopifnot(length(sha_values) == length(reviewed_files), all(nchar(sha_values) == 64))
hashes <- setNames(as.list(sha_values), reviewed_files)
summary <- list(
  status = "PASS",
  method = "Independent direct algebra, without sourcing implementation functions",
  main_grid_rows = nrow(grid),
  checked_numeric_values = sum(counts),
  checks = length(counts),
  maximum_absolute_error = max(errors),
  source_fidelity = "Reviewed separately in agents/design_review.md and agents/source_assessment.md",
  scientific_status = "Numerical correctness conditional on explicit analyst judgments",
  reviewed_sha256 = hashes
)
jsonlite::write_json(summary, file.path(base_dir, "agents", "independent_audit_results.json"),
                     pretty = TRUE, auto_unbox = TRUE, digits = 16)
write.csv(data.frame(check = names(counts), n_values = unname(counts),
                     max_abs_error = unname(errors)),
          file.path(base_dir, "agents", "independent_audit_checks.csv"), row.names = FALSE)
print(summary)
