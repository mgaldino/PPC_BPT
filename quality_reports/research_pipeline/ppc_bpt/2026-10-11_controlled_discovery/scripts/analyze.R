#!/usr/bin/env Rscript
# Controlled-discovery experiment: implementation of the frozen protocol.
# H is common to each entire data set. Its truth is NEVER an input to a check.
# The log mixture is outside the product of episode probabilities.
# Numerical tie convention agreed before execution: round deviance to 12 digits.
# All inference is conditional on this one fixed corpus and selected check set.

options(stringsAsFactors = FALSE, digits = 17)
suppressWarnings(try(Sys.setlocale("LC_CTYPE", "en_US.UTF-8"), silent = TRUE))
if (!requireNamespace("jsonlite", quietly = TRUE)) stop("jsonlite is required.")
args <- commandArgs(trailingOnly = FALSE)
script_file <- args[grepl("^--file=", args)]
if (length(script_file) != 1L) stop("Run this file with Rscript.")
root <- dirname(dirname(normalizePath(sub("^--file=", "", script_file))))
input <- file.path(root, "data")
output <- file.path(root, "results")
selected_file <- file.path(input, "selected_checks.json")
if (!file.exists(selected_file)) stop("Selected checks must be frozen before execution.")
dir.create(output, recursive = TRUE, showWarnings = FALSE)

states <- read.csv(file.path(input, "states.csv"))
laws <- read.csv(file.path(input, "joint_laws.csv"))
selected <- jsonlite::fromJSON(selected_file, simplifyVector = FALSE)
stopifnot(nrow(states) == 16L, identical(as.integer(states$state_id), 0:15),
          all(states$state_id == 8 * states$S + 4 * states$A + 2 * states$M + states$P),
          length(selected) <= 3L)
conditions <- c("null", "F1", "F2", "F2_weak")
hs <- c("SA", "CA")
weights <- c(SA = 0.6, CA = 0.4)
law <- lapply(conditions, function(condition) {
  ans <- sapply(hs, function(h) {
    x <- laws[laws$condition == condition & laws$H == h, ]
    x <- x[match(states$state_id, x$state_id), ]
    stopifnot(nrow(x) == 16L, !anyNA(x), all(x$prob > 0),
              abs(sum(x$prob) - 1) < 1e-12)
    x$prob
  })
  colnames(ans) <- hs
  ans
})
names(law) <- conditions

Ustar <- as.integer(xor(states$S, states$A))
V <- as.integer(xor(states$A, states$M))
W <- as.integer(xor(states$M, states$P))
code <- list(S = states$S, Ustar = Ustar, V = V, W = W,
             Ustar_V = 2L * Ustar + V, Ustar_W = 2L * Ustar + W,
             V_W = 2L * V + W,
             path_SM = 2L * states$S + states$M,
             path_AP = 2L * states$A + states$P,
             path_SP = 2L * states$S + states$P,
             pathXOR_SM = as.integer(xor(states$S, states$M)),
             pathXOR_AP = as.integer(xor(states$A, states$P)),
             pathXOR_SP = as.integer(xor(states$S, states$P)))
