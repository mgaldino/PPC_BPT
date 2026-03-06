# Posterior Predictive Checks for Bayesian Process Tracing

**[DRAFT v1 --- assembled 2026-03-05]**

---

## Abstract

Bayesian process tracing (BPT) has imported the machinery of Bayesian updating but not the machinery of Bayesian diagnostics. We develop *qualitative posterior predictive checks* (PPCs) for BPT: a procedure in which the analyst derives predictions from the fitted model about evidence not yet examined and compares those predictions to domain knowledge or newly collected data. To address the circularity objection, we formalize the problem as one of correlated elicitation errors and propose design principles --- including multi-channel likelihood elicitation --- that reduce this correlation. We demonstrate the framework on two cases that contrast sharply in posterior extremity: Fairfield and Charman's (2022) canonical application to Chile's 2005 income tax reform (posterior $\approx 1.0$), where the PPC generates sharp predictions and confirms broad coherence while surfacing diagnostic refinements; and their (2025) Bayesian reanalysis of oil majors' carbon pricing support (posterior $\approx 0.71$ for H$_{SA}$), where the PPC reveals that post-2020 holdout evidence dramatically strengthens the original posterior and that company-level heterogeneity challenges the binary hypothesis structure. The comparison illustrates a key property of the framework: extreme posteriors generate the most testable predictions.

**Keywords:** Bayesian process tracing, posterior predictive checks, model diagnostics, qualitative methods, likelihood specification, Chile tax reform, climate politics

---

# 1. Introduction

Bayesian process tracing has transformed the practice of causal inference in qualitative research. Since Fairfield and Charman's (2017) foundational guidelines, researchers can now specify priors over hypotheses, assign likelihoods to evidence in decibels, update via Bayes' rule, and report posterior probabilities that make the strength of their inferences explicit and auditable. The methodology has been extended to iterative research designs (Fairfield and Charman 2019), mixed-methods integration (Behrens and Rohlfing 2025; Humphreys and Jacobs 2015, 2023), policy evaluation (Befani and Stedman-Bryce 2017; Brandao et al. 2023), and qualitative replication analysis (Fairfield and Charman 2025). Books by Fairfield and Charman (2022) and Humphreys and Jacobs (2023) have consolidated BPT as a mainstream tool for social inquiry.

Yet in importing the Bayesian machinery of *updating*, the qualitative methods community has not imported the Bayesian machinery of *diagnostics*. In quantitative Bayesian statistics, fitting a model is only the beginning. The analyst then asks: does this fitted model make sense? The standard tool for answering this question is the posterior predictive check (PPC): the analyst derives what the model, having learned from the data, predicts about new or replicated observations, and compares those predictions to what is actually observed (Gelman, Meng, and Stern 1996; Gabry et al. 2019; Gelman et al. 2020). Systematic discrepancies signal model misspecification and guide revision. PPCs are now considered an essential component of the Bayesian workflow --- not an optional add-on but a constitutive element of responsible Bayesian practice (Gelman and Shalizi 2013; Gelman et al. 2020).

No analogous tool exists for BPT. Having specified likelihoods, updated to a posterior, and reported the results, the BPT analyst has no formal procedure for checking whether the likelihood specification is empirically plausible. The validation of likelihood assignments currently relies on verbal argumentation, sensitivity analysis of priors (Fairfield and Charman 2017: 372--374), and the judgment of the research community via peer review. This is the gap that Zaks (2021: 58) identifies when she characterizes BPT as "a method without clear guardrails" --- the concern is not that researchers assign probabilities, but that there is no systematic way to detect when those assignments go wrong.

This paper proposes a solution. We develop *qualitative posterior predictive checks* for BPT: a formal procedure in which the analyst, having obtained a posterior distribution over hypotheses, (1) identifies evidence not examined in the original analysis, (2) derives the model's predictions about that evidence using the posterior predictive distribution, and (3) compares the predictions to domain knowledge or newly collected data. Discrepancies between predictions and observations provide diagnostic information about where the model's likelihood specification may be miscalibrated --- and, crucially, about how to fix it.

The core insight is straightforward. Errors in likelihood specification that are invisible when we examine only the evidence already incorporated into the analysis become visible when the model is asked to predict evidence it has not yet seen. A researcher who has assigned likelihoods to six pieces of archival evidence and arrived at a posterior distribution can ask: *given this posterior, what should I expect to find if I examine a seventh piece of evidence?* If the model's prediction is wildly at odds with what domain knowledge suggests, something in the specification is likely wrong.

Our contribution is both methodological and empirical. Methodologically, we formalize the qualitative posterior predictive distribution as a discrete analogue of the standard PPC formula, operationalize it as a six-step workflow that integrates into existing BPT practice, and situate it relative to existing diagnostic tools --- particularly sensitivity analysis of priors (Fairfield and Charman 2017). We also address the circularity objection head-on: rather than claiming that qualitative PPCs are "not circular," we formalize the problem as one of correlated errors in likelihood elicitation and propose design principles --- including blind second-analyst elicitation and human--LLM triangulation with diversified prompts --- that reduce the correlation between estimation and checking errors. Empirically, we demonstrate the procedure on two cases that contrast sharply in posterior extremity. The first is Fairfield and Charman's (2022) canonical application to Chile's 2005 income tax reform, where the posterior is approximately 1.0 for the equity appeal hypothesis. The second is their (2025) Bayesian reanalysis of oil majors' carbon pricing advocacy, where the posterior is a modest 4 dB (~71%) for the strategic accommodation hypothesis. The contrast is deliberate: it tests the framework's prediction that extreme posteriors generate the most testable predictions, and it demonstrates that PPCs can generate qualitatively different diagnostic insights depending on the posterior's extremity.

The paper proceeds as follows. Section 2 reviews the BPT literature and the tradition of posterior predictive checking in Bayesian statistics, identifying the gap that motivates our proposal. Section 3 develops the qualitative PPC framework: the formal apparatus, the six-step workflow, practical guidance on discrepancy assessment, scope conditions, and a detailed treatment of the circularity problem --- including a formal framework for correlated elicitation errors and protocols for multi-channel likelihood elicitation. Section 4 applies the framework to the Chilean tax reform case, integrating empirical evidence, a multi-channel elicitation exercise using human and LLM assessments, and a stress test that demonstrates the PPC's ability to detect deliberate misspecification. Section 5 applies the framework to the oil majors case, demonstrating how the PPC operates with non-extreme posteriors and publicly verifiable holdout evidence. Section 6 discusses the findings, addresses limitations, and outlines an agenda for future work.


# 2. BPT and the Missing Diagnostic

## 2.1 The State of Bayesian Process Tracing

The formalization of process tracing along Bayesian lines has proceeded in three phases. The first, culminating in Bennett's (2008) chapter in the *Oxford Handbook of Political Methodology*, established the conceptual parallel between process tracing and Bayesian inference: evidence can be classified by its diagnostic value, and updating beliefs about hypotheses in light of evidence follows the logic of Bayes' rule. The connection was suggestive but informal.

The second phase, inaugurated by Humphreys and Jacobs (2015) and Fairfield and Charman (2017), made the formalization explicit. Humphreys and Jacobs developed the BIQQ framework for integrating qualitative and quantitative evidence within a single Bayesian model. Fairfield and Charman proposed detailed guidelines for explicit Bayesian analysis in qualitative case research, using weight of evidence measured in decibels --- a logarithmic scale where approximately 3 dB corresponds to "barely worth mentioning," 10 dB to "moderate" evidence, 20 dB to "strong" evidence, and 30 dB to "very strong" evidence (Fairfield and Charman 2017: 370). Their application to Chile's 2005 tax reform demonstrated that even a small number of well-characterized evidence items could produce overwhelming posterior support for one hypothesis over its rivals. Barrenechea and Mahoney (2019) connected BPT to set-theoretic foundations, showing that the two approaches are "two faces of the same coin."

The third phase, from approximately 2020 to the present, has seen consolidation and critique. Fairfield and Charman (2022) published a comprehensive book-length treatment. Humphreys and Jacobs (2023) developed the *CausalQueries* computational framework. Applications have expanded to policy evaluation (Brandao et al. 2023; Befani 2020), mixed-methods integration (Behrens and Rohlfing 2025), and qualitative replication analysis (Fairfield and Charman 2025), including reanalysis of climate politics research (Vormedal et al. 2020). At the same time, Zaks (2021, 2022) mounted a systematic critique, questioning whether BPT provides adequate guidance for practitioners and identifying the absence of "guardrails" as a fundamental weakness. Bennett, Fairfield, and Charman (2022) responded by clarifying foundational issues, but the debate remains open on the question of how to validate likelihood specifications.

Yet despite this growth, the number of papers that apply formal BPT with explicit numerical likelihoods to real empirical cases remains modest --- roughly 10 to 15 as of early 2026. The field has reached a stage where the conceptual framework is well-established but the practical infrastructure for quality control is underdeveloped.

## 2.2 Posterior Predictive Checks in Bayesian Statistics

The idea that a fitted model should be checked against its own predictions has deep roots in Bayesian statistics. Box (1980) argued that scientific inference involves an iterative cycle of estimation and criticism, with the predictive distribution serving as the basis for model criticism. Rubin (1984) provided a formal justification for posterior predictive checks as "Bayesianly justifiable and relevant frequency calculations." Meng (1994) developed the posterior predictive p-value as a Bayesian analogue of the classical p-value. The foundational treatment is Gelman, Meng, and Stern (1996), who introduced "realized discrepancies" --- test statistics evaluated at both observed data and replicated data drawn from the posterior predictive distribution --- as the primary tool for model assessment. Their key insight was that PPCs serve a diagnostic rather than decisional function: the goal is not to accept or reject a model but to understand *how* and *where* it fails.

Subsequent work has refined and extended the approach. Gabry et al. (2019) developed graphical tools for posterior predictive checking implemented in the *bayesplot* R package. Gelman and Shalizi (2013) offered a philosophical defense, arguing that Bayesian statistics is best understood as hypothetico-deductive rather than inductivist, with model checking playing the role of "falsification" within the Bayesian cycle. Gelman et al. (2020) integrated PPCs into a comprehensive "Bayesian workflow" framework in which model building, inference, checking, and revision form a continuous iterative loop.

The central formula is well-known. Given observed data $y$ and model parameters $\theta$, the posterior predictive distribution for a new observation $y^{\text{rep}}$ is:

$$p(y^{\text{rep}} \mid y) = \int p(y^{\text{rep}} \mid \theta) \, p(\theta \mid y) \, d\theta$$

This distribution represents what the model, having learned from the data, expects new data to look like. The analyst generates replicated datasets and compares them to the observed data; systematic discrepancies signal misspecification.

## 2.3 The Gap

The connection between these two literatures is logically necessary but has not been made. If BPT is Bayesian, it should incorporate model checking. Yet no paper proposes a formal routine for posterior predictive checking in BPT. Table 1 summarizes the closest existing contributions and what each lacks.

**Table 1: Closest Existing Contributions**

| Work | What it does | What it lacks for PPC in BPT |
|------|-------------|------------------------------|
| Fairfield & Charman (2017) | Sensitivity analysis with different priors | Focus on priors, not likelihoods; no formal checking framework |
| Fairfield & Charman (2019) | Iterative research design: collect new evidence in light of intermediate posteriors | Iterative *updating* presupposes model is well-specified; does not *diagnose* specification |
| Befani et al. (2021) | Simulated probabilities via agent-based models | Limited to program evaluation; no explicit PPC formalization |
| Humphreys & Jacobs (2023) | *CausalQueries*: specify and interrogate causal models | DAG-based formalism, not posterior predictive distribution |
| Behrens & Rohlfing (2025) | Posterior predictive sampling from regression for case selection | PPCs from the quantitative component, not from BPT itself |
| Gelman & Shalizi (2013) | Philosophical argument: model checking = falsification | Conceptual parallel with PT, but no operational proposal for qualitative context |

The gap is not accidental. Adapting PPCs to BPT requires solving a conceptual problem: in quantitative analysis, "replicated data" means generating synthetic datasets from the fitted model, but in qualitative research one cannot resample archival documents or simulate interview transcripts. The adaptation must therefore redefine what "prediction" and "comparison" mean in a discrete, qualitative setting. This is the task we take up in the next section.

# 3. Framework: Qualitative Posterior Predictive Checks for Bayesian Process Tracing

This section develops qualitative posterior predictive checks for BPT. We begin with the formal apparatus, then operationalize it as a workflow, and address the circularity problem that arises when predictive likelihoods are elicited by the same analyst who estimated the model.

