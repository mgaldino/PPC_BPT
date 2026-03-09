# Anotação de Abstract: Mechanism Configurations and Posterior Predictive Checks for Bayesian Process Tracing

**Arquivo**: `paper_draft_v1.md`
**Data**: 2026-03-09 (post-recalibration rewrite; new rubric with Craft & Economia)

## Abstract avaliado

> Fairfield and Charman's (2022) Bayesian process tracing (BPT) framework provides the mathematical machinery to sum over multiple causal pathways within each hypothesis (Eq. 3.11), but in application this sum collapses to the dominant scenario: practitioners assess likelihoods under the single most plausible pathway rather than integrating over the full space of scenarios. We operationalize this unenumerated structure by decomposing hypotheses into configurations of mechanism links --- discrete, binary steps in a causal chain. This decomposition creates an internal parameter space that enables posterior predictive checks (PPCs) in the proper Bayesian sense: predictions derived by integrating over uncertainty in mechanism links within and across configurations. We formalize this two-level predictive distribution, operationalize it as a workflow, and address the circularity objection through correlated-error analysis and multi-channel elicitation protocols combining human and LLM assessments across diverse prompt families. Two applications to cases previously analyzed by Fairfield and Charman --- Chile's 2005 income tax reform (posterior $\approx 1.0$) and oil majors' carbon pricing advocacy (posterior $\approx 0.71$) --- demonstrate that mechanism decomposition generates finer-grained diagnostics than standard hypothesis-level testing. In Chile, the PPC identifies a composite mechanism configuration --- equity appeal plus low business stakes --- that better accounts for the evidence than the dominant hypothesis alone. In the oil majors case, decomposition reveals that original likelihood assignments were miscalibrated because the dominant-scenario treatment hid uncertainty about a critical link, and that company-level heterogeneity challenges the binary hypothesis structure. The framework resolves long-standing problems in BPT --- mutual exclusivity distortions, ad hoc compound hypotheses, and the absence of model checking --- by giving hypotheses the internal structure that makes Bayesian diagnostics possible.

## Avaliação elemento a elemento

### 1. Research Puzzle (16/16)

- **Status**: Presente
- **Qualidade da escrita**: Bem escrito
- **Coerência com o paper**: Coerente
- **Trecho relevante**: "Fairfield and Charman's (2022) Bayesian process tracing (BPT) framework provides the mathematical machinery to sum over multiple causal pathways within each hypothesis (Eq. 3.11), but in application this sum collapses to the dominant scenario: practitioners assess likelihoods under the single most plausible pathway rather than integrating over the full space of scenarios."
- **Comentário**: The puzzle is precisely stated in S1: FC's framework has mathematical infrastructure for multiple causal pathways (Eq. 3.11), but in practice this collapses to a single dominant scenario. The tension (theory vs. practice) is clearly delineated. The formulation "but in application this sum collapses" is concise and accurate. The puzzle is coherent with Section 2 of the paper, which develops the dominant-scenario problem in detail. The accessibility limitations of this sentence (opening with author names, referencing an equation number) are evaluated under Craft, not here — the *content* is precise.

### 2. Theoretical Contribution (16/16)

- **Status**: Presente
- **Qualidade da escrita**: Bem escrito
- **Coerência com o paper**: Coerente
- **Trecho relevante**: "We operationalize this unenumerated structure by decomposing hypotheses into configurations of mechanism links --- discrete, binary steps in a causal chain. This decomposition creates an internal parameter space that enables posterior predictive checks (PPCs) in the proper Bayesian sense."
- **Comentário**: The contribution is stated with exceptional precision. S2 defines mechanism links ("discrete, binary steps in a causal chain") and the decomposition. S3 articulates the consequence: an internal parameter space that enables PPCs. The two-level structure — decomposition as primary innovation, PPC as consequence — faithfully mirrors the paper's Section 3 architecture. "In the proper Bayesian sense" effectively signals that this paper corrects a structural deficiency, not merely adds a tool. The gloss of mechanism links is sufficient for comprehension. Full marks.

### 3. Empirical Approach (16/16)