t0 <- names(code)[1:7]
path_extra <- names(code)[8:10]
path_xor_extra <- names(code)[11:13]
check_origin <- setNames(rep("protocol", length(code)), names(code))
check_implication <- setNames(rep("fixed categorical check", length(code)), names(code))
ia_names <- character()
selected_ids <- character()
for (j in seq_along(selected)) {
  item <- selected[[j]]
  needed <- c("id", "state_table", "implication")
  if (!all(needed %in% names(item))) stop("Selected check lacks a required field.")
  id <- as.character(item$id)
  if (length(id) != 1L || !nzchar(id)) stop("Invalid selected check id.")
  raw_code <- unlist(item$state_table, use.names = FALSE)
  if (length(raw_code) != 16L || !is.numeric(raw_code) || anyNA(raw_code) ||
      any(!is.finite(raw_code)) || any(raw_code != as.integer(raw_code))) {
    stop("Each selected state_table must have 16 integer codes.")
  }
  nm <- paste0("IA_", make.names(id))
  if (nm %in% names(code) || id %in% selected_ids) stop("Duplicate selected check id.")
  code[[nm]] <- as.integer(raw_code)
  ia_names <- c(ia_names, nm)
  selected_ids <- c(selected_ids, id)
  check_origin[nm] <- if (is.null(item$origin)) {
    paste0("selected candidate ", id)
  } else if (is.list(item$origin)) {
    as.character(jsonlite::toJSON(item$origin, auto_unbox = TRUE))
  } else paste(as.character(item$origin), collapse = "; ")
  check_implication[nm] <- paste(as.character(item$implication), collapse = " ")
}
code$full16 <- states$state_id
check_origin["full16"] <- "protocol"
check_implication["full16"] <- "full joint distribution of S,A,M,P"
families <- list(T0 = t0, Tpath = c(t0, path_extra),
                 TpathXOR = c(t0, path_xor_extra), TIA = c(t0, ia_names),
                 Tfull = "full16")
all_family_names <- c(names(families), "T0_Bonferroni")

# Each row of a mapping matrix defines one category from observable states.
mapping <- lapply(code, function(x) {
  lev <- sort(unique(x))
  out <- outer(lev, x, FUN = "==") * 1
  rownames(out) <- as.character(lev)
  out
})
predicted <- lapply(mapping, function(g) g %*% law$null)
state_code_table <- do.call(rbind, lapply(names(code), function(nm) {
  data.frame(check = nm, state_id = states$state_id, category = code[[nm]],
             origin = unname(check_origin[nm]), implication = unname(check_implication[nm]))
}))
write.csv(state_code_table, file.path(output, "check_state_tables.csv"), row.names = FALSE)
prob_table <- do.call(rbind, lapply(names(predicted), function(nm) {
  q <- predicted[[nm]]
  data.frame(check = nm, category = rownames(q), q_SA = q[, "SA"], q_CA = q[, "CA"],
             marginal_mixture_one_episode = as.vector(q %*% weights))
}))
write.csv(prob_table, file.path(output, "check_probabilities.csv"), row.names = FALSE)

# Necessary marginal invariances; no claim of joint invariance of T0 statistics.
invariance <- do.call(rbind, lapply(c("F1", "F2", "F2_weak"), function(cond) {
  do.call(rbind, lapply(names(mapping), function(nm) {
    delta <- mapping[[nm]] %*% (law[[cond]] - law$null)
    data.frame(condition = cond, check = nm, H = hs,
               max_absolute_probability_difference = apply(abs(delta), 2L, max),
               total_variation = colSums(abs(delta)) / 2,
               required_zero = cond %in% c("F2", "F2_weak") & nm %in% t0)
  }))
}))
stopifnot(all(invariance$max_absolute_probability_difference[invariance$required_zero] < 1e-12),
          all(invariance$total_variation[invariance$condition == "F2" & invariance$check == "full16"] > 0))
write.csv(invariance, file.path(output, "invariance_checks.csv"), row.names = FALSE)

RNGkind("Mersenne-Twister", "Inversion", "Rejection")
n_reference <- 50000L
n_evaluation <- 5000L
sample_sizes <- c(24L, 96L, 384L)
alpha <- 0.05
tie_digits <- 12L
seed_for <- function(n, phase) as.integer(202610110L + n * 100L + phase)

generate <- function(n, m, condition, seed) {
  set.seed(seed)
  H_truth <- ifelse(runif(m) < weights[["SA"]], "SA", "CA")
  counts <- matrix(0L, nrow = 16L, ncol = m)
  for (h in hs) {
    ind <- which(H_truth == h)
    if (length(ind)) counts[, ind] <- rmultinom(length(ind), n, law[[condition]][, h])
  }
  stopifnot(all(colSums(counts) == n))
  rownames(counts) <- as.character(states$state_id)
  list(counts = counts, H_truth = H_truth, seed = seed)
}