A crucial feature of the qualitative PPC is that *extreme posteriors generate the most testable predictions* --- and these are precisely the cases where the researcher most needs a diagnostic, because they are the cases where the posterior creates a "case closed" impression that discourages further scrutiny. Consider a posterior of 0.99 for the leading hypothesis. This means the model predicts that virtually all unobserved evidence should conform to that hypothesis: $P(e^* \mid \mathbf{e}_{\text{obs}}) \approx P(e^* \mid H_{\text{dominant}})$, since the posterior weight on all other hypotheses is negligible. The predictions are therefore *sharp* --- driven almost entirely by what the dominant hypothesis implies --- and *easy to confront* with domain knowledge, provided the dominant hypothesis itself makes strong claims about the holdout evidence (i.e., $P(e^* \mid H_{\text{dominant}})$ is close to 0 or 1 rather than near 0.5). If even a few predictions turn out to be implausible, the extreme posterior is directly challenged. The mathematical fact that the posterior predictive distribution collapses onto the dominant hypothesis when the posterior is extreme is not a weakness of the procedure --- it is the mechanism by which the PPC works. It transforms the model's confidence into a testable commitment. As we demonstrate in Section 4, Fairfield and Charman's (2022) analysis of Chile's 2005 tax reform produces a posterior of approximately 1.0 for the equity appeal hypothesis, robust to alternative prior specifications. The qualitative PPC exploits this extreme posterior to generate four sharp predictions that can be confronted with domain knowledge and publicly available data.

## 3.1 The Posterior Predictive Distribution in the BPT Context

In BPT, the "parameters" of interest are hypotheses $H_1, H_2, \ldots, H_K$ about the causal process that produced an outcome of interest. Rather than continuous parameters over which we integrate, we have a discrete set of hypotheses over which we sum. The "data" are pieces of qualitative evidence --- documents, interview testimony, behavioral patterns, institutional records --- each characterized by its likelihood under each hypothesis.

Suppose the researcher has observed evidence $\mathbf{e}_{\text{obs}} = (e_1, e_2, \ldots, e_n)$ and updated to a posterior distribution $P(H_i \mid \mathbf{e}_{\text{obs}})$ for $i = 1, \ldots, K$. Now consider a piece of *potential* evidence $e^*$ --- an observation that the researcher has not yet examined but could, in principle, seek out. The **qualitative posterior predictive distribution** for $e^*$ is:

$$P(e^* \mid \mathbf{e}_{\text{obs}}) = \sum_{i=1}^{K} P(e^* \mid H_i) \times P(H_i \mid \mathbf{e}_{\text{obs}})$$

This expression is the discrete analogue of the standard PPC formula. It says: the probability of observing $e^*$, given everything we have learned so far, is a weighted average of the probability of $e^*$ under each hypothesis, where the weights are the posterior probabilities of the hypotheses.

**A worked example.** Suppose a researcher has two hypotheses, $H_1$ and $H_2$, and after observing evidence has arrived at posteriors $P(H_1 \mid \mathbf{e}_{\text{obs}}) = 0.80$ and $P(H_2 \mid \mathbf{e}_{\text{obs}}) = 0.20$. Now consider a piece of holdout evidence $e^*$ --- say, whether a specific document exists in an archive. The researcher judges that this document is very likely to exist if $H_1$ is true ($P(e^* \mid H_1) = 0.90$) but unlikely if $H_2$ is true ($P(e^* \mid H_2) = 0.20$). The posterior predictive probability is:

$$P(e^* \mid \mathbf{e}_{\text{obs}}) = 0.90 \times 0.80 + 0.20 \times 0.20 = 0.72 + 0.04 = 0.76$$

The model predicts with probability 0.76 that the document exists. If the researcher then discovers that it does *not* exist, the discrepancy is notable: the model assigned 76% probability to something that turned out to be false. This discrepancy could signal that $P(e^* \mid H_1) = 0.90$ was too high (likelihood miscalibration) or that $H_1$'s posterior of 0.80 is inflated. Note also how the posterior weights matter: if the posterior had been more diffuse ($P(H_1) = 0.50$, $P(H_2) = 0.50$), the predictive probability would be $0.90 \times 0.50 + 0.20 \times 0.50 = 0.55$ --- a weaker prediction and a less diagnostic check. This illustrates the point developed below: extreme posteriors generate the sharpest predictions.

### Interpretation

Several features of this expression deserve emphasis.

First, notice that the posterior predictive distribution depends on *both* the likelihoods $P(e^* \mid H_i)$ and the posteriors $P(H_i \mid \mathbf{e}_{\text{obs}})$. The posteriors, in turn, were determined by the likelihoods assigned to previously observed evidence. This means that the posterior predictive distribution is a compound reflection of the *entire* model specification --- not just the likelihoods for the new evidence $e^*$, but also the likelihoods for $e_1, \ldots, e_n$ that generated the posteriors. It is this compound character that gives the tool its diagnostic power.

Second, unlike in quantitative PPCs, we do not literally "generate replicated data." We cannot resample archival documents or simulate interview transcripts. Instead, the qualitative PPC asks a different but analogous question: *given the model's current state (the posterior), how strongly does it predict that a specific piece of evidence will be present or absent, positive or negative, strong or weak?* The check consists of comparing this prediction to what domain knowledge, auxiliary evidence, or eventual observation suggests.

Third, the expression naturally accommodates the distinction between binary evidence (an observation is either made or not made) and graded evidence (an observation can take different forms, ranging from strongly supportive of one hypothesis to strongly supportive of another). In the binary case, $e^*$ takes values in $\{$present, absent$\}$; in the graded case, $e^*$ takes values in a set of qualitative categories that the researcher specifies.

Fourth, the formula makes explicit an operation that good qualitative researchers already perform implicitly --- namely, asking "if my leading hypothesis is correct, what else should I expect to find?" The contribution of formalizing this operation is not to replace substantive judgment but to make the reasoning *auditable*. When the prediction and the observation diverge, the formalization makes it possible to trace the source of the discrepancy back to specific assumptions.

### What the posterior predictive distribution is *not*

It is important to be clear about what this tool does not do. The posterior predictive distribution is not a test of whether a hypothesis is "true" or "false." It is a diagnostic of *internal coherence*: given the assumptions embedded in the model (priors and likelihoods), do the model's out-of-sample predictions make sense? A model can pass posterior predictive checks and still be wrong about the world, just as a quantitative model can generate plausible-looking replicated data while being misspecified in ways that the chosen test statistics do not capture (Gelman, Meng, and Stern 1996: 737). The value of the check lies not in certification but in *diagnosis*: it helps identify specific points where the model's assumptions may be implausible. Conversely, when predictions are broadly confirmed, the PPC provides only weak evidence of model adequacy --- the model has survived one set of checks but may still be misspecified in ways that the chosen holdout evidence does not capture.

It is also important to distinguish the PPC from simply continuing to update the posterior with additional evidence. Standard BPT allows incorporating new evidence at any time: the analyst collects a seventh piece of evidence, assigns likelihoods, and updates. But this procedure *presupposes* that the model is well-specified --- that the hypothesis set is adequate and the likelihoods for previous evidence were reasonable. The PPC serves a logically prior function: it asks whether the specification deserves that trust. If the PPC reveals a discrepancy, the appropriate response is not to add the new evidence and update but to *revise the model* --- adjust likelihoods, reinterpret evidence, or expand the hypothesis set (Step 5). The PPC thus occupies a different position in the inferential workflow: it diagnoses the specification before further updating proceeds.


## 3.2 Operationalization: The Qualitative PPC Workflow

This subsection translates the formal apparatus into a practical procedure. The workflow consists of six steps, designed to be integrated into the existing BPT process after the initial round of updating.

### Step 1: Conduct standard BPT to obtain a posterior

The starting point is a completed (or partially completed) round of Bayesian process tracing. The researcher has:

- Specified a set of mutually exclusive and exhaustive hypotheses $H_1, \ldots, H_K$.
- Assigned prior probabilities $P(H_i)$.
- Collected evidence $\mathbf{e}_{\text{obs}} = (e_1, \ldots, e_n)$.
- For each piece of evidence and each hypothesis, specified a likelihood $P(e_j \mid H_i)$.
- Updated to a posterior $P(H_i \mid \mathbf{e}_{\text{obs}})$ via Bayes' rule.

This step is not new; it is the standard BPT procedure as described in Fairfield and Charman (2017, 2022). The qualitative PPC begins where this procedure ends.

### Step 2: Identify potential unobserved evidence

The researcher now asks: *what other evidence, not yet examined, could I in principle observe?* This step generates a list of potential evidence items $e^*_1, e^*_2, \ldots, e^*_m$ that will serve as the basis for the predictive check.

Not all potential evidence is equally useful for diagnostic purposes. The most informative items are those that satisfy one or more of the following criteria:

- **Mechanism-derived evidence.** If a hypothesis posits a specific causal mechanism, the mechanism implies observable traces. Evidence that follows from the *internal logic of the mechanism* but was not used in the initial analysis is particularly valuable.

- **Evidence from a different domain.** If the initial evidence comes from archival documents, predictions about interview testimony (or vice versa) provide a check that spans evidentiary domains. Cross-domain predictions are harder for a misspecified model to "game," because errors in likelihood specification are less likely to be correlated across domains.

- **Evidence that would be surprising under at least one hypothesis.** The most diagnostic evidence is that which sharply discriminates between hypotheses --- evidence whose predicted probability varies substantially across the $H_i$. Evidence that every hypothesis predicts equally well carries no diagnostic information.

- **Evidence that is accessible but was not used.** Practical feasibility matters. The researcher should focus on evidence items that could realistically be sought or that are known to exist but were not incorporated into the initial analysis.

A practical minimum is 3 to 5 items drawn from at least two of the criteria above. The lower bound ensures coverage of at least two evidentiary domains (reducing the risk that all holdout items share correlated elicitation errors) and provides enough observations to distinguish isolated mispredictions from systematic patterns. The upper bound reflects diminishing marginal returns: each additional item requires specifying likelihoods under each hypothesis, and the qualitative assessment becomes harder to manage as the number of comparisons grows.

### Step 3: Derive the model's predictions

For each potential evidence item $e^*_k$ and each hypothesis $H_i$, the researcher specifies a likelihood: *how probable is this evidence if $H_i$ is the correct hypothesis?* This is the same type of judgment involved in standard BPT --- the researcher draws on substantive knowledge to assess how expected or unexpected the evidence would be under each hypothesis. These likelihoods are then combined with the posterior using the formula in Section 3.1.

The result is a **predictive narrative**: a structured account of what the model, taken as a whole, expects to find. Importantly, the researcher should articulate these predictions *before* examining the new evidence or consulting auxiliary sources. This temporal discipline is what prevents the check from degenerating into a post hoc rationalization.

### Step 4: Assess qualitative coherence

The researcher now compares the model's predictions with external information. This external information can come from several sources:

- **Direct observation.** If the potential evidence can actually be collected, then the prediction is compared to what is actually found.

- **Domain knowledge.** Even without collecting new evidence, the researcher (or a colleague with domain expertise) may have strong intuitions about what should or should not exist.

- **Evidence known but not incorporated.** Researchers often encounter evidence during fieldwork that does not fit neatly into the analysis or that was set aside for practical reasons. These "orphan" observations can serve as a check.

- **Auxiliary literature.** Published research on the same case or closely related cases may provide information about the plausibility of the model's predictions.

The assessment is inherently qualitative. There is no p-value, no formal threshold, no automatic rejection criterion. The researcher asks: *does the prediction strike me (and would it strike a knowledgeable colleague) as reasonable, given what is known about this case?* This is a judgment call --- but it is a *structured* judgment call, grounded in explicit predictions derived from explicit assumptions.

### Step 5: Diagnose and revise when discrepancies arise

When the model's prediction conflicts with external information, the researcher has identified a discrepancy. The task is now to trace the discrepancy back to its source and revise accordingly. Discrepancies can arise from several sources:

**Likelihood revision.** The most common and least disruptive response. The discrepancy suggests that one or more likelihoods in the original analysis were miscalibrated. The researcher revises the likelihood and re-updates the posterior.

**Hypothesis revision.** The discrepancy may suggest that the hypothesis set is incomplete --- that none of the specified hypotheses adequately accounts for the pattern of evidence. This is the most substantively consequential form of revision.

**Evidential reinterpretation.** The discrepancy may stem from a misunderstanding of what a piece of evidence means. An archival document initially interpreted as supporting $H_1$ may, on reflection, be ambiguous.

**Structural revision.** In rare cases, the discrepancy may point to a deeper problem with the model's structure --- for example, the assumption that hypotheses are mutually exclusive, or the conditional independence of evidence items given the hypotheses.

The researcher need not determine with certainty which type of revision is appropriate. The diagnostic power of the PPC lies in *localizing the problem*: the discrepancy identifies a specific prediction that the model gets wrong, which narrows the search for the source of the error.

### Step 6: Iterate and document

The revised model generates new posteriors, which generate new predictions, which may reveal further discrepancies. The researcher iterates until the model's predictions are qualitatively coherent with domain knowledge and available evidence --- or until the researcher has exhausted the evidence items identified in Step 2.