- **Status**: Presente
- **Qualidade da escrita**: Bem escrito
- **Coerência com o paper**: Coerente
- **Trecho relevante**: "We formalize this two-level predictive distribution, operationalize it as a workflow, and address the circularity objection through correlated-error analysis and multi-channel elicitation protocols combining human and LLM assessments across diverse prompt families. Two applications to cases previously analyzed by Fairfield and Charman --- Chile's 2005 income tax reform (posterior ≈ 1.0) and oil majors' carbon pricing advocacy (posterior ≈ 0.71) --- demonstrate that mechanism decomposition generates finer-grained diagnostics than standard hypothesis-level testing."
- **Comentário**: The abstract identifies both cases with specificity (Chile tax reform, oil majors carbon pricing), notes their contrasting posteriors (the key design feature), and names the source. Multi-channel elicitation is mentioned with specification ("combining human and LLM assessments across diverse prompt families") — an improvement over the previous version. S4 is overloaded (7+ technical concepts in one sentence), but the overload is a Craft issue, not a content gap. The empirical approach is adequately described for a methodology paper.

### 4. Main Findings (16/16)

- **Status**: Presente
- **Qualidade da escrita**: Bem escrito
- **Coerência com o paper**: Coerente
- **Trecho relevante**: "In Chile, the PPC identifies a composite mechanism configuration --- equity appeal plus low business stakes --- that better accounts for the evidence than the dominant hypothesis alone. In the oil majors case, decomposition reveals that original likelihood assignments were miscalibrated because the dominant-scenario treatment hid uncertainty about a critical link, and that company-level heterogeneity challenges the binary hypothesis structure."
- **Comentário**: Major improvement over the previous version, which stated findings generically. S6 and S7 now report concrete, case-specific findings: (1) Chile: composite configuration {equity appeal + low stakes} outperforms pure H_EA; (2) oil majors: original likelihoods miscalibrated + company heterogeneity challenges binary structure. These are specific, directional, and coherent with Sections 4.3 and 5.3. The only finding not represented is the skeptical channel's reversal in Table 10 — but this is a reasonable omission for space reasons.

### 5. Implications (16/16)

- **Status**: Presente
- **Qualidade da escrita**: Bem escrito
- **Coerência com o paper**: Coerente
- **Trecho relevante**: "The framework resolves long-standing problems in BPT --- mutual exclusivity distortions, ad hoc compound hypotheses, and the absence of model checking --- by giving hypotheses the internal structure that makes Bayesian diagnostics possible."
- **Comentário**: S8 explicitly articulates implications: the framework resolves three named problems (mutual exclusivity, compound hypotheses, model checking). The closing phrase ("by giving hypotheses the internal structure that makes Bayesian diagnostics possible") is the thesis restated as implication. This is a significant improvement over the previous version, which left implications implicit. The implications are methodological rather than substantive — appropriate for a methods paper targeting *Political Analysis* or *SMR*. For *APSR* or *JOP*, broader disciplinary implications would be expected.

### 6. Craft & Economia (5/20)

- **6a. Primeira frase acessível?** Não → **-5**
  - Frase: "Fairfield and Charman's (2022) Bayesian process tracing (BPT) framework provides the mathematical machinery to sum over multiple causal pathways within each hypothesis (Eq. 3.11), but in application this sum collapses to the dominant scenario: practitioners assess likelihoods under the single most plausible pathway rather than integrating over the full space of scenarios."
  - Comentário: The first sentence opens with author names ("Fairfield and Charman") that a non-BPT specialist will not recognize, references a specific equation number ("Eq. 3.11") that is meaningless without reading the book, and uses technical phrases ("mathematical machinery to sum over multiple causal pathways," "integrating over the full space of scenarios") that presuppose familiarity with Bayesian integration. A formal theorist, an experimentalist, or a comparativist focused on institutions would not be able to parse this sentence without BPT background. The sentence is 52 words long — a micro-essay rather than an opening hook. Test failed.

- **6b. Economia de frase?** Não → **-5**
  - Comprimento médio: 33.6 palavras/frase (well above the ≤25 target)
  - Frases acima de 35 palavras: S1 (52w), S5 (40w)
  - Comentário: The abstract is systematically dense. Every sentence carries heavy technical load. S1 packs the puzzle, the FC framework, Eq. 3.11, dominant scenario, and the contrast between theory and practice into a single 52-word sentence. S4 packs formalization, operationalization, workflow, circularity, correlated-error analysis, multi-channel elicitation, human+LLM, and prompt families into 32 words. Even sentences below 35 words (S3: 31w, S7: 32w, S8: 33w) are dense because each compresses multiple technical concepts. The average of 33.6 is 34% above the target.