discrepancies <- function(counts, n) {
  ans <- matrix(NA_real_, nrow = ncol(counts), ncol = length(mapping),
                dimnames = list(NULL, names(mapping)))
  for (nm in names(mapping)) {
    obs <- mapping[[nm]] %*% counts
    saturated <- matrix(0, nrow(obs), ncol(obs))
    positive <- obs > 0
    saturated[positive] <- obs[positive] * (log(obs[positive]) - log(n))
    log_SA <- as.vector(crossprod(log(predicted[[nm]][, "SA"]), obs)) + log(weights[["SA"]])
    log_CA <- as.vector(crossprod(log(predicted[[nm]][, "CA"]), obs)) + log(weights[["CA"]])
    max_log <- pmax(log_SA, log_CA)
    log_mixture <- max_log + log(exp(log_SA - max_log) + exp(log_CA - max_log))
    raw <- 2 * (colSums(saturated) - log_mixture)
    if (any(raw < -1e-8) || any(!is.finite(raw))) stop("Invalid discrepancy.")
    ans[, nm] <- round(pmax(0, raw), digits = tie_digits)
  }
  ans
}

# left.open=TRUE gives number strictly less than x; default gives <= x.
upper_tail <- function(x, sorted_reference) {
  (1 + length(sorted_reference) - findInterval(x, sorted_reference, left.open = TRUE)) /
    (length(sorted_reference) + 1)
}
lower_tail <- function(x, sorted_reference) {
  (1 + findInterval(x, sorted_reference)) / (length(sorted_reference) + 1)
}
stopifnot(upper_tail(c(0, 1, 2, 3), c(1, 1, 2)) == c(1, 1, 0.5, 0.25),
          lower_tail(c(0, 1, 2, 3), c(1, 1, 2)) == c(0.25, 0.75, 1, 1))

component_p <- function(T, sorted_A) {
  ans <- T
  for (nm in colnames(T)) ans[, nm] <- upper_tail(T[, nm], sorted_A[[nm]])
  ans
}
family_scores <- function(P) {
  ans <- sapply(families, function(nms) apply(P[, nms, drop = FALSE], 1L, min))
  if (!is.matrix(ans)) stop("Family scores must be a matrix.")
  ans
}
calibrated <- function(scores, sorted_B) {
  ans <- scores
  for (nm in colnames(scores)) ans[, nm] <- lower_tail(scores[, nm], sorted_B[[nm]])
  cbind(ans, T0_Bonferroni = pmin(1, length(t0) * scores[, "T0"]))
}
wilson <- function(k, m) {
  z <- qnorm(0.975)
  phat <- k / m
  center <- (phat + z^2 / (2 * m)) / (1 + z^2 / m)
  half <- z * sqrt(phat * (1 - phat) / m + z^2 / (4 * m^2)) / (1 + z^2 / m)
  c(lower = center - half, upper = center + half)
}

rate_rows <- list()
paired_rows <- list()
seed_rows <- list()
pvalue_rows <- list()
example <- NULL
pair_specs <- list(c("TIA", "T0"), c("TIA", "Tpath"), c("TIA", "TpathXOR"),
                   c("TIA", "Tfull"), c("TIA", "T0_Bonferroni"),
                   c("Tpath", "T0"), c("TpathXOR", "T0"), c("Tfull", "T0"))