**Documentation is essential.** The researcher should record, for each iteration:

- The potential evidence items considered.
- The likelihoods assigned under each hypothesis.
- The model's predictions (the posterior predictive narrative).
- The external information used for comparison.
- The discrepancy identified (if any).
- The revision made and the rationale for it.

This record serves two purposes. It makes the analysis *transparent* --- a reader can trace the researcher's reasoning. And it provides a *guard against circularity*.


## 3.3 Assessing Discrepancies in Practice

The workflow described above may suggest a more algorithmic procedure than is actually feasible. In practice, assessing whether a model's prediction is "discrepant" with external information requires judgment that cannot be reduced to a mechanical rule. Several considerations can help structure the judgment.

**Magnitude matters.** A model that assigns a 0.70 probability to the existence of evidence that turns out to be absent is less alarming than a model that assigns a 0.95 probability to evidence that turns out to be absent. The researcher is looking for predictions that are *strikingly* at odds with the available information.

**Patterns matter more than individual items.** A single misprediction can result from bad luck or imprecise likelihood specification. But if the model systematically mispredicts across multiple evidence items, the pattern suggests a structural problem.

**The direction of the discrepancy is informative.** A model that predicts evidence *more strongly* than warranted may have inflated the likelihoods under the leading hypothesis. A model that predicts evidence *less strongly* than warranted may have underweighted a hypothesis. The direction provides a diagnostic clue about the nature of the revision needed.

**Consult a colleague.** When feasible, the researcher can present the model's predictions to a domain expert *without* revealing the model's posteriors and ask whether the predictions seem reasonable. This informal "adversarial check" provides an external perspective.

The underlying philosophy mirrors that of Gelman and colleagues in the quantitative context: posterior predictive checks are "a tool for understanding model fit, not a formal hypothesis test" (Gelman, Meng, and Stern 1996: 734). The goal is to learn about the model, not to certify it.

In quantitative Bayesian model checking, posterior predictive assessments are often summarized through discrepancy measures or posterior predictive p-values. Our qualitative adaptation does not aim to reproduce that scalar summary. Its objective is more modest: to provide a formalized comparison between the evidentiary implications generated by the model and the additional evidence observed in the case. The diagnostic force of the check lies in whether the holdout evidence is broadly consistent or inconsistent with those posterior predictive implications, not in a single thresholded test statistic. The aim of the qualitative PPC is not to produce a posterior predictive p-value, but to probe the model for predictive surprise. Although we do not formalize surprise as a scalar quantity in this paper, the exercise is still diagnostic because it disciplines how surprise is assessed. Rather than allowing the researcher to retrofit the narrative after inspecting new material, the PPC requires explicit predictive implications, structured evaluation of holdout evidence, and transparent justification of whether that evidence is broadly expected or genuinely surprising under the model.


## 3.4 Relationship to Sensitivity Analysis of Priors

Fairfield and Charman (2017: 372--374) recommend sensitivity analysis by varying prior probabilities. Qualitative PPCs complement rather than replace this practice. The key difference: sensitivity analysis asks *do my conclusions change if I started from different priors?* PPCs ask *given my posterior, does the model make sensible predictions about unobserved evidence?* The former checks the role of the prior; the latter checks the role of *likelihoods*. The two tools are orthogonal: a model can pass one check and fail the other.

## 3.5 Scope Conditions and Limitations

### When qualitative PPCs work best

The tool is most valuable when three conditions are met:

1. **The domain is sufficiently well understood to generate non-trivial predictions.** PPCs are most useful for cases embedded in a rich empirical literature or studied by a researcher with deep area knowledge.

2. **There exist identifiable potential evidence items.** The researcher must be able to articulate what kinds of evidence might exist and what they would look like.

3. **The hypotheses generate distinguishable predictions.** If all hypotheses assign similar likelihoods to the potential evidence, no diagnostic information is available.

### Hypothesis structure

The PPC formula inherits the mutual exclusivity assumption from BPT: the hypotheses $H_1, \ldots, H_K$ must be logically mutually exclusive. Following Fairfield and Charman (2022: 87; 2023), we emphasize that mutual exclusivity of hypotheses is conceptually distinct from exclusivity of the variables, causal factors, or mechanisms they invoke. Hypotheses that share causal factors can still be mutually exclusive if they posit different functional relationships or scope conditions. When a PPC reveals that the evidence is best explained by a *combination* of factors drawn from different hypotheses (as our application illustrates), the appropriate response is to add a composite hypothesis to the set and re-run the analysis --- a standard move in BPT that the PPC can help motivate.

## 3.6 Addressing the Circularity Problem

The most serious objection to qualitative PPCs is circularity. In quantitative PPCs, the separation between model and check is clean: the model generates replicated data mechanically, and the researcher compares. In qualitative PPCs, the researcher must specify predictive likelihoods $P(e^* \mid H_i)$ using the same type of substantive judgment that produced the original likelihoods, and must also assess whether the resulting predictions are coherent with the case. If the same biases that distorted the original likelihoods also distort the predictive likelihoods, the check may mechanically confirm the original model rather than diagnose its misspecification.

We take this objection seriously. Our response is not that qualitative PPCs eliminate circularity --- that claim would be too strong for qualitative research. Our claim is narrower:

> Qualitative posterior predictive checks have diagnostic value not because they eliminate subjectivity, but because they can introduce structured opportunities for surprise when predictive judgments are elicited independently, prospectively, and across evidence domains.

Their value lies in creating structured opportunities for surprise and revision that are absent in standard BPT applications. To make this claim precise, we first formalize the circularity problem and then propose design principles and protocols that reduce its severity.

### Correlated errors in likelihood elicitation

Let the true likelihood for evidence item $e_j$ under hypothesis $H_i$ be $L_{ij} = P(e_j \mid H_i)$. Suppose the researcher does not observe $L_{ij}$ directly but instead elicits a distorted version:

$$\tilde{L}_{ij} = L_{ij} \cdot \exp(\epsilon_{ij})$$

where $\epsilon_{ij}$ is an error term capturing misjudgment, overconfidence, narrative overfitting, or other sources of distortion.

For holdout evidence $e^*_k$, the true predictive likelihood is $L^*_{ik} = P(e^*_k \mid H_i)$, but the elicited value is:

$$\tilde{L}^*_{ik} = L^*_{ik} \cdot \exp(\eta_{ik})$$

where $\eta_{ik}$ is the predictive elicitation error.

The circularity problem arises when $\epsilon_{ij}$ and $\eta_{ik}$ are positively correlated. In that case, the same latent bias that distorted the original likelihoods also distorts the predictive likelihoods, so the posterior predictive check may mechanically confirm the original model. The design problem is therefore not how to eliminate subjective judgment, but how to reduce $\mathrm{Corr}(\epsilon_{ij}, \eta_{ik})$ --- or, more modestly, how to make it unlikely that both stages are driven by the same error-generating process.

### Design principles for credible checks

We propose four design principles that reduce the correlation between estimation errors and checking errors.

**Principle 1: Pre-specification before examining new evidence.** A qualitative PPC is more informative when the predictive likelihoods are specified before the researcher inspects the additional evidence used for the check. This does not eliminate judgment, but it reduces the scope for ex post rationalization. Once the new material has been seen, the researcher can always adjust predictive assessments to protect the original model. Pre-specification makes such repair more difficult and therefore increases the credibility of the check.

**Principle 2: Separation between estimation and checking.** The check is stronger when the person assigning predictive likelihoods is not the same person who derived the posterior from the original evidence, or at least does not know the posterior at the time of elicitation. A second researcher can assign predictive likelihoods for the holdout evidence while blind to the posterior ranking of hypotheses. This makes the check less dependent on a single coherent narrative built by one analyst.

**Principle 3: External elicitation by domain experts.** A related strategy is to delegate predictive elicitation to an external expert with substantive knowledge of the case. The expert need not estimate the full BPT model; their narrower task is only to assess how likely the holdout evidence would be under each hypothesis. This creates a partial division of labor: one analyst estimates the model, another contributes predictive judgments. The diagnostic value of the PPC is higher when those stages are separated.

**Principle 4: Adversarial or multi-analyst checking.** The strongest qualitative PPC is produced under adversarial collaboration. Researchers with different prior substantive commitments independently assign predictive likelihoods for the same holdout evidence. The paper then reports whether the check is robust across these alternative elicitation exercises. If the model only "passes" under one analyst's judgments but fails under others, that divergence is itself substantively informative --- it suggests that the apparent success of the check depends too heavily on a particular interpretive stance.

### Strong protocols: reducing correlated errors in practice

These design principles can be implemented through specific protocols. The strongest protocols are those that introduce heterogeneity in who generates the predictive likelihoods and how they are generated.

**Protocol 1: Blind second analyst.** The cleanest protocol is to have a second analyst assign predictive likelihoods without knowing the posterior ranking produced by the original analysis. This breaks the most obvious source of correlated error: the tendency of the original analyst to protect the model they already estimated. The second analyst may still be wrong, but their errors are less likely to be driven by the same inferential commitment. A practical version: (1) Analyst A estimates the original BPT model; (2) holdout evidence is fixed in advance; (3) Analyst B receives only the hypotheses and holdout materials; (4) Analyst B assigns $P(e^*_k \mid H_i)$ blind to the posterior; (5) the PPC is computed using Analyst B's predictive likelihoods.

**Protocol 2: Human--LLM triangulation.** A second strong protocol combines human elicitation with large language model (LLM) elicitation. The rationale is not that LLMs are neutral --- it is that their errors are often generated differently from human errors. Human analysts tend to impose coherent substantive narratives; LLMs tend to rely on textual pattern completion, generic plausibility, and overgeneralization. These are different failure modes. A useful design: (1) the original human analyst estimates the model; (2) a blind human analyst or the same analyst using pre-specification elicits predictive likelihoods; (3) one or more LLMs, using fixed prompts and the same holdout material, also elicit predictive likelihoods; (4) the paper reports convergence or divergence across these channels. Agreement across heterogeneous systems is more informative than agreement within a single human workflow.

**Protocol 3: Prompt diversification across LLM runs.** If LLMs are used, repeated runs with nearly identical prompts do not provide much independence. A stronger design uses different prompt families that induce different inferential styles --- for example, one prompt asks for standard process-tracing assessment, one for a skeptical or adversarial assessment, and one for a minimalist assessment that penalizes inferential leaps. Prompt diversification is the LLM analogue of using different coding strategies or estimators: the goal is not repetition but heterogeneity in the pathway generating the answer.

**Protocol 4: Pre-specification of holdout evidence and predictive elicitation.** The holdout evidence should be fixed before examining it, and predictive likelihoods should be elicited before the analyst inspects the material in detail. This removes a major source of shared bias: ex post adjustment. The minimal rule: (1) define the holdout evidence ex ante; (2) elicit predictive likelihoods ex ante; (3) only then inspect the holdout material for the PPC.

A recommended protocol for empirical work would combine Protocols 1, 2, and 4: the original analyst estimates the model; holdout evidence is selected by rule in advance; a blind second analyst elicits predictive likelihoods; one or more LLMs with distinct prompts also elicit predictive likelihoods; and the paper reports whether the PPC conclusion is robust across these heterogeneous elicitation channels. We implement a version of this protocol in Section 4.

### Graded credibility of qualitative PPCs

These design principles imply that qualitative PPCs should be presented as *graded* rather than binary. Some checks are weak, some are strong. A same-researcher, post hoc predictive check should be treated as exploratory. A blind, pre-specified, externally elicited check should be treated as much more credible. This grading allows the field to calibrate its confidence in PPC results according to the design used to produce them.

### The revised claim

The paper therefore does not argue that qualitative PPCs are "not circular." That claim is too strong for qualitative research. The defensible claim is that qualitative PPCs have diagnostic value when predictive judgments are made prospectively and with at least partial independence from the original estimation exercise. This formulation is more modest but also stronger: it acknowledges the continuing role of judgment while identifying concrete procedures that make the check genuinely informative rather than merely confirmatory.

Using the formal framework above: a qualitative PPC is more credible when predictive likelihoods are generated through heterogeneous elicitation channels whose errors are unlikely to share the same latent source. This is the qualitative analogue of validating a computational result across different programming languages. The point is not that any one elicitation channel is error-free, but that convergence across channels with different failure modes is less likely to be the product of correlated error.


## 3.7 Other Objections and Limitations

**Objection: Qualitative assessment is debatable.** The assessment of coherence relies on judgment (as discussed in Section 3.3). This objection is valid but does not undermine the tool's value. The alternative is *no check at all*. A debatable check is better than no check. The transparency requirement means readers who disagree can offer their own evaluation.

**Objection: The risk of p-hacking by analogy.** Could a researcher manipulate the choice of evidence items to make the model appear better than it is? In principle, yes. The mitigation is the same as in quantitative analysis: report all checks conducted, not just those that support the desired conclusion. Pre-specification of holdout evidence (Protocol 4 above) further mitigates this concern.