- **6c. Disciplina de jargão/siglas?** Não → **-5**
  - Siglas não definidas: Nenhuma — BPT and PPCs are properly introduced
  - Termos técnicos sem glosa:
    - "Eq. 3.11" — equation number from FC 2022, meaningless without context
    - "correlated-error analysis" — statistical technique, not glossed
    - "prompt families" — LLM jargon, not glossed
    - "two-level predictive distribution" — technical concept, not glossed
    - "posterior $\approx 1.0$" / "posterior $\approx 0.71$" — "posterior" used as a standalone noun/number without indicating it's a posterior *probability*
    - "dominant-scenario treatment" — introduced without explicit definition (though contextually derivable from S1)
  - Total: 5+ unglossed technical terms, well above the 3-term threshold.

- **6d. Fluidez e transição?** Sim
  - Comentário: The abstract follows a logical progression: puzzle (S1) → contribution (S2–S3) → method (S4–S5) → findings (S6–S7) → implications (S8). Transitions between sentences are smooth ("We operationalize," "This decomposition creates," "Two applications," "In Chile," "In the oil majors case," "The framework resolves"). No abrupt jumps. The progression mirrors the paper's structure. Passes.

## Score

| Elemento | Pontuação | Deduções |
|----------|-----------|----------|
| Research Puzzle | 16/16 | Nenhuma (precise and coherent; accessibility issues captured under Craft) |
| Theoretical Contribution | 16/16 | Nenhuma (specific, well-structured, mechanism links glossed) |
| Empirical Approach | 16/16 | Nenhuma (cases identified, posteriors noted, multi-channel specified) |
| Main Findings | 16/16 | Nenhuma (concrete case-specific findings stated; major improvement over previous version) |
| Implications | 16/16 | Nenhuma (three problems named and resolution stated) |
| Craft & Economia | 5/20 | -5: first sentence inaccessible (author names, Eq. 3.11, 52 words); -5: avg 33.6 w/sentence, systematically dense; -5: 5+ unglossed technical terms |
| **TOTAL** | **85/100** | |

**Classificação**: Bom — ajustes pontuais necessários

## Recomendações de melhoria

1. **Rewrite the first sentence for accessibility (impacto: +5 pts em Craft 6a).** The first sentence should be parseable by any political scientist. Instead of opening with "Fairfield and Charman's (2022)..." and "Eq. 3.11," open with the *problem in plain language*: "Bayesian process tracing (BPT) evaluates competing causal explanations but concentrates likelihood assessment on a single dominant scenario within each hypothesis, leaving alternative causal pathways unenumerated." This communicates the same puzzle without requiring knowledge of FC's specific framework or equation numbers. Save the FC citation for the contribution sentence.

2. **Break the densest sentences (impacto: +5 pts em Craft 6b).** S1 (52 words) should be split into two sentences: one for the puzzle, one for the gap. S4 (32 words but 7+ concepts) should be split: one sentence for formalization/workflow, one for circularity/multi-channel. Target: average ≤ 28 words, no sentence above 40.

3. **Gloss or remove opaque technical terms (impacto: +5 pts em Craft 6c).** Specific fixes:
   - Remove "Eq. 3.11" — it's meaningless without the book. The concept (summing over pathways) is already explained.
   - Replace "correlated-error analysis" with plain language: "modeling how biases may correlate across elicitation stages"
   - Replace "prompt families" with "prompt variants" or gloss: "different prompting strategies (standard, skeptical, minimalist)"
   - Change "posterior $\approx 1.0$" to "posterior probability $\approx 1.0$" or "near-certain posterior"

4. **Consider broader implications (impacto: +0 pts, but strategic).** The current implications sentence speaks only to BPT practitioners. For submission to *APSR* or broader methods journals, a closing sentence connecting to qualitative methodology writ large would expand the audience: "More broadly, the framework demonstrates how Bayesian diagnostics can be extended to qualitative causal inference." For *Political Analysis* or *SMR*, the current framing is adequate.

## Contagem de palavras e sugestões de corte

**Contagem**: 269 palavras

### Corte para ≤ 250 palavras (alvo: 250, cortar ≥19)

1. **Remove "Eq. 3.11" and compress S1.**
   - Original: "...provides the mathematical machinery to sum over multiple causal pathways within each hypothesis (Eq. 3.11), but in application this sum collapses to the dominant scenario: practitioners assess likelihoods under the single most plausible pathway rather than integrating over the full space of scenarios."
   - Cortado: "...provides mathematical infrastructure for multiple causal pathways within each hypothesis, but in practice this infrastructure goes unused: practitioners assess likelihoods under the single most plausible pathway."
   - Economia: ~14 words
   - Justificativa: "Eq. 3.11" is opaque; "mathematical machinery" → "mathematical infrastructure" is slightly shorter; the colon-expansion restated the concept.