for (n in sample_sizes) {
  cat(sprintf("N=%d: generating two independent null references.\n", n))
  flush.console()
  ref_A <- generate(n, n_reference, "null", seed_for(n, 1L))
  ref_B <- generate(n, n_reference, "null", seed_for(n, 2L))
  ref_A$T <- discrepancies(ref_A$counts, n)
  sorted_A <- lapply(as.data.frame(ref_A$T), sort)
  ref_B$T <- discrepancies(ref_B$counts, n)
  ref_B$component_p <- component_p(ref_B$T, sorted_A)
  ref_B$scores <- family_scores(ref_B$component_p)
  sorted_B <- lapply(as.data.frame(ref_B$scores), sort)
  evaluations <- list()
  seed_rows[[length(seed_rows) + 1L]] <- data.frame(N = n, purpose = c("reference_A", "reference_B"),
                                                  condition = "null", seed = c(ref_A$seed, ref_B$seed))
  for (ci in seq_along(conditions)) {
    cond <- conditions[ci]
    ev <- generate(n, n_evaluation, cond, seed_for(n, 9L + ci))
    ev$T <- discrepancies(ev$counts, n)
    ev$component_p <- component_p(ev$T, sorted_A)
    ev$scores <- family_scores(ev$component_p)
    ev$global_p <- calibrated(ev$scores, sorted_B)
    ev$reject <- ev$global_p <= alpha
    evaluations[[cond]] <- ev
    seed_rows[[length(seed_rows) + 1L]] <- data.frame(N = n, purpose = "evaluation", condition = cond,
                                                    seed = ev$seed)
    for (fam in all_family_names) {
      k <- sum(ev$reject[, fam])
      ci_rate <- wilson(k, n_evaluation)
      rate_rows[[length(rate_rows) + 1L]] <- data.frame(
        N = n, primary_N = n == 96L, condition = cond, family = fam,
        n_datasets = n_evaluation, n_reject = k, rate = k / n_evaluation,
        Wilson_lower = unname(ci_rate[1L]), Wilson_upper = unname(ci_rate[2L]),
        n_component_checks = if (fam == "T0_Bonferroni") length(t0) else length(families[[fam]]),
        interpretation = "conditional_on_fixed_discovery_corpus_and_reference_draws")
    }
    for (pair in pair_specs) {
      x <- ev$reject[, pair[1L]]
      y <- ev$reject[, pair[2L]]
      d <- as.integer(x) - as.integer(y)
      estimate <- mean(d)
      standard_error <- sd(d) / sqrt(length(d))
      paired_rows[[length(paired_rows) + 1L]] <- data.frame(
        N = n, condition = cond, first = pair[1L], second = pair[2L],
        n_datasets = length(d), difference = estimate, standard_error = standard_error,
        lower_95 = max(-1, estimate - qnorm(0.975) * standard_error),
        upper_95 = min(1, estimate + qnorm(0.975) * standard_error),
        n_first_only = sum(x & !y), n_second_only = sum(!x & y),
        n_both = sum(x & y), n_neither = sum(!x & !y))
    }
    p_out <- data.frame(N = n, condition = cond, dataset = seq_len(n_evaluation))
    pp <- as.data.frame(ev$global_p)
    names(pp) <- paste0("p_", names(pp))
    rr <- as.data.frame(ev$reject)
    names(rr) <- paste0("reject_", names(rr))
    cc <- as.data.frame(ev$component_p)
    names(cc) <- paste0("component_p_", names(cc))
    pvalue_rows[[length(pvalue_rows) + 1L]] <- cbind(p_out, pp, rr, cc)
    if (n == 96L && cond == "F2") {
      eligible <- which(ev$reject[, "TIA"] & !ev$reject[, "T0"])
      idx <- if (length(eligible)) eligible[1L] else 1L
      example <- list(N = n, condition = cond, dataset = idx,
                      selection = if (length(eligible)) "first_TIA_reject_T0_nonreject" else "first_F2_no_qualifying_dataset",
                      n_qualifying_datasets = length(eligible),
                      counts = ev$counts[, idx], H_truth = ev$H_truth[idx],
                      T = ev$T[idx, ], component_p = ev$component_p[idx, ],
                      scores = ev$scores[idx, ], global_p = ev$global_p[idx, ])
    }
    cat(sprintf("  %s complete; rejection rates: %s\n", cond,
                paste(sprintf("%s=%.3f", all_family_names, colMeans(ev$reject)), collapse = ", ")))
    flush.console()
  }
  saveRDS(list(N = n, weights = weights, alpha = alpha, tie_digits = tie_digits,
               code = code, mapping = mapping, predicted = predicted, families = families,
               selected = selected, reference_A = ref_A, reference_B = ref_B,
               evaluation = evaluations),
          file.path(output, sprintf("audit_draws_N%d.rds", n)), compress = "gzip")
  rm(ref_A, ref_B, evaluations, sorted_A, sorted_B)
  invisible(gc())
}

