# Source-to-bound bookkeeping for the exact original E3 (base R only).
# SA = Strategic Accommodation; CA = Competitive Advantage.
# No human elicitation, estimated absolute likelihood, or empirical PPC here.
# Documents F3-F6 audit interpretations. They are NOT incorporated as new
# probabilistic information while keeping the original r and w unchanged.

file_arg <- grep("^--file=", commandArgs(FALSE), value = TRUE)
stopifnot(length(file_arg) == 1L)
run_dir <- dirname(normalizePath(sub("^--file=", "", file_arg)))
out_dir <- file.path(run_dir, "results")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
sources <- read.csv(file.path(run_dir, "data", "source_constraints.csv"),
                    na.strings = "NA", stringsAsFactors = FALSE)
weights <- read.csv(file.path(run_dir, "data", "published_weights.csv"),
                    stringsAsFactors = FALSE)

# Missing magnitudes must remain missing; zero is a numerical assertion.
stopifnot(identical(sources$source_id, paste0("F", 1:6)),
          !anyDuplicated(sources$source_id),
          all(is.na(sources$absolute_a_lower)),
          all(is.na(sources$absolute_a_upper)),
          all(sources$absolute_magnitude_origin == "not_supplied"),
          all(is.na(sources$opportunity_denominator)),
          all(!sources$independent_frequency_observations),
          identical(which(!is.na(sources$observed_y)), 1L),
          sources$observed_y[1] == 1,
          identical(which(!is.na(sources$bf_db_central)), 2L),
          sources$bf_origin[2] == "published_author_judgment",
          identical(weights$stage, c("prior", "E1", "E2", "E3", "E4")),
          !anyNA(weights), !anyDuplicated(weights$stage),
          is.numeric(weights$woe_db_sa_vs_ca),
          all(weights$origin == "published_author_judgment"),
          weights$woe_db_sa_vs_ca[weights$stage == "E3"] ==
            sources$bf_db_central[2])

r <- 10^(sources$bf_db_central[2] / 10)
posterior_db <- sum(weights$woe_db_sa_vs_ca)
posterior_odds <- 10^(posterior_db / 10)
w <- posterior_odds / (1 + posterior_odds)
q_coefficient <- w + (1 - w) / r
stopifnot(is.finite(r), r > 1, is.finite(w), w > 0, w < 1,
          posterior_db == 4, q_coefficient > 0, q_coefficient <= 1)

# F1 alone: normalization gives closure [0,1]. Observing E3 alone does not
# force positive likelihood under every rival. F2's finite positive BF plus
# positive posteriors after observed E3 exclude zero for this fixed family.
# w is the final published benchmark, not a posterior updated by source rows.
source_impacts <- data.frame(
  source_id = sources$source_id,
  interpretation = c("event_definition_only",
                     "fixed_central_BF_and_positive_posterior_benchmark",
                     rep("additional_documentary_audit_no_mass_bound", 4)),
  a_closure_lower = 0, a_closure_upper = 1,
  a_lower_included = c(TRUE, rep(FALSE, 5)),
  a_upper_included = TRUE,
  absolute_a_numeric_narrowing = FALSE,
  benchmark_b_closure_lower = c(NA_real_, rep(0, 5)),
  benchmark_b_closure_upper = c(NA_real_, rep(1 / r, 5)),
  benchmark_q_infimum = c(NA_real_, rep(0, 5)),
  benchmark_q_maximum = c(NA_real_, rep(q_coefficient, 5)),
  benchmark_q_lower_included = c(NA, rep(FALSE, 5)),
  r_fixed = c(NA_real_, rep(r, 5)),
  w_fixed = c(NA_real_, rep(w, 5)),
  status = "conditional_algebra_not_empirical_estimate",
  stringsAsFactors = FALSE
)

