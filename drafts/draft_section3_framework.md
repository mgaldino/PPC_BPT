# 3. Framework: Qualitative Posterior Predictive Checks for Bayesian Process Tracing

The core machinery of Bayesian process tracing --- specifying priors over hypotheses, assigning likelihoods to evidence, and updating via Bayes' rule --- is by now well established (Fairfield and Charman 2017, 2022; Humphreys and Jacobs 2015, 2023). What remains missing is a systematic procedure for *checking* whether the model thus specified actually makes sense. In quantitative Bayesian analysis, this role is played by posterior predictive checks (PPCs): the analyst asks what new data the fitted model would predict, compares those predictions to observed patterns, and revises the model when discrepancies arise (Gelman, Meng, and Stern 1996; Gelman and Shalizi 2013). The purpose of this section is to develop an analogous tool --- *qualitative posterior predictive checks* --- for BPT.

The central insight is straightforward. Errors in likelihood specification that are invisible when we examine only the evidence already incorporated into the analysis become visible when the model is asked to generate predictions about evidence it has not yet seen.

[INSERT ARGUMENT: Extreme posteriors generate the most testable predictions --- and these are precisely the cases where the researcher most needs a PPC, because they are the cases where the posterior creates a "case closed" impression that discourages further scrutiny. A posterior of 0.99 means the model predicts that virtually all unobserved evidence should conform to the dominant hypothesis. This makes the predictions sharp and easy to confront with domain knowledge. If even a few predictions turn out to be implausible, the extreme posterior is directly challenged. The mathematical fact that P(e*|e_obs) ≈ P(e*|H_dominant) when the posterior is extreme is not a weakness --- it is the mechanism by which the PPC works. Develop this point with reference to the Chile application (Section 4).] A researcher who has assigned likelihoods to three pieces of archival evidence and arrived at a posterior distribution over hypotheses can ask: *given this posterior, what should I expect to find if I examine a fourth piece of evidence?* If the model's prediction is wildly at odds with what domain knowledge or auxiliary evidence suggests, something in the specification is likely wrong --- and the discrepancy provides diagnostic information about *where* it is wrong.

This section proceeds as follows. Section 3.1 develops a semi-formal account of the posterior predictive distribution adapted to the discrete, qualitative setting of BPT. Section 3.2 operationalizes the concept as a six-step workflow. Section 3.3 offers practical guidance on how to assess discrepancies when they arise. Section 3.4 situates the proposal relative to existing tools in the BPT literature. Section 3.5 discusses scope conditions and limitations.


## 3.1 The Posterior Predictive Distribution in the BPT Context

### Standard PPCs: a brief recap

In quantitative Bayesian statistics, posterior predictive checks proceed as follows. Suppose a researcher has observed data $y$ and fitted a model with parameters $\theta$. The posterior distribution $p(\theta \mid y)$ summarizes updated beliefs about the parameters. The *posterior predictive distribution* for a new observation $y^{\text{rep}}$ is then:

$$p(y^{\text{rep}} \mid y) = \int p(y^{\text{rep}} \mid \theta) \, p(\theta \mid y) \, d\theta$$

This distribution represents what the model, having learned from the data, expects new data to look like. The analyst generates replicated datasets from this distribution and compares them to the observed data. Systematic discrepancies signal model misspecification (Gelman et al. 1996; Gabry et al. 2019; Gelman et al. 2020).

### Adaptation to BPT

In BPT, the "parameters" of interest are hypotheses $H_1, H_2, \ldots, H_K$ about the causal process that produced an outcome of interest. Rather than continuous parameters over which we integrate, we have a discrete set of hypotheses over which we sum. The "data" are pieces of qualitative evidence --- documents, interview testimony, behavioral patterns, institutional records --- each characterized by its likelihood under each hypothesis.

Suppose the researcher has observed evidence $\mathbf{e}_{\text{obs}} = (e_1, e_2, \ldots, e_n)$ and updated to a posterior distribution $P(H_i \mid \mathbf{e}_{\text{obs}})$ for $i = 1, \ldots, K$. Now consider a piece of *potential* evidence $e^*$ --- an observation that the researcher has not yet examined but could, in principle, seek out. The **qualitative posterior predictive distribution** for $e^*$ is:

