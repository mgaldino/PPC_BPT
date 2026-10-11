# Independent design review: carbon application

Date: 2026-10-11. Role: design/statistical reviewer, not the analysis implementer. Exact underlying model ID: UNKNOWN. No claim of human elicitation.

## Recommended application

Use the Exxon carbon-price endorsement episode in **2021** as the applied estimand. Condition on the public endorsement documented by Exxon on March 29, 2021. Check the May 2021 insider explanation published by Unearthed on June 30, 2021. This keeps the endorsement and the diagnostic record in the same period. Reconstruct the published Fairfield–Charman (FC) 71.5% sector-level posterior separately, and do not silently treat it as an Exxon-specific prior or posterior.

This recommendation relies on a particularly clear source-supported model restriction. FC's supplement A.3 already distinguishes Costless Reputational Gains (HR), which explains endorsement of policies regarded as infeasible, from SA, interpreted as endorsement of measures that could actually be adopted to lock in a lesser evil. Therefore HR is an existing substantive alternative, rather than a statistical category created to absorb any anomaly.

Sources read by this reviewer:

- `CLAUDE.md`.
- `paper_draft_v1.Rmd`, carbon case.
- FC 2025 main text, pages 9–13, and supplement A.3, pages 3–4, archived in the sibling `2026-10-10_causal_likelihoods/sources/` directory.
- `2026-10-10_causal_likelihoods/README.md` and `2026-10-10_e3_source_constraints/README.md`, plus source-constraint tables.
- Live primary-source search confirmed the 2021 official endorsement, Unearthed recording report, and official corporate repudiation. Source collection and quotation adjudication belong to the independent source reviewer.

Primary URLs:

1. https://corporate.exxonmobil.com/news/viewpoints/supports-carbon-pricing
2. https://unearthed.greenpeace.org/2021/06/30/exxon-climate-change-undercover/
3. https://corporate.exxonmobil.com/news/news-releases/statements/our-position-on-climate-policy-and-carbon-pricing
4. https://doi.org/10.1017/psrm.2025.16

## Observable and source interpretation

Let C denote the public endorsement and the known interview context. Let Z=1 denote an insider account linking the usefulness of the endorsement to expected non-enactment and its advocacy value. Z concerns an observed account, not direct error-free observation of the company's underlying motive.

The model must distinguish three objects:

1. The words and context in the source.
2. The coded observable Z.
3. The latent motive H to be inferred.

Source selection, the interviewer prompt, possible boasting, seniority/knowledge of the speaker, and disagreement with the CEO all affect the probability of observing Z under a given motive. They enter the likelihood. Replicate the whole coded interview record once. Multiple quotes from this interview do not create multiple independent observations.

Here a "false positive" is a diagnostic signal resembling HR when SA or CA is the main motive. It need not be a factually false statement. A speaker can truthfully describe reputational benefits and pessimism about enactment while the firm also prefers adoption. Therefore q_SA and q_CA need not be near zero under the definitions.

The official July 2 repudiation is substantively relevant. It can inform a sensitivity analysis for source error or be included through a joint observation model with explicitly specified conditional likelihoods. It cannot be multiplied in as an independent confirmation of the same motive.

## Minimal complete Bayesian model

Condition on C throughout. In the original two-mechanism specification M0:

\[
P(H=SA)=\pi,\qquad P(H=CA)=1-\pi.
\]

\[
P(Z=1\mid SA)=\epsilon_{SA},\qquad
P(Z=1\mid CA)=\epsilon_{CA}.
\]

The complement probabilities are 1 minus these values, so this is a normalized likelihood for every possible observable. All probabilities, including the absolute scale, are explicit analyst judgments. Their role and source rationale must appear in the judgment ledger.

After observing Z=1:

\[
P(SA\mid Z=1,M_0)
=\frac{\pi\epsilon_{SA}}
       {\pi\epsilon_{SA}+(1-\pi)\epsilon_{CA}}.
\]

For the directional discrepancy T(Z)=Z, the genuine in-sample posterior predictive probability is

\[
p_{PPC,0}
=P(Z^{rep}=1\mid Z=1,M_0)
=\frac{\pi\epsilon_{SA}^{2}+(1-\pi)\epsilon_{CA}^{2}}
       {\pi\epsilon_{SA}+(1-\pi)\epsilon_{CA}}.
\]

This is different from the pre-observation predictive probability except when the two likelihoods coincide. With the transparent benchmark restriction epsilon_SA=epsilon_CA=epsilon, the posterior SA/CA odds stay unchanged while the PPC equals epsilon. This cleanly exhibits the intended function of a PPC: an unchanged relative conclusion can coexist with a poor account of an observed implication shared by the two explanations.

