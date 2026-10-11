invisible(Sys.setlocale("LC_CTYPE", "en_US.UTF-8"))
args <- commandArgs(trailingOnly = TRUE)
base_dir <- if (length(args)) args[1L] else
  "quality_reports/research_pipeline/ppc_bpt/2026-10-11_carbon_application"
source(file.path(base_dir, "scripts", "exact_bayes.R"))
spec <- jsonlite::fromJSON(file.path(base_dir, "data", "model_spec.json"),
                           simplifyVector = TRUE)
out_dir <- file.path(base_dir, "results")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
write_csv <- function(x, name) {
  write.csv(x, file.path(out_dir, paste0(name, ".csv")),
            row.names = FALSE, fileEncoding = "UTF-8")
}

model_kernel <- function(q, d) {
  stopifnot(identical(names(q), names(d)), all(q >= 0 & q <= 1),
            all(d >= 0 & d <= 1))
  rbind(no_account = 1 - q,
        account_no_denial = q * (1 - d),
        account_denial = q * d)
}

fit_models <- function(pi, rho, epsilon_SA, epsilon_CA, lambda_R,
                       d_SA = .9, d_CA = .9, d_R = .9) {
  q0 <- c(SA = epsilon_SA, CA = epsilon_CA)
  d0 <- c(SA = d_SA, CA = d_CA)
  prior0 <- c(SA = pi, CA = 1 - pi)
  kernel0 <- model_kernel(q0, d0)
  q1 <- c(q0, HR = lambda_R)
  d1 <- c(d0, HR = d_R)
  prior1 <- c((1 - rho) * prior0, HR = rho)
  kernel1 <- model_kernel(q1, d1)
  obs <- spec$observed_state
  discrepancy <- setNames(spec$primary_discrepancy, spec$states)
  update0 <- posterior_from_state(prior0, kernel0, obs)
  update1 <- posterior_from_state(prior1, kernel1, obs)
  ppc0 <- exact_ppc(update0$posterior, kernel0, obs, discrepancy)
  ppc1 <- exact_ppc(update1$posterior, kernel1, obs, discrepancy)
  pre0 <- predictive_distribution(prior0, kernel0)
  pre1 <- predictive_distribution(prior1, kernel1)
  list(q0 = q0, q1 = q1, d0 = d0, d1 = d1,
       kernel0 = kernel0, kernel1 = kernel1,
       update0 = update0, update1 = update1,
       ppc0 = ppc0, ppc1 = ppc1,
       pre0 = pre0, pre1 = pre1)
}

as_result_row <- function(pars) {
  fit <- do.call(fit_models, pars)
  conditional_old <- pars$pi * pars$epsilon_SA * pars$d_SA +
    (1 - pars$pi) * pars$epsilon_CA * pars$d_CA
  likelihood_R <- pars$lambda_R * pars$d_R
  data.frame(
    as.data.frame(pars),
    M0_prior_predictive_account = sum(fit$update0$prior * fit$q0),
    M0_prior_predictive_observed = fit$update0$evidence_probability,
    M0_posterior_SA = unname(fit$update0$posterior["SA"]),
    M0_posterior_CA = unname(fit$update0$posterior["CA"]),
    M0_PPC_account_tail = fit$ppc0$tail_probability,
    M0_posterior_predictive_observed = fit$ppc0$observed_probability,
    M1_prior_predictive_account = sum(fit$update1$prior * fit$q1),
    M1_prior_predictive_observed = fit$update1$evidence_probability,
    M1_posterior_SA = unname(fit$update1$posterior["SA"]),
    M1_posterior_CA = unname(fit$update1$posterior["CA"]),
    M1_posterior_HR = unname(fit$update1$posterior["HR"]),
    M1_PPC_account_tail = fit$ppc1$tail_probability,
    M1_posterior_predictive_observed = fit$ppc1$observed_probability,
    BF_HR_vs_old = likelihood_R / conditional_old,
    rho_threshold_HR_majority = conditional_old / (likelihood_R + conditional_old),
    lambda_threshold_HR_majority =
      (1 - pars$rho) * conditional_old / (pars$rho * pars$d_R),
    dR_threshold_HR_majority =
      (1 - pars$rho) * conditional_old / (pars$rho * pars$lambda_R),
    stringsAsFactors = FALSE
  )
}

central <- spec$central
fit <- do.call(fit_models, central)
central_result <- as_result_row(central)
write_csv(central_result, "central_results")
saveRDS(list(specification = spec, model = fit, results = central_result),
        file.path(out_dir, "central_exact_model.rds"))

