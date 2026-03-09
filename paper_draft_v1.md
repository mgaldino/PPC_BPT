# From Monolithic Hypotheses to Mechanism Configurations: Posterior Predictive Checks for Bayesian Process Tracing

**[DRAFT v2 --- Option B rewrite, assembled 2026-03-08]**

---

## Abstract

Bayesian process tracing (BPT) treats causal hypotheses as monolithic black boxes, updating beliefs across the entire set without examining the internal structure of any one account. We argue that causal hypotheses are not atomic propositions but configurations of mechanism links --- discrete, binary steps in a causal chain. Decomposing hypotheses into mechanism configurations creates an internal parameter space that enables posterior predictive checks (PPCs) in the proper Bayesian sense: predictions derived by integrating over uncertainty in mechanism links within and across configurations. We formalize this two-level predictive distribution, operationalize it as a workflow, and address the circularity objection through correlated-error analysis and multi-channel elicitation protocols combining human and LLM assessments across diverse prompt families. Two applications to cases previously analyzed by Fairfield and Charman --- Chile's 2005 income tax reform (posterior $\approx 1.0$) and oil majors' carbon pricing advocacy (posterior $\approx 0.71$) --- demonstrate that mechanism decomposition generates finer-grained diagnostics than monolithic hypothesis testing. In Chile, the PPC identifies a composite mechanism configuration --- equity appeal plus low business stakes --- that better accounts for the evidence than the dominant hypothesis alone. In the oil majors case, decomposition reveals that original likelihood assignments were miscalibrated because the monolithic treatment hid uncertainty about a critical link, and that company-level heterogeneity challenges the binary hypothesis structure. The framework resolves long-standing problems in BPT --- mutual exclusivity distortions, ad hoc compound hypotheses, and the absence of model checking --- by giving hypotheses the internal structure that makes Bayesian diagnostics possible.

**Keywords:** Bayesian process tracing, mechanism configurations, posterior predictive checks, model diagnostics, qualitative methods, Chile tax reform, climate politics

---

# 1. Introduction

Bayesian process tracing has made causal inference explicit and auditable (Fairfield and Charman 2017, 2022; Humphreys and Jacobs 2015, 2023), extending to iterative designs (Fairfield and Charman 2019), mixed-methods integration (Behrens and Rohlfing 2025), policy evaluation (Befani and Stedman-Bryce 2017; Brandao et al. 2023), and qualitative replication analysis (Fairfield and Charman 2025). Yet the hypotheses that BPT evaluates remain monolithic. Each hypothesis --- "the equity appeal drove the reform," "strategic accommodation explains corporate support" --- packages an entire causal story into a single proposition. Evidence updates beliefs about these packages but never opens them. The analyst learns *which* hypothesis is best supported but not *which parts* of any hypothesis are doing the explanatory work. This matters because causal mechanisms are not monoliths; they are chains of discrete steps, each potentially testable, and each potentially shared with rival accounts. This limitation has surfaced in an active debate between proponents and critics of BPT (Zaks 2021, 2022; Bennett 2023; Jacobs 2023; Soifer 2023; Fairfield and Charman 2023), where the question of how hypotheses should be constructed, decomposed, and compared remains unresolved.

The monolithic treatment creates a structural problem. In quantitative Bayesian statistics, posterior predictive checks (PPCs) diagnose model adequacy by generating predictions that integrate over uncertainty in *parameters within a model* (Gelman, Meng, and Stern 1996; Gelman et al. 2020). In BPT as currently practiced, there are no parameters within a hypothesis --- only hypotheses treated as indivisible units. What BPT computes when it averages predictions across hypotheses weighted by posteriors is structurally identical to Bayesian model averaging (BMA), not to PPC within a model. The diagnostic machinery of the full Bayesian workflow --- the part that asks "does this model make sense?" rather than "which model wins?" --- has no foothold.

This paper proposes a solution in two parts. First, we argue that BPT hypotheses should be decomposed into **configurations of mechanism links** --- binary variables representing the presence or absence of each step in a causal chain. This decomposition creates an internal parameter space for each hypothesis, analogous to regression coefficients within a statistical model. Hypotheses become configurations: specific combinations of active mechanism links. Different hypotheses can share links (just as different regression models share covariates), and composite hypotheses emerge as configurations that combine links from multiple accounts.

Second, we show that this decomposition naturally enables posterior predictive checks in the proper Bayesian sense. With mechanism links as parameters, the analyst can integrate over uncertainty in *which links are active* within each configuration and across configurations weighted by posteriors --- yielding a two-level predictive distribution that generates finer-grained diagnostics than monolithic hypothesis testing. When a prediction fails, the failure can be traced to specific mechanism links rather than to entire hypotheses.

We formalize this framework, operationalize it as a six-step workflow, and address the circularity objection by modeling correlated elicitation errors and proposing multi-channel protocols.

We then demonstrate the approach on two cases previously analyzed by Fairfield and Charman: Chile's 2005 income tax reform, where the posterior is extreme ($\approx 1.0$), and oil majors' carbon pricing advocacy, where the posterior is modest ($\approx 0.71$). In both cases, mechanism decomposition reveals diagnostic information invisible to monolithic analysis: in Chile, a composite hypothesis incorporating low business stakes alongside the equity appeal; in the oil majors case, company-level heterogeneity in mechanism configurations and miscalibration of original likelihood assignments.

Section 2 reviews BPT and identifies the monolithic hypothesis problem. Section 3 develops the mechanism configurations framework and derives PPCs as a consequence. Sections 4 and 5 apply it to Chile and oil majors. Section 6 discusses implications.


# 2. Monolithic Hypotheses and Their Discontents

## 2.1 The Bayesian Turn

The formalization of process tracing along Bayesian lines has proceeded in three phases. Bennett's (2008) *Oxford Handbook* chapter established the conceptual parallel: evidence can be classified by diagnostic value, and belief updating follows Bayes' rule. The connection was suggestive but informal. Humphreys and Jacobs (2015) and Fairfield and Charman (2017) made the formalization explicit, developing the BIQQ framework for mixed-method integration and detailed guidelines for explicit Bayesian analysis using weight of evidence in decibels. Fairfield and Charman's application to Chile's 2005 tax reform demonstrated that even a small number of well-characterized evidence items could produce overwhelming posterior support.

The third phase, from approximately 2020, brought consolidation and critique. Fairfield and Charman (2022) published a comprehensive book-length treatment; Humphreys and Jacobs (2023) developed *CausalQueries*. Applications expanded to policy evaluation (Brandao et al. 2023; Befani 2020) and qualitative replication analysis (Fairfield and Charman 2025). At the same time, Zaks (2021, 2022) mounted a systematic critique, questioning whether BPT provides adequate guidance for practitioners and identifying the absence of "guardrails" as a fundamental weakness. Bennett, Fairfield, and Charman (2022) responded, but the debate remains open. Despite this growth, the number of papers that apply formal BPT with explicit numerical likelihoods to real empirical cases remains modest --- roughly 10 to 15 as of early 2026.

## 2.2 The Monolithic Hypothesis Problem

Across three phases of development, one structural feature of BPT has remained unchanged: hypotheses are treated as indivisible units. Each hypothesis packages a complete causal story --- actors, motives, mechanisms, scope conditions --- into a single proposition that either explains the outcome or does not. Evidence updates beliefs across the set of hypotheses without examining the internal structure of any one account.

