# Frozen synthetic validation oracle. This file is not supplied to discovery,
# generation, or blind coding. Parameters are design choices, not carbon data.
# Usage: Rscript --vanilla scripts/oracle.R [output_directory]
# Existing data outputs are never overwritten.

args <- commandArgs(trailingOnly = TRUE)
root <- if (length(args)) args[[1L]] else
  "quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications"
data_dir <- file.path(root, "data")
dir.create(data_dir, recursive = TRUE, showWarnings = FALSE)
targets <- file.path(data_dir, c("oracle_rules.json", "benchmark.csv",
                                "benchmark_documents.json"))
if (any(file.exists(targets))) {
  stop("Oracle outputs already exist; use a fresh output directory to reproduce.")
}
if (!requireNamespace("jsonlite", quietly = TRUE)) stop("jsonlite is required.")

RNGkind("Mersenne-Twister", "Inversion", "Rejection")
seed <- 2026101121L
set.seed(seed)
frozen_at <- format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
conditions <- c("null", "fault_mechanism", "fault_documentation")
cost <- 6
p_sa <- 0.6
p_behavior_flip <- 0.05
p_public_flip_null <- 0.05
p_public_flip_fault <- 0.80

make_dataset <- function(condition, index, role = "benchmark") {
  # H is common within a dataset: 12 repeated worlds conditional on H.
  hypothesis <- if (runif(1L) < p_sa) "SA" else "CA"
  behavior_hypothesis <- if (condition == "fault_mechanism") {
    if (hypothesis == "SA") "CA" else "SA"
  } else hypothesis
  shock <- ifelse(runif(12L) < 0.5, "regulatory", "competitive")
  regulatory_post <- ifelse(shock == "regulatory", 2, 12)
  competitive_post <- ifelse(shock == "competitive", 2, 12)
  assumed_payoff <- if (hypothesis == "SA") regulatory_post - cost else
    competitive_post - cost
  behavior_payoff <- if (behavior_hypothesis == "SA") regulatory_post - cost else
    competitive_post - cost
  intended <- as.integer(behavior_payoff >= 0)
  behavior_flip <- as.integer(runif(12L) < p_behavior_flip)
  internal_support <- as.integer(xor(intended == 1L, behavior_flip == 1L))
  p_public_flip <- if (condition == "fault_documentation")
    p_public_flip_fault else p_public_flip_null
  public_flip <- as.integer(runif(12L) < p_public_flip)
  public_support <- as.integer(xor(internal_support == 1L, public_flip == 1L))
  dataset_id <- sprintf("%s_%s_%04d", role, condition, index)
  data.frame(
    role = role, dataset_id = dataset_id,
    world_id = sprintf("%s_W%02d", dataset_id, seq_len(12L)),
    blind_id = NA_character_, condition = condition,
    hypothesis = hypothesis, behavior_hypothesis = behavior_hypothesis,
    posterior_probability_SA = p_sa,
    shock = shock, day0_support = 1L,
    cost = cost, regulatory_baseline = 12, competitive_baseline = 12,
    regulatory_post = regulatory_post, competitive_post = competitive_post,
    assumed_payoff = assumed_payoff, behavior_payoff = behavior_payoff,
    intended_support = intended, behavior_flip = behavior_flip,
    internal_support = internal_support, public_flip = public_flip,
    public_support = public_support,
    signal_day = 10L, memo_day = 11L, public_note_day = 12L,
    private_commercial_numbers_in_public = 0L,
    stringsAsFactors = FALSE
  )
}

benchmark <- do.call(rbind, lapply(conditions, function(condition) {
  do.call(rbind, lapply(seq_len(1000L), function(i) {
    make_dataset(condition, i, "benchmark")
  }))
}))

# Separate, small textual corpus. Its truth and condition mapping live only in
# benchmark.csv, never in benchmark_documents.json.
audit <- do.call(rbind, lapply(conditions, function(condition) {
  make_dataset(condition, 1L, "textual_audit")
}))
audit <- audit[sample.int(nrow(audit)), , drop = FALSE]
audit$blind_id <- sprintf("SYN_DOC_%03d", seq_len(nrow(audit)))
rownames(audit) <- NULL
all_rows <- rbind(benchmark, audit)
write.csv(all_rows, targets[[2L]], row.names = FALSE, na = "", fileEncoding = "UTF-8")

