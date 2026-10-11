#!/usr/bin/env Rscript
# Exploratory analysis of the frozen three-arm pilot. Base R only.
# Run only after worlds.csv and coded.csv are complete:
# Rscript scripts/analyze.R [absolute_or_relative_run_directory]
# A call/batch, not a document or world within a call, is the bootstrap unit.
# This script does not estimate historical SA/CA parameters or validate equivalence.

args <- commandArgs(trailingOnly = TRUE)
file_arg <- grep("^--file=", commandArgs(), value = TRUE)
script_path <- if (length(file_arg)) sub("^--file=", "", file_arg[1L]) else "scripts/analyze.R"
run_dir <- if (length(args)) args[1L] else dirname(dirname(normalizePath(script_path)))
run_dir <- normalizePath(run_dir, mustWork = TRUE)
out_dir <- file.path(run_dir, "results")
required <- c("data/worlds.csv", "data/coded.csv", "results/theory.csv")
stopifnot(all(file.exists(file.path(run_dir, required))))
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

read_input <- function(path, columns) {
  x <- read.csv(file.path(run_dir, path), stringsAsFactors = FALSE,
                check.names = FALSE, na.strings = c("", "NA"))
  if (!all(columns %in% names(x))) stop("Missing columns in ", path)
  x
}
write_result <- function(x, name) {
  write.csv(x, file.path(out_dir, name), row.names = FALSE, na = "NA",
            fileEncoding = "UTF-8")
}
worlds <- read_input("data/worlds.csv", c("id", "arm", "H", "batch", "Q", "K", "A"))
coded <- read_input("data/coded.csv", c("id", "Q_c", "K_c", "A_c", "contradiction"))
theory <- read_input("results/theory.csv", c("H", "Q", "K", "A", "prob"))
stopifnot(!anyDuplicated(worlds$id), !anyDuplicated(coded$id),
          all(worlds$arm %in% c("A", "B", "C")),
          all(worlds$H %in% c("SA", "CA")),
          !anyNA(worlds[, c("id", "arm", "H", "batch")]),
          all(worlds$id %in% coded$id), nrow(theory) == 16L)
for (v in c("Q", "K", "A")) {
  stopifnot(is.numeric(worlds[[v]]), all(worlds[[v]] %in% 0:1),
            is.numeric(theory[[v]]), all(theory[[v]] %in% 0:1))
  cv <- paste0(v, "_c")
  coded[[cv]][is.na(coded[[cv]])] <- -1L
  stopifnot(is.numeric(coded[[cv]]), all(coded[[cv]] %in% c(-1L, 0L, 1L)))
}
parse_flag <- function(x) {
  text <- tolower(trimws(as.character(x)))
  if (any(is.na(text) | !text %in% c("0", "1", "false", "true", "no", "yes"))) {
    stop("contradiction must contain explicit 0/1, false/true, or no/yes")
  }
  text %in% c("1", "true", "yes")
}
coded$contradiction <- parse_flag(coded$contradiction)
extra_codes <- coded[!coded$id %in% worlds$id, , drop = FALSE]
if (nrow(extra_codes)) write_result(extra_codes, "coded_controls_outside_main_sample.csv")
matched <- coded[match(worlds$id, coded$id), , drop = FALSE]
stopifnot(identical(as.character(worlds$id), as.character(matched$id)))
worlds <- cbind(worlds, matched[, c("Q_c", "K_c", "A_c", "contradiction"), drop = FALSE])

# Disallow silent changes to the frozen synthetic probability model.
cells <- expand.grid(Q = 0:1, K = 0:1, A = 0:1)
cell_key <- function(x) paste0(x$Q, x$K, x$A)
stopifnot(all(theory$H %in% c("SA", "CA")), !anyNA(theory),
          all(theory$prob >= 0), all(theory$prob <= 1))
for (h in c("SA", "CA")) {
  z <- theory[theory$H == h, , drop = FALSE]
  stopifnot(nrow(z) == 8L, !anyDuplicated(cell_key(z)),
            setequal(cell_key(z), cell_key(cells)), abs(sum(z$prob) - 1) < 1e-12)
  pa <- if (h == "SA") 0.1 + 0.6 * z$Q + 0.1 * z$K else 0.1 + 0.1 * z$Q + 0.6 * z$K
  expected <- 0.25 * ifelse(z$A == 1, pa, 1 - pa)
  stopifnot(max(abs(z$prob - expected)) < 1e-12)
}

