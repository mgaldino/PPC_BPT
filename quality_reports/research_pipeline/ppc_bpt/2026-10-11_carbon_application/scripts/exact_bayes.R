# Exact finite-state Bayesian updating and posterior predictive checks.
# All probabilities are supplied by the model specification. This file does not
# infer numerical judgments from prose or substitute frequency estimates.

validate_weights <- function(weights, tolerance = 1e-10) {
  if (!is.numeric(weights) || !length(weights) || is.null(names(weights)) ||
      anyNA(weights) || any(!is.finite(weights)) || any(weights < 0) ||
      any(!nzchar(names(weights))) || anyDuplicated(names(weights)) ||
      abs(sum(weights) - 1) > tolerance) {
    stop("Weights must be uniquely named, nonnegative, finite and sum to one.")
  }
  weights
}

validate_kernel <- function(kernel, weights, tolerance = 1e-10) {
  validate_weights(weights, tolerance)
  if (!is.matrix(kernel) || !is.numeric(kernel) || !nrow(kernel) ||
      is.null(rownames(kernel)) || is.null(colnames(kernel)) ||
      anyDuplicated(rownames(kernel)) || anyDuplicated(colnames(kernel)) ||
      anyNA(kernel) || any(!is.finite(kernel)) || any(kernel < 0) ||
      any(kernel > 1) || !setequal(names(weights), colnames(kernel))) {
    stop("Kernel must have unique state rows and matching hypothesis columns.")
  }
  kernel <- kernel[, names(weights), drop = FALSE]
  if (any(abs(colSums(kernel) - 1) > tolerance)) {
    stop("Every hypothesis-specific kernel must sum to one over the state space.")
  }
  kernel
}

bayes_update <- function(weights, likelihood, tolerance = 1e-10) {
  weights <- validate_weights(weights, tolerance)
  if (!is.numeric(likelihood) || is.null(names(likelihood)) ||
      anyDuplicated(names(likelihood)) ||
      !setequal(names(weights), names(likelihood)) ||
      anyNA(likelihood) || any(!is.finite(likelihood)) ||
      any(likelihood < 0) || any(likelihood > 1)) {
    stop("Likelihood must be a named probability for each hypothesis.")
  }
  likelihood <- likelihood[names(weights)]
  evidence_probability <- sum(weights * likelihood)
  if (evidence_probability <= 0) stop("Observation has zero model probability.")
  list(
    prior = weights,
    likelihood = likelihood,
    evidence_probability = evidence_probability,
    posterior = weights * likelihood / evidence_probability
  )
}

predictive_distribution <- function(weights, kernel, tolerance = 1e-10) {
  kernel <- validate_kernel(kernel, weights, tolerance)
  setNames(as.vector(kernel %*% weights), rownames(kernel))
}

posterior_from_state <- function(weights, kernel, observed_state,
                                 tolerance = 1e-10) {
  kernel <- validate_kernel(kernel, weights, tolerance)
  if (length(observed_state) != 1L || !observed_state %in% rownames(kernel)) {
    stop("Observed state must name exactly one kernel row.")
  }
  bayes_update(weights, kernel[observed_state, ], tolerance)
}

exact_ppc <- function(weights, kernel, observed_state, discrepancy = NULL,
                      tolerance = 1e-10) {
  # weights are posterior weights for a conventional PPC, or checkpoint weights
  # for a subsequent-observation predictive check. Caller must name that choice.
  # Discrepancy may be a state vector, or a state x hypothesis matrix. In the
  # latter case the draw of H is shared by the observed and replicated statistic.
  kernel <- validate_kernel(kernel, weights, tolerance)
  if (length(observed_state) != 1L || !observed_state %in% rownames(kernel)) {
    stop("Observed state must name exactly one kernel row.")
  }
  predictive <- predictive_distribution(weights, kernel, tolerance)
  if (is.null(discrepancy)) discrepancy <- -log(predictive)
  if (is.function(discrepancy)) {
    discrepancy <- discrepancy(kernel = kernel, weights = weights,
                               predictive = predictive)
  }
  if (is.numeric(discrepancy) && is.null(dim(discrepancy))) {
    if (is.null(names(discrepancy)) ||
        !setequal(names(discrepancy), rownames(kernel)) ||
        anyNA(discrepancy) || anyDuplicated(names(discrepancy))) {
      stop("Vector discrepancy must uniquely name all states and contain no NA.")
    }
    discrepancy <- matrix(discrepancy[rownames(kernel)], nrow = nrow(kernel),
                          ncol = ncol(kernel),
                          dimnames = dimnames(kernel))
  }
  if (!is.matrix(discrepancy) || !is.numeric(discrepancy) ||
      !setequal(rownames(discrepancy), rownames(kernel)) ||
      !setequal(colnames(discrepancy), colnames(kernel)) ||
      anyNA(discrepancy)) {
    stop("Discrepancy matrix must have matching state and hypothesis labels.")
  }
  discrepancy <- discrepancy[rownames(kernel), colnames(kernel), drop = FALSE]
  observed_discrepancy <- discrepancy[observed_state, ]
  tail_membership <- sweep(discrepancy, 2L, observed_discrepancy,
                           function(x, y) x >= y - tolerance)
  conditional_tail <- colSums(kernel * tail_membership)
  list(
    weights = weights,
    observed_state = observed_state,
    predictive_distribution = predictive,
    observed_probability = unname(predictive[observed_state]),
    discrepancy = discrepancy,
    conditional_tail = conditional_tail,
    tail_probability = unname(sum(weights * conditional_tail))
  )
}

enumerate_binary_states <- function(variables) {
  if (!is.character(variables) || !length(variables) ||
      any(!nzchar(variables)) || anyDuplicated(variables)) {
    stop("Supply unique variable names.")
  }
  args <- setNames(rep(list(0:1), length(variables)), variables)
  states <- do.call(expand.grid, c(args, stringsAsFactors = FALSE))
  rownames(states) <- apply(states, 1L, paste0, collapse = "")
  states
}

condition_kernel <- function(kernel, keep, tolerance = 1e-10) {
  # Returns the kernel conditional on an event in each hypothesis. In updating,
  # retain normalizers as event likelihoods if the event is itself new evidence.
  if (!is.matrix(kernel) || !is.logical(keep) || length(keep) != nrow(kernel) ||
      anyNA(keep) || !any(keep)) stop("Invalid conditional event.")
  retained <- kernel[keep, , drop = FALSE]
  normalizers <- colSums(retained)
  if (any(normalizers <= tolerance)) stop("Condition has zero hypothesis mass.")
  list(kernel = sweep(retained, 2L, normalizers, "/"),
       event_likelihood = normalizers)
}
