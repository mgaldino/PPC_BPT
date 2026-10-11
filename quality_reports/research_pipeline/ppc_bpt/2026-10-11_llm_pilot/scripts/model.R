#!/usr/bin/env Rscript
# Synthetic causal reference for the carbon LLM pilot.
# All probabilities below are didactic choices frozen in design.md.
# They were not estimated from historical sources or elicited from experts.
# This script owns only the B/C latent states and the exact reference outputs.

options(stringsAsFactors = FALSE, digits = 17)

file_arg <- commandArgs(trailingOnly = FALSE)
file_arg <- file_arg[grepl("^--file=", file_arg)]
if (length(file_arg) != 1L) {
  stop("Run with Rscript path/to/scripts/model.R")
}
script_path <- normalizePath(sub("^--file=", "", file_arg), mustWork = TRUE)
pilot_dir <- dirname(dirname(script_path))
data_dir <- file.path(pilot_dir, "data")
results_dir <- file.path(pilot_dir, "results")
dir.create(data_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(results_dir, recursive = TRUE, showWarnings = FALSE)

adoption_probability <- function(H, Q, K) {
  if (any(!H %in% c("SA", "CA")) ||
      any(!Q %in% 0:1) || any(!K %in% 0:1)) {
    stop("H must be SA/CA; Q and K must be binary.")
  }
  0.1 + ifelse(H == "SA", 0.6, 0.1) * Q +
    ifelse(H == "SA", 0.1, 0.6) * K
}

# B: independent draws from the stipulated model, not from an LLM.
# C reuses these exact states; it does not receive a second RNG sample.
seed <- 20261011L
n_per_hypothesis <- 32L
RNGkind(kind = "Mersenne-Twister", normal.kind = "Inversion",
        sample.kind = "Rejection")
set.seed(seed)

state_list <- lapply(c("SA", "CA"), function(hypothesis) {
  Q <- rbinom(n_per_hypothesis, size = 1L, prob = 0.5)
  K <- rbinom(n_per_hypothesis, size = 1L, prob = 0.5)
  A <- rbinom(n_per_hypothesis, size = 1L,
              prob = adoption_probability(hypothesis, Q, K))
  data.frame(
    id = sprintf("B_%s_%02d", hypothesis, seq_len(n_per_hypothesis)),
    H = hypothesis,
    batch = rep(seq_len(4L), each = 8L),
    Q = Q,
    K = K,
    A = A
  )
})
states <- do.call(rbind, state_list)
row.names(states) <- NULL

stopifnot(nrow(states) == 64L, !anyNA(states), !anyDuplicated(states$id),
          all(table(states$H, states$batch) == 8L),
          all(states$Q %in% 0:1), all(states$K %in% 0:1),
          all(states$A %in% 0:1))

# Exact conditional joint distribution P(Q,K,A | H); Q,K iid Bernoulli(.5).
theory_list <- lapply(c("SA", "CA"), function(hypothesis) {
  grid <- expand.grid(Q = 0:1, K = 0:1, A = 0:1)
  adoption_p <- adoption_probability(hypothesis, grid$Q, grid$K)
  data.frame(
    H = hypothesis,
    Q = grid$Q,
    K = grid$K,
    A = grid$A,
    prob = 0.25 * ifelse(grid$A == 1L, adoption_p, 1 - adoption_p)
  )
})
theory <- do.call(rbind, theory_list)
row.names(theory) <- NULL

mass <- function(hypothesis, indicator) {
  sum(theory$prob[theory$H == hypothesis & indicator])
}
hypotheses <- c("SA", "CA")
total_mass <- vapply(hypotheses, mass, numeric(1L),
                     indicator = rep(TRUE, nrow(theory)))
observed_event <- theory$Q == 1L & theory$A == 1L
likelihood <- vapply(hypotheses, mass, numeric(1L),
                     indicator = observed_event)
prior <- c(SA = 0.5, CA = 0.5)
evidence_probability <- sum(prior * likelihood)
posterior <- prior * likelihood / evidence_probability

# Principal PPC: replicate Q,K,A; T=Q+A and observed T=2.
tail_by_hypothesis <- vapply(hypotheses, mass, numeric(1L),
                            indicator = theory$Q + theory$A >= 2L)
ppc_joint <- sum(posterior * tail_by_hypothesis)

# Secondary target: hold the replicated proposal Q=1 fixed.
q1_mass <- vapply(hypotheses, mass, numeric(1L),
                  indicator = theory$Q == 1L)
conditional_likelihood <- likelihood / q1_mass
conditional_posterior <- prior * conditional_likelihood /
  sum(prior * conditional_likelihood)
ppc_conditional_q1 <- sum(conditional_posterior * conditional_likelihood)

adoption_marginal <- vapply(hypotheses, mass, numeric(1L),
                            indicator = theory$A == 1L)
competitive_adoption <- vapply(hypotheses, mass, numeric(1L),
                               indicator = theory$K == 1L & theory$A == 1L)

# Internal implementation invariants; independent auditing is done separately.
tol <- 1e-12
stopifnot(nrow(theory) == 16L, !anyNA(theory),
          all(theory$prob > 0), all(theory$prob <= 1),
          max(abs(total_mass - 1)) < tol,
          max(abs(likelihood - c(SA = 0.375, CA = 0.25))) < tol,
          max(abs(posterior - c(SA = 0.6, CA = 0.4))) < tol,
          max(abs(conditional_posterior - posterior)) < tol,
          max(abs(adoption_marginal - 0.45)) < tol,
          abs(ppc_joint - 0.325) < tol,
          abs(ppc_conditional_q1 - 0.65) < tol)

model_summary <- data.frame(
  metric = c(
    "seed", "n_per_hypothesis", "batches_per_hypothesis", "worlds_per_batch",
    "prior_SA", "prior_CA", "likelihood_E_SA", "likelihood_E_CA",
    "evidence_probability", "bayes_factor_SA_CA",
    "posterior_SA", "posterior_CA", "T_observed",
    "ppc_joint_SA", "ppc_joint_CA", "ppc_joint_posterior",
    "likelihood_A1_given_Q1_SA", "likelihood_A1_given_Q1_CA",
    "posterior_SA_given_A1_Q1", "ppc_conditional_Q1_posterior",
    "marginal_adoption_SA", "marginal_adoption_CA",
    "joint_competitive_adoption_SA", "joint_competitive_adoption_CA"
  ),
  value = c(
    seed, n_per_hypothesis, 4, 8,
    prior[["SA"]], prior[["CA"]], likelihood[["SA"]], likelihood[["CA"]],
    evidence_probability, likelihood[["SA"]] / likelihood[["CA"]],
    posterior[["SA"]], posterior[["CA"]], 2,
    tail_by_hypothesis[["SA"]], tail_by_hypothesis[["CA"]], ppc_joint,
    conditional_likelihood[["SA"]], conditional_likelihood[["CA"]],
    conditional_posterior[["SA"]], ppc_conditional_q1,
    adoption_marginal[["SA"]], adoption_marginal[["CA"]],
    competitive_adoption[["SA"]], competitive_adoption[["CA"]]
  ),
  provenance = c(
    rep("frozen_computational_design", 4),
    rep("synthetic_model_exact_enumeration", 20)
  )
)

write.csv(states, file.path(data_dir, "bc_states.csv"), row.names = FALSE)
write.csv(theory, file.path(results_dir, "theory.csv"), row.names = FALSE)
write.csv(model_summary, file.path(results_dir, "model_summary.csv"),
          row.names = FALSE)

cat(sprintf("Wrote %d B/C states and %d exact reference cells.\n",
            nrow(states), nrow(theory)))
cat(sprintf("Posterior SA: %.6f; joint PPC: %.6f; conditional-Q=1 PPC: %.6f.\n",
            posterior[["SA"]], ppc_joint, ppc_conditional_q1))
cat(sprintf("R version: %s; RNG kinds: %s.\n",
            as.character(getRversion()), paste(RNGkind(), collapse = ", ")))