# Generic propagation for FUTURE justified mass certificates:
# G subset E3, B subset complement, P(G)>=g, P(B)>=d imply a in [g,1-d].
# Inputs are not supplied by the sources in this audit.
mass_bounds <- function(g, d) {
  if (length(g) != 1L || length(d) != 1L || !is.finite(g) ||
      !is.finite(d) || g < 0 || d < 0 || g > 1 || d > 1 || g + d > 1) {
    stop("Require finite scalar bounds in [0,1] with g+d <= 1.")
  }
  c(lower = g, upper = 1 - d)
}

# These are implementation unit checks, not observations or elicited answers.
unit_checks <- list()
record_check <- function(name, passed) {
  stopifnot(isTRUE(passed))
  unit_checks[[length(unit_checks) + 1L]] <<- data.frame(
    check = name, result = "PASS",
    interpretation = "synthetic_or_algebraic_unit_check_not_empirical_validation"
  )
}
tol <- 1e-12
record_check("unrestricted_mass_certificates_return_closure_0_1",
             isTRUE(all.equal(unname(mass_bounds(0, 0)), c(0, 1))))
record_check("synthetic_mass_certificates_propagate",
             isTRUE(all.equal(unname(mass_bounds(0.2, 0.3)), c(0.2, 0.7))))
record_check("incompatible_mass_certificates_raise_error",
             inherits(try(mass_bounds(0.8, 0.4), silent = TRUE), "try-error"))
record_check("missing_mass_must_not_be_zero_imputed",
             inherits(try(mass_bounds(NA_real_, 0), silent = TRUE), "try-error"))
record_check("out_of_range_mass_is_rejected",
             inherits(try(mass_bounds(-0.1, 0), silent = TRUE), "try-error"))

# A few synthetic coordinates exercise identities; no coordinate is chosen
# for the substantive E3 analysis and no grid becomes a distribution over a.
for (a in c(.Machine$double.eps, 0.25, 1)) {
  b <- a / r
  probs <- matrix(c(a, 1 - a, b, 1 - b), nrow = 2)
  stopifnot(all(probs >= 0 & probs <= 1),
            max(abs(colSums(probs) - 1)) < tol,
            abs(a / b - r) < tol,
            abs(w * a + (1 - w) * b - q_coefficient * a) < tol)
}
record_check("normalized_likelihoods_preserve_BF_and_predictive_identity", TRUE)
record_check("documentary_rows_do_not_narrow_absolute_scale",
             all(source_impacts$a_closure_lower == 0) &&
             all(source_impacts$a_closure_upper == 1) &&
             all(!source_impacts$absolute_a_numeric_narrowing))
record_check("missing_magnitudes_remain_NA_not_zero",
             all(is.na(sources$absolute_a_lower)) &&
             all(is.na(sources$absolute_a_upper)))

constants <- data.frame(
  quantity = c("bf_E3_central", "posterior_sa_central", "ppc_coefficient",
               "a_infimum", "a_maximum", "q_infimum", "q_maximum",
               "published_bf_lower", "published_bf_upper"),
  value = c(r, w, q_coefficient, 0, 1, 0, q_coefficient,
            10^(sources$bf_db_lower[2] / 10),
            10^(sources$bf_db_upper[2] / 10)),
  origin = c(rep("arithmetic_from_published_central_judgments", 3),
             rep("normalization_and_fixed_BF_closure", 2),
             rep("conditional_algebra_from_central_judgments", 2),
             rep("published_author_judgment_range_not_propagated", 2))
)
options(digits = 17)
write.csv(source_impacts, file.path(out_dir, "source_impacts.csv"),
          row.names = FALSE, na = "NA")
write.csv(constants, file.path(out_dir, "constants.csv"), row.names = FALSE)
write.csv(do.call(rbind, unit_checks), file.path(out_dir, "unit_checks.csv"),
          row.names = FALSE)
capture.output(sessionInfo(), file = file.path(out_dir, "sessionInfo.txt"))
cat("PASS: source bookkeeping and algebraic/unit checks.\n")
cat("No human elicitation or empirical absolute likelihood/PPC obtained.\n")
cat("F3-F6 add no documented numerical bound on a in this audit.\n")
print(constants, row.names = FALSE)