# Validate batch counts and B/C pairing before any derived results are written.
sample_sizes <- aggregate(worlds$id, worlds[c("arm", "H", "batch")], length)
names(sample_sizes)[4L] <- "n_worlds"
stopifnot(nrow(sample_sizes) == 24L, all(sample_sizes$n_worlds == 8L))
for (arm in c("A", "B", "C")) for (h in c("SA", "CA")) {
  z <- worlds[worlds$arm == arm & worlds$H == h, , drop = FALSE]
  stopifnot(nrow(z) == 32L, length(unique(z$batch)) == 4L)
}
pair_key <- function(id) sub("^[BC][_-]?", "", as.character(id))
b <- worlds[worlds$arm == "B", , drop = FALSE]
c <- worlds[worlds$arm == "C", , drop = FALSE]
stopifnot(!anyDuplicated(pair_key(b$id)), !anyDuplicated(pair_key(c$id)),
          setequal(pair_key(b$id), pair_key(c$id)))
c <- c[match(pair_key(b$id), pair_key(c$id)), , drop = FALSE]
stopifnot(all(b$H == c$H), all(b$batch == c$batch),
          all(as.matrix(b[c("Q", "K", "A")]) == as.matrix(c[c("Q", "K", "A")])) )

# Contradictory documents have no trustworthy unique state in the primary text
# reconstruction. Mark the full vector unknown, retaining raw codes for audits.
view_data <- function(x, representation) {
  z <- x
  if (representation == "coded") {
    for (v in c("Q", "K", "A")) {
      z[[v]] <- z[[paste0(v, "_c")]]
      z[[v]][z$contradiction] <- -1L
    }
  }
  z
}
event_variables <- list(Q = "Q", K = "K", A = "A", QA = c("Q", "A"), KA = c("K", "A"))
event_bounds <- function(z, variables) {
  m <- as.matrix(z[variables])
  success <- rowSums(m == 1L) == length(variables)
  impossible <- rowSums(m == 0L) > 0L
  lo <- mean(success)
  hi <- mean(!impossible)
  c(estimate = if (abs(hi - lo) < 1e-15) lo else NA_real_,
    lower = lo, upper = hi, n_ambiguous = sum(!success & !impossible))
}
theory_event <- function(h, variables) {
  z <- theory[theory$H == h, , drop = FALSE]
  sum(z$prob[rowSums(as.matrix(z[variables]) == 1L) == length(variables)])
}
metrics <- list()
joint <- list()
tv <- list()
for (arm in c("A", "B", "C")) for (h in c("SA", "CA")) for (repr in c("states", "coded")) {
  z <- view_data(worlds[worlds$arm == arm & worlds$H == h, , drop = FALSE], repr)
  for (event in names(event_variables)) {
    e <- event_bounds(z, event_variables[[event]])
    target <- theory_event(h, event_variables[[event]])
    metrics[[length(metrics) + 1L]] <- data.frame(
      arm = arm, H = h, representation = repr, event = event, n = nrow(z),
      n_batches = length(unique(z$batch)), target = target,
      estimate = unname(e["estimate"]), lower = unname(e["lower"]), upper = unname(e["upper"]),
      n_ambiguous = unname(e["n_ambiguous"]),
      signed_error = unname(e["estimate"]) - target,
      absolute_error = abs(unname(e["estimate"]) - target))
  }
  known <- rowSums(as.matrix(z[c("Q", "K", "A")]) == -1L) == 0L
  observed <- vapply(cell_key(cells), function(key) sum(known & cell_key(z) == key) / nrow(z), numeric(1))
  target <- theory$prob[match(paste(h, cell_key(cells)), paste(theory$H, cell_key(theory)))]
  unknown_mass <- mean(!known)
  joint[[length(joint) + 1L]] <- data.frame(
    arm = arm, H = h, representation = repr, cell = cell_key(cells), cells,
    n = nrow(z), target = target, known_cell_mass = observed,
    point_estimate = if (all(known)) observed else rep(NA_real_, nrow(cells)),
    lower = observed, upper = pmin(1, observed + unknown_mass), unknown_mass = unknown_mass)
  tv[[length(tv) + 1L]] <- data.frame(
    arm = arm, H = h, representation = repr, n = nrow(z), unknown_mass = unknown_mass,
    tv_eight_cells = if (all(known)) 0.5 * sum(abs(observed - target)) else NA_real_,
    tv_with_unknown_as_ninth_category = 0.5 * (sum(abs(observed - target)) + unknown_mass),
    maximum_cell_absolute_error = if (all(known)) max(abs(observed - target)) else NA_real_)
}
metrics <- do.call(rbind, metrics)
joint <- do.call(rbind, joint)
tv <- do.call(rbind, tv)