The exact replication algorithm is: draw H from its posterior, draw one Zrep from Bernoulli(epsilon_H), compare T(Zrep) with T(Z). Exact enumeration is preferable to Monte Carlo for this small model.

## Revision by adding the already-theorized HR mechanism

In M1 assign prior mass rho to HR, and preserve the conditional SA/CA split among the remaining mass:

\[
P(SA)=(1-\rho)\pi,\quad
P(CA)=(1-\rho)(1-\pi),\quad
P(HR)=\rho.
\]

Let lambda=P(Z=1|HR,C). Then

\[
P(HR\mid Z=1,M_1)
=\frac{\rho\lambda}
{\rho\lambda+(1-\rho)[\pi\epsilon_{SA}+(1-\pi)\epsilon_{CA}]}.
\]

The three posterior masses are normalized prior-times-likelihood quantities. The revised PPC is the posterior weighted average of epsilon_SA, epsilon_CA and lambda. H must be drawn once for the whole replicated record.

If epsilon_SA=epsilon_CA=epsilon, the threshold for HR receiving a posterior majority is especially interpretable:

\[
\lambda/\epsilon>(1-\rho)/\rho.
\]

With rho=.20 the observed account must be more than four times as probable under HR as under either adoption-based mechanism. This is the substantive judgment readers should be invited to assess. It is more useful than presenting an unexplained 66.7% posterior.

Illustrative arithmetic only, not recommended elicitation results: epsilon=.10, lambda=.80, rho=.20 implies P(HR|Z)=2/3 and revised PPC=.5666667. If pi=.50, SA and CA each have posterior1/6. If pi=.715252751 is explicitly borrowed from the sector analysis, SA=.238417584 and CA=.094915750. That borrowing must be labeled and given its own sensitivity analysis.

## Sensitivity required for a complete delivery

1. Vary epsilon_SA and epsilon_CA separately. Equality is a useful benchmark, not a source-derived identity.
2. Vary rho, because prior exclusion or near-exclusion of HR can dominate the revised conclusion.
3. Vary lambda and explain that insider disclosure is not guaranteed even if HR is true.
4. Vary pi, or show the algebraic result that HR's posterior is pi-invariant under equal epsilon. Do not use a population posterior as a firm-level value without a stated bridge.
5. Translate changes into source claims: how often would a knowledgeable speaker give this account under an adoption motive, and how often under a reputation motive, in this interview context?
6. Present both the pre-observation predictive probability and the genuine in-sample PPC with different labels. Under unequal likelihoods these differ.
7. If epsilon or lambda are given probability distributions rather than a sensitivity grid, update their posteriors with Z before the PPC. For example, a Beta prior's mean does not stay fixed after one success. A range is not automatically a uniform prior.

## Why I do not recommend a primary 16-state completion of E1–E4

Such a model is mathematically possible, but requires four new absolute anchors, branch completion for evidence histories that were not observed, and a rule for replicating the selection of salient evidence. FC's likelihood ratios were sequentially assessed along the observed history. Assigning their values unchanged to every alternate history is a new conditional-independence/completion assumption.

A quick independent exact calculation used favorable-hypothesis likelihood q for each item, with the rival likelihood fixed by the published Bayes factor, and a posterior-predictive density-tail discrepancy over16 states. At q=.80 the tail is .036996, while at q=.90 it is .165511. Both completions reproduce the same 71.5253% SA posterior. These are illustrative completion sensitivities, not empirical PPC results. Choosing one as the main finding would make the desired conclusion depend on an arbitrary absolute-scale anchor.

E3 and E4 also concern different sets of firms and policies. A heterogeneous revision is substantively plausible but requires a genuine population/firm model and explicit allocation of the evidence likelihoods. It cannot be obtained by silently relabeling the four selected evidence items as independent firms.

## Scope of the eventual claim

The applied example can demonstrate an auditably conditional inference: under clearly enumerated source judgments, adding the observed insider explanation reveals a limitation of the two-mechanism specification and changes the posterior distribution when the already-theorized reputational mechanism is admitted. The precise extent of change is shown over the judgment sensitivity surface.

If the central PPC probability is .10 or .20, report that value directly and characterize it proportionately. The application need not manufacture a conventional 5% rejection. The model revision can be assessed through the posterior odds threshold and source interpretation.