This monolithic treatment has generated a persistent and unresolved debate about how hypotheses should be constructed, compared, and revised.

**The mutual exclusivity problem.** Zaks (2021: 66--67) demonstrates that when hypotheses share causal mechanisms --- as they frequently do in social inquiry --- treating them as mutually exclusive distorts likelihood assignments. Using the greed-versus-grievance example, she shows that evidence consistent with one hypothesis automatically penalizes the other, even when both mechanisms could operate simultaneously. The result is a "disconfirmation bias" that is an artifact of the monolithic structure, not a feature of the evidence. Zaks explicitly calls for "expansions to Bayes' rule to accommodate the wide scope of relationships among rival hypotheses" (2021: 72).

**The "it depends" problem.** Zaks (2022: 308) identifies a second difficulty: when researchers ask "how likely am I to observe $E_i$ under $H_j$?" the answer is frequently "it depends" --- on contingencies not modeled within the hypothesis. Whether finding a suspect's receipts is likely under a murder hypothesis depends on whether the murder was premeditated, whether the suspect was sophisticated enough to create an alibi, and other unspecified conditions. These contingencies are substantively important but have no formal representation in the monolithic framework.

**The compound hypothesis problem.** Zaks (2022: 307) notes that BPT provides "three different strategies for forming compound hypotheses from two causal factors" --- a single broad compound, a precise specification of how the factors interact, or a set of rivals resembling a Likert scale --- with "no guidance" on which to use. The monolithic framework offers no structural basis for choosing because it does not decompose hypotheses into components.

**The QMMR 2023 symposium.** A book symposium on Fairfield and Charman (2022) brought these tensions into focus. Soifer (2023: 64--65) identified a "tension" in Fairfield and Charman's framework: they maintain that "a well-specified explanatory hypothesis should generally include some sort of causal mechanism" (Fairfield and Charman 2022: 80) while simultaneously arguing that any evidence discriminating between hypotheses is informative, even if unrelated to the mechanism. Soifer predicts that "a certain set of qualitative scholars may see an insufficiently mechanistic view of causation" and resist integration.

Bennett (2023: 52) offered a constructive clarification: "Mutual exclusivity of hypotheses is conceptually distinct from exclusivity of the variables, causal factors, or mechanisms." His engine analogy --- a car can fail because of a dirty spark plug, a dirty plug plus a clogged fuel line, or any combination, and these are distinct, mutually exclusive diagnoses despite sharing components --- points toward the solution we develop, though Bennett does not formalize it.

Jacobs (2023: 58) argued for *more* formalization, not less: deriving likelihoods from explicit causal models rather than treating them as irreducible subjective judgments. Against Fairfield and Charman's objection that formalization "pushes the subjectivity back deeper into the model," Jacobs responded that formalization "extends the benefits of analytic explicitness deeper into the process of scientific reasoning."

Fairfield and Charman (2023: 68--70) responded by clarifying that mechanisms serve to "make our hypotheses more precise" and that patchwork hypotheses and composite accounts can always be added to the analysis. Their footnote 17 (p. 70) invokes Occam's razor: complex hypotheses should receive lower priors because there are exponentially more complex theories than simple ones. But this parsimony operates only through prior assignment, not through any structural feature of the framework.

The debate thus identifies a real problem --- monolithic hypotheses lack internal structure --- without providing a formal solution. Zaks's critique is correct that something is missing. Fairfield and Charman are correct that the solution should be Bayesian. What is needed is a decomposition that gives hypotheses internal structure while preserving the Bayesian updating logic.


## 2.3 PPC Requires Internal Structure

The connection to posterior predictive checks makes the stakes of this debate precise. In quantitative Bayesian statistics, PPCs work by integrating over parameters *within* a model (Gelman, Meng, and Stern 1996):

$$p(y^{\text{rep}} \mid y) = \int p(y^{\text{rep}} \mid \theta) \, p(\theta \mid y) \, d\theta$$

This integration over $\theta$ is what gives PPCs their diagnostic power: the predictions reflect not just the best-fitting parameter values but the full posterior uncertainty about them.

In BPT as currently practiced, the predictive formula is:

$$P(e^* \mid \mathbf{e}_{\text{obs}}) = \sum_{i=1}^{K} P(e^* \mid H_i) \times P(H_i \mid \mathbf{e}_{\text{obs}})$$

This is structurally identical to Bayesian model averaging: it averages predictions across models (hypotheses) weighted by posterior model probabilities. There is no integration over parameters within any hypothesis because monolithic hypotheses have no parameters. The diagnostic power is correspondingly limited: the formula can tell us that a prediction fails, but it cannot tell us *which part* of the hypothesis is responsible.

To enable PPCs in the proper sense, we need internal structure --- "parameters" within each hypothesis over which to integrate. The next section shows that mechanism links provide exactly this.

**Table 1: Closest Existing Contributions**

| Work | What it does | What it lacks |
|------|-------------|---------------|
| Fairfield & Charman (2017) | Sensitivity analysis with different priors | Checks priors, not likelihoods; no internal structure |
| Fairfield & Charman (2019) | Iterative updating with new evidence | Presupposes well-specified model; no diagnostics |
| Befani et al. (2021) | Simulated probabilities via agent-based models | Limited to program evaluation; no mechanism decomposition |
| Humphreys & Jacobs (2023) | DAG-based causal models (*CausalQueries*) | Different formalism; not posterior predictive distribution |
| Behrens & Rohlfing (2025) | Posterior predictive sampling for case selection | PPCs from quantitative component, not from BPT |
| Zaks (2021, 2022) | Identifies structural problems with hypothesis construction | Diagnosis without formal solution |
| This paper | Mechanism decomposition + two-level PPC | --- |


# 3. From Monolithic Hypotheses to Mechanism Configurations

## 3.1 Hypotheses as Configurations of Mechanism Links

We propose that BPT hypotheses be decomposed into **mechanism links**: discrete, binary steps in the causal chain connecting cause to outcome. Each link $m_j$ represents a specific causal step --- an actor perceiving a condition, a decision being made, a group responding --- that is either present (active, $m_j = 1$) or absent (inactive, $m_j = 0$).

A **mechanism configuration** is a specific combination of active links: a vector $\mathbf{c} = (m_1, m_2, \ldots, m_n) \in \{0, 1\}^n$ specifying which links are active and which are not. A causal hypothesis, in this framework, is a mechanism configuration: a specific account of which links are operating.

The analogy to quantitative modeling clarifies the structure:

- **Mechanism links** are like covariates in a regression. Just as a regression model specifies which variables enter the equation, a mechanism configuration specifies which causal links are active.
- **Hypotheses (configurations)** are like models. Just as $M_1: y = \beta_0 + \beta_1 x_1$ and $M_2: y = \beta_0 + \beta_1 x_1 + \beta_2 x_2$ are distinct models that share the covariate $x_1$, two mechanism configurations can share links while remaining mutually exclusive *as configurations*.
- **Mutual exclusivity** operates at the level of configurations, not links. No one would claim that regression models sharing a covariate violate mutual exclusivity. The same logic applies: hypotheses that share mechanism links are mutually exclusive if they specify *different* overall configurations.

This resolves the problems identified in Section 2.2:

1. **Mutual exclusivity without forced exclusivity of mechanisms.** Configurations $\{m_1, m_2, m_3\}$ and $\{m_1, m_2, m'_3\}$ share $m_1$ and $m_2$ but are mutually exclusive as configurations --- exactly Bennett's engine analogy, now formalized.

2. **Compound hypotheses as configurations.** A composite hypothesis is not a vague "A plus B caused the outcome" but a specific configuration that includes links from multiple accounts. It is testable link by link.

3. **The "it depends" problem dissolves.** When the likelihood of evidence $E_i$ under hypothesis $H_j$ "depends" on unspecified contingencies (Zaks 2022), those contingencies are mechanism links that the monolithic framework leaves implicit. Making them explicit as binary parameters transforms "it depends" into a structured integration over link states.

**Table 2: Standard BPT vs. Mechanism Configurations**

| | Standard BPT (FC) | Mechanism Configurations |
|---|---|---|
| Unit of analysis | Hypotheses (monolithic) | Configurations of mechanism links |
| "Parameters" | None | Binary links ($m_j \in \{0,1\}$) |
| Integration | Over hypotheses (= BMA) | Over links *within* each config + over configs |
| Mechanism sharing | Problematic (threatens mutual exclusivity) | Natural (like models sharing covariates) |
| Diagnostics | Which hypothesis fails | Which specific *link* fails |
| Compositionality | Ad hoc addition of compound hypotheses | Formalized as a configuration in the space |
| Parsimony | Via prior assignment (footnote) | Via PPC: extra links must generate confirmed predictions |

**Combinatorial explosion and pruning.** With $n$ mechanism links, the full configuration space contains $2^n$ possibilities. This is a feature, not a bug: it makes explicit the richness of the hypothesis space that monolithic BPT collapses into a handful of propositions. In practice, most configurations are substantively implausible and can be pruned using domain knowledge. The analyst need only consider configurations that correspond to coherent causal stories --- typically a small fraction of the combinatorial space. This is no different from quantitative model selection, where the space of possible regression specifications is vast but substantive theory constrains the models actually considered.


## 3.2 Worked Example: Chile Mechanism Decomposition

To make the framework concrete, consider Fairfield and Charman's (2022, ch. 10) analysis of Chile's 2005 income tax reform. Three hypotheses explain why the right accepted the elimination of Article 57 bis:

**Table 3: Mechanism Decomposition --- Chile Case**

| Hypothesis | Link | Description |
|------------|------|-------------|
| $H_{EA}$ (Equity Appeal) | $m_1$ | Inequality gains public salience (bishops, campaign) |
| | $m_2$ | Lagos issues public equity challenge |
| | $m_3$ | Right leadership perceives electoral threat from rejection |
| | $m_4$ | Political leadership overrides technical/ideological resistance |
| | $m_5$ | Caucus follows leadership and votes in favor |
| $H_{CC}$ (Core Constituency) | $m'_1$ | Material value of 57 bis declines over time |
| | $m'_2$ | Right's constituency becomes indifferent to subsidy |
| | $m'_3$ | Party assesses subsidy as dispensable *before* Lagos's challenge |
| | $m'_4$ | Right votes elimination without external pressure |
| $H_{MV}$ (Median Voter) | $m''_1$ | Generic electoral competition generates convergence |
| | $m''_2$ | Both coalitions converge on median voter interests |
| | $m''_3$ | Elimination reflects median voter preference |

The decomposition reveals that a composite hypothesis --- what we term the "low-stakes confound" --- is a legitimate configuration in the mechanism space:

$$H_{\text{composite}} = \{m_1, m_2, m_3, m_4, m'_1\}$$

This configuration shares $m_1$--$m_4$ with $H_{EA}$ and $m'_1$ with $H_{CC}$: the equity appeal operated, but partly *because* the declining material value of the subsidy ($m'_1$) lowered the stakes for organized business. Under monolithic BPT, this composite is an ad hoc addition; under mechanism configurations, it is a well-defined point in the configuration space with its own testable implications.

**Link-level PPC: a worked calculation.** To illustrate how mechanism decomposition changes predictive checking, consider the prediction for $e^*_3$ (internal deliberations showing a *reactive* decision) within $H_{EA}$. In the monolithic approach, the analyst assigns $P(e^*_3 \mid H_{EA}) = 0.90$ directly. In the decomposed approach, the prediction depends on specific links:

- If $m_3 = 1$ (leadership perceives threat) and $m_4 = 1$ (leadership overrides resistance): $P(e^*_3 = \text{reactive}) = 0.95$
- If $m_3 = 1$ but $m_4 = 0$ (perception exists, but resistance not overridden): $P(e^*_3 = \text{reactive}) = 0.60$
- If $m_3 = 0$ (no perceived threat): $P(e^*_3 = \text{reactive}) = 0.10$

Integrating over link-level posteriors ($P(m_3 \mid \mathbf{e}_{\text{obs}}) \approx 0.95$, $P(m_4 \mid \mathbf{e}_{\text{obs}}) \approx 0.90$):

$$P(e^*_3 = \text{reactive} \mid H_{EA}, \mathbf{e}_{\text{obs}}) \approx (0.95)(0.95)(0.90) + (0.60)(0.95)(0.10) + (0.10)(0.05) = 0.874$$

The aggregate prediction (0.87) is similar to the monolithic value (0.90), but the structure reveals that the prediction is sensitive to $m_4$ (the leadership override). If $e^*_3$ turns out to show ambiguous rather than clearly reactive deliberations, the decomposition tells us *where* to look: the override link is the likely source of the discrepancy, not the equity appeal writ large.


## 3.3 PPC as a Consequence of Mechanism Decomposition

With mechanism links as parameters, the posterior predictive distribution acquires a two-level structure. At the first level, within each configuration $\mathbf{c}_i$, the analyst integrates over uncertainty in which links are active:

$$P(e^* \mid \mathbf{c}_i, \mathbf{e}_{\text{obs}}) = \sum_{\mathbf{m} \in \{0,1\}^{n_i}} P(e^* \mid \mathbf{m}, \mathbf{c}_i) \, P(\mathbf{m} \mid \mathbf{c}_i, \mathbf{e}_{\text{obs}})$$

At the second level, the analyst averages across configurations weighted by posterior probabilities:

$$P(e^* \mid \mathbf{e}_{\text{obs}}) = \sum_{i=1}^{K} P(e^* \mid \mathbf{c}_i, \mathbf{e}_{\text{obs}}) \times P(\mathbf{c}_i \mid \mathbf{e}_{\text{obs}})$$

The first level is the proper PPC --- integrating over parameters within a model. The second level is BMA across models. Together, they give the qualitative PPC the same two-level structure as its quantitative counterpart.

### Why formalize?

A natural objection is that good researchers already ask "if my hypothesis is correct, what else should I expect to find?" Three things distinguish the formalized approach. First, it forces the researcher to specify predictive likelihoods *under each hypothesis and each mechanism link*, not just the leading account. Informal reasoning asks "is this evidence consistent with my conclusion?" rather than "is this evidence more consistent with my conclusion *at this specific link* than with the alternatives?" The comparative structure becomes explicit. Second, the posterior weights and link-level integration ensure that the prediction reflects the *entire model*, including cumulative evidence and uncertainty about specific links. When the posterior is non-extreme, alternatives contribute substantially, and informal prediction systematically overstates confidence. Third, explicit documentation makes the check auditable and replicable --- another researcher can inspect the predictions, substitute different link-level likelihoods, and determine whether the diagnostic conclusion is robust.

### What PPC is --- and is not

The posterior predictive distribution is a diagnostic of *internal coherence*, not a test of truth (Gelman and Shalizi 2013). A model can pass PPCs and still be wrong. The value lies in *diagnosis*: when predictions fail, mechanism decomposition localizes the failure to specific links rather than condemning entire hypotheses. Crucially, PPC differs from continuing to update with additional evidence. Standard BPT presupposes that the model is well-specified; PPC asks whether that presupposition is warranted. If a discrepancy is found, the response is not to update but to *revise* --- adjust likelihoods, reinterpret evidence, or expand the hypothesis set.


## 3.4 Workflow

The qualitative PPC consists of six steps.

**Step 1: Conduct standard BPT** to obtain posteriors over hypotheses and, where possible, posteriors over mechanism links within each hypothesis.

**Step 2: Identify holdout evidence** --- observations not examined in the original analysis. The most diagnostic items are mechanism-derived (following from the internal logic of specific links), drawn from domains different from the original evidence, and sharply discriminating between hypotheses. A practical minimum is 3--5 items from at least two evidentiary domains.

**Step 3: Derive predictions** by specifying predictive likelihoods under each hypothesis and (where decomposed) each mechanism link, then computing the two-level posterior predictive distribution. Predictions should be articulated *before* examining the holdout evidence.

**Step 4: Assess coherence** by comparing predictions to domain knowledge, direct observation, or auxiliary literature. The assessment is qualitative: no p-value, no formal rejection threshold. The analyst asks whether predictions are reasonable given what is known --- a structured judgment call grounded in explicit predictions.

**Step 5: Diagnose and revise.** When predictions conflict with evidence, trace the discrepancy to its source. Mechanism decomposition enables finer-grained diagnosis: the failure may localize to a specific link ($m_4$ rather than $H_{EA}$ as a whole), suggesting targeted revision rather than wholesale hypothesis rejection.

**Step 6: Document.** Record predictions, evidence, assessments, and revisions. Documentation guards against circularity and enables independent evaluation.


## 3.5 Addressing the Circularity Problem

The most serious objection to qualitative PPCs is circularity: the researcher specifies predictive likelihoods using the same type of judgment that produced the original likelihoods. If the same biases distort both stages, the check mechanically confirms the model.

### Correlated errors formalization

Let the true likelihood for evidence $e_j$ under $H_i$ be $L_{ij} = P(e_j \mid H_i)$. The researcher elicits a distorted version $\tilde{L}_{ij} = L_{ij} \cdot \exp(\epsilon_{ij})$, where $\epsilon_{ij}$ captures misjudgment, overconfidence, or narrative overfitting. For holdout evidence $e^*_k$, the elicited predictive likelihood is $\tilde{L}^*_{ik} = L^*_{ik} \cdot \exp(\eta_{ik})$. Circularity arises when $\mathrm{Corr}(\epsilon_{ij}, \eta_{ik}) > 0$: the same latent bias distorts both estimation and checking. The design problem is to reduce this correlation.

### Protocols

We propose four protocols targeting different sources of correlation:

**Protocol 1: Pre-specification.** Fix holdout evidence and elicit predictive likelihoods *before* inspecting holdout material. This removes ex post adjustment.

**Protocol 2: Blind second analyst.** A second analyst assigns predictive likelihoods without knowing the posterior ranking, breaking the tendency to protect the model.

**Protocol 3: Human--LLM triangulation.** Combine human elicitation with LLM elicitation. The rationale is not that LLMs are neutral but that their errors differ from human errors: humans impose coherent narratives; LLMs rely on pattern completion. Agreement across different failure modes is more informative than agreement within one.

**Protocol 4: Prompt diversification.** When using LLMs, employ different prompt families --- standard, skeptical, minimalist --- to induce heterogeneity in inferential style.

A recommended protocol combines all four: pre-specified holdout evidence, a blind second analyst, LLMs with diversified prompts, and reporting of convergence or divergence. We implement versions of this protocol in Sections 4 and 5.

### Graded credibility

Qualitative PPCs should be presented as *graded*: a same-researcher, post hoc check is exploratory; a blind, pre-specified, multi-channel check is much more credible. The defensible claim is not that qualitative PPCs eliminate circularity but that they have diagnostic value when predictive judgments are elicited prospectively through channels whose errors are unlikely to share the same latent source.


## 3.6 Scope Conditions and Objections

### Scope conditions

The framework is most valuable when (1) the domain is well-understood enough to generate non-trivial predictions, (2) identifiable holdout evidence exists, and (3) the hypotheses generate distinguishable predictions at the link level.

### Relationship to sensitivity analysis

Fairfield and Charman (2017: 372--374) recommend sensitivity analysis by varying priors. PPCs complement rather than replace this. Sensitivity analysis asks *do my conclusions change with different priors?* PPCs ask *does the model make sensible predictions about unobserved evidence?* The former checks priors; the latter checks likelihoods. A model can pass one and fail the other.

### Objections

**"Qualitative assessment is debatable."** Valid, but the alternative is no check at all. A debatable check is better than no check. Transparency means readers who disagree can substitute their own judgments.

**"Risk of p-hacking by analogy."** Could researchers select holdout evidence to confirm the model? Yes, in principle. Pre-specification (Protocol 1) and reporting all checks conducted mitigate this concern.

**"Combinatorial explosion makes the approach impractical."** The full configuration space is $2^n$, but substantive theory constrains the analyst to coherent causal stories --- typically 3--6 configurations. This is no more burdensome than the standard requirement to specify rival hypotheses.


# 4. Application: Chile's 2005 Tax Reform

## 4.1 The Case and the Original BPT

In 2005, President Ricardo Lagos eliminated Article 57 bis of Chile's Income Tax Law --- a tax credit on financial savings that overwhelmingly benefited high-income individuals (0.5% of adults received 72% of the tax expenditure). The puzzle is why the right, which held a Senate majority and had blocked similar reforms since 1990, accepted the elimination. During the 2005 presidential campaign, Catholic bishops denounced inequality; Lagos seized the moment with a public equity challenge: "The famous Article 57 bis is still in force and signifies a tremendous source of inequality. ... Instead of just talking, why don't we agree to eliminate 57 bis in less than 24 hours?" (Lagos, *El Mercurio*, May 10, 2005). The right accepted and voted in favor.

Fairfield and Charman (2022, ch. 10) evaluate three hypotheses: $H_{EA}$ (Equity Appeal --- Lagos's challenge, amplified by high issue-salience, drove the right to accept via electoral-damage concerns), $H_{MV}$ (Median Voter --- generic electoral competition), and $H_{CC}$ (Core Constituency --- the right's base no longer valued the subsidy). Starting from equal priors, they evaluate six evidence items:

**Table 4: Original Evidence --- Chile Case**

| Evidence | Description | WoE vs. $H_{CC}$ (dB) | WoE vs. $H_{MV}$ (dB) |
|----------|-------------|:---:|:---:|
| $E_0$ | Electoral salience of inequality (context) | $-5$ | $-10$ |
| $E_1$ | Reform blocked by right in prior episodes (1990--2001) | $+6$ | $+66$ |
| $E_2$ | Government informants: equity appeal decisive | $+12$ | $+12$ |
| $E_3$ | Post-2001 negotiation on 57 bis failed | $+25$ | $0$ |
| $E_4$ | ILD advisor overruled: "we will lose votes" | $+30$ | $+15$ |
| $E_5$ | Lavin advisors: "1999 trap"; party followed candidate | $+30$ | $+27$ |

The total WoE is 98 dB for $H_{EA}$ over $H_{CC}$ and 110 dB over $H_{MV}$, yielding a posterior of approximately 1.0 for $H_{EA}$ regardless of prior specification.


## 4.2 Mechanism Decomposition

Decomposing the three hypotheses into mechanism links (Table 3, Section 3.2) reveals the structure that monolithic analysis obscures. Each piece of original evidence maps to specific links:

**Table 5: Mechanism--Evidence Mapping --- Chile Case**

| Evidence | Primary links tested | Secondary links |
|----------|---------------------|-----------------|
| $E_0$ | $m_1$ (salience), $m_2$ (Lagos challenge) | --- |
| $E_1$ | $m_3$ (threat perception requires context) | $m'_3$ (subsidy not previously dispensable) |
| $E_2$ | $m_2$ (equity challenge framing) | --- |
| $E_3$ | $m'_3$ (pre-challenge: subsidy not dispensable) | $m_4$ (resistance not yet overridden) |
| $E_4$ | $m_4$ (leadership overrides ILD), $m_3$ (electoral threat) | --- |
| $E_5$ | $m_3$ (electoral threat), $m_5$ (caucus follows) | --- |

The mapping reveals that $m_1$ and $m_2$ (salience and challenge) are well-evidenced by $E_0$ and $E_2$; $m_3$ (threat perception) is strongly supported by $E_4$ and $E_5$; $m_4$ (leadership override) rests primarily on $E_4$; and $m_5$ (caucus compliance) is directly observed. Under $H_{CC}$, the critical link $m'_3$ (pre-challenge assessment of dispensability) is *disconfirmed* by $E_1$ and $E_3$: the right had repeatedly blocked similar reforms, suggesting the subsidy was not previously considered expendable. However, $m'_1$ (declining material value) receives no direct test from the original evidence --- a gap the PPC addresses.


## 4.3 PPC Predictions, Evidence, and Diagnosis

We identify four holdout evidence items spanning legislative records, comparative politics, internal deliberations, and business behavior. Each is selected for mechanism-derived diagnostic value.

### Predictions

For each item, we derive predictions from the posterior model. Given $P(H_{EA} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$, predictions are driven by what $H_{EA}$ implies at the link level.

| Evidence | Description | Key links | Posterior Predictive |
|----------|-------------|-----------|:---:|
| $e^*_1$ | Equity-dominated committee debate | $m_1$, $m_2$ | $\approx 0.85$ |
| $e^*_2$ | Weak equity framing in failed reforms | $m_2$ sufficiency | $\approx 0.70$ |
| $e^*_3$ | Reactive decision post-challenge | $m_3$, $m_4$ | $\approx 0.87$ |
| $e^*_4$ | No organized lobbying to defend 57 bis | $m'_1$ (tests $H_{CC}$ link) | $\approx 0.55$ |

### Evidence and assessment

**$e^*_1$ (committee records):** Lagos framed the reform as "a tremendous source of inequality"; a Finance Ministry official called 57 bis "a pure transfer to rich people"; the right did not contest the equity frame. The ILD advisor who opposed the reform was overruled by legislators citing electoral costs. **Strongly consistent** with the prediction and with links $m_1$--$m_2$.

**$e^*_2$ (comparative reforms):** A mixed picture. The only clearly rejected Lagos-era reform (Mining Royalty I, 2004) used a sovereignty frame rather than equity, consistent with $H_{EA}$. But the 2001 Anti-Evasion reform used equity framing yet required major concessions; the 2001 corporate tax increase required compensation despite equity framing. The pattern suggests equity framing was *necessary but not sufficient* --- the 57 bis succeeded also because stakes for organized business were low. This points to link $m'_1$ (declining value/low stakes) as a co-determinant.

**$e^*_3$ (internal deliberations):** The ILD advisor's opposition *after* Lagos's challenge, the "1999 trap" framing by Lavin's advisors, the rapid timeline, and the absence of pre-existing support for elimination all confirm a reactive sequence. **Strongly consistent** with links $m_3$ and $m_4$. Access to internal party records would provide the definitive test.

**$e^*_4$ (lobbying silence):** No organized business mobilization documented. Fairfield (2015a) documents active CPC/SOFOFA opposition to other reforms but finds only "business complaints" for 57 bis. The silence is consistent with $H_{CC}$'s $m'_1$ (declining value) but also with $H_{EA}$'s irrelevance of business lobbying to the equity appeal mechanism. The ambiguity is informative: it identifies $m'_1$ as a link that the original evidence does not resolve.

### Diagnosis

The PPC reveals three findings, reframed through mechanism links.

**Finding 1: The low-stakes confound points to a composite configuration.** The comparative evidence ($e^*_2$) and lobbying silence ($e^*_4$) converge on $m'_1$ --- the declining material value of the subsidy and the low stakes for organized business. The equity appeal operated (links $m_1$--$m_4$ confirmed), but it operated in a context where $m'_1$ was also active. The mechanism decomposition shows why this matters: the composite configuration $\{m_1, m_2, m_3, m_4, m'_1\}$ generates different predictions from pure $H_{EA}$ $\{m_1, m_2, m_3, m_4, m_5\}$ for evidence involving business behavior, while making identical predictions for evidence involving party deliberations.

**Finding 2: The temporal sequence localizes to $m_3$--$m_4$.** Internal deliberations ($e^*_3$) strongly support the reactive mechanism. The link-level analysis shows that the key test is whether $m_4$ (leadership override) is independently supported. The ILD advisor's opposition is indirect evidence; caucus minutes would test $m_4$ directly.

**Finding 3: The comparative counterfactual challenges $m_2$'s sufficiency.** If equity framing ($m_2$) was used in earlier reforms that required concessions, then $m_2$ alone is insufficient --- contextual factors ($m_1$, $m'_1$) are co-determinants. This calls for likelihood revision: the likelihoods under $H_{EA}$ may need to be conditioned on these contextual links.

**Table 6: PPC Summary --- Chile**

| Element | Content |
|---------|---------|
| **Posterior** | $P(H_{EA} \mid \mathbf{e}_{\text{obs}}) \approx 1.0$; 98 dB vs. $H_{CC}$, 110 dB vs. $H_{MV}$ |
| **Holdout evidence** | 4 items across 4 domains |
| **Predictions** | Posterior predictive probabilities: 0.55--0.87 |
| **Coherence** | Broadly coherent; 2 items strongly supported, 1 partially consistent, 1 ambiguous |
| **Link-level diagnosis** | $m_1$--$m_4$ well-supported; $m'_1$ (low stakes) identified as likely co-determinant; composite configuration $\{m_1, m_2, m_3, m_4, m'_1\}$ better accounts for the full evidence pattern |
| **Revision recommended?** | No fundamental revision. Consider composite hypothesis; seek internal party records to test $m_4$ directly |


## 4.4 Multi-Channel Elicitation

To implement the anti-circularity protocols, we conducted multi-channel elicitation using four model families (human, Claude, Gemini, GPT-5) each with three prompt variants (standard, skeptical, minimalist). None received the posterior distribution.

**Table 7: Multi-Channel Likelihood Comparison --- Chile (Standard Assessment)**

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

*Note: Claude = claude-opus-4-6 (Anthropic); Gemini = gemini-2.0-flash (Google); GPT-5 = gpt-5.3-codex (OpenAI). Models received hypotheses, case description, and holdout evidence but not the posterior distribution.*

**Table 7b: Prompt-Variation Results (Claude only)**

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

**Ordinal rankings are preserved across all four channels for all four items**: every channel agrees that $e^*_1$, $e^*_2$, and $e^*_3$ are most likely under $H_{EA}$ and that $e^*_4$ is most likely under $H_{CC}$. The skeptical channel lowers $H_{EA}$ by 0.15--0.20 but preserves diagnostic structure. $H_{CC}$ assessments are most stable (range $\leq 0.15$).

**Training data contamination.** Fairfield and Charman's (2022) book is likely in all LLM training corpora, so convergence may reflect echo rather than independence. Three considerations partially mitigate this: (1) the holdout evidence items are not analyzed in the book, requiring new predictive judgments; (2) skeptical prompts adopt stances differing from the book's conclusions yet preserve ordinal rankings; (3) the oil majors case (Section 5) provides a cleaner test, since holdout evidence postdates all training cutoffs.


# 5. Application: Oil Majors and Carbon Pricing

## 5.1 The Case and the Original BPT

Fairfield and Charman (2025) reanalyze Vormedal, Gulbrandsen, and Skjæresth's (2020) study of why European and US oil majors publicly supported carbon pricing. Two hypotheses: $H_{SA}$ (Strategic Accommodation --- a defensive hedge against radical regulation) and $H_{CA}$ (Competitive Advantage --- offensive strategy exploiting gas and CCS advantages). Starting from a 6 dB prior for $H_{SA}$ (~80%), they evaluate four evidence items yielding net WoE of 2 dB for $H_{CA}$, leaving the posterior at approximately 4 dB for $H_{SA}$ (~71%). The inference is dominated by the prior; the evidence barely moves the needle.


## 5.2 Mechanism Decomposition

**Table 8: Mechanism Decomposition --- Oil Majors**

| Hypothesis | Link | Description |
|------------|------|-------------|
| $H_{SA}$ | $m_1$ | Majors perceive growing regulatory threat |
| | $m_2$ | Moderate carbon price calculated as less costly than severe regulation |
| | $m_3$ | Support conditional: carbon price *replacing* regulation, not complementing |
| | $m_4$ | No serious investment in businesses dependent on carbon pricing |
| | $m_5$ | Public positioning ("responsible citizen") as rhetorical tool |
| $H_{CA}$ | $m'_1$ | Natural gas advantage over coal amplified by carbon pricing |
| | $m'_2$ | CCS creates markets leveraging geological expertise |
| | $m'_3$ | Companies make real investments predicated on carbon pricing |
| | $m'_4$ | Companies genuinely want carbon pricing to pass |

**Company-level configurations.** The decomposition reveals heterogeneity that the binary $H_{SA}$/$H_{CA}$ structure obscures:

| Company | Plausible configuration | Type |
|---------|------------------------|------|
| ExxonMobil | $\{m_1, m_2, m_3, m_4, m_5\}$ | Pure $H_{SA}$ |
| Equinor | $\{m_1, m_2, m'_2, m'_3\}$ | Mix: $H_{SA}$ framing + $H_{CA}$ investments |
| TotalEnergies | $\{m_1, m'_1, m'_2, m'_3, m'_4\}$ | Closer to pure $H_{CA}$ |

Under monolithic BPT, this heterogeneity is an ad hoc observation. Under mechanism configurations, each company occupies a distinct point in the configuration space with its own testable implications.

**Worked PPC: $e^*_5$ (McCoy admission) within $H_{SA}$.** In the monolithic approach, the analyst assigns $P(e^*_5 \mid H_{SA}) = 0.80$. In the decomposed approach, the prediction depends on $m_4$ (no serious investment) and $m_5$ (rhetorical positioning):

- If $m_4 = 1$ and $m_5 = 1$: $P(e^*_5 = \text{cynical admission}) = 0.85$
- If $m_4 = 0$ (company invests seriously): $P(e^*_5) = 0.10$
- If $m_5 = 0$ (no rhetorical positioning): $P(e^*_5) = 0.05$

With $P(m_4 \mid \mathbf{e}_{\text{obs}}) = 0.50$ (original evidence was ambiguous) and $P(m_5 \mid \mathbf{e}_{\text{obs}}) = 0.85$:

$$P(e^*_5 \mid H_{SA}, \mathbf{e}_{\text{obs}}) \approx 0.85 \times 0.50 \times 0.85 + 0.10 \times 0.50 \times 0.85 + 0.05 \times 0.15 = 0.41$$

This is *dramatically lower* than the monolithic 0.80 because the monolithic value hides uncertainty about $m_4$. The original evidence was genuinely ambiguous about whether oil majors invested seriously in carbon-pricing-dependent businesses --- a critical link that the monolithic treatment obscures.


## 5.3 PPC Predictions, Evidence, and Diagnosis

We identify four items of post-2020 holdout evidence. All postdate F&C's analysis window and are from publicly verifiable sources.

| Evidence | Description | $P$ under $H_{SA}$ | $P$ under $H_{CA}$ | Posterior Predictive |
|----------|-------------|:---:|:---:|:---:|
| $e^*_5$ | McCoy sting: carbon tax a "talking point" | 0.80 | 0.05 | 0.58 |
| $e^*_6$ | API conditions support on replacing all regulation | 0.75 | 0.15 | 0.58 |
| $e^*_7$ | BP/Shell/Equinor retreat from climate while maintaining carbon pricing rhetoric | 0.70 | 0.20 | 0.56 |
| $e^*_8$ | Denbury (\$4.9B) + Northern Lights (\$3.4B) CCS investments | 0.40 | 0.80 | 0.52 |

Predictions cluster near 0.55--0.58, much less sharp than Chile's 0.55--0.87, reflecting the non-extreme posterior.

### Evidence and assessment

**$e^*_5$ (McCoy sting):** ExxonMobil's senior lobbyist Keith McCoy admitted on undercover video that carbon tax support was "an effective advocacy tool" for a policy "nobody is going to propose" (NPR 2021; Unearthed 2021). Devastating for $H_{CA}$: a company genuinely motivated by competitive advantage would want carbon pricing to pass. McCoy described a strategy operational *during* F&C's analysis window, meaning that $E_1$ (UNFCCC letter) and $E_2$ (Exxon CEO letter) --- coded as favoring $H_{CA}$ --- were equally predicted by $H_{SA}$. The link-level analysis localizes this: the holdout evidence confirms $m_4$ and $m_5$ for ExxonMobil, suggesting that the original likelihoods for $E_1$ and $E_2$ under $H_{SA}$ were too low. WoE: 8--10 dB for $H_{SA}$.

**$e^*_6$ (API conditionality):** API endorsed carbon pricing conditioned on "replacing all environmental laws and regulations" for GHG emissions (Bloomberg 2021). Less than 0.4% of oil industry lobbying targeted carbon pricing legislation (House Oversight 2022). Textbook $m_3$ (conditional support): $H_{CA}$ would predict *additional* policies accelerating gas transitions, not carbon pricing as regulatory replacement. WoE: 6--8 dB for $H_{SA}$.

**$e^*_7$ (strategy reversals):** BP, Shell, and Equinor cut renewable investment while maintaining carbon pricing support (Fortune 2025; Carbon Brief 2024). Under $H_{SA}$, carbon pricing was a low-cost hedge abandoned in practice. Under $H_{CA}$, companies seeing genuine advantage would sustain transition investments. WoE: 5--7 dB for $H_{SA}$.

**$e^*_8$ (CCS investments):** ExxonMobil acquired Denbury (\$4.9B) for CO2 pipelines; the Northern Lights project (\$3.4B) invested in commercial CCS. These create genuine profit centers dependent on carbon pricing, consistent with $H_{CA}$ links $m'_2$ and $m'_3$. However, investments depend heavily on government subsidies (US 45Q credit, IRA, Norwegian state support) rather than market carbon prices, complicating $H_{CA}$. WoE: 3--4 dB for $H_{CA}$.

### Diagnosis

**Finding 1: The original likelihoods were miscalibrated.** The holdout evidence reveals a *diagnostic* finding about the original specification, not merely an update. McCoy ($e^*_5$) described a strategy operational during the period F&C analyzed. API's conditional endorsement ($e^*_6$) reflects a posture predating the formal announcement. This means the original likelihood assignments for $E_1$ and $E_2$ --- coded at 4 dB and 3 dB for $H_{CA}$ --- were likely miscalibrated: public carbon pricing support was *equally predicted by $H_{SA}$*. The link-level analysis shows exactly where: $m_4$ (no serious investment) and $m_5$ (rhetorical positioning) were active during the analysis window, meaning that $P(E_1 \mid H_{SA})$ and $P(E_2 \mid H_{SA})$ should have been higher than originally assigned. If revised, the original posterior would have been substantially more favorable to $H_{SA}$ even without post-2020 evidence.

**Finding 2: Company heterogeneity challenges the binary structure.** $H_{SA}$ dominates for ExxonMobil ($m_4$, $m_5$ confirmed) and ConocoPhillips. $H_{CA}$ is more plausible for Equinor ($m'_2$, $m'_3$: CCS leveraging Norway's geology) and TotalEnergies ($m'_1$, $m'_4$). The mechanism decomposition shows this is not ad hoc: different companies occupy different configurations in the same mechanism space.

**Finding 3: Non-extreme posteriors generate diagnostic PPCs when holdout evidence is strong.** Predictions clustered near 0.55, but the holdout evidence was dramatically one-sided, confirming that mechanism-level diagnostics are informative even when aggregate predictions are blurred.

**Table 9: PPC Summary --- Oil Majors**

| Element | Content |
|---------|---------|
| **Posterior** | $P(H_{SA} \mid \mathbf{e}_{\text{obs}}) \approx 0.71$; 4 dB for $H_{SA}$ |
| **Holdout evidence** | 4 items, all post-2020 |
| **Predictions** | Posterior predictive: 0.52--0.58 (blurred) |
| **Coherence** | 3 items strongly confirm $H_{SA}$; 1 item moderately supports $H_{CA}$ |
| **Link-level diagnosis** | $m_4$, $m_5$ confirmed for ExxonMobil; $m'_2$, $m'_3$ confirmed for Equinor/TotalEnergies; original $P(E_1 \mid H_{SA})$ and $P(E_2 \mid H_{SA})$ miscalibrated |
| **Revision recommended?** | Yes: (a) revise $E_1$/$E_2$ likelihoods under $H_{SA}$; (b) composite hypothesis with company-level variation |

**Audit note.** All holdout evidence is from publicly verifiable sources: Greenpeace/Unearthed (2021) undercover video (NPR, CNN, CNBC); API Climate Action Framework (2021); corporate press releases and SEC filings; Bloomberg, Fortune, Al Jazeera, Carbon Brief reporting.


## 5.4 Multi-Channel Elicitation

Unlike Chile, the holdout evidence here postdates all LLM training cutoffs, eliminating training data contamination as an explanation for convergence.

**Table 10: Multi-Channel Likelihood Comparison --- Oil Majors (Claude, 3 prompt variants)**

| Evidence | Hypothesis | Standard | Skeptical | Minimalist |
|----------|-----------|:--------:|:---------:|:----------:|
| $e^*_5$ | $H_{SA}$ | 0.75 | 0.30 | 0.55 |
| $e^*_5$ | $H_{CA}$ | 0.15 | 0.15 | 0.25 |
| $e^*_6$ | $H_{SA}$ | 0.80 | 0.40 | 0.60 |
| $e^*_6$ | $H_{CA}$ | 0.10 | 0.30 | 0.30 |
| $e^*_7$ | $H_{SA}$ | 0.70 | 0.25 | 0.50 |
| $e^*_7$ | $H_{CA}$ | 0.25 | 0.55 | 0.35 |
| $e^*_8$ | $H_{SA}$ | 0.30 | 0.10 | 0.30 |
| $e^*_8$ | $H_{CA}$ | 0.75 | 0.75 | 0.55 |

Ordinal rankings are preserved for three of four items ($e^*_5$, $e^*_6$, $e^*_8$). The critical exception: **$e^*_7$ (strategy reversals) flips under the skeptical channel**, which assigns $P(e^*_7 \mid H_{CA}) = 0.55 > P(e^*_7 \mid H_{SA}) = 0.25$. The skeptic argues that retreating from renewables while maintaining carbon pricing support is *exactly what $H_{CA}$ predicts*: the competitive advantage accrues through gas and CCS, not renewables.

The aggregate net WoE diverges: $+16.5$ dB for $H_{SA}$ (standard), $+5.3$ dB (minimalist), $-8.0$ dB toward $H_{CA}$ (skeptical). The skeptical channel *reverses the direction*. This divergence is itself diagnostic: it identifies which evidence is robust ($e^*_5$, $e^*_8$) and which is contested ($e^*_7$). The contrast with Chile --- where all channels converge --- confirms that the multi-channel exercise's value is greatest when posteriors are non-extreme.


# 6. Discussion and Conclusion

## 6.1 What the Framework Revealed

The two applications demonstrate that mechanism decomposition generates diagnostic information unavailable to monolithic hypothesis testing. In Chile, the PPC confirmed the equity appeal mechanism at the link level ($m_1$--$m_4$) while identifying $m'_1$ (low business stakes) as a likely co-determinant --- a finding that emerges naturally as a composite configuration $\{m_1, m_2, m_3, m_4, m'_1\}$ rather than an ad hoc addition. In the oil majors case, mechanism decomposition revealed that the original likelihood assignments for $E_1$ and $E_2$ were miscalibrated because the monolithic treatment hid uncertainty about link $m_4$ (no serious investment), and that company-level heterogeneity in mechanism configurations challenges the binary hypothesis structure.

The contrast between cases confirms two properties of the framework. First, extreme posteriors generate the sharpest predictions (Chile: 0.55--0.87; oil majors: 0.52--0.58). Second, multi-channel elicitation reveals interpretive fragility: in Chile, all channels converge; in the oil majors case, the skeptical channel reverses the aggregate direction, identifying $e^*_7$ as contested and $e^*_5$/$e^*_8$ as robust.


## 6.2 Engaging the Debate

The framework addresses specific interlocutors in the BPT debate.

**Fairfield and Charman** are correct that any evidence discriminating between hypotheses is informative and that Bayesian inference can accommodate diverse causal ontologies. But their framework treats hypotheses as monolithic units without internal parameters, limiting diagnostic capacity. Mechanism configurations extend their framework: mutual exclusivity is preserved at the configuration level, parsimony operates through PPC rather than prior assignment alone, and composite hypotheses are formalized rather than informally appended.

**Zaks** is correct that BPT lacks guardrails and that mutual exclusivity creates distortions when hypotheses share mechanisms. But the solution is not to abandon BPT; it is to decompose hypotheses so that mutual exclusivity operates at the right level --- configurations --- while mechanism links can be shared. The decomposition also answers Zaks's (2021: 72) explicit call for "expansions to Bayes' rule to accommodate the wide scope of relationships among rival hypotheses."

**Bennett's** engine analogy --- hypotheses can share components while remaining mutually exclusive if they specify different overall configurations --- is precisely what mechanism configurations formalize.

**Jacobs** argues for more formalization to derive likelihoods from explicit causal models. Mechanism decomposition is exactly this intermediate formalization: not a full DAG (as in *CausalQueries*) but a structured decomposition that makes likelihood derivation explicit at the link level.

**Soifer** identifies a tension between Fairfield and Charman's broad view of informative evidence and the mainstream emphasis on mechanisms. Mechanism configurations reconcile the two: mechanisms provide the *structure* of hypotheses (Soifer's concern), while any evidence that discriminates at the link level is informative (Fairfield and Charman's insight).


## 6.3 Limitations and Future Work

Our demonstration relies on secondary sources rather than independent primary data collection. Complete primary access --- BCN transcripts for Chile, internal party archives, independent CCS investment data --- would strengthen the analysis. The circularity protocols are partially but not fully implemented: a blind second analyst was not used for the human channel. The link-level posteriors (e.g., $P(m_4 \mid \mathbf{e}_{\text{obs}}) = 0.90$) are point estimates without formal uncertainty propagation. Future work should explore integration with *CausalQueries* (Humphreys and Jacobs 2023), empirical calibration across published BPT applications, and formal criteria for configuration space pruning.


## 6.4 Conclusion

BPT has imported the machinery of Bayesian updating but not the machinery of Bayesian diagnostics. The reason is structural: monolithic hypotheses have no internal parameters over which to integrate, so posterior predictive checks cannot operate in the proper sense. Decomposing hypotheses into mechanism configurations --- discrete, binary steps in a causal chain --- creates the parameter space that makes PPCs possible. The decomposition also resolves long-standing problems with mutual exclusivity, compound hypotheses, and diagnostic granularity. If BPT treats hypotheses as models, it should give those models the internal structure that makes model checking possible.


---

# References

Befani, Barbara. 2020. "Diagnostic Evaluation and Bayesian Updating: Practical Solutions to Common Problems." *Evaluation* 26(4): 415--438.

Befani, Barbara, and Gavin Stedman-Bryce. 2017. "Process Tracing and Bayesian Updating for Impact Evaluation." *Evaluation* 23(1): 42--60.

Befani, Barbara, Corinna Elsenbroich, and Jen Badham. 2021. "Diagnostic Evaluation with Simulated Probabilities." *Evaluation* 27(2): 102--115.

Behrens, Lars, and Ingo Rohlfing. 2025. "The Integration of Bayesian Regression Analysis and Bayesian Process Tracing in Mixed-Methods Research." *Sociological Methods & Research*. DOI: 10.1177/00491241241295336.

Bennett, Andrew. 2008. "Process Tracing: A Bayesian Perspective." In Janet M. Box-Steffensmeier, Henry E. Brady, and David Collier (eds.), *The Oxford Handbook of Political Methodology*. Oxford: Oxford University Press, pp. 702--721.

Bennett, Andrew. 2023. "Comments on *Social Inquiry and Bayesian Inference*." *Qualitative and Multi-Method Research* 21(2): 51--55.

Bennett, Andrew, Tasha Fairfield, and Andrew E. Charman. 2022. "Understanding Bayesianism: Fundamentals for Process Tracers." *Political Analysis* 30(2): 298--305.

Brandao, Federico, Barbara Befani, Britaldo Soares-Filho, Raoni Rajao, and Romulo Garcia. 2023. "How to Halt Deforestation in the Amazon? A Bayesian Process-Tracing Approach." *Land Use Policy* 133(C): 106862.

Fairfield, Tasha. 2015a. *Private Wealth and Public Revenue in Latin America: Business Power and Tax Politics*. New York: Cambridge University Press.

Fairfield, Tasha, and Andrew E. Charman. 2017. "Explicit Bayesian Analysis for Process Tracing: Guidelines, Opportunities, and Caveats." *Political Analysis* 25(3): 363--380.

Fairfield, Tasha, and Andrew E. Charman. 2019. "A Dialogue with the Data: The Bayesian Foundations of Iterative Research in Qualitative Social Science." *Perspectives on Politics* 17(1): 154--167.

Fairfield, Tasha, and Andrew E. Charman. 2022. *Social Inquiry and Bayesian Inference: Rethinking Qualitative Research*. Cambridge: Cambridge University Press.

Fairfield, Tasha, and Andrew E. Charman. 2023. "Bayesian Reflections." *Qualitative and Multi-Method Research* 21(2): 66--71.

Fairfield, Tasha, and Andrew E. Charman. 2025. "Bayesian Reasoning for Qualitative Replication Analysis: Examples from Climate Politics." *Political Science Research and Methods*, 1--16.

Gelman, Andrew, and Cosma Rohilla Shalizi. 2013. "Philosophy and the Practice of Bayesian Statistics." *British Journal of Mathematical and Statistical Psychology* 66(1): 8--38.

Gelman, Andrew, Xiao-Li Meng, and Hal Stern. 1996. "Posterior Predictive Assessment of Model Fitness via Realized Discrepancies." *Statistica Sinica* 6(4): 733--807.

Gelman, Andrew, Aki Vehtari, Daniel Simpson, et al. 2020. "Bayesian Workflow." arXiv preprint, arXiv:2011.01808.

Humphreys, Macartan, and Alan M. Jacobs. 2015. "Mixing Methods: A Bayesian Approach." *American Political Science Review* 109(4): 653--673.

Humphreys, Macartan, and Alan M. Jacobs. 2023. *Integrated Inferences: Causal Models for Qualitative and Mixed-Method Research*. Cambridge: Cambridge University Press.

Jacobs, Alan M. 2023. "Comments on *Social Inquiry and Bayesian Inference*." *Qualitative and Multi-Method Research* 21(2): 56--59.

Soifer, Hillel David. 2023. "Comments on *Social Inquiry and Bayesian Inference*." *Qualitative and Multi-Method Research* 21(2): 63--65.

Vormedal, Irja, Lars H. Gulbrandsen, and Jon Birger Skjæresth. 2020. "Big Oil and Climate Regulation: Business as Usual or a Changing Business?" *Global Environmental Politics* 20(4): 143--166.

Zaks, Sherry. 2021. "Updating Bayesian(s): A Critical Evaluation of Bayesian Process Tracing." *Political Analysis* 29(1): 58--74.

Zaks, Sherry. 2022. "Return to the Scene of the Crime: Revisiting Process Tracing, Bayesianism, and Murder." *Political Analysis* 30(2): 306--310.

---

**[END OF DRAFT v2 --- Option B rewrite]**

**Remaining TODOs:**

- [TODO] Obtain full transcripts from BCN "Historia de la Ley N. 20.028" (ID 6630) to verify $e^*_1$
- [TODO] Seek access to internal UDI/RN records (caucus minutes) for $e^*_3$
- [TODO] Document business lobbying behavior with primary sources ($e^*_4$)
- [TODO] Supplementary materials: compile full source URLs for oil majors evidence
- [VERIFY] Exact dB threshold adjectives from Fairfield and Charman (2017: 370)