fidelity <- list()
row_audit <- worlds[c("id", "arm", "H", "batch", "Q", "K", "A", "Q_c", "K_c", "A_c", "contradiction")]
raw_coding <- as.matrix(worlds[c("Q_c", "K_c", "A_c")])
latent <- as.matrix(worlds[c("Q", "K", "A")])
row_audit$indeterminate <- rowSums(raw_coding == -1L) > 0L
row_audit$any_known_bit_inverted <- rowSums((raw_coding != latent) & (raw_coding != -1L)) > 0L
row_audit$exact_vector <- rowSums(raw_coding == latent) == 3L & !worlds$contradiction
for (arm in c("A", "B", "C")) for (h in c("SA", "CA")) {
  z <- row_audit[row_audit$arm == arm & row_audit$H == h, , drop = FALSE]
  fidelity[[length(fidelity) + 1L]] <- data.frame(
    arm = arm, H = h, n = nrow(z), n_batches = length(unique(z$batch)),
    n_exact_vector = sum(z$exact_vector), exact_vector_rate = mean(z$exact_vector),
    n_indeterminate = sum(z$indeterminate), n_any_known_bit_inverted = sum(z$any_known_bit_inverted),
    n_contradiction = sum(z$contradiction))
}
fidelity <- do.call(rbind, fidelity)

safe_ratio <- function(a, b) if (!is.finite(a) || !is.finite(b) || b <= 0) NA_real_ else a / b
ppc_summary <- function(sa, ca) {
  es <- event_bounds(sa, c("Q", "A"))
  ec <- event_bounds(ca, c("Q", "A"))
  qs <- event_bounds(sa, "Q")
  qc <- event_bounds(ca, "Q")
  ls <- unname(es["estimate"])
  lc <- unname(ec["estimate"])
  conditional_sa <- safe_ratio(ls, unname(qs["estimate"]))
  conditional_ca <- safe_ratio(lc, unname(qc["estimate"]))
  plug_w <- safe_ratio(ls, ls + lc)
  c(likelihood_SA = ls, likelihood_CA = lc,
    conditional_likelihood_SA = conditional_sa, conditional_likelihood_CA = conditional_ca,
    posterior_SA_intended = 0.6,
    ppc_joint_fixed_weights = 0.6 * ls + 0.4 * lc,
    ppc_joint_lower = 0.6 * unname(es["lower"]) + 0.4 * unname(ec["lower"]),
    ppc_joint_upper = 0.6 * unname(es["upper"]) + 0.4 * unname(ec["upper"]),
    ppc_conditional_fixed_weights = 0.6 * conditional_sa + 0.4 * conditional_ca,
    posterior_SA_plugin = plug_w,
    ppc_joint_plugin = plug_w * ls + (1 - plug_w) * lc,
    ppc_conditional_plugin = plug_w * conditional_sa + (1 - plug_w) * conditional_ca)
}
ppc <- list()
for (arm in c("A", "B", "C")) for (repr in c("states", "coded")) {
  z <- view_data(worlds[worlds$arm == arm, , drop = FALSE], repr)
  values <- ppc_summary(z[z$H == "SA", , drop = FALSE], z[z$H == "CA", , drop = FALSE])
  ppc[[length(ppc) + 1L]] <- cbind(data.frame(arm = arm, representation = repr), as.data.frame(as.list(values)))
}
ppc <- do.call(rbind, ppc)
exact <- data.frame(
  quantity = c("prior_SA", "likelihood_SA", "likelihood_CA", "posterior_SA",
               "ppc_joint", "ppc_conditional_Q1", "marginal_A_SA", "marginal_A_CA"),
  value = c(0.5, theory_event("SA", c("Q", "A")), theory_event("CA", c("Q", "A")),
            0.6, 0.325, 0.65, theory_event("SA", "A"), theory_event("CA", "A")))