$$P(e^* \mid \mathbf{e}_{\text{obs}}) = \sum_{i=1}^{K} P(e^* \mid H_i) \times P(H_i \mid \mathbf{e}_{\text{obs}})$$

This expression is the discrete analogue of the standard PPC formula. It says: the probability of observing $e^*$, given everything we have learned so far, is a weighted average of the probability of $e^*$ under each hypothesis, where the weights are the posterior probabilities of the hypotheses.

### Interpretation

Several features of this expression deserve emphasis.

First, notice that the posterior predictive distribution depends on *both* the likelihoods $P(e^* \mid H_i)$ and the posteriors $P(H_i \mid \mathbf{e}_{\text{obs}})$. The posteriors, in turn, were determined by the likelihoods assigned to previously observed evidence. This means that the posterior predictive distribution is a compound reflection of the *entire* model specification --- not just the likelihoods for the new evidence $e^*$, but also the likelihoods for $e_1, \ldots, e_n$ that generated the posteriors. It is this compound character that gives the tool its diagnostic power.

Second, unlike in quantitative PPCs, we do not literally "generate replicated data." We cannot resample archival documents or simulate interview transcripts. Instead, the qualitative PPC asks a different but analogous question: *given the model's current state (the posterior), how strongly does it predict that a specific piece of evidence will be present or absent, positive or negative, strong or weak?* The check consists of comparing this prediction to what domain knowledge, auxiliary evidence, or eventual observation suggests.

Third, the expression naturally accommodates the distinction between binary evidence (an observation is either made or not made) and graded evidence (an observation can take different forms, ranging from strongly supportive of one hypothesis to strongly supportive of another). In the binary case, $e^*$ takes values in $\{$present, absent$\}$; in the graded case, $e^*$ takes values in a set of qualitative categories that the researcher specifies. [TODO: Consider whether to include a brief worked numerical example here, or reserve all examples for Section 4.]

Fourth, the formula makes explicit an operation that good qualitative researchers already perform implicitly --- namely, asking "if my leading hypothesis is correct, what else should I expect to find?" The contribution of formalizing this operation is not to replace substantive judgment but to make the reasoning *auditable*. When the prediction and the observation diverge, the formalization makes it possible to trace the source of the discrepancy back to specific assumptions.

### What the posterior predictive distribution is *not*

It is important to be clear about what this tool does not do. The posterior predictive distribution is not a test of whether a hypothesis is "true" or "false." It is a diagnostic of *internal coherence*: given the assumptions embedded in the model (priors and likelihoods), do the model's out-of-sample predictions make sense? A model can pass posterior predictive checks and still be wrong about the world, just as a quantitative model can generate plausible-looking replicated data while being misspecified in ways that the chosen test statistics do not capture (Gelman, Meng, and Stern 1996: 737). The value of the check lies not in certification but in *diagnosis*: it helps identify specific points where the model's assumptions may be implausible.


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

- **Mechanism-derived evidence.** If a hypothesis posits a specific causal mechanism (e.g., "the president lobbied legislators privately"), the mechanism implies observable traces (e.g., records of private meetings, legislative aides reporting lobbying). Evidence that follows from the *internal logic of the mechanism* but was not used in the initial analysis is particularly valuable.

- **Evidence from a different domain.** If the initial evidence comes from archival documents, predictions about interview testimony (or vice versa) provide a check that spans evidentiary domains. Cross-domain predictions are harder for a misspecified model to "game," because errors in likelihood specification are less likely to be correlated across domains.

- **Evidence that would be surprising under at least one hypothesis.** The most diagnostic evidence is that which sharply discriminates between hypotheses --- evidence whose predicted probability varies substantially across the $H_i$. Evidence that every hypothesis predicts equally well carries no diagnostic information.

- **Evidence that is accessible but was not used.** Practical feasibility matters. The researcher should focus on evidence items that could realistically be sought or that are known to exist but were not incorporated into the initial analysis.