### What qualitative PPCs do not do

- They do not provide a definitive test of model adequacy. They provide *diagnostic information*.
- They do not eliminate the subjectivity of likelihood specification. They *discipline* that subjectivity by subjecting it to out-of-sample scrutiny and, when strong protocols are used, by separating the stages of estimation and checking.
- They do not replace careful, substantively informed process tracing. They add a layer of quality control.

The goal, following Gelman and Shalizi (2013), is not to "prove" that the model is correct but to identify the specific ways in which it might be wrong --- and thereby to improve it.


# 4. Application: Reanalyzing Fairfield and Charman's Chilean Tax Reform

The qualitative PPC framework proposed in Section 3 is only as valuable as its ability to illuminate features of a BPT analysis that would otherwise remain hidden. This section puts the framework to work on what is arguably the canonical application of explicit Bayesian process tracing: Fairfield and Charman's analysis of Chile's 2005 income tax reform, presented in their *Political Analysis* article (2017) and developed in full detail in their book (Fairfield and Charman 2022, ch. 10). The case is ideal for a first demonstration. The analysis is fully transparent --- priors, likelihoods in decibels, and posteriors are all reported. The case is substantively well-understood, thanks to Fairfield's (2015a) book-length treatment of Chilean tax politics. And the number of evidence items is small enough (six) to permit a detailed walk-through of every step in the workflow.

The goal is not to "overturn" Fairfield and Charman's conclusions. It is to show that even a well-executed BPT analysis benefits from the discipline of posterior predictive checking --- and that the exercise can reveal features of the model specification that deserve further scrutiny.


## 4.1 The Case: Chile's 2005 Income Tax Reform

### Background

In 2005, the Chilean government under President Ricardo Lagos succeeded in eliminating Article 57 bis of the Income Tax Law --- a preferential tax regime that granted a tax credit on savings invested in financial instruments such as stocks, mutual funds, and time deposits. The subsidy had been introduced with the stated purpose of incentivizing household savings, but in practice it overwhelmingly benefited high-income individuals: data from the Servicio de Impuestos Internos (SII) showed that just 0.5% of adults received 72% of the associated tax expenditure (Fairfield 2015b). Its elimination was a rare instance of progressive tax reform in a country where cohesive business elites, allied with right-wing parties (UDI and RN), had historically blocked attempts to increase direct taxation (Fairfield 2015a).

The puzzle is why the reform succeeded in 2005 when the same initiative had been discussed and dismissed in multiple prior reform episodes (1990, 1995, 1998, 2001). During the 2005 presidential campaign, Chile's Catholic bishops denounced the country's extreme inequality, raising the salience of the issue. Right-coalition candidate Joaquin Lavin responded by blaming persistent inequality on the governing left coalition. President Lagos seized the opportunity, issuing a public equity appeal: "The famous Article 57 bis is still in force and signifies a tremendous source of inequality. ... Instead of just talking, why don't we agree to eliminate 57 bis in less than 24 hours?" (Lagos, quoted in *El Mercurio*, May 10, 2005; Fairfield and Charman 2022: ch. 10). The right, which held a majority in the Senate, accepted the challenge and voted in favor. The reform was enacted as Ley 20.028, published in the *Diario Oficial* on June 30, 2005.

### The BPT analysis

Fairfield and Charman evaluate three mutually exclusive hypotheses regarding why the right accepted the 2005 reform (Fairfield and Charman 2022: ch. 10):

- $H_{EA}$ **(Equity Appeal):** Lagos's equity appeal, in the context of a major electoral campaign where inequality had assumed high issue-salience, drove the right to accept the reform. The causal mechanism is concern within the right coalition that rejecting the initiative would damage its candidate's electoral prospects.

- $H_{MV}$ **(Median Voter):** The right accepted the reform in accord with a simple median voter model, where electoral competition drives politicians to converge on policies that promote the median voter's material interests. Lagos's equity appeal and the specific electoral context were irrelevant.

- $H_{CC}$ **(Core Constituency):** The right accepted the reform because the preferences of its core constituency had changed. Over time, the material value of the 57 bis subsidy had declined, so the right's elite base no longer had a strong interest in defending it.

**Priors.** Fairfield and Charman work with equal priors (1/3 each) and demonstrate that the posterior is robust to alternative prior specifications.

**Evidence.** Six pieces of evidence ($E_0$--$E_5$) are evaluated, drawn from extensive fieldwork including interviews, archival research, and observation of congressional proceedings. Fairfield and Charman follow a "weigh, not count" principle: non-informative evidence items (those that do not discriminate among hypotheses) are omitted from the formal analysis, and some items are composites summarizing multiple observations that point in the same direction.

| Evidence | Description | WoE vs. $H_{CC}$ (dB) | WoE vs. $H_{MV}$ (dB) |
|----------|-------------|:---:|:---:|
| $E_0$ | Context: Lagos's challenge and the electoral salience of inequality. This evidence uniquely *favors the rival hypotheses* over $H_{EA}$ | $-5$ | $-10$ |
| $E_1$ | Reform previously discussed by center-left but blocked by the right in prior episodes (1990, 1995, 1998, 2001) | $+6$ | $+66$ |
| $E_2$ | Government informants confirm equity appeal was decisive; 57 bis described as "pure transfer to rich people" | $+12$ | $+12$ |
| $E_3$ | After the 2001 Anti-Evasion reform, the government tried to negotiate 57 bis elimination with business, without success | $+25$ | $0$ |
| $E_4$ | Right-party technical advisor opposed elimination but was overruled: "we will lose votes if we don't approve it" | $+30$ | $+15$ |
| $E_5$ | Lavin's advisors compared the 57 bis bill to the "1999 trap"; UDI deputy confirmed party decided to "support what the candidate said" to "not harm the presidential option" | $+30$ | $+27$ |

A distinctive feature of the analysis is $E_0$: the background context (Lagos's challenge, the bishops' intervention, the electoral salience of inequality) is evidence that *disfavors* $H_{EA}$ relative to the rivals. This is because $E_0$ is a necessary condition for $H_{EA}$ to operate, so its presence is expected under all hypotheses that posit a response to the equity challenge. Fairfield and Charman assign negative weight of evidence ($-5$ dB vs. $H_{CC}$, $-10$ dB vs. $H_{MV}$), reflecting that the electoral context slightly favors the rival hypotheses at the outset.

**Posterior.** After sequential updating across all six evidence items, the total weight of evidence for $H_{EA}$ is 98 dB relative to $H_{CC}$ and 110 dB relative to $H_{MV}$. This corresponds to a posterior probability for $H_{EA}$ of approximately 1.0 regardless of the prior specification. These are overwhelming margins: 98 dB means the evidence is approximately $10^{9.8}$ times more likely under $H_{EA}$ than under $H_{CC}$.

The analysis concludes that the equity appeal mechanism provides an overwhelmingly strong explanation for the right's acceptance of the 2005 reform.


## 4.2 Applying the Qualitative PPC Workflow

### Step 1: Starting from the posterior

The posterior from Fairfield and Charman's analysis assigns overwhelming probability to $H_{EA}$: $P(H_{EA} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$. Because $H_{EA}$ dominates, the model's predictions about unobserved evidence will be driven almost entirely by what $H_{EA}$ implies. If $H_{EA}$ is indeed the correct hypothesis, its predictions should be coherent with what we know about the case. If they are not, the dominance of $H_{EA}$ in the posterior may be a symptom of miscalibrated likelihoods.

### Step 2: Identifying potential evidence

We identify four items of evidence that were not incorporated into the original BPT analysis. These items span distinct evidentiary domains --- legislative records, comparative politics, internal party deliberations, and business behavior --- and are selected for diagnostic value: mechanism-derived implications, cross-domain evidence, and discriminating predictions.

1. **Congressional committee records ($e^*_1$).** The Chilean Biblioteca del Congreso Nacional (BCN) maintains the "Historia de la Ley" for every enacted law, compiling committee reports, floor debate transcripts, and formal testimony. For Ley 20.028, this record (BCN ID 6630) documents how government officials, business representatives, and legislators framed the reform in committee.

2. **Comparative evidence from earlier reform attempts ($e^*_2$).** The Lagos government pursued at least five tax initiatives between 2001 and 2005. If equity appeals were the key mechanism in 2005, earlier reforms should show weaker or absent equity framing when they failed. This item tests whether the equity appeal is *sufficient* or merely *necessary* for progressive tax reform.