stopifnot(max(abs(exact$value - c(0.5, 0.375, 0.25, 0.6, 0.325, 0.65, 0.45, 0.45))) < 1e-12)

# Four calls per hypothesis. Exploratory cluster bootstrap, not iid-world CIs.
# Shared B/C draws preserve their exact pairing in every bootstrap replication.
RNGkind("Mersenne-Twister", "Inversion", "Rejection")
set.seed(2026101101L)
n_boot <- 2000L
groups <- list()
for (arm in c("A", "B", "C")) for (h in c("SA", "CA")) {
  z <- worlds[worlds$arm == arm & worlds$H == h, , drop = FALSE]
  groups[[paste(arm, h)]] <- split(z, as.character(z$batch))
}
boot <- vector("list", n_boot * 6L)
boot_index <- 0L
for (iteration in seq_len(n_boot)) {
  selected <- list()
  for (h in c("SA", "CA")) {
    a_names <- names(groups[[paste("A", h)]])
    bc_names <- names(groups[[paste("B", h)]])
    stopifnot(setequal(bc_names, names(groups[[paste("C", h)]])))
    selected[[paste("A", h)]] <- sample(a_names, length(a_names), replace = TRUE)
    selected[[paste("B", h)]] <- sample(bc_names, length(bc_names), replace = TRUE)
    selected[[paste("C", h)]] <- selected[[paste("B", h)]]
  }
  for (arm in c("A", "B", "C")) {
    zs <- do.call(rbind, groups[[paste(arm, "SA")]][selected[[paste(arm, "SA")]]])
    zc <- do.call(rbind, groups[[paste(arm, "CA")]][selected[[paste(arm, "CA")]]])
    for (repr in c("states", "coded")) {
      values <- ppc_summary(view_data(zs, repr), view_data(zc, repr))
      boot_index <- boot_index + 1L
      boot[[boot_index]] <- cbind(data.frame(iteration = iteration, arm = arm, representation = repr),
                                 as.data.frame(as.list(values)))
    }
  }
}
boot <- do.call(rbind, boot)
boot_quantities <- c("ppc_joint_fixed_weights", "ppc_joint_lower", "ppc_joint_upper",
                    "ppc_conditional_fixed_weights", "posterior_SA_plugin", "ppc_joint_plugin",
                    "ppc_conditional_plugin")
intervals <- list()
for (i in seq_len(nrow(ppc))) for (quantity in boot_quantities) {
  z <- boot[boot$arm == ppc$arm[i] & boot$representation == ppc$representation[i], quantity]
  finite <- is.finite(z)
  # Do not construct a point-estimate interval by dropping ambiguous original data.
  usable <- is.finite(ppc[[quantity]][i]) && any(finite)
  ends <- if (usable) unname(quantile(z[finite], c(0.025, 0.975), type = 7)) else c(NA_real_, NA_real_)
  intervals[[length(intervals) + 1L]] <- data.frame(
    arm = ppc$arm[i], representation = ppc$representation[i], quantity = quantity,
    estimate = ppc[[quantity]][i], exploratory_lower = ends[1L], exploratory_upper = ends[2L],
    n_bootstrap = n_boot, n_finite_bootstrap = sum(finite),
    unit = "call/batch within hypothesis; 4 observed batches; exploratory percentile interval")
}
intervals <- do.call(rbind, intervals)

paired <- data.frame(key = pair_key(b$id), H = b$H, batch = b$batch, B_id = b$id, C_id = c$id,
                     states_identical = TRUE,
                     B_exact = row_audit$exact_vector[match(b$id, row_audit$id)],
                     C_exact = row_audit$exact_vector[match(c$id, row_audit$id)])
paired$paired_difference_in_exact_recovery <- as.integer(paired$B_exact) - as.integer(paired$C_exact)
paired_summary <- aggregate(paired$paired_difference_in_exact_recovery,
                            paired[c("H", "batch")], mean)
names(paired_summary)[3L] <- "B_minus_C_exact_recovery"