[TODO: Consider adding a brief note on how many items of potential evidence are "enough." The answer is context-dependent, but a practical minimum might be 2--3 items drawn from at least two of the criteria above.]

### Step 3: Derive the model's predictions

For each potential evidence item $e^*_k$ and each hypothesis $H_i$, the researcher specifies a likelihood: *how probable is this evidence if $H_i$ is the correct hypothesis?* This is the same type of judgment involved in standard BPT --- the researcher draws on substantive knowledge to assess how expected or unexpected the evidence would be under each hypothesis.

The posterior predictive assessment then proceeds by weighting these likelihoods by the posterior:

$$P(e^*_k \mid \mathbf{e}_{\text{obs}}) = \sum_{i=1}^{K} P(e^*_k \mid H_i) \times P(H_i \mid \mathbf{e}_{\text{obs}})$$

The result is a **predictive narrative**: a statement about what the model, taken as a whole, expects to find. For example: "Given that the posterior assigns 0.75 to $H_1$ (presidential lobbying) and 0.25 to $H_2$ (party discipline), and given that private meeting records would be very likely under $H_1$ (0.90) but unlikely under $H_2$ (0.15), the model predicts a 0.71 probability that such records exist." [TODO: Replace with the paper's substantive running example once Section 4 is drafted.]

Importantly, the researcher should articulate these predictions *before* examining the new evidence or consulting auxiliary sources. This temporal discipline is what prevents the check from degenerating into a post hoc rationalization.

### Step 4: Assess qualitative coherence

The researcher now compares the model's predictions with external information. This external information can come from several sources:

- **Direct observation.** If the potential evidence can actually be collected (e.g., the researcher can request archival records, conduct an additional interview), then the prediction is compared to what is actually found.

- **Domain knowledge.** Even without collecting new evidence, the researcher (or a colleague with domain expertise) may have strong intuitions about what should or should not exist. For instance, a prediction that a particular politician made public speeches supporting a policy may conflict with well-known facts about that politician's record.

- **Evidence known but not incorporated.** Researchers often encounter evidence during fieldwork that does not fit neatly into the analysis or that was set aside for practical reasons. These "orphan" observations can serve as a check: does the model's prediction about such evidence accord with what was actually found?

- **Auxiliary literature.** Published research on the same case or closely related cases may provide information about the plausibility of the model's predictions.

The assessment is inherently qualitative. There is no p-value, no formal threshold, no automatic rejection criterion. The researcher asks: *does the prediction strike me (and would it strike a knowledgeable colleague) as reasonable, given what is known about this case?* This is a judgment call --- but it is a *structured* judgment call, grounded in explicit predictions derived from explicit assumptions.

### Step 5: Diagnose and revise when discrepancies arise

When the model's prediction conflicts with external information --- when, say, the model strongly predicts the existence of evidence that domain knowledge suggests is very unlikely to exist --- the researcher has identified a discrepancy. The task is now to trace the discrepancy back to its source and revise accordingly.

Discrepancies can arise from several sources, and the appropriate response depends on the diagnosis:

**Likelihood revision.** The most common and least disruptive response. The discrepancy suggests that one or more likelihoods in the original analysis were miscalibrated. For example, if the model predicts strong evidence of presidential lobbying but the researcher knows that this president systematically avoided leaving paper trails, the likelihood $P(\text{meeting records} \mid H_{\text{lobbying}})$ may have been set too high. The researcher revises the likelihood and re-updates the posterior.

**Hypothesis revision.** The discrepancy may suggest that the hypothesis set is incomplete --- that none of the specified hypotheses adequately accounts for the pattern of evidence. This is the most substantively consequential form of revision, as it requires the researcher to expand the model by introducing a new hypothesis or refining an existing one.

**Evidential reinterpretation.** The discrepancy may stem not from a wrong likelihood or a missing hypothesis but from a misunderstanding of what a piece of evidence means. An archival document initially interpreted as supporting $H_1$ may, on reflection, be ambiguous or may support $H_2$ equally well. This calls for re-examining the interpretation of evidence already in the analysis.

**Structural revision.** In rare cases, the discrepancy may point to a deeper problem with the model's structure --- for example, the assumption that hypotheses are mutually exclusive, or the conditional independence of evidence items given the hypotheses. Structural revision is the most demanding response and is typically warranted only when simpler revisions fail to resolve the discrepancy.

The researcher need not --- and in practice cannot --- determine with certainty which type of revision is appropriate. The diagnostic power of the PPC lies not in dictating a specific correction but in *localizing the problem*: the discrepancy identifies a specific prediction that the model gets wrong, which narrows the search for the source of the error.

### Step 6: Iterate and document

The revised model generates new posteriors, which generate new predictions, which may reveal further discrepancies. The researcher iterates until the model's predictions are qualitatively coherent with domain knowledge and available evidence --- or until the researcher has exhausted the evidence items identified in Step 2.

This iterative character is not a weakness; it is a feature shared with the standard Bayesian workflow in quantitative analysis (Gelman et al. 2020) and with the iterative logic of qualitative research more broadly (Fairfield and Charman 2019). What the qualitative PPC adds is *structure* to the iteration: each round is organized around explicit predictions derived from explicit assumptions, and each revision is motivated by an identified discrepancy.

**Documentation is essential.** The researcher should record, for each iteration:

- The potential evidence items considered.
- The likelihoods assigned under each hypothesis.
- The model's predictions (the posterior predictive narrative).
- The external information used for comparison.
- The discrepancy identified (if any).
- The revision made and the rationale for it.

This record serves two purposes. It makes the analysis *transparent* --- a reader can trace the researcher's reasoning and assess whether the revisions were substantively justified. And it provides a *guard against circularity* --- a concern to which we return in Section 3.5.


## 3.3 Assessing Discrepancies in Practice

The workflow described above may suggest a more algorithmic procedure than is actually feasible. In practice, assessing whether a model's prediction is "discrepant" with external information requires judgment that cannot be reduced to a mechanical rule. This subsection offers some practical guidance, while acknowledging the irreducibly informal character of the assessment.

The key question the researcher faces is: *how surprised am I by the gap between what the model predicts and what I know (or subsequently learn) about the world?* This is not a question with a precise answer, but certain considerations can help structure the judgment.

**Magnitude matters.** A model that assigns a 0.70 probability to the existence of evidence that turns out to be absent is less alarming than a model that assigns a 0.95 probability to evidence that turns out to be absent. Perfect calibration is neither expected nor required; the researcher is looking for predictions that are *strikingly* at odds with the available information.

**Patterns matter more than individual items.** A single misprediction can result from bad luck, idiosyncratic features of a case, or imprecise likelihood specification. But if the model systematically mispredicts across multiple evidence items --- for example, consistently overpredicting evidence favoring $H_1$ and underpredicting evidence favoring $H_2$ --- the pattern suggests a structural problem with the model, not a one-off calibration error.

**The direction of the discrepancy is informative.** A model that predicts evidence *more strongly* than warranted may have inflated the likelihoods under the leading hypothesis. A model that predicts evidence *less strongly* than warranted may have underweighted a hypothesis that deserves greater posterior probability. The direction of the misprediction provides a diagnostic clue about the nature of the revision needed.

**Consult a colleague.** When feasible, the researcher can present the model's predictions to a domain expert *without* revealing the model's posteriors and ask whether the predictions seem reasonable. This informal "adversarial check" provides an external perspective that can help detect discrepancies that the analyst's own confirmation bias might conceal.

The underlying philosophy here mirrors that of Gelman and colleagues in the quantitative context: posterior predictive checks are "a tool for understanding model fit, not a formal hypothesis test" (Gelman, Meng, and Stern 1996: 734). The goal is to learn about the model, not to certify it. [TODO: Decide whether to include a brief "red flag / yellow flag / green flag" rubric or leave the guidance entirely narrative. Current preference is narrative, but author may want a light-touch rubric for pedagogical purposes.]


## 3.4 Relationship to Existing Tools

Qualitative PPCs do not emerge in a vacuum. Several existing tools in the BPT literature address related concerns. This subsection situates the proposal relative to three of them.

### Sensitivity analysis of priors

Fairfield and Charman (2017: 372--374) recommend that researchers conduct sensitivity analysis by varying prior probabilities and checking whether the posterior conclusions are robust. This is a valuable practice, and qualitative PPCs complement rather than replace it.

The key difference is in what each tool diagnoses. Sensitivity analysis asks: *do my conclusions change if I started from different priors?* It is a check on the role of the prior in driving the posterior. Qualitative PPCs ask: *given my posterior, does the model make sensible predictions about unobserved evidence?* It is a check on the role of *likelihoods* --- both those already assigned and those implied by the model for new evidence.

The two tools are orthogonal in the sense that a model can pass one check and fail the other. A posterior that is robust to alternative priors may nonetheless generate implausible predictions, because the likelihoods (which sensitivity analysis holds fixed) are miscalibrated. Conversely, a posterior that is sensitive to priors may generate perfectly sensible predictions, because the likelihoods are well-specified even though the prior is influential. In practice, researchers should employ both tools.

### Cross-validation in qualitative research

A natural question is whether qualitative PPCs are simply a rebranding of "cross-validation" --- the practice of checking a model against data not used to fit it. The analogy is partially apt: qualitative PPCs do involve a form of out-of-sample prediction. But there are important differences.

Standard cross-validation (in the quantitative sense) involves a formal hold-out procedure: data are partitioned into training and validation sets, and model performance on the validation set is used for model comparison (Vehtari, Gelman, and Gabry 2017). In the qualitative PPC framework, there is no formal partitioning. Instead, the "held-out" evidence items are identified *after* the initial analysis, and the comparison is qualitative rather than metric.

Moreover, qualitative PPCs can include a *retrodictive* component: the researcher can check the model's predictions against evidence that is already known but was not incorporated into the analysis. This blurs the line between prediction and retrodiction, but the diagnostic value remains --- a model that cannot account for known facts is suspect regardless of whether those facts were formally "held out."

### The typology of tests (hoop, smoking gun, doubly decisive)

Van Evera's (1997) typology, which classifies evidence according to whether it is necessary, sufficient, both, or neither for a hypothesis, has been a staple of the process tracing literature. Fairfield and Charman (2017: 366--368) reinterpret this typology in Bayesian terms: a "hoop test" is evidence with a high likelihood under the hypothesis being tested (failing the test is informative), while a "smoking gun" is evidence with a low likelihood under alternative hypotheses (passing the test is informative).

Qualitative PPCs can *refine* this typology by making explicit what the model expects across the full range of evidence. A piece of evidence classified as a "hoop test" for $H_1$ should, according to the model, be highly probable if $H_1$ is true. If the posterior predictive check reveals that the model assigns this evidence only moderate probability even when $H_1$ dominates the posterior, the classification may be wrong --- the evidence is not as necessary as initially supposed. In this way, PPCs provide a check not only on the model but on the researcher's meta-level characterization of the evidence.

[TODO: Consider whether to add a brief comparison with Befani et al.'s (2021) "simulated probabilities" approach. It may be worth noting that their proposal uses agent-based modeling to generate likelihoods computationally, which is complementary to the qualitative PPC approach but operates at a different level (generating likelihoods vs. checking them).]


## 3.5 Scope Conditions and Limitations

Qualitative PPCs are not universally applicable, and their value varies across research contexts. This subsection identifies the conditions under which they are most and least useful, and addresses several potential objections.

### When qualitative PPCs work best

The tool is most valuable when three conditions are met:

1. **The domain is sufficiently well understood to generate non-trivial predictions.** If the researcher knows so little about the case that any prediction would be mere speculation, the posterior predictive check adds nothing. The check draws its power from the researcher's (or the field's) ability to assess the plausibility of predictions independently of the model. This means that PPCs are most useful for cases embedded in a rich empirical literature or studied by a researcher with deep area knowledge.

2. **There exist identifiable potential evidence items.** The researcher must be able to articulate, at least in general terms, what kinds of evidence might exist and what they would look like. In cases where the evidence base is extremely thin or where the mechanisms posited are too abstract to generate observable implications, the check cannot be operationalized.

3. **The hypotheses generate distinguishable predictions.** If all hypotheses assign similar likelihoods to the potential evidence, the posterior predictive distribution will not discriminate and no diagnostic information is available. PPCs are most powerful when hypotheses make *different* predictions about unobserved evidence.

### Potential objections and responses

**Objection 1: Circularity.** If the researcher specifies the likelihoods for the posterior predictive check using the same substantive judgment that was used to specify the original likelihoods, is the check not circular? The concern is legitimate, and it precisely mirrors the charge of circularity that has been leveled against quantitative PPCs (see the discussion in Bayarri and Berger 2000 and the response by Gelman and Shalizi 2013). Gelman and Shalizi's (2013: 21) response applies with equal force here: the check is not circular because the *predictions* are derived from the model, not from the researcher's direct assessment. The researcher assigns likelihoods to the original evidence and to the potential evidence separately; the *model* then combines these into a prediction via the posterior predictive formula. A discrepancy between the prediction and domain knowledge reveals an inconsistency in the researcher's own assumptions --- and identifying such inconsistencies is precisely the point.

The primary mitigation strategy is **documentation and transparency.** If the researcher records all assumptions, predictions, and comparisons, a reader can trace the reasoning and assess whether the check was genuinely informative or merely a post hoc rationalization. The temporal discipline recommended in Step 3 --- deriving predictions *before* examining new evidence --- further guards against circularity.

**Objection 2: Qualitative assessment is debatable.** Unlike in quantitative PPCs, where discrepancies can be summarized by posterior predictive p-values or graphical comparisons, the qualitative PPC relies on the researcher's judgment that a prediction is or is not "coherent" with external information. This makes the assessment inherently debatable.

This objection is valid but does not, in our view, undermine the tool's value. The alternative is *no check at all* --- the researcher specifies likelihoods, updates, and reports the posterior without any systematic attempt to verify that the specification makes sense. A debatable check is better than no check. Moreover, the transparency requirement (Step 6) means that readers who disagree with the researcher's assessment of a discrepancy can offer their own evaluation. The qualitative PPC opens a space for structured disagreement about model specification that currently does not exist in BPT practice.

**Objection 3: The tool cannot substitute for substantive judgment.** This is correct, and it is a feature rather than a limitation. Qualitative PPCs do not automate the process of evaluating evidence. They structure a form of reasoning --- out-of-sample prediction and comparison --- that is already implicit in good qualitative practice. The formalization adds transparency and auditability, but the substantive assessment remains the researcher's responsibility.

**Objection 4: The risk of p-hacking by analogy.** Could a researcher manipulate the choice of potential evidence items to make the model appear better (or worse) than it is? In principle, yes --- just as a quantitative analyst can choose test statistics that a misspecified model happens to pass. The mitigation is the same in both cases: report all checks conducted, not just those that support the desired conclusion. Pre-registration of the evidence items to be checked would provide additional protection, though we recognize that this is often impractical in qualitative research.

[TODO: The author may want to add a brief note about how the framework interacts with the iterative, abductive character of qualitative research (cf. Fairfield and Charman 2019). The concern is that in an iterative research design, the boundary between "evidence used for updating" and "evidence used for checking" is fluid. This is not necessarily a problem --- it simply means that the check is retrodictive rather than predictive --- but it deserves acknowledgment.]

### What qualitative PPCs do not do

To guard against overinterpretation, it is worth restating what the tool does not provide:

- It does not provide a definitive test of model adequacy. It provides *diagnostic information*.
- It does not eliminate the subjectivity of likelihood specification. It makes that subjectivity *more tractable* by subjecting it to out-of-sample scrutiny.
- It does not replace the need for careful, substantively informed process tracing. It adds a layer of quality control to an existing methodology.

The goal, following Gelman and Shalizi (2013), is not to "prove" that the model is correct but to identify the specific ways in which it might be wrong --- and thereby to improve it.