The revised model was motivated by this observed discrepancy. Its better fit to Z is expected by construction and should not be presented as independent confirmation. A follow-up application could predict a distinct, unused implication such as how support changes when enactment becomes more plausible. That would be additional evidence, not a condition for finishing this transparent application.

## Implementation review status

No main analysis script was written or edited by this reviewer.

### Specification selected by coordinator

The coordinator selected the Exxon2021 target, pi=.50 and rho=.20. The source reviewer proposed q=(.15,.10,.65) for SA, CA and HR, respectively. These are that reviewer's analyst judgments, with explicitly broad sensitivity ranges. The coordinator added d=(.90,.90,.90), where d_H is the conditional probability of corporate repudiation after the instrumental-infeasibility report under H.

The implemented state space is:

- state0: no report of instrumental infeasibility, probability1−q_H
- state1: such a report, followed by no official repudiation, probabilityq_H(1−d_H)
- state2: such a report, followed by official repudiation, probabilityq_Hd_H

State2 is observed. State0 leaves the response unobserved/irrelevant because the triggering report did not occur. This conditional construction represents the dependence between the report and the response. The primary discrepancy is T=I(state1 or state2), so it checks occurrence of the report while the posterior uses the whole observed report-and-response record.

Independent arithmetic benchmark:

| Quantity | M0: SA/CA | M1: SA/CA/HR |
|---|---:|---:|
| Initial prior masses | .50, .50 | .40, .40, .20 |
| State2 likelihoods | .135, .090 | .135, .090, .585 |
| State2 initial predictive mass | .1125 | .207 |
| Posterior masses | .60, .40 | .2608695652, .1739130435, .5652173913 |
| Genuine in-sample PPC of T | .1300000000 | .4239130435 |
| Posterior predictive mass of state2 | .1170000000 | .3815217391 |

The common d cancels from posterior odds. It remains an explicit source-interpretation judgment that the repudiation is equally likely under all three motives. This means the main effect of adding this source is to represent the empirical sequence and make the equality assumption visible. Sensitivity in d_H is essential before treating that cancellation as scientifically harmless.

For bookkeeping, q_H denotes P(report|H,C) before conditioning on this particular repudiation, and d_H denotes P(repudiation|report,H,C). Reading the full corpus to elicit these values makes the elicitation retrospective. Interpreting q_H as already conditional on the specific observed denial and then multiplying by d_H would count that denial twice.

This specification is **approved as an auditable, judgment-conditional application**. It is not a decisive PPC rejection at the central setting: a .13 report-tail probability is a modest discrepancy. The concrete result is a change in the posterior's leading mechanism after allowing HR, with the amount and direction of change sensitive to the report-error and prior judgments.

The E1–E4 normalized completion is acceptable as a clearly labeled sensitivity appendix. It must retain its new absolute-scale and counterfactual-history assumptions and must not become an empirical claim that FC's likelihoods have been shown to be miscalibrated.

### Numerical audit completed

The independent script `agents/independent_audit.R` was executed successfully. It does not source any implementation functions. It rederives updating, posterior prediction and majority frontiers directly from the joint-law algebra, and checks the serialized outputs.

Result: **PASS**, 115 checks covering 246,087 numerical values, including all 14,400 sensitivity rows. Maximum absolute discrepancy was 4.973799e−14. The audit checked the central three-state kernels and their normalizations, both kinds of predictive probability, every focal and denial sensitivity row, prior endpoints, all720 majority-frontier rows, the inconclusive recoding, and all64 state rows in the four E1–E4 completions. It also checked uniqueness and parameter membership of the sensitivity grid.

Audit artifacts:

- `agents/independent_audit.R`: independent formulas and execution.
- `agents/independent_audit_results.json`: status, scope and SHA256 of20 reviewed inputs and outputs.
- `agents/independent_audit_checks.csv`: named checks, denominators and numerical errors.

No numerical correction to the implementer's code was needed. The initial audit script compared named and unnamed logical vectors with `identical`, yielding a false failure for the FC tail-membership check. Removing irrelevant names corrected the reviewer script. All tail-membership values themselves agreed.

The central outputs match the benchmark table above. In the focal sensitivity, d_R=.45 gives posteriorHR=.393939394 and M1's report-tail PPC=.334848485. These values correctly represent a stronger evidentiary role for the corporate denial against HR.

This PASS establishes implementation correctness for the specified judgments. The source judgments, target population and retrospective status remain as documented in the codebook and judgment ledger. The final report was subsequently reviewed in `agents/report_review.md`. All three requested wording/presentation corrections were verified, and no material issue remains in the reviewed report.