kernel_rows <- do.call(rbind, lapply(c("M0", "M1"), function(model) {
  i <- if (model == "M0") "0" else "1"
  kernel <- fit[[paste0("kernel", i)]]
  update <- fit[[paste0("update", i)]]
  data.frame(
    model = model,
    state = rep(rownames(kernel), ncol(kernel)),
    hypothesis = rep(colnames(kernel), each = nrow(kernel)),
    likelihood = as.vector(kernel),
    prior = rep(update$prior, each = nrow(kernel)),
    posterior = rep(update$posterior, each = nrow(kernel)),
    observed = rep(rownames(kernel) == spec$observed_state, ncol(kernel)),
    discrepancy = rep(spec$primary_discrepancy, ncol(kernel)),
    stringsAsFactors = FALSE
  )
}))
write_csv(kernel_rows, "central_kernel")

predictive_rows <- do.call(rbind, lapply(c("M0", "M1"), function(model) {
  i <- if (model == "M0") "0" else "1"
  data.frame(model = model, state = spec$states,
             prior_predictive = as.numeric(fit[[paste0("pre", i)]][spec$states]),
             posterior_predictive = as.numeric(
               fit[[paste0("ppc", i)]]$predictive_distribution[spec$states]),
             observed = spec$states == spec$observed_state,
             discrepancy = spec$primary_discrepancy)
}))
write_csv(predictive_rows, "central_predictive_states")

posterior_rows <- do.call(rbind, lapply(c("M0", "M1"), function(model) {
  i <- if (model == "M0") "0" else "1"
  update <- fit[[paste0("update", i)]]
  data.frame(model = model, hypothesis = names(update$posterior),
             prior = as.numeric(update$prior),
             likelihood_observed = as.numeric(update$likelihood),
             unnormalized_mass = as.numeric(update$prior * update$likelihood),
             evidence_probability = update$evidence_probability,
             posterior = as.numeric(update$posterior))
}))
write_csv(posterior_rows, "central_posterior_calculation")

# Eight named choices for the readable table, with only the indicated changes.
focal_changes <- list(
  central = list(),
  equal_account_likelihoods = list(epsilon_SA = .125, epsilon_CA = .125),
  low_false_account = list(epsilon_SA = .05, epsilon_CA = .05),
  more_false_accounts = list(epsilon_SA = .30, epsilon_CA = .30),
  less_disclosure_under_HR = list(lambda_R = .40),
  lower_prior_HR = list(rho = .10),
  less_denial_under_HR = list(d_R = .45),
  explicitly_borrowed_sector_split = list(pi = 10^.4 / (1 + 10^.4))
)
focal <- do.call(rbind, lapply(names(focal_changes), function(name) {
  pars <- modifyList(central, focal_changes[[name]])
  cbind(scenario = name, as_result_row(pars))
}))
rownames(focal) <- NULL
write_csv(focal, "focal_sensitivity")

grid <- do.call(expand.grid, c(spec$sensitivity, stringsAsFactors = FALSE))
grid$d_SA <- central$d_SA
grid$d_CA <- central$d_CA
# This is a deterministic sensitivity set, not a probability distribution over
# judgments. Do not interpret the share of favorable rows as posterior support.
grid_results <- do.call(rbind, lapply(seq_len(nrow(grid)), function(j) {
  as_result_row(as.list(grid[j, ]))
}))
rownames(grid_results) <- NULL
write_csv(grid_results, "sensitivity_full_grid")
saveRDS(grid_results, file.path(out_dir, "sensitivity_full_grid.rds"))

denial <- do.call(rbind, lapply(spec$sensitivity$d_R, function(value) {
  as_result_row(modifyList(central, list(d_R = value)))
}))
write_csv(denial, "denial_sensitivity")

# Coding the account as inconclusive removes the whole dependent record.
# It is not recoded as a zero, and no tail for a known account is then computed.
recoding <- posterior_rows[, c("model", "hypothesis", "prior")]
recoding$scenario <- "account_inconclusive_joint_record_omitted"
recoding$posterior <- recoding$prior
recoding$joint_likelihood_omitted <- TRUE
recoding$observed_account_PPC <- NA_real_
write_csv(recoding, "inconclusive_recoding")

# Exact majority frontiers. At equality HR has exactly half the posterior mass.
frontier_parameters <- expand.grid(
  epsilon_SA = spec$sensitivity$epsilon_SA,
  epsilon_CA = spec$sensitivity$epsilon_CA,
  lambda_R = spec$sensitivity$lambda_R,
  d_R = spec$sensitivity$d_R, stringsAsFactors = FALSE)
frontier_parameters$pi <- central$pi
frontier_parameters$d_SA <- central$d_SA
frontier_parameters$d_CA <- central$d_CA
evidence_old <- with(frontier_parameters,
  pi * epsilon_SA * d_SA + (1 - pi) * epsilon_CA * d_CA)
evidence_R <- with(frontier_parameters, lambda_R * d_R)
frontier_parameters$rho_threshold_HR_majority <-
  evidence_old / (evidence_old + evidence_R)