2. **Compress S4.**
   - Original: "We formalize this two-level predictive distribution, operationalize it as a workflow, and address the circularity objection through correlated-error analysis and multi-channel elicitation protocols combining human and LLM assessments across diverse prompt families."
   - Cortado: "We formalize this predictive distribution as a workflow and address circularity through multi-channel elicitation combining human and LLM assessments."
   - Economia: ~12 words
   - Justificativa: "two-level" is a detail for the body; "correlated-error analysis" is a detail; "diverse prompt families" can be cut.

Total savings: ~26 words → ~243 words. Within 250 limit.

### Corte para ≤ 200 palavras (alvo: 200, cortar ≥69 total)

Cumulative with cuts above (~243 words remaining, need to cut ~43 more):

3. **Compress S5 (applications sentence).**
   - Original: "Two applications to cases previously analyzed by Fairfield and Charman --- Chile's 2005 income tax reform (posterior $\approx 1.0$) and oil majors' carbon pricing advocacy (posterior $\approx 0.71$) --- demonstrate that mechanism decomposition generates finer-grained diagnostics than standard hypothesis-level testing."
   - Cortado: "Applications to Chile's 2005 tax reform and oil majors' carbon pricing advocacy demonstrate finer-grained diagnostics than standard hypothesis-level testing."
   - Economia: ~18 words
   - Justificativa: Posterior values are secondary; "previously analyzed by Fairfield and Charman" can move to body.

4. **Compress S7 (oil majors finding).**
   - Original: "In the oil majors case, decomposition reveals that original likelihood assignments were miscalibrated because the dominant-scenario treatment hid uncertainty about a critical link, and that company-level heterogeneity challenges the binary hypothesis structure."
   - Cortado: "In the oil majors case, decomposition reveals miscalibrated likelihoods and company-level heterogeneity challenging the binary hypothesis structure."
   - Economia: ~14 words
   - Justificativa: The mechanism of miscalibration ("dominant-scenario treatment hid uncertainty about a critical link") is a detail for the body.

5. **Compress S8 (implications).**
   - Original: "The framework resolves long-standing problems in BPT --- mutual exclusivity distortions, ad hoc compound hypotheses, and the absence of model checking --- by giving hypotheses the internal structure that makes Bayesian diagnostics possible."
   - Cortado: "The framework resolves long-standing BPT problems --- mutual exclusivity distortions, ad hoc compound hypotheses, and absent model checking --- by giving hypotheses internal structure."
   - Economia: ~7 words

Total additional savings: ~39 words → ~204 words. Close to target. One more small trim would reach ≤200.

6. **Remove "in the proper Bayesian sense" from S3.**
   - Original: "...enables posterior predictive checks (PPCs) in the proper Bayesian sense: predictions derived by integrating over uncertainty in mechanism links within and across configurations."
   - Cortado: "...enables posterior predictive checks (PPCs): predictions derived by integrating over uncertainty in mechanism links within and across configurations."
   - Economia: ~5 words → ~199 words.

## Comparação com avaliação anterior

| Elemento | Versão anterior (rubrica antiga, 5×20) | Versão atual (rubrica nova, 5×16 + Craft 20) | Nota |
|----------|--------|--------|------|
| Research Puzzle | 20/20 | 16/16 | Both full marks; recalibrated framing improved precision |
| Contribution | 20/20 | 16/16 | Both full marks |
| Empirical Approach | 17/20 (-3 multi-channel) | 16/16 | Multi-channel now specified in abstract |
| Main Findings | 15/20 (-5 generic) | 16/16 | **Major fix**: concrete findings added per recommendation |
| Implications | 15/20 (-5 implicit) | 16/16 | **Major fix**: explicit implications sentence added per recommendation |
| Craft | N/A | 5/20 | **New dimension** reveals accessibility/density issues |
| **TOTAL** | **87/100** | **85/100** | Score appears similar but the rubric is fundamentally different |

The content improved substantially (all 5 elements now at full marks vs. 3/5 previously), but the new Craft dimension reveals that the *delivery* remains dense and inaccessible — the same pattern as the introduction.