write_result(sample_sizes, "sample_sizes.csv")
write_result(metrics, "event_metrics.csv")
write_result(joint, "joint_cell_metrics.csv")
write_result(tv, "joint_distribution_metrics.csv")
write_result(row_audit, "coding_row_audit.csv")
write_result(fidelity, "coding_fidelity.csv")
write_result(ppc, "ppc_estimates.csv")
write_result(exact, "exact_checks.csv")
write_result(boot, "bootstrap_draws.csv")
write_result(intervals, "bootstrap_intervals.csv")
write_result(paired, "paired_BC.csv")
write_result(paired_summary, "paired_BC_by_batch.csv")

plot_ppc <- function() {
  par(mar = c(6.5, 4.5, 3.5, 1.5), las = 1)
  x <- seq_len(nrow(ppc))
  values <- ppc$ppc_joint_fixed_weights
  plot(x, rep(0.325, length(x)), type = "n", xlim = c(0.5, length(x) + 0.5), ylim = c(0, 1),
       xaxt = "n", xlab = "", ylab = "Probability of replicated Q = 1 and A = 1",
       main = "Figure 1. Predictive reconstruction in the synthetic carbon pilot")
  abline(h = seq(0, 1, by = 0.1), col = "grey92")
  abline(h = 0.325, col = "#222222", lty = 2, lwd = 2)
  for (i in x) {
    ci <- intervals[intervals$arm == ppc$arm[i] & intervals$representation == ppc$representation[i] &
                      intervals$quantity == "ppc_joint_fixed_weights", , drop = FALSE]
    col <- if (ppc$representation[i] == "states") "#2166AC" else "#B35806"
    if (is.finite(values[i])) {
      if (is.finite(ci$exploratory_lower) && is.finite(ci$exploratory_upper))
        arrows(i, ci$exploratory_lower, i, ci$exploratory_upper, angle = 90, code = 3, length = 0.04, col = col)
      points(i, values[i], pch = 19, cex = 1.3, col = col)
    } else {
      segments(i, ppc$ppc_joint_lower[i], i, ppc$ppc_joint_upper[i], col = col, lwd = 3)
      points(rep(i, 2L), c(ppc$ppc_joint_lower[i], ppc$ppc_joint_upper[i]), pch = 1, col = col)
    }
  }
  axis(1, at = x, labels = paste(ppc$arm, ppc$representation, sep = "\n"), tick = FALSE)
  legend("topright", legend = c("Exact declared model: 0.325", "Generated states", "Decoded documents"),
         col = c("#222222", "#2166AC", "#B35806"), lty = c(2, NA, NA), pch = c(NA, 19, 19), bty = "n", cex = 0.8)
  mtext("32 worlds per hypothesis and arm; 4 calls per hypothesis. Bootstrap bars are exploratory.",
        side = 1, line = 3.8, cex = 0.75)
  mtext("Open endpoints show identification bounds from unresolved/contradictory coding, not confidence intervals.",
        side = 1, line = 4.9, cex = 0.7)
}
png(file.path(out_dir, "ppc_reconstruction.png"), width = 1800, height = 1200, res = 200)
plot_ppc()
dev.off()
capture.output(sessionInfo(), file = file.path(out_dir, "analysis_sessionInfo.txt"))
writeLines(c(
  "No historical SA/CA parameters were estimated. All theory inputs are synthetic.",
  "Primary PPC uses fixed posterior weights 0.6/0.4; plugin recalibration is separate.",
  "Conditional replication plugin holds Qrep fixed while retaining posterior from the JOINT observed E=(Q=1,A=1). It is not a refit with Q treated as fixed in the observed-data likelihood.",
  "Unresolved coding remains in the denominator. Contradictions make the whole coded vector unresolved.",
  "Cell upper bounds are individual bounds and cannot all be attained simultaneously.",
  "Bootstrap resamples four calls within each hypothesis, pairing B/C; it is exploratory, not iid-world inference.",
  "No test of equivalence or independent human coding validation was performed.",
  "Synthetic checks compare distributions implied by the declared model, not historical truth.",
  paste("Main worlds:", nrow(worlds), "Extra coded controls:", nrow(extra_codes)),
  "Bootstrap RNG: Mersenne-Twister / Inversion / Rejection; seed 2026101101; repetitions 2000."
), file.path(out_dir, "analysis_notes.txt"), useBytes = TRUE)
cat("Analysis completed. Main worlds:", nrow(worlds), "; bootstrap draws:", n_boot,
    "; outputs:", out_dir, "\n")