write_csv(frontier_parameters, "majority_frontiers")

# Endpoint behavior in the admitted prior parameter space. These rows use the
# central likelihoods and document the consequences of excluding a hypothesis.
endpoints <- do.call(rbind, lapply(c(0, 1), function(pi) {
  do.call(rbind, lapply(c(0, 1), function(rho) {
    as_result_row(modifyList(central, list(pi = pi, rho = rho)))
  }))
}))
write_csv(endpoints, "prior_endpoint_behavior")

# Original FC analysis: all16 evidence vectors are completed using explicit
# analyst anchors and conditional independence. This is separate from Exxon2021.
weights_db <- unlist(spec$published_FC$evidence_db_SA_CA)
prior_odds_FC <- 10^(spec$published_FC$prior_db_SA_CA / 10)
prior_FC <- c(SA = prior_odds_FC / (1 + prior_odds_FC),
              CA = 1 / (1 + prior_odds_FC))
states_FC <- enumerate_binary_states(names(weights_db))
original_states <- list()
original_results <- list()
original_item_probabilities <- list()
for (anchor in spec$FC_completion_appendix$favored_likelihood_anchors) {
  ratios <- 10^(abs(weights_db) / 10)
  item_SA <- ifelse(weights_db > 0, anchor, anchor / ratios)
  item_CA <- ifelse(weights_db < 0, anchor, anchor / ratios)
  kernel_FC <- sapply(list(SA = item_SA, CA = item_CA), function(probs) {
    apply(states_FC, 1L, function(y) prod(ifelse(y == 1, probs, 1 - probs)))
  })
  update_FC <- posterior_from_state(prior_FC, kernel_FC, "1111")
  ppc_FC <- exact_ppc(update_FC$posterior, kernel_FC, "1111")
  original_results[[as.character(anchor)]] <- data.frame(
    favored_anchor = anchor,
    posterior_SA = unname(update_FC$posterior["SA"]),
    posterior_CA = unname(update_FC$posterior["CA"]),
    prior_probability_observed = update_FC$evidence_probability,
    posterior_probability_observed = ppc_FC$observed_probability,
    PPC_probability_mass_rank = ppc_FC$tail_probability)
  original_states[[as.character(anchor)]] <- data.frame(
    favored_anchor = anchor, state = rownames(states_FC), states_FC,
    likelihood_SA = kernel_FC[, "SA"], likelihood_CA = kernel_FC[, "CA"],
    posterior_predictive = ppc_FC$predictive_distribution,
    discrepancy_surprisal = ppc_FC$discrepancy[, "SA"],
    in_tail = ppc_FC$discrepancy[, "SA"] >=
      ppc_FC$discrepancy["1111", "SA"] - 1e-10,
    observed = rownames(states_FC) == "1111")
  original_item_probabilities[[as.character(anchor)]] <- data.frame(
    favored_anchor = anchor, evidence = names(weights_db),
    published_db = weights_db,
    P_item_SA = item_SA, P_item_CA = item_CA,
    BF_SA_CA = item_SA / item_CA)
}
write_csv(do.call(rbind, original_results), "FC_completion_sensitivity")
write_csv(do.call(rbind, original_states), "FC_completion_all_states")
write_csv(do.call(rbind, original_item_probabilities), "FC_completion_item_likelihoods")
saveRDS(list(results = original_results, states = original_states,
             item_probabilities = original_item_probabilities),
        file.path(out_dir, "FC_completion_exact.rds"))

jsonlite::write_json(list(
  method = "Exact finite enumeration; no Monte Carlo",
  central = as.list(central_result[1, ]),
  grid_rows = nrow(grid_results),
  grid_is_probability_distribution = FALSE,
  primary_discrepancy = "One if a McCoy-type reputational account is observed",
  source_interview_is_one_record = TRUE,
  denial_is_conditioned_on_the_account = TRUE,
  posterior_updated_on = "Account plus denial, state account_denial",
  source_denial_independent_evidence_assumed = FALSE,
  judgment_timing = spec$judgment_timing,
  inconclusive_recoding_omits_joint_record = TRUE,
  prior_endpoint_rows = nrow(endpoints),
  original_FC_completion_is_separate = TRUE
), file.path(out_dir, "analysis_summary.json"), pretty = TRUE,
auto_unbox = TRUE, digits = 16)
writeLines(capture.output(sessionInfo()), file.path(out_dir, "sessionInfo.txt"))
print(central_result)
print(focal[, c("scenario", "M0_posterior_SA", "M0_PPC_account_tail",
               "M1_posterior_HR", "M1_PPC_account_tail")])
print(do.call(rbind, original_results))
cat("Exact sensitivity grid rows:", nrow(grid_results), "\n")