documents <- lapply(seq_len(nrow(audit)), function(i) {
  x <- audit[i, ]
  signal <- if (x$shock == "regulatory") {
    paste0("No dia 10, um aviso confiável recebido internamente reduziu de 12 ",
           "para 2 a avaliação da carga regulatória alternativa. A avaliação ",
           "do ganho competitivo permaneceu em 12.")
  } else {
    paste0("No dia 10, um aviso confiável recebido internamente reduziu de 12 ",
           "para 2 a avaliação do ganho competitivo. A avaliação da carga ",
           "regulatória alternativa permaneceu em 12.")
  }
  internal_choice <- if (x$internal_support == 1L) "manter o apoio" else
    "retirar o apoio"
  public_choice <- if (x$public_support == 1L) "mantemos nosso apoio" else
    "retiramos nosso apoio"
  list(
    id = x$blind_id,
    documents = list(
      list(type = "internal_memo", day = 11L,
           text = paste0("SINTÉTICO. Memorando interno, dia 11. A coalizão das ",
                         "quatro firmas endossou a proposta no dia 0. O custo ",
                         "da proposta é 6. ", signal, " A decisão registrada ",
                         "após esse aviso é ", internal_choice, ". Este ",
                         "memorando é interno; o aviso não foi divulgado ",
                         "diretamente ao público.")),
      list(type = "public_note", day = 12L,
           text = paste0("SINTÉTICO. Nota pública, dia 12. A coalizão das ",
                         "quatro firmas comunica: ", public_choice,
                         " à proposta de precificação de carbono. Esta nota ",
                         "não divulga avaliações comerciais internas."))
    )
  )
})
jsonlite::write_json(list(
  description = "Synthetic documentary corpus; no real carbon-case quotations.",
  worlds = documents
), targets[[3L]], pretty = TRUE, auto_unbox = TRUE)

rules <- list(
  status = "FROZEN_BEFORE_LLM_DISCOVERY",
  frozen_at_utc = frozen_at,
  synthetic_only = TRUE,
  seed = seed,
  rng = RNGkind(),
  r_version = R.version.string,
  parameter_origin = "Explicit synthetic design choices; not estimated historical probabilities.",
  analysis_unit = "A coalition of four firms; H is drawn once per dataset and shared across its 12 worlds.",
  baseline = list(day = 0L, support = 1L, cost = cost,
                  regulatory_alternative_burden = 12,
                  net_competitive_gain = 12),
  shock = list(day = 10L, probability_regulatory = 0.5,
               changed_component_from = 12, changed_component_to = 2,
               unchanged_component = 12, privately_received_reliable = TRUE),
  hypothesis_prior_for_replication = list(SA = p_sa, CA = 1 - p_sa,
     interpretation = "Fixed posterior weights inherited from the synthetic reduced E3 model, conditional on D=1."),
  behavior = list(SA_payoff = "regulatory_post - cost",
                  CA_payoff = "competitive_post - cost",
                  decision_rule = "support iff payoff >= 0",
                  probability_decision_flip = p_behavior_flip),
  documents = list(internal_memo_day = 11L, public_note_day = 12L,
                   internal_memo_reports_decision_without_error = TRUE,
                   public_note_probability_flip_null = p_public_flip_null,
                   no_public_private_commercial_numbers = TRUE,
                   no_information_before_signal = TRUE),
  conditions = list(
    null = "Use stipulated H payoff and null documentary process.",
    fault_mechanism = "Swap SA and CA payoff rules for decisions only; leave stipulated H and documentary process unchanged.",
    fault_documentation = paste0("Use stipulated H for decisions; set public-note probability of ",
                                  "inverting the internal decision to 0.80.")),
  sampling = list(datasets_per_condition = 1000L, worlds_per_dataset = 12L,
                   textual_audit_worlds_per_condition = 12L,
                   conditional_independence = "World shocks, decision flips, and public-note flips are independent conditional on the shared dataset H; the public decision depends on its internal decision."),
  secrecy = list(not_supplied_to = c("LLM discovery", "LLM generator", "blind coders"),
                  text_condition_mapping = "Stored only in benchmark.csv rows with role=textual_audit.",
                  candidate_statistics = "Intentionally unspecified; no retuning after discovery."),
  limitations = c(
    "Fault-mechanism ensembles can resemble the alternative hypothesis; mixture PPC power may be weak, which is an intended possible result.",
    "The H draw is common across worlds; treating all worlds as unconditionally independent is incorrect.",
    "These synthetic inputs and documents do not validate historical likelihoods."
  )
)
jsonlite::write_json(rules, targets[[1L]], pretty = TRUE, auto_unbox = TRUE,
                     digits = 16)
cat("Frozen synthetic oracle created at ", frozen_at, "\n", sep = "")
cat("Benchmark rows: ", nrow(benchmark), "; audit rows: ", nrow(audit), "\n", sep = "")
cat("Independent review is required; this script does not certify its own validity.\n")