rates <- do.call(rbind, rate_rows)
paired <- do.call(rbind, paired_rows)
seeds <- do.call(rbind, seed_rows)
pvalues <- do.call(rbind, pvalue_rows)
stopifnot(!anyDuplicated(seeds$seed),
          nrow(rates) == length(sample_sizes) * length(conditions) * length(all_family_names),
          nrow(pvalues) == length(sample_sizes) * length(conditions) * n_evaluation)
write.csv(rates, file.path(output, "rejection_rates.csv"), row.names = FALSE)
write.csv(paired, file.path(output, "paired_differences.csv"), row.names = FALSE)
write.csv(seeds, file.path(output, "simulation_seeds.csv"), row.names = FALSE)
write.csv(pvalues, file.path(output, "evaluation_pvalues.csv"), row.names = FALSE)
write.csv(data.frame(states, count = example$counts), file.path(output, "example_counts.csv"), row.names = FALSE)
write.csv(data.frame(N = example$N, condition = example$condition, dataset = example$dataset,
                     H_truth = example$H_truth, selection = example$selection,
                     n_qualifying_datasets = example$n_qualifying_datasets),
          file.path(output, "example_truth_and_selection.csv"), row.names = FALSE)
write.csv(data.frame(check = names(example$T), discrepancy = example$T,
                     component_p = example$component_p),
          file.path(output, "example_component_checks.csv"), row.names = FALSE)
write.csv(data.frame(family = names(example$global_p), global_p = example$global_p,
                     reject = example$global_p <= alpha),
          file.path(output, "example_family_checks.csv"), row.names = FALSE)
example_categories <- do.call(rbind, lapply(names(mapping), function(nm) {
  q <- predicted[[nm]]
  data.frame(check = nm, category = rownames(q),
             observed_count = as.vector(mapping[[nm]] %*% example$counts),
             q_SA = q[, "SA"], q_CA = q[, "CA"],
             marginal_mixture_one_episode = as.vector(q %*% weights))
}))
write.csv(example_categories, file.path(output, "example_check_categories.csv"), row.names = FALSE)
saveRDS(example, file.path(output, "example.rds"))
capture.output(sessionInfo(), file = file.path(output, "sessionInfo.txt"))
hash_paths <- c(file.path(root, "protocol.md"), file.path(input, "states.csv"),
                file.path(input, "joint_laws.csv"), selected_file,
                normalizePath(sub("^--file=", "", script_file)))
write.csv(data.frame(path = hash_paths, md5 = unname(tools::md5sum(hash_paths))),
          file.path(output, "input_hashes.csv"), row.names = FALSE)