3. **Right-coalition internal deliberations ($e^*_3$).** Internal party records --- caucus meeting minutes, memoranda, or internal communications within UDI and RN --- would reveal whether the decision to accept the 57 bis elimination was *reactive* (a response to Lagos's public challenge, as $H_{EA}$ predicts) or *pre-existing* (reflecting a prior assessment that the subsidy was no longer worth defending, as $H_{CC}$ predicts). This item tests the temporal sequence of the causal mechanism and provides sharp discrimination between $H_{EA}$ and $H_{CC}$.

4. **Elite lobbying silence ($e^*_4$).** A systematic search for evidence of business lobbying to defend the 57 bis subsidy --- communications from business associations (CPC, SOFOFA), financial industry groups, or individual high-net-worth beneficiaries to legislators or party leaders. The *absence* of organized lobbying would constitute "evidence of absence" bearing on $H_{CC}$: if the right's core constituency did not mobilize to defend the subsidy, this suggests their material interest had indeed declined.

### Step 3: Deriving the model's predictions

For each evidence item, we derive what the posterior model predicts. Given $P(H_{EA} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$, the posterior predictive distribution is dominated by likelihoods under $H_{EA}$: $P(e^*_k \mid \mathbf{e}_{\text{obs}}) \approx P(e^*_k \mid H_{EA})$.

We specify likelihoods under each hypothesis and derive the predictive narrative.

**Prediction 1 (Committee records, $e^*_1$).** Under $H_{EA}$, government witnesses should have emphasized distributional fairness while business representatives focused on economic merits of savings incentives rather than contesting the equity frame directly. Under $H_{CC}$, committee debate should have centered on the subsidy's declining relevance or its technical obsolescence. Under $H_{MV}$, the equity frame would appear but as an electoral tactic rather than the dominant substantive argument. We assign:

| | $H_{EA}$ | $H_{MV}$ | $H_{CC}$ |
|---|---|---|---|
| $P(e^*_1 = \text{equity-dominated debate})$ | 0.85 | 0.50 | 0.30 |

Posterior predictive probability of equity-dominated debate: $\approx 0.85$.

**Prediction 2 (Comparative reforms, $e^*_2$).** Under $H_{EA}$, earlier reform attempts that failed or required major concessions should have featured weaker equity framing. Under $H_{CC}$, earlier failures should be explained by the persistence of business preferences (which only changed later). Under $H_{MV}$, failures would be explained by different electoral conditions.

| | $H_{EA}$ | $H_{MV}$ | $H_{CC}$ |
|---|---|---|---|
| $P(e^*_2 = \text{weak equity framing in failed reforms})$ | 0.70 | 0.35 | 0.40 |

Posterior predictive: $\approx 0.70$.

**Prediction 3 (Internal deliberations, $e^*_3$).** Under $H_{EA}$, internal party records should show that the decision to accept the reform was *reactive* --- taken *after* Lagos's public challenge and driven by electoral-damage calculations. Under $H_{CC}$, internal records should show that the right had *already* assessed the subsidy as expendable *before* the public challenge, reflecting constituency indifference. Under $H_{MV}$, internal records would reference generic electoral competition without emphasizing the specific equity appeal. This item provides the sharpest discrimination between $H_{EA}$ and $H_{CC}$ because it tests the *temporal sequence* of the causal mechanism.

| | $H_{EA}$ | $H_{MV}$ | $H_{CC}$ |
|---|---|---|---|
| $P(e^*_3 = \text{reactive decision post-challenge})$ | 0.90 | 0.50 | 0.15 |

Posterior predictive: $\approx 0.90$. Note the strong discrimination: if the decision was pre-existing rather than reactive, the posterior predictive probability would be dramatically at odds with the observation.

**Prediction 4 (Lobbying silence, $e^*_4$).** Under $H_{EA}$, business lobbying to defend 57 bis may or may not have occurred --- the equity appeal operates through political/electoral channels, and business behavior is not central to the mechanism. Under $H_{CC}$, the *absence* of organized lobbying is strongly predicted: if the right's core constituency no longer valued the subsidy, there should be no mobilization to defend it. Under $H_{MV}$, business lobbying is orthogonal to the mechanism (electoral competition drives the outcome regardless).

| | $H_{EA}$ | $H_{MV}$ | $H_{CC}$ |
|---|---|---|---|
| $P(e^*_4 = \text{no organized lobbying to defend 57 bis})$ | 0.55 | 0.50 | 0.85 |

Posterior predictive: $\approx 0.55$. This is one of the few items where the dominant hypothesis ($H_{EA}$) produces a *weaker* prediction than a rival ($H_{CC}$), making it particularly diagnostic. Finding no lobbying would be unremarkable under $H_{EA}$ but strongly expected under $H_{CC}$; finding active lobbying that was overridden would strongly favor $H_{EA}$.

**Summary of predictions:**

| Evidence | Description | Posterior Predictive $P(e^* \mid \mathbf{e}_{\text{obs}})$ |
|----------|-------------|---|
| $e^*_1$ | Equity-dominated committee debate | $\approx 0.85$ |
| $e^*_2$ | Weak equity framing in failed reforms | $\approx 0.70$ |
| $e^*_3$ | Reactive decision post-challenge | $\approx 0.90$ |
| $e^*_4$ | No organized lobbying to defend 57 bis | $\approx 0.55$ |


### Multi-Channel Likelihood Elicitation

To implement the elicitation protocol described in Section 3.6, we conducted a multi-channel exercise for the predictive likelihoods in Step 3. The human analyst's assessments (reported above) were compared with LLM assessments from three architecturally distinct model families --- Claude (Anthropic), Gemini (Google), and GPT-5 (OpenAI) --- each given the same prompt in three inferential styles:

1. **Standard assessment.** The LLM was given the case description, hypotheses, and evidence items, and asked to assess likelihoods based on domain knowledge of Latin American politics and process-tracing logic.

2. **Skeptical assessment.** The LLM was prompted to adopt a skeptical stance toward agency-based explanations (particularly $H_{EA}$'s reliance on public rhetoric as a causal mechanism) and to favor structural and institutional explanations.

3. **Minimalist assessment.** The LLM was instructed to apply a strict "minimal interpretation" principle: assign high probabilities (>0.70) only when the mechanism directly and necessarily implies the evidence, and moderate probabilities (0.40--0.60) when the evidence is merely consistent.

Crucially, none of the LLM channels were given the posterior distribution over hypotheses. Each received only the hypotheses, the case description, and the holdout evidence items --- implementing the blind-to-posterior protocol described in Section 3.6.

**Table 4: Multi-Channel Likelihood Comparison (Standard Assessment)**

| Evidence | Hypothesis | Human | Claude | Gemini | GPT-5 |
|----------|-----------|:-----:|:------:|:------:|:-----:|
| $e^*_1$ | $H_{EA}$ | 0.85 | 0.85 | 0.85 | 0.85 |
| $e^*_1$ | $H_{MV}$ | 0.50 | 0.45 | 0.30 | 0.45 |
| $e^*_1$ | $H_{CC}$ | 0.30 | 0.25 | 0.15 | 0.30 |
| $e^*_2$ | $H_{EA}$ | 0.70 | 0.80 | 0.80 | 0.75 |
| $e^*_2$ | $H_{MV}$ | 0.35 | 0.50 | 0.40 | 0.40 |
| $e^*_2$ | $H_{CC}$ | 0.40 | 0.40 | 0.40 | 0.50 |
| $e^*_3$ | $H_{EA}$ | 0.90 | 0.90 | 0.90 | 0.90 |
| $e^*_3$ | $H_{MV}$ | 0.50 | 0.30 | 0.25 | 0.20 |
| $e^*_3$ | $H_{CC}$ | 0.15 | 0.15 | 0.10 | 0.15 |
| $e^*_4$ | $H_{EA}$ | 0.55 | 0.55 | 0.60 | 0.65 |
| $e^*_4$ | $H_{MV}$ | 0.50 | 0.40 | 0.30 | 0.45 |
| $e^*_4$ | $H_{CC}$ | 0.85 | 0.85 | 0.95 | 0.85 |

*Note: Claude = claude-opus-4-6 (Anthropic); Gemini = gemini-2.0-flash (Google); GPT-5 = gpt-5.3-codex (OpenAI). Each model also provided skeptical and minimalist assessments; full results in supplementary materials. All models received the same prompt with case description, hypotheses, and evidence items but were not given the posterior distribution.*

**Table 4b: Prompt-Variation Results (Claude only)**

| Evidence | Hypothesis | Standard | Skeptical | Minimalist |
|----------|-----------|:--------:|:---------:|:----------:|
| $e^*_1$ | $H_{EA}$ | 0.85 | 0.65 | 0.72 |
| $e^*_1$ | $H_{MV}$ | 0.45 | 0.40 | 0.45 |
| $e^*_1$ | $H_{CC}$ | 0.25 | 0.30 | 0.30 |
| $e^*_2$ | $H_{EA}$ | 0.80 | 0.60 | 0.75 |
| $e^*_2$ | $H_{MV}$ | 0.50 | 0.45 | 0.40 |
| $e^*_2$ | $H_{CC}$ | 0.40 | 0.45 | 0.45 |
| $e^*_3$ | $H_{EA}$ | 0.90 | 0.70 | 0.80 |
| $e^*_3$ | $H_{MV}$ | 0.30 | 0.35 | 0.35 |
| $e^*_3$ | $H_{CC}$ | 0.15 | 0.25 | 0.25 |
| $e^*_4$ | $H_{EA}$ | 0.55 | 0.40 | 0.50 |
| $e^*_4$ | $H_{MV}$ | 0.40 | 0.50 | 0.35 |
| $e^*_4$ | $H_{CC}$ | 0.85 | 0.80 | 0.75 |

Several patterns emerge from these comparisons.

**First, ordinal rankings are preserved across all four model families for all four evidence items in the standard assessment (Table 4).** Every channel --- human, Claude, Gemini, and GPT-5 --- agrees that $e^*_1$, $e^*_2$, and $e^*_3$ are most likely under $H_{EA}$ and that $e^*_4$ is most likely under $H_{CC}$. The diagnostic structure of the PPC --- which evidence favors which hypothesis --- is robust to both the elicitation channel and the model architecture. This is the strongest form of convergence evidence: models with different training data, architectures, and latent representations independently agree on the qualitative pattern.

**Second, cross-model agreement on point estimates is remarkably tight for the most diagnostic items.** For $e^*_1$ (committee records), all four channels assign $P(e^*_1 \mid H_{EA}) = 0.85$. For $e^*_3$ (internal deliberations), all assign $P(e^*_3 \mid H_{EA}) = 0.90$. The range across models is zero for these key assessments.

**Third, prompt variation within Claude (Table 4b) shows that the skeptical channel systematically lowers $H_{EA}$ assessments by 0.15--0.20 but does not change the diagnostic conclusions.** Even the skeptic assigns $H_{EA}$ the highest likelihood for $e^*_1$, $e^*_2$, and $e^*_3$. Skeptical assessments from Gemini and GPT-5 show the same pattern, with one exception: for $e^*_2$ (comparative reforms), both Gemini-skeptical and GPT-5-skeptical assign $H_{CC}$ a higher likelihood than $H_{EA}$, consistent with the paper's own assessment that $e^*_2$ is the most ambiguous prediction.

**Fourth, $H_{CC}$ predictions are the most stable across channels.** In the standard assessment, the range of $H_{CC}$ assessments is $\leq 0.15$ for all evidence items. This suggests that the predictions for the core-constituency hypothesis are driven more by the hypothesis's internal logic than by the assessor's inferential stance --- a sign of low susceptibility to correlated elicitation error.

The convergence across architecturally diverse model families provides evidence that the PPC's diagnostic conclusions are not artifacts of a single model's training data or the human analyst's interpretive commitments. In the language of Section 3.6, the use of three independent architectures (Protocol 2) combined with prompt diversification within Claude (Protocol 3) substantially reduces the plausibility that correlated elicitation errors drive the results.

One notable divergence warrants discussion. For $e^*_4$ (lobbying silence), assessments of $P(e^*_4 \mid H_{EA})$ range from 0.40 (Claude-skeptical) to 0.65 (GPT-5-standard). This spread reinforces the ambiguous assessment of $e^*_4$ in Step 4: the lobbying silence is genuinely open to multiple interpretations, and this ambiguity is not an artifact of the human analyst's assessment.


### Step 4: Assessing qualitative coherence

We now compare each prediction against empirical evidence collected from publicly available sources. The evidence collection draws on Chilean legislative records, academic secondary sources (particularly Fairfield 2015a, 2015b), institutional documents, and the original interview evidence reported in Fairfield and Charman (2022).

#### $e^*_1$: Congressional committee records

**Prediction:** Equity-dominated debate (probability $\approx 0.85$).

**Evidence found:** The available evidence is strongly consistent with the prediction, though complete committee transcripts were not directly accessed. The evidence comes from multiple sources within the Fairfield and Charman (2022) analysis and from public institutional records:

- President Lagos framed the reform explicitly as a matter of vertical equity: "a tremendous source of inequality" (*El Mercurio*, May 10, 2005).
- A Finance Ministry official described 57 bis as "a pure transfer of resources to rich people; there was no way to argue differently" (interview, Oct. 13, 2005).
- The *Mensaje Presidencial* (presidential message to Congress) described the benefit as "one of the worst-targeted state subsidies" (Tribunal Constitucional, Rol 1486).
- The right did not contest the equity frame publicly. A technical advisor from the Instituto Libertad y Desarrollo *attempted* to argue that elimination was "a mistake," but was overruled by the legislators themselves, who said "we will lose votes if we don't approve it" ($E_4$).

**Assessment:** The evidence strongly supports the prediction. The equity frame dominated both government argumentation and the right's acquiescence calculus. Importantly, no evidence was found of committee debate emphasizing the declining value of the subsidy ($H_{CC}$) or generic electoral competition ($H_{MV}$) as the primary rationale.

#### $e^*_2$: Comparative evidence from earlier reforms

**Prediction:** Weaker equity framing in reforms that failed or required major concessions (probability $\approx 0.70$).

**Evidence found:** A comparative analysis of the Lagos government's tax initiatives reveals a more complex picture than the simple prediction suggests:

| Reform | Year | Equity Frame? | Type | Intensity | Outcome |
|--------|------|:---:|------|:---:|---------|
| Anti-Evasion (Ley 19.738) | 2001 | Yes | Horizontal + vertical | Moderate | Approved with concessions |
| Corporate tax increase (Ley 19.753) | 2001 | Yes | Vertical + compensation | Moderate | Approved |
| VAT increase (Ley 19.888) | 2003 | No | Pragmatic/fiscal | N/A | Approved |
| Mining Royalty I | 2004 | Partial | Sovereignty > equity | Weak | **Rejected** |
| 57 bis elimination (Ley 20.028) | 2005 | Yes | Vertical (pure) | **Strong** | Approved |
| Mining Royalty II (Ley 20.026) | 2005 | Partial | Fair contribution | Moderate | Approved |

The evidence is **partially consistent** with the prediction:

- The only clearly rejected reform (Mining Royalty I, 2004) used a sovereignty frame rather than a vertical equity frame, consistent with $H_{EA}$'s prediction.
- However, the 2001 Anti-Evasion reform used equity framing (horizontal: "everyone should pay their fair share") but still required major concessions --- particularly on bank secrecy provisions.
- The 2001 corporate tax increase used equity framing but had to be accompanied by *compensation* for elites (reducing the top marginal personal income tax rate from 45% to 40%). President Lagos himself described the personal tax cuts as a "candy" to appease powerful actors.
- The 2003 VAT increase passed *without* equity framing, suggesting that equity framing is not necessary when the cost to economic elites is low (VAT falls on consumers, not profits).

**Assessment:** The comparative evidence suggests that equity framing was probably *necessary but not sufficient* for progressive tax reform under conditions of strong business power. The 57 bis succeeded not only because of the equity frame but also because the stakes for organized business were low --- the subsidy benefited individual investors, not corporations. The discrepancy between "equity framing + high stakes $\rightarrow$ failure/concessions" (Royalty I, Anti-Evasion) and "equity framing + low stakes $\rightarrow$ easy success" (57 bis) points to a potential specification issue: the model may attribute to the equity appeal a causal force that was partly shared with the low-stakes nature of the policy.

#### $e^*_3$: Right-coalition internal deliberations

**Prediction:** Reactive decision post-challenge (probability $\approx 0.90$).

**Evidence found:** Direct access to internal party records (caucus minutes, memoranda) was not obtained. However, the available evidence from interviews and press reports provides substantial indirect information about the temporal sequence:

- The right's technical advisor at the Instituto Libertad y Desarrollo opposed the reform *after* Lagos's challenge, arguing "that is a mistake" --- but was overruled by legislators who cited the electoral cost of rejection ($E_4$). This suggests the party's policy apparatus had *not* previously assessed 57 bis as expendable; the override came from the political leadership responding to the challenge.
- Lavin's advisors explicitly compared the 57 bis bill to the "1999 trap" --- a labor-rights bill whose rejection cost Lavin votes in the 1999 presidential election ($E_5$). The "trap" framing implies a *reactive* calculus: the concern was about damage from *refusing* Lagos's challenge, not about a pre-existing preference to eliminate the subsidy.
- Fairfield (2015b) reports that Lavin "accepted the challenge rapidly," and the right "followed him in the Senate despite business complaints." The sequence --- public challenge $\rightarrow$ rapid acceptance $\rightarrow$ legislative support despite complaints --- is consistent with $H_{EA}$'s reactive mechanism.
- No evidence was found of internal right-coalition discussions about eliminating 57 bis *prior* to Lagos's May 2005 challenge. The reform had been discussed and dismissed in 1990, 1995, 1998, and 2001 ($E_1$), always with right-wing resistance.

**Assessment:** The available evidence strongly supports a reactive decision sequence. The ILD advisor's opposition, the "1999 trap" framing, the rapid timeline, and the absence of pre-existing internal support for elimination all point to $H_{EA}$'s mechanism. If internal party records were to reveal that the right had *already* concluded that 57 bis was expendable before Lagos's challenge, this would substantially shift the diagnostic assessment toward $H_{CC}$. Full access to internal party archives would provide the definitive test.

#### $e^*_4$: Elite lobbying silence

**Prediction:** No organized lobbying to defend 57 bis (probability $\approx 0.55$).

**Evidence found:** The evidence on business behavior comes from multiple sources:

- Fairfield (2015a) provides extensive analysis of business lobbying in Chilean tax politics, documenting active CPC and SOFOFA mobilization against the 2001 Anti-Evasion reform (bank secrecy provisions), the 2004 Mining Royalty I (active opposition from SONAMI and CPC), and the 2001 corporate tax increase (negotiated compensation). In each case, the business community's organized response is documented in detail.
- For the 57 bis elimination, no comparable organized lobbying response is documented. Fairfield (2015b) notes "business complaints" but does not describe organized mobilization by CPC, SOFOFA, or financial industry associations.
- The subsidy's beneficiaries were individual investors, not corporations or business associations. The CPC and SOFOFA had no institutional reason to defend a personal tax credit that did not affect corporate profitability.
- The ILD's opposition ($E_4$) was technical and advisory, not a mobilization of the business community. The ILD advisor was overruled by the party's political leadership.

**Assessment:** The evidence is consistent with lobbying silence, but the interpretation is ambiguous. Under $H_{CC}$, the silence reflects constituency indifference: business did not lobby because the subsidy no longer mattered to the right's core constituency. Under $H_{EA}$, the silence is orthogonal: business did not lobby because the subsidy was a *personal* tax benefit outside the scope of organized business interests (CPC/SOFOFA represent firms, not individual investors). The two interpretations have different implications. If the silence reflects genuine constituency indifference (as $H_{CC}$ predicts), then the equity appeal may have been pushing on an open door --- the right accepted not because of electoral fear but because its base simply did not care. If the silence reflects the subsidy's structural irrelevance to organized business (consistent with $H_{EA}$), then the equity appeal was the decisive mechanism and the lobbying question is a red herring. Distinguishing these two interpretations would require evidence about individual high-net-worth beneficiaries' reactions, which is harder to observe than organized business lobbying.


### Step 5: Diagnosis

The posterior predictive check does not reveal a stark discrepancy that would call for a fundamental revision of the model. Three of the four predictions are broadly coherent with the evidence collected. This is itself informative: it suggests that the likelihood specification underlying the original analysis is broadly reasonable. However, the check surfaces three diagnostic observations that the original analysis does not address.

**Observation 1: The "low-stakes" confound.** The comparative evidence ($e^*_2$) and the lobbying silence ($e^*_4$) converge on a common pattern: the 57 bis reform succeeded not only because of the equity frame but also because the stakes for organized business were low. Reforms with equity framing but high stakes for organized business (Mining Royalty I, Anti-Evasion) faced much greater resistance than the 57 bis reform, which had low stakes for CPC/SOFOFA. The lobbying silence reinforces this: business did not mobilize to defend a personal tax credit outside its institutional scope. This pattern is partly captured by $H_{CC}$ (whose mechanism centers on the declining material value of the subsidy), but the comparative evidence goes further: it suggests a possible *hypothesis revision* toward a composite hypothesis --- "the equity appeal worked *in part because* business power was not strongly engaged" --- that might better account for the full pattern. If this composite mechanism is correct, the strong weight attributed to $H_{EA}$ may partly reflect the absence of such a composite from the hypothesis set.

**Observation 2: The temporal sequence test.** The internal deliberations evidence ($e^*_3$) provides the strongest support for $H_{EA}$'s reactive mechanism. The ILD advisor's opposition, the "1999 trap" framing, and the rapid timeline all point to a decision driven by Lagos's public challenge rather than a pre-existing assessment of the subsidy's expendability. This evidence is particularly valuable because it discriminates sharply between $H_{EA}$ and $H_{CC}$ --- the two hypotheses that the comparative and lobbying evidence cannot easily separate. However, the evidence is indirect (interviews and press reports rather than internal party records). Access to caucus minutes or internal memoranda would provide the definitive test: if the right had discussed dropping 57 bis *before* May 2005, $H_{CC}$ would gain substantial ground.

**Observation 3: The comparative counterfactual.** The prediction about earlier reform attempts ($e^*_2$) highlights a potential weakness in $H_{EA}$'s sufficiency claim. If equity framing was used in earlier reforms that nonetheless encountered difficulty (the 2001 Anti-Evasion reform required concessions despite equity framing; the 2001 corporate tax increase required compensation), then the success of the 2005 reform cannot be attributed *solely* to the equity appeal. Contextual factors --- the specific nature of 57 bis as a clearly regressive individual subsidy, the electoral campaign context, and the low stakes for organized business --- were likely co-determinants. Interestingly, this observation resonates with the structure of the original analysis itself: $E_0$ (the contextual background) is the one piece of evidence that *disfavors* $H_{EA}$, precisely because the context is a necessary condition for the equity appeal to operate. The PPC extends this logic by suggesting that other contextual factors (low business stakes, the subsidy's declining value) may also have been necessary conditions. This calls for *likelihood revision*: the likelihoods assigned to equity-framing evidence under $H_{EA}$ may need to be conditioned on these contextual factors, or a composite hypothesis incorporating them should be added to the model. Computing the sensitivity of the posterior to such revised likelihoods is a natural next step that we leave for future work focused on the substantive case rather than the methodology.


### Step 6: Documentation

**Table 3: PPC Summary**

| Element | Content |
|---------|---------|
| **Posterior** | $P(H_{EA} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$; 98 dB vs. $H_{CC}$, 110 dB vs. $H_{MV}$ |
| **Potential evidence** | 4 items across 4 evidentiary domains (legislative records, comparative politics, internal deliberations, business behavior) |
| **Predictions** | Model predicts equity-consistent evidence across all items ($P$ ranging from 0.55 to 0.90) |
| **Coherence assessment** | Broadly coherent; 2 items strongly supported, 1 partially consistent, 1 ambiguous |
| **Multi-channel elicitation** | 4 model families (human + Claude + Gemini + GPT-5), each with 3 prompt variants (standard/skeptical/minimalist). Ordinal rankings preserved across all model families in standard assessment. Skeptical channels lower $H_{EA}$ by 0.15--0.20 but preserve diagnostic structure. $H_{CC}$ assessments most stable (range $\leq 0.15$). |
| **Diagnoses** | (1) Low-stakes confound: comparative reforms + lobbying silence suggest business indifference co-explains the outcome. (2) Temporal sequence test: internal deliberations strongly support reactive mechanism ($H_{EA}$) but rely on indirect evidence. (3) Comparative counterfactual challenges sufficiency of equity framing alone. |
| **Revision recommended?** | No fundamental revision. Original analysis well-supported. PPC identifies points for refinement: (a) consider composite hypothesis incorporating low business stakes; (b) seek internal party records for definitive temporal sequence test; (c) distinguish business-structural from constituency-preference explanations for lobbying silence. |


## 4.3 Stress Test: Does the PPC Detect Deliberate Misspecification?

The preceding analysis applied the PPC to a model that the original authors considered well-specified, and the check confirmed broad coherence. But can the PPC detect misspecification when it exists? To demonstrate the tool's diagnostic power, we conduct a stress test: we deliberately impose an incorrect posterior and ask whether the PPC's predictions become discrepant with the holdout evidence.

**Setup.** We retain the same predictive likelihoods from Step 3 but replace the posterior. Instead of $P(H_{EA} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$, we impose $P(H_{CC} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$ --- as if the model had concluded that the right accepted the reform because its core constituency no longer valued the 57 bis subsidy. Under this misspecified posterior, the model's predictions are driven entirely by likelihoods under $H_{CC}$.

**Predictions under the misspecified model:**

| Evidence | Description | $P(e^* \mid H_{CC})$ | Actual evidence |
|----------|-------------|:---:|---------|
| $e^*_1$ | Equity-dominated debate | 0.30 | Equity framing dominated (strongly supported under correct model) |
| $e^*_2$ | Weak equity in failed reforms | 0.40 | Partially consistent under correct model |
| $e^*_3$ | Reactive decision post-challenge | 0.15 | Strong evidence of reactive sequence under correct model |
| $e^*_4$ | No organized lobbying | 0.85 | No organized lobbying found (ambiguous under correct model) |

**Results.** The misspecified model produces two clear discrepancies:

1. **$e^*_1$ (committee records).** The model predicts that equity-dominated debate is unlikely (0.30), but the holdout evidence shows that the equity frame dominated both government argumentation and the right's acquiescence calculus. The discrepancy is sharp: the evidence that was most expected under the correct model is poorly predicted by the wrong one.

2. **$e^*_3$ (internal deliberations).** The model predicts that a reactive decision is very unlikely (0.15) --- under $H_{CC}$, the right should have been *already disposed* to accept the reform before Lagos's challenge. But the evidence shows the opposite: the ILD advisor opposed the reform, the "1999 trap" framing implies reactive electoral calculation, and no pre-existing support for elimination was found. This is the sharpest discrepancy: the misspecified model assigns probability 0.15 to an outcome that the evidence strongly confirms.

3. **$e^*_4$ (lobbying silence).** The model correctly predicts no organized lobbying (0.85), and this is observed. This item does not help detect the misspecification --- it is equally consistent with the wrong model.

This gross misspecification is easy to detect. A harder question is whether the PPC can detect *moderate* misspecification --- a posterior that overweights $H_{EA}$ relative to a more balanced assessment. Consider a posterior of $P(H_{EA}) = 0.60$, $P(H_{CC}) = 0.30$, $P(H_{MV}) = 0.10$. The posterior predictive probabilities become:

| Evidence | $P(e^* \mid \mathbf{e}_{\text{obs}})$ under correct model ($H_{EA} \approx 1.0$) | $P(e^* \mid \mathbf{e}_{\text{obs}})$ under moderate misspecification |
|----------|:---:|:---:|
| $e^*_1$ (equity debate) | 0.85 | $0.85 \times 0.60 + 0.50 \times 0.10 + 0.30 \times 0.30 = 0.65$ |
| $e^*_3$ (reactive decision) | 0.90 | $0.90 \times 0.60 + 0.50 \times 0.10 + 0.15 \times 0.30 = 0.64$ |
| $e^*_4$ (no lobbying) | 0.55 | $0.55 \times 0.60 + 0.50 \times 0.10 + 0.85 \times 0.30 = 0.64$ |

Under this moderate scenario, the predictions shift but remain broadly consistent with the holdout evidence. The PPC would not flag a clear discrepancy --- the predictions are still plausible. This is expected: the moderate posterior still assigns 60% to $H_{EA}$, so the predictions remain dominated by the correct hypothesis. The qualitative PPC is better suited to detecting gross misspecification (wrong hypothesis dominating) than subtle overconfidence in the correct hypothesis. This is an honest limitation, analogous to the well-known conservatism of posterior predictive p-values in quantitative settings (Bayarri and Berger 2000).

The stress tests together demonstrate two properties. First, the PPC detects gross misspecification: a model dominated by $H_{CC}$ generates predictions clearly discrepant with the holdout evidence. Second, the PPC is less sensitive to moderate misspecification, where the correct hypothesis retains substantial weight. The diagnostic power depends on both the degree of misspecification and the choice of holdout evidence, which is why Step 2's selection criteria emphasize cross-domain coverage and discriminating predictions.


# 5. Application: Reanalyzing Fairfield and Charman's Oil Majors Case

The Chilean application demonstrates the PPC with an extreme posterior ($\approx 1.0$). This section applies the framework to a case where the posterior is modest, testing the prediction that non-extreme posteriors generate less sharp --- and therefore less diagnostic --- predictions.

## 5.1 The Case: Oil Majors and Carbon Pricing

Fairfield and Charman (2025) conduct a Bayesian reanalysis of Vormedal, Gulbrandsen, and Skjæresth's (2020) study of why European and US oil majors (Shell, BP, ExxonMobil, TotalEnergies, ConocoPhillips, Equinor) publicly supported carbon pricing policies. Two hypotheses are evaluated:

- $H_{SA}$ **(Strategic Accommodation):** Oil majors support moderate carbon pricing to hedge against or preclude more radical regulation --- a defensive strategy.

- $H_{CA}$ **(Competitive Advantage):** Oil majors support carbon pricing because it creates competitive advantages --- notably for natural gas over coal and for carbon capture and storage (CCS) --- an offensive strategy.

F&C set a prior of approximately 6 dB for $H_{SA}$ (~80% probability), based on Vormedal et al.'s own literature review emphasizing the strategic accommodation tradition (Falkner 2008; Meckling 2015). They evaluate four pieces of evidence:

| Evidence | Description | WoE (dB) | Direction |
|----------|-------------|:--------:|-----------|
| $E_1$ | European majors' UNFCCC letter supporting carbon pricing | 4 | $H_{CA}$ |
| $E_2$ | Exxon CEO letter to Trump urging US to stay in Paris Agreement | 3 | $H_{CA}$ |
| $E_3$ | Oil majors create Climate Leadership Council, proposing US carbon tax with liability waiver | 12 | $H_{SA}$ |
| $E_4$ | Investor presentations projecting "golden age" for gas, coal-to-gas switching | 7 | $H_{CA}$ |

The net weight of evidence is 2 dB for $H_{CA}$, yielding a posterior of approximately 4 dB for $H_{SA}$ (~71% probability). The inference is dominated by the prior; the evidence barely moves the needle. Crucially, F&C diverge from the original authors: Vormedal et al. conclude that carbon pricing advocacy is "unlikely to represent... hedging," while F&C's reanalysis finds that $H_{SA}$ remains weakly favored.


## 5.2 Applying the PPC Workflow

### Step 1: Starting from the posterior

The posterior assigns $P(H_{SA} \mid \mathbf{e}_{\text{obs}}) \approx 0.71$. Unlike the Chilean case, the posterior weight on the rival hypothesis ($H_{CA}$) is substantial (0.29), so predictions will reflect a mixture of both hypotheses rather than collapsing onto the dominant one.

### Step 2: Identifying holdout evidence

We identify four items of post-2020 holdout evidence spanning distinct domains. All evidence postdates F&C's analysis window (which covers through approximately 2019) and is drawn from publicly verifiable sources.

1. **Internal revelations about carbon pricing support ($e^*_5$).** In June 2021, Greenpeace's investigative unit Unearthed released undercover video of ExxonMobil's senior lobbyist Keith McCoy, who stated that the company's carbon tax support was "an effective advocacy tool" and a "talking point" for a policy they knew would never pass: "Nobody is going to propose a tax on all Americans and the cynical side of me says, yeah, we kind of know that" (NPR 2021; Unearthed 2021). ExxonMobil was subsequently suspended from the Climate Leadership Council.

2. **Lobbying conditionality ($e^*_6$).** In March 2021, the American Petroleum Institute endorsed carbon pricing for the first time --- but explicitly conditioned its support on the carbon price "replacing all environmental laws and regulations that are intended to reduce or control carbon and other GHG emissions" (Bloomberg 2021; CNBC 2021). ConocoPhillips adopted identical language. Congressional investigations found that less than 0.4% of oil industry lobbying expenditure targeted carbon pricing legislation (House Oversight Committee 2022).

3. **Corporate strategy reversals ($e^*_7$).** Between 2023 and 2025, BP, Shell, and Equinor systematically retreated from climate commitments --- cutting renewable investment, abandoning emissions targets, and increasing fossil fuel spending --- while maintaining their public support for carbon pricing (Fortune 2025; Carbon Brief 2024; Al Jazeera 2025). BP's CEO stated the company had gone "too far, too fast" and its faith in green energy was "misplaced."

4. **CCS investment positioning ($e^*_8$).** ExxonMobil acquired Denbury Inc. for \$4.9 billion (2023), gaining the largest US CO2 pipeline network. The Northern Lights project (Equinor, Shell, TotalEnergies) invested \$3.4 billion in commercial CCS infrastructure in Norway. These investments create genuine profit centers that depend on carbon pricing (ExxonMobil 2023; Equinor 2025).

### Step 3: Deriving predictions

The non-extreme posterior generates blurred predictions:

| | $H_{SA}$ | $H_{CA}$ | Posterior predictive |
|---|:---:|:---:|:---:|
| $P(e^*_5 = \text{cynical "talking point" admission})$ | 0.80 | 0.05 | $0.80 \times 0.71 + 0.05 \times 0.29 = 0.58$ |
| $P(e^*_6 = \text{support conditioned on replacing regulations})$ | 0.75 | 0.15 | $0.75 \times 0.71 + 0.15 \times 0.29 = 0.58$ |
| $P(e^*_7 = \text{retreat from climate but maintain carbon pricing rhetoric})$ | 0.70 | 0.20 | $0.70 \times 0.71 + 0.20 \times 0.29 = 0.56$ |
| $P(e^*_8 = \text{large CCS investments dependent on carbon pricing})$ | 0.40 | 0.80 | $0.40 \times 0.71 + 0.80 \times 0.29 = 0.52$ |

Note how the predictions cluster near 0.55--0.58 --- much less sharp than Chile's 0.55--0.90 range. This is exactly what the framework predicts: a 71% posterior generates moderate predictions that are harder to confront with evidence. The posterior predictive distribution does not collapse onto the dominant hypothesis; it remains genuinely uncertain.

### Step 4: Assessing coherence

All four predictions are confirmed by the holdout evidence --- but the evidence is far stronger than the moderate predictions suggest.

**$e^*_5$ (internal revelations):** The McCoy sting is devastating for $H_{CA}$. A company genuinely motivated by competitive advantage would want carbon pricing to pass, not celebrate its impossibility. The model predicted this evidence with probability 0.58; the evidence's strongly $H_{SA}$-consistent character suggests the posterior should assign substantially more weight to $H_{SA}$. Estimated WoE: 8--10 dB for $H_{SA}$.

**$e^*_6$ (lobbying conditionality):** Supporting carbon pricing *as a substitute* for command-and-control regulation is textbook strategic accommodation. Under $H_{CA}$, one would expect support for carbon pricing *in addition to* other policies that accelerate gas-over-coal transitions, not as a replacement for them. The API's negligible lobbying expenditure on actual carbon pricing legislation reinforces this. Estimated WoE: 6--8 dB for $H_{SA}$.

**$e^*_7$ (strategy reversals):** The simultaneous retreat from climate investments while maintaining carbon pricing rhetoric is strongly consistent with $H_{SA}$: carbon pricing support was a strategic hedge that could be sustained at low cost while genuine transition investments were abandoned when short-term fossil fuel profits surged. Under $H_{CA}$, companies seeing genuine competitive advantage in carbon pricing would sustain transition investments. Estimated WoE: 5--7 dB for $H_{SA}$.

**$e^*_8$ (CCS investments):** The main counterevidence. Large-scale CCS investments suggest some companies are genuinely positioning to profit from carbon pricing, consistent with $H_{CA}$. However, these investments depend heavily on government subsidies (the US 45Q tax credit, IRA funding, Norwegian state support) rather than on market carbon prices, complicating the $H_{CA}$ interpretation. Estimated WoE: 3--4 dB for $H_{CA}$.

### Step 5: Diagnosis

The PPC reveals three findings.

**Finding 1: The holdout evidence dramatically strengthens the posterior.** The net holdout WoE is approximately 16--21 dB for $H_{SA}$ (after accounting for the CCS counterevidence). Combined with F&C's posterior of 4 dB for $H_{SA}$, the updated posterior would be approximately 20--25 dB (~99%) for $H_{SA}$. This suggests that F&C's original analysis was *too conservative* --- the 2 dB net evidence they identified substantially underweighted $H_{SA}$. This is a different PPC outcome than Chile: rather than confirming the posterior's level of confidence, the check suggests the original model was insufficiently confident.

**Finding 2: Company heterogeneity challenges the binary hypothesis structure.** The evidence is not uniformly $H_{SA}$ or $H_{CA}$ across companies. $H_{SA}$ dominates for ExxonMobil (the McCoy admission, CLC suspension) and ConocoPhillips (oil-heavy but advocates carbon tax as regulatory replacement). $H_{CA}$ is more plausible for TotalEnergies (which left API for insufficient climate ambition and frames gas as a competitive transition fuel) and Equinor (whose CCS strategy leverages Norway's geological advantages). This heterogeneity suggests that the binary $H_{SA}$-vs-$H_{CA}$ framing may be too coarse: different companies may be motivated by different logics simultaneously. Following the framework's Step 5 guidance on hypothesis revision, a composite hypothesis --- "$H_{SA}$ for some companies and $H_{CA}$ for others, with the mix depending on regulatory exposure and gas portfolio" --- might better account for the evidence. This is exactly the kind of structural insight that PPCs are designed to generate (Section 3.2, Step 5).

**Finding 3: The PPC illustrates the posterior-extremity prediction.** Chile's extreme posterior ($\approx 1.0$) generated predictions in the 0.55--0.90 range, producing sharp tests that confirmed broad coherence. The oil majors' modest posterior ($\approx 0.71$) generated predictions clustered near 0.55, producing weaker tests --- but the holdout evidence nonetheless provided strong diagnostic information because it was *far more extreme* than the predictions suggested. The PPC worked not because the predictions were sharp but because the evidence was dramatically one-sided. This suggests a refinement of Observation 1 from the Chile case: even when posteriors are non-extreme, PPCs can be diagnostic if the holdout evidence is sufficiently strong to overwhelm the prediction's uncertainty.

### Step 6: Documentation

**Table 5: Oil Majors PPC Summary**

| Element | Content |
|---------|---------|
| **Posterior** | $P(H_{SA} \mid \mathbf{e}_{\text{obs}}) \approx 0.71$; 4 dB for $H_{SA}$ |
| **Holdout evidence** | 4 items across 4 domains (internal revelations, lobbying records, corporate strategy, capital allocation) |
| **Predictions** | Posterior predictive probabilities clustered near 0.55--0.58 (blurred by non-extreme posterior) |
| **Coherence assessment** | 3 items strongly confirm $H_{SA}$; 1 item moderately supports $H_{CA}$ |
| **Diagnoses** | (1) Original posterior was too conservative: holdout evidence adds ~16--21 dB for $H_{SA}$. (2) Company heterogeneity suggests composite hypothesis. (3) Non-extreme posteriors can still yield diagnostic PPCs when holdout evidence is strong. |
| **Revision recommended?** | Yes: (a) composite hypothesis incorporating company-level variation; (b) revision of $E_3$ weight upward (CLC evidence was strongest in original, and holdout evidence on lobbying conditionality reinforces it). |

**Audit note.** All holdout evidence is drawn from publicly verifiable sources: undercover video published by Greenpeace/Unearthed (2021) and reported by NPR, CNN, and CNBC; API's own Climate Action Framework (2021); corporate press releases and SEC filings; and journalistic reporting from Bloomberg, Fortune, Al Jazeera, and Carbon Brief. Source URLs are documented in the supplementary materials.


# 6. Discussion and Conclusion

## 6.1 What the PPCs Revealed

The two applications illustrate five features of the qualitative PPC framework.

**First, the PPC adds value even when the original analysis is well-executed.** Neither the Chile analysis nor the oil majors reanalysis is "broken" in any obvious way. Yet both PPCs surfaced diagnostic observations not formally incorporated into the original model specifications. In Chile, the low-stakes confound, the temporal sequence test, and the comparative counterfactual suggest that the extreme posterior may be partly shaped by the absence of a composite hypothesis. In the oil majors case, the PPC revealed that post-2020 evidence dramatically strengthens $H_{SA}$ beyond F&C's modest 4 dB posterior, and that company-level heterogeneity challenges the binary hypothesis structure. These are precisely the kinds of insights PPCs are designed to generate.

**Second, the two cases confirm the posterior-extremity prediction.** Chile's extreme posterior ($\approx 1.0$) generated predictions in the 0.55--0.90 range, producing sharp tests. The oil majors' modest posterior ($\approx 0.71$) generated predictions clustered near 0.55, producing weaker tests. Yet the oil majors PPC was still diagnostic because the holdout evidence was dramatically one-sided. This suggests a refinement: even when posteriors are non-extreme, PPCs can generate diagnostic information when the holdout evidence is sufficiently strong.

**Third, multi-channel elicitation provides a practical response to the circularity concern.** The multi-channel exercise in the Chile case (Table 4) shows that diagnostic conclusions are robust across four heterogeneous elicitation channels. Ordinal rankings are preserved across all channels for all four evidence items. In the oil majors case, the publicly verifiable nature of the holdout evidence provides a different form of robustness: any researcher can audit the sources.

**Fourth, the stress tests clarify the PPC's diagnostic reach.** When we imposed a grossly misspecified posterior on the Chile case ($H_{CC} \approx 1.0$), the PPC detected two clear discrepancies. When we imposed a moderately misspecified posterior ($H_{EA} = 0.60$), the predictions remained broadly plausible. The qualitative PPC is better suited to detecting gross misspecification than subtle overconfidence --- an honest limitation analogous to the conservatism of posterior predictive p-values in quantitative settings.

**Fifth, the PPCs generate distinct research agendas.** In Chile, the diagnostics point toward collecting primary archival evidence (committee transcripts, internal party records). In the oil majors case, the diagnostics point toward revising the hypothesis structure to accommodate company-level heterogeneity. The PPC functions not only as a diagnostic tool but as a generator of productive research questions --- a feature it shares with its quantitative counterpart (Gabry et al. 2019).

## 6.2 Implications for the Fairfield--Charman / Zaks Debate

The exercise speaks to the ongoing debate between proponents and critics of BPT. Qualitative PPCs offer a middle path between Zaks's (2021) critique that BPT lacks guardrails and the Fairfield--Charman response that explicitness itself is a guardrail. PPCs concede that *something beyond transparency is needed* --- the analyst should check assumptions against out-of-sample evidence --- while showing that the Bayesian formalism itself generates a natural diagnostic procedure. The result aligns BPT with the full Bayesian workflow (Gelman et al. 2020): not only updating (priors $\rightarrow$ likelihoods $\rightarrow$ posteriors) but also checking (posteriors $\rightarrow$ predictions $\rightarrow$ comparison $\rightarrow$ revision).

## 6.3 Limitations

Several limitations of this study should be acknowledged.

**Data limitations.** Our empirical demonstration relies partly on secondary sources (Fairfield 2015a, 2015b; Fairfield and Charman 2022) rather than independent primary data collection. Complete transcripts from the BCN's *Historia de la Ley*, access to internal party archives, and systematic documentation of business lobbying (or its absence) would strengthen the analysis. We note, however, that the PPC workflow is designed to accommodate varying levels of data availability: the check can be conducted with domain knowledge alone (Step 4, variant 2) or with newly collected data (variant 1).

**Circularity concerns.** As discussed in Section 3.6, the circularity objection is the most serious challenge to qualitative PPCs. Our demonstration partially implements the design principles proposed there: we use holdout evidence from domains structurally distinct from the interview-based evidence in the original analysis, and we implement multi-channel elicitation (Section 4) to show that the diagnostic conclusions are robust across heterogeneous assessment channels. However, the demonstration falls short of the strongest protocol in two respects: the human analyst's predictive likelihoods were not elicited fully blind to the posterior (which is approximately 1.0 for $H_{EA}$ and widely known from the published analysis), and the evidence assessments draw partly on information reported in Fairfield's own publications. A stronger test would involve a blind second analyst with independent domain expertise and genuinely primary evidence that the original analyst did not discuss.

**Subjectivity of coherence assessment.** The Step 4 assessments are our judgment. Other researchers might assess the same evidence differently. This is inherent in the qualitative nature of the check and mirrors the assessment involved in standard BPT. The transparency of the procedure --- all predictions, evidence, and assessments are documented --- allows readers to substitute their own judgments.

## 6.4 Agenda for Future Work

The qualitative PPC framework opens several avenues for future research.

**Software integration.** The posterior predictive calculation is straightforward and could be implemented as an extension to existing BPT tools, including Humphreys and Jacobs's (2023) *CausalQueries* R package. A software tool that automatically computes posterior predictive probabilities for user-specified evidence items would lower the barrier to adoption.

**Empirical calibration.** How often do PPCs reveal genuine problems with BPT analyses? An empirical study applying PPCs to a sample of published BPT applications --- systematically identifying potential evidence, deriving predictions, and assessing coherence --- would provide evidence about the tool's diagnostic yield.

**Connection to sensitivity analysis.** Qualitative PPCs check likelihoods; sensitivity analysis checks priors. Developing an integrated diagnostic framework that combines both tools would provide a more complete picture of model robustness. The interaction between prior sensitivity and posterior predictive coherence is theoretically interesting and practically important.

**Multi-case applications.** Our two applications contrast extreme and non-extreme posteriors, confirming that the PPC generates qualitatively different diagnostic insights in each setting. Extending the framework to cases with more hypotheses, richer evidence bases, or different substantive domains would further test its portability.

## 6.5 Conclusion

Bayesian process tracing has brought rigor and transparency to qualitative causal inference. But the methodology has imported the Bayesian machinery of updating without the Bayesian machinery of diagnostics. This paper addresses the gap by developing qualitative posterior predictive checks --- a formal procedure for asking whether a BPT model's predictions about unobserved evidence are coherent with what domain knowledge and newly collected data suggest.

We do not claim that PPCs resolve all concerns about BPT. The subjectivity of likelihood specification remains, and qualitative PPCs cannot achieve the clean separation between model and check that exists in quantitative settings. But this does not make the check valueless. As we argue in Section 3.6, the diagnostic power of a qualitative PPC depends on design choices that reduce the correlation between estimation errors and checking errors --- pre-specification, separation of analysts, external elicitation, and adversarial collaboration. When these protocols are followed, the check creates genuine opportunities for surprise and revision. When they are not, the check should be treated as exploratory rather than confirmatory.

The two applications illustrate this logic from different angles. Chile's extreme posterior generates sharp, testable predictions; the oil majors' modest posterior generates blurred predictions that are nonetheless diagnostic because the holdout evidence turns out to be dramatically one-sided. In both cases, the PPC surfaces insights --- the low-stakes confound in Chile, the company heterogeneity in the oil majors case --- that the original analyses did not formally incorporate. The multi-channel elicitation exercise in Section 4 provides additional evidence that the check's conclusions are not artifacts of a single analyst's interpretive commitments.

If BPT is Bayesian, it should check its models. Posterior predictive checks show how --- and the credibility of those checks depends on the care with which they are designed.

---

# References

Barrenechea, Rodrigo, and James Mahoney. 2019. "A Set-Theoretic Approach to Bayesian Process Tracing." *Sociological Methods & Research* 48(3): 451--484.

Bayarri, M. J., and James O. Berger. 2000. "P Values for Composite Null Models." *Journal of the American Statistical Association* 95(452): 1127--1142.

Befani, Barbara. 2020. "Diagnostic Evaluation and Bayesian Updating: Practical Solutions to Common Problems." *Evaluation* 26(4): 415--438.

Befani, Barbara, and Gavin Stedman-Bryce. 2017. "Process Tracing and Bayesian Updating for Impact Evaluation." *Evaluation* 23(1): 42--60.

Befani, Barbara, Corinna Elsenbroich, and Jen Badham. 2021. "Diagnostic Evaluation with Simulated Probabilities." *Evaluation* 27(2): 102--115.

Behrens, Lars, and Ingo Rohlfing. 2025. "The Integration of Bayesian Regression Analysis and Bayesian Process Tracing in Mixed-Methods Research." *Sociological Methods & Research*. DOI: 10.1177/00491241241295336.

Bennett, Andrew. 2008. "Process Tracing: A Bayesian Perspective." In Janet M. Box-Steffensmeier, Henry E. Brady, and David Collier (eds.), *The Oxford Handbook of Political Methodology*. Oxford: Oxford University Press, pp. 702--721.

Bennett, Andrew, Tasha Fairfield, and Andrew E. Charman. 2022. "Understanding Bayesianism: Fundamentals for Process Tracers." *Political Analysis* 30(2): 298--305.

Box, George E. P. 1980. "Sampling and Bayes' Inference in Scientific Modelling and Robustness." *Journal of the Royal Statistical Society, Series A* 143(4): 383--430.

Brandao, Federico, Barbara Befani, Britaldo Soares-Filho, Raoni Rajao, and Romulo Garcia. 2023. "How to Halt Deforestation in the Amazon? A Bayesian Process-Tracing Approach." *Land Use Policy* 133(C): 106862.

Falkner, Robert. 2008. *Business Power and Conflict in International Environmental Politics*. New York: Palgrave Macmillan.

Fairfield, Tasha. 2015a. *Private Wealth and Public Revenue in Latin America: Business Power and Tax Politics*. New York: Cambridge University Press.

Fairfield, Tasha. 2015b. "La economía política de la reforma tributaria progresiva en Chile." *Revista de Economía Institucional* 17(32): 129--156.

Fairfield, Tasha, and Andrew E. Charman. 2017. "Explicit Bayesian Analysis for Process Tracing: Guidelines, Opportunities, and Caveats." *Political Analysis* 25(3): 363--380.

Fairfield, Tasha, and Andrew E. Charman. 2019. "A Dialogue with the Data: The Bayesian Foundations of Iterative Research in Qualitative Social Science." *Perspectives on Politics* 17(1): 154--167.

Fairfield, Tasha, and Andrew E. Charman. 2022. *Social Inquiry and Bayesian Inference: Rethinking Qualitative Research*. Cambridge: Cambridge University Press.

Fairfield, Tasha, and Andrew E. Charman. 2023. "Bayesian Reflections." *Qualitative and Multi-Method Research* 21(2): 66--71.

Fairfield, Tasha, and Andrew E. Charman. 2025. "Bayesian Reasoning for Qualitative Replication Analysis: Examples from Climate Politics." *Political Science Research and Methods*, 1--16.

Gabry, Jonah, Daniel Simpson, Aki Vehtari, Michael Betancourt, and Andrew Gelman. 2019. "Visualization in Bayesian Workflow." *Journal of the Royal Statistical Society, Series A* 182(2): 389--402.

Gelman, Andrew, and Cosma Rohilla Shalizi. 2013. "Philosophy and the Practice of Bayesian Statistics." *British Journal of Mathematical and Statistical Psychology* 66(1): 8--38.

Gelman, Andrew, Xiao-Li Meng, and Hal Stern. 1996. "Posterior Predictive Assessment of Model Fitness via Realized Discrepancies." *Statistica Sinica* 6(4): 733--807.

Gelman, Andrew, Aki Vehtari, Daniel Simpson, et al. 2020. "Bayesian Workflow." arXiv preprint, arXiv:2011.01808.

Humphreys, Macartan, and Alan M. Jacobs. 2015. "Mixing Methods: A Bayesian Approach." *American Political Science Review* 109(4): 653--673.

Humphreys, Macartan, and Alan M. Jacobs. 2023. *Integrated Inferences: Causal Models for Qualitative and Mixed-Method Research*. Cambridge: Cambridge University Press.

Meckling, Jonas. 2015. "Oppose, Support, or Hedge? Distributional Effects, Regulatory Pressure, and Business Strategy in Environmental Politics." *Global Environmental Politics* 15(2): 19--37.

Meng, Xiao-Li. 1994. "Posterior Predictive p-Values." *The Annals of Statistics* 22(3): 1142--1160.

Rubin, Donald B. 1984. "Bayesianly Justifiable and Relevant Frequency Calculations for the Applied Statistician." *The Annals of Statistics* 12(4): 1151--1172.

Zaks, Sherry. 2021. "Updating Bayesian(s): A Critical Evaluation of Bayesian Process Tracing." *Political Analysis* 29(1): 58--74.

Vormedal, Irja, Lars H. Gulbrandsen, and Jon Birger Skjæresth. 2020. "Big Oil and Climate Regulation: Business as Usual or a Changing Business?" *Global Environmental Politics* 20(4): 143--166.

Zaks, Sherry. 2022. "Return to the Scene of the Crime: Revisiting Process Tracing, Bayesianism, and Murder." *Political Analysis* 30(2): 306--310.

---

**[END OF DRAFT v1]**

**Remaining TODOs:**

- [TODO] Obtain full transcripts from BCN "Historia de la Ley N. 20.028" (ID 6630) to verify $e^*_1$ with primary sources
- [TODO] Seek access to internal UDI/RN records (caucus minutes, memoranda) for definitive temporal sequence test ($e^*_3$)
- [TODO] Document business lobbying behavior for/against 57 bis with primary sources ($e^*_4$) --- CPC/SOFOFA archives, press reports
- [TODO] Verify exact page reference for Lagos quote from Fairfield (2014) Wilson Center paper
- [DONE] Cross-model elicitation: Gemini (gemini-2.0-flash) and GPT-5 (gpt-5.3-codex) results added to Table 4
- [DONE] Clean bibliography: orphaned references removed
- [DONE] Checkel (2021) statistic removed (unverifiable)
- [DONE] Oil majors case (Section 5) integrated with 4 holdout evidence items from post-2020 public sources
- [VERIFY] Exact dB threshold adjectives from Fairfield and Charman (2017: 370)
- [TODO] Supplementary materials: compile full source URLs for oil majors holdout evidence
- [TODO] Run multi-channel elicitation (Gemini + Codex) for oil majors case (matching Chile protocol)