writeLines(c(
  "All probabilities and defects are synthetic; no historical validity is inferred.",
  sprintf("Number of frozen selected IA checks: %d. Discovery status: %s.", length(ia_names),
          if (length(ia_names)) "nonempty_fixed_corpus" else "no_valid_candidate"),
  "H is common to an entire dataset, drawn once with weights 0.6/0.4.",
  "Truth H is used only to generate data and record audit metadata, never to compute checks.",
  "Deviance uses log[0.6 product(q_SA) + 0.4 product(q_CA)], not product of marginal mixtures.",
  "Deviances are rounded to 12 decimal places before inclusive tail comparisons (numerical tie convention).",
  "Component p=(1+# reference_A T>=Tobs)/(50000+1).",
  "Family score=min component p; global p=(1+# reference_B score<=scoreobs)/(50000+1).",
  "Bonferroni uses 7*minimum T0 component p, capped at 1, and threshold 0.05.",
  "Reference A, reference B, and each evaluation condition use distinct seeds.",
  "All check families receive the exact same datasets and references.",
  "Wilson intervals and paired-difference intervals describe Monte Carlo evaluation conditional on the fixed corpus and references.",
  "They do not incorporate discovery-corpus, model, historical, or reference-estimation uncertainty.",
  "Each T0 marginal is invariant under F2; the joint distribution of their aggregate need not be invariant.",
  "TpathXOR is the pre-evaluation secondary comparator from the protocol addendum; it does not replace primary Tpath.",
  "TpathXOR uses three parity coarsenings, while the third IA check may differ; information budgets are not identical partitions.",
  "The N=96 example is selected illustratively as specified, not a representative or held-out success claim.",
  "Check probabilities labeled marginal_mixture_one_episode are for description only; not used as the joint dataset likelihood.",
  "RDS files retain references, evaluation counts, discrepancies, component p-values, scores and rejection flags for independent audit."
), file.path(output, "analysis_notes.txt"))
cat("Core analysis outputs and audit draws are saved.\n")
flush.console()

# Scientific figures use base R; they present all primary-N families/conditions.
plot_primary <- function() {
  old <- par(no.readonly = TRUE)
  on.exit(par(old))
  par(mfrow = c(1, 2), mar = c(6, 4.4, 4, 1.2), oma = c(1, 0, 1, 0))
  fam <- all_family_names
  colors <- c("#4C78A8", "#F58518", "#E45756", "#54A24B", "#B279A2", "#79706E")
  faults <- c("F1", "F2", "F2_weak")
  val <- lo <- hi <- matrix(0, length(fam), length(faults), dimnames = list(fam, faults))
  for (j in seq_along(faults)) for (i in seq_along(fam)) {
    row <- rates[rates$N == 96L & rates$condition == faults[j] & rates$family == fam[i], ]
    val[i, j] <- row$rate; lo[i, j] <- row$Wilson_lower; hi[i, j] <- row$Wilson_upper
  }
  xx <- barplot(val, beside = TRUE, col = colors, border = NA, ylim = c(0, 1),
                names.arg = c("F1", "F2", "F2 weak"), ylab = "Rejection proportion",
                main = "Specified faults (N = 96)")
  arrows(as.vector(xx), as.vector(lo), as.vector(xx), as.vector(hi),
         angle = 90, code = 3, length = 0.025)
  legend("topleft", legend = gsub("_", "-", fam), fill = colors, bty = "n", cex = 0.7)
  nu <- rates[rates$N == 96L & rates$condition == "null", ]
  nu <- nu[match(fam, nu$family), ]
  xx <- barplot(nu$rate, col = colors, border = NA, ylim = c(0, max(0.08, nu$Wilson_upper * 1.25)),
                names.arg = gsub("_", "-", fam), las = 2, cex.names = 0.75,
                ylab = "Rejection proportion", main = "False alarms under null (N = 96)")
  arrows(xx, nu$Wilson_lower, xx, nu$Wilson_upper, angle = 90, code = 3, length = 0.025)
  abline(h = alpha, lty = 2, col = "#B22222")
  mtext("5,000 evaluation datasets per condition; bars show Wilson 95% Monte Carlo intervals.",
        outer = TRUE, side = 1, line = -0.2, cex = 0.8)
}
pdf(file.path(output, "primary_power_and_null.pdf"), width = 12, height = 6, useDingbats = FALSE)
plot_primary()
dev.off()
png(file.path(output, "primary_power_and_null.png"), width = 1800, height = 900, res = 150)
plot_primary()
dev.off()
cat("Figures saved. Analysis complete.\n")
