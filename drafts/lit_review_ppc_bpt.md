# Revisão de Literatura: Posterior Predictive Checks para Bayesian Process Tracing

**Data:** 2026-02-19
**Tema:** Adaptar posterior predictive checks (PPC) ao Bayesian process tracing (BPT) como rotina formal de validação da especificação de verossimilhança

---

## 1. Visão geral do campo

A proposta de adaptar posterior predictive checks ao Bayesian process tracing situa-se na interseção de duas literaturas maduras mas até agora desconectadas: (i) a tradição estatística de model checking bayesiano, inaugurada por Box (1980) e formalizada por Gelman, Meng e Stern (1996), e (ii) o programa de pesquisa em Bayesian process tracing, liderado por Fairfield e Charman (2017, 2022) com contribuições de Bennett (2008), Humphreys e Jacobs (2015, 2023) e Barrenechea e Mahoney (2019).

A literatura de BPT cresceu rapidamente desde 2017 — Checkel (2021) reporta que 55% das publicações sobre process tracing entre 2017-2020 envolviam formalização bayesiana. Contudo, o debate concentrou-se em três eixos: (a) a viabilidade de atribuir probabilidades a evidências qualitativas, (b) a subjetividade inerente à especificação de likelihoods, e (c) o risco de falsa precisão. O que **não** existe na literatura é uma ferramenta formal de diagnóstico que permita ao pesquisador verificar se a verossimilhança escolhida é empiricamente plausível — exatamente o papel que PPCs desempenham na estatística bayesiana.

---

## 2. Trabalhos seminais

### 2.1 Bayesian Process Tracing

| Autor(es) | Ano | Argumento central | Método | Achado/Contribuição |
|-----------|-----|-------------------|--------|---------------------|
| Bennett | 2008 | PT pode ser fundamentado via lógica bayesiana | Capítulo teórico (Oxford Handbook) | Paralelismo entre PT e inferência bayesiana; Bayesianismo justifica inferência causal com N pequeno |
| Humphreys & Jacobs | 2015 | Framework BIQQ integra evidências quali e quanti via Bayes | Modelo formal + aplicação (sistemas eleitorais, guerra civil) | Posteriors sobre efeitos causais combinando cross-case e within-case evidence (*APSR*) |
| Fairfield & Charman | 2017 | Guidelines para BPT explícito usando "probabilidade como lógica estendida" | Aplicação sistemática ao caso da reforma tributária chilena | Primeira aplicação detalhada com múltiplas evidências; linguagem de likelihood ratios substitui tipologia de testes (*Political Analysis*; Sage Paper Award 2017) |
| Befani & Stedman-Bryce | 2017 | "Contribution Tracing" para avaliação de impacto | BPT aplicado a avaliação de programas | Critérios explícitos para guiar avaliadores na coleta de dados e mensuração de confiança (*Evaluation*) |
| Fairfield & Charman | 2019 | Fundamentação bayesiana para pesquisa iterativa | Aplicação teórica (state building) | Bayesianismo compatível com ida-e-volta entre teoria e dados; mitiga viés de confirmação (*Perspectives on Politics*) |
| Barrenechea & Mahoney | 2019 | Fundamentos set-teóricos do BPT | Formalização: testes como zonas em espaço contínuo | BPT e set-theoretic PT são "duas faces da mesma moeda" (*Sociological Methods & Research*) |
| Fairfield & Charman | 2022 | Tratamento abrangente: metodologia completa para case studies | Livro (Cambridge, Strategies for Social Inquiry) | Referência definitiva sobre BPT; cobre hipóteses, evidências, vieses, seleção de casos |
| Humphreys & Jacobs | 2023 | Modelos causais (DAGs) + Bayes para pesquisa quali e mixed-methods | Livro + pacote R *CausalQueries* | Framework computacional para especificar, atualizar e interrogar modelos causais (*Cambridge UP*) |
| Fairfield & Charman | 2025 | Raciocínio bayesiano para "replicação qualitativa" | Reanálise de evidências em climate politics | Likelihood ratios em escala decibel; avaliação da confiabilidade de achados qualitativos (*PSRM*) |

### 2.2 Posterior Predictive Checks (tradição estatística)

| Autor(es) | Ano | Argumento central | Método | Achado/Contribuição |
|-----------|-----|-------------------|--------|---------------------|
| Guttman | 1967 | "Observação futura" como critério de goodness-of-fit | Proposta conceitual | Precursor formal dos PPCs (*JRSS-B*) |
| Box | 1980 | Ciência como iteração entre *Criticism* e *Estimation* | "Sampling the future": distribuição preditiva para crítica de modelos | Distribuição preditiva (não posterior sozinha) revela falta de ajuste (*JRSS-A*) |
| Rubin | 1984 | PPCs como cálculos frequentistas "bayesianamente justificáveis" | Posterior predictive distribution substitui prior predictive de Box | Fundamento formal para PPCs (*Annals of Statistics*) |
| Meng | 1994 | Posterior predictive p-value como análogo bayesiano do p-value clássico | Formalização: statistic depende de dados e parâmetros | Distribuição amostral "menos variável" que uniforme quando modelo é correto (*Annals of Statistics*) |
| Gelman, Meng & Stern | 1996 | "Realized discrepancies" para avaliação de ajuste | Discrepância dependente de dados + parâmetros; displays gráficos | **Paper fundacional dos PPCs**: distingue PPCs (diagnóstico) de seleção de modelos (*Statistica Sinica*) |
| Gelman & Shalizi | 2013 | Estatística bayesiana como hipotético-dedutivismo, não indutivismo | Argumento filosófico + exemplos | Model checking (PPCs) = "falsificação" no ciclo bayesiano; essencial, não opcional (*BJMSP*) |
| Gabry et al. | 2019 | Visualização é indispensável em cada etapa da análise bayesiana | PPCs gráficos implementados em *bayesplot* | Ferramentas visuais concretas para diagnóstico (*JRSS-A*) |
| Gelman et al. | 2020 | Bayesian Workflow completo: construção, inferência, checking, expansão | Prior + posterior predictive checks como etapas formais | Framework iterativo onde model checking é central (arXiv:2011.01808) |

---

## 3. Debates centrais

### Debate 1: Viabilidade da quantificação de probabilidades em BPT

- **Posição A (proponentes):** Probabilidades representam graus racionais de crença dada informação limitada. O que importa são *likelihood ratios* relativos, não probabilidades absolutas. A quantificação explícita torna premissas transparentes e auditáveis (Fairfield & Charman 2017, 2022; Bennett 2008).
- **Posição B (críticos):** Probabilidades não podem ser especificadas sem ambiguidade para evidências qualitativas. A formalização cria uma ilusão de precisão e pode introduzir mais viés do que corrige (Zaks 2021, 2022; Hay 2016).
- **Estado atual:** Tensão irresolvida. Fairfield e Charman reconhecem a dificuldade mas argumentam que explicitação é superior à alternativa (julgamento implícito). Zaks (2021, 2022) rebate que a literatura oferece "um método sem guidelines claros nem guardrails". Bennett, Fairfield e Charman (2022) respondem clarificando pontos sobre exclusividade mútua, peso evidencial e pesquisa iterativa.

### Debate 2: Exclusividade mútua e exaustividade (MEE) das hipóteses

- **Posição A:** Formas funcionais distintas (e.g., "só A causou X", "só B causou X", "A e B conjuntamente causaram X") representam mundos distintos e satisfazem MEE (Bennett, Fairfield & Charman 2022).
- **Posição B:** Fenômenos sociais complexos raramente têm causas singulares; MEE estrita é impraticável. Não há procedimento operacional para avaliar exaustividade (Zaks 2021, 2022).
- **Estado atual:** Debate aberto. Proponentes argumentam que a objeção confunde hipóteses com variáveis causais; críticos insistem que a falta de guardrails práticos persiste.

### Debate 3: Calibração de likelihood ratios

- **Posição A:** Pesquisadores podem estimar likelihood ratios "habitando mentalmente o mundo" de cada hipótese. Sensitivity analysis com diferentes priors testa robustez (Fairfield & Charman 2017, 2025).
- **Posição B:** Calibração depende de julgamento subjetivo e pensamento crítico; pesquisadores podem desonestamente declarar que um teste foi "passado" (Aston 2020; Zaks 2021). A literatura carece de ferramentas formais para detectar especificações implausíveis.
- **Estado atual:** Gap reconhecido. Befani et al. (2021) propõem "probabilidades simuladas" via simulação computacional como terceira via, mas não integram ao framework mainstream de BPT.

---

## 4. Evolução metodológica

**Fase 1 — Analogia informal (1997-2010):** Van Evera (1997) propõe tipologia de testes (hoop, smoking gun, doubly decisive). Bennett (2008) traça paralelismo com inferência bayesiana. A conexão é conceitual, sem formalização.

**Fase 2 — Formalização explícita (2015-2019):** Humphreys e Jacobs (2015) formalizam integração quali-quanti via BIQQ (*APSR*). Fairfield e Charman (2017) publicam guidelines detalhados (*Political Analysis*). Barrenechea e Mahoney (2019) conectam BPT a fundamentos set-teóricos. Befani e colegas adaptam para avaliação de impacto.

**Fase 3 — Consolidação e debate (2020-presente):** Livros de referência (Fairfield & Charman 2022; Humphreys & Jacobs 2023). Crítica sistemática (Zaks 2021, 2022). Resposta dos proponentes (Bennett, Fairfield & Charman 2022). Extensões para replicação qualitativa (Fairfield & Charman 2025) e mixed-methods (Behrens & Rohlfing 2025).

**Observação crucial:** Em toda essa evolução, **não surgiu uma ferramenta de model checking análoga aos PPCs**. A validação da especificação do modelo permanece dependente de (a) argumentação verbal sobre a plausibilidade dos likelihood ratios, (b) sensitivity analysis ad hoc sobre priors, e (c) julgamento do pesquisador ou da comunidade via peer review.

---

## 5. Gaps identificados

### 5.1 Gap teórico-metodológico central (diretamente relevante para a proposta)

**Ausência de model checking formal para BPT.** A estatística bayesiana desenvolveu, ao longo de décadas, uma infraestrutura sofisticada de diagnóstico — PPCs, prior predictive checks, LOO-CV, WAIC — para verificar se modelos são adequados aos dados. O BPT importou a maquinaria de atualização bayesiana (priors → likelihoods → posteriors) mas **não importou a maquinaria de diagnóstico**. Nenhum paper propõe uma rotina formal para verificar se a verossimilhança especificada para uma evidência é empiricamente plausível.

**Trabalhos mais próximos, mas que não preenchem o gap:**

| Trabalho | O que faz | O que falta para ser PPC em BPT |
|----------|-----------|-------------------------------|
| Fairfield & Charman (2017) | Recomendam sensitivity analysis com diferentes priors | Foco em priors, não em likelihoods; sem framework formal de checking |
| Befani et al. (2021) | Propõem probabilidades simuladas via agent-based models | Limitado a avaliação de programas; não formaliza como PPC; sem conexão explícita com BPT |
| Humphreys & Jacobs (2023) | *CausalQueries* permite especificar e interrogar modelos causais | Formalismo via DAGs/modelos causais, não via distribuição preditiva posterior |
| Behrens & Rohlfing (2025) | Posterior predictive sampling de regressão para selecionar casos | PPCs vindos do componente quantitativo, não do componente qualitativo |
| Tran et al. (2016) | Model criticism para inferência causal bayesiana | Aplicado a modelos estatísticos de tratamento/resultado, não a process tracing |
| Gelman & Shalizi (2013) | Argumento filosófico: model checking = falsificação | Paralelo conceitual com PT, mas sem proposta operacional para contexto qualitativo |

### 5.2 Gaps empíricos

- **Aplicações de BPT** permanecem concentradas em CP comparada e relações internacionais. Avaliação de políticas públicas (Befani) é a principal exceção.
- **Calibração empírica** de likelihood ratios em BPT nunca foi testada sistematicamente (e.g., comparando estimativas de diferentes pesquisadores para as mesmas evidências).

### 5.3 Gaps metodológicos adicionais

- **Sensitivity analysis para likelihoods** (não apenas priors): não existe protocolo formalizado.
- **Critérios de revisão de modelo** pós-diagnóstico: quando e como revisar a especificação de verossimilhança após detectar falta de ajuste.
- **Conexão entre PPCs e a tipologia de testes** (hoop, smoking gun): como PPCs poderiam refinar a classificação de testes e detectar quando um teste é mal-especificado.

---

## 6. Avaliação da contribuição proposta

### 6.1 Diagnóstico: a contribuição é real?

**Sim, a contribuição é real e preenche um gap genuíno.** A avaliação se baseia em cinco critérios:

| Critério | Avaliação | Justificativa |
|----------|-----------|---------------|
| **Novidade** | Alta | Nenhum paper propõe formalmente PPCs para BPT. A ponte entre as duas literaturas não foi construída. |
| **Relevância** | Alta | Endereça diretamente a crítica mais persistente ao BPT (subjetividade e falta de validação da likelihood), levantada por Zaks (2021, 2022) e reconhecida pelos próprios proponentes. |
| **Viabilidade** | Média-Alta | PPCs são conceitualmente adaptáveis: geram "dados replicados" a partir do modelo, comparam com padrões observados, e detectam discrepâncias. O desafio é operacionalizar "dados replicados" no contexto qualitativo. |
| **Conexão com debates existentes** | Alta | Dialoga com Gelman & Shalizi (2013) sobre model checking como falsificação, com o ciclo iterativo de Fairfield & Charman (2019), e com a demanda de Zaks por "guardrails". |
| **Público-alvo** | Definido | Metodólogos de CP e ciências sociais; praticantes de BPT; comunidade de avaliação de políticas. |

### 6.2 Natureza da contribuição

A contribuição é **metodológica e incremental, mas não trivial**. Não reinventa o BPT nem os PPCs, mas constrói uma ponte formal entre dois programas de pesquisa que compartilham fundamentos bayesianos. É análoga, em espírito, ao trabalho de Tran et al. (2016) que adaptou model criticism para inferência causal bayesiana quantitativa — mas aqui no domínio qualitativo.

### 6.3 O que fortalece a contribuição

1. **Responde a uma demanda explícita da literatura.** Zaks (2021: 58) escreve que BPT é "um método sem guardrails claros". PPCs seriam exatamente esse tipo de guardrail.
2. **Segue a lógica do Bayesian Workflow.** Gelman et al. (2020) argumentam que model checking é etapa *essencial* do ciclo bayesiano. Se BPT é bayesiano, deveria incorporar model checking.
3. **Complementa (não substitui) a sensitivity analysis existente.** Fairfield e Charman recomendam variar priors; a proposta foca em diagnosticar a adequação da *likelihood*, um componente diferente e igualmente crítico.
4. **Tem potencial computacional.** A proposta pode ser implementada em software (e.g., extensão do *CausalQueries* de Humphreys & Jacobs), aumentando acessibilidade.

### 6.4 Riscos e desafios

1. **Operacionalização:** O conceito de "dados replicados" no contexto qualitativo exige definição cuidadosa. Em BPT, a "replicação" não pode ser literal (gerar novos documentos ou entrevistas). Será necessário definir o que conta como a distribuição preditiva posterior de padrões evidenciais.
2. **Recepção:** Uma parte da comunidade qualitativista pode ver a proposta como formalização excessiva (cf. Hay 2016 sobre "high-tariff methodology").
3. **Escopo:** O paper precisa demonstrar utilidade com exemplos concretos, não apenas formalizar o conceito abstratamente. Uma aplicação a um caso empírico (ou reanálise de caso publicado) será essencial.

### 6.5 Posicionamento sugerido

O paper se posiciona melhor como contribuição à **Political Analysis**, **Sociological Methods & Research**, ou **Political Science Research and Methods** — journals que publicaram o debate Fairfield-Charman vs. Zaks e que são receptivos a inovação metodológica em inferência qualitativa.

---

## 7. Sugestões para pesquisa futura (derivadas dos gaps)

1. **Formalizar PPCs para BPT:** Definir a distribuição preditiva posterior em contexto qualitativo, propor test statistics/discrepancy measures adequadas, e especificar o procedimento de comparação entre padrões preditos e observados. *(Este é o paper proposto.)*

2. **Protocolo de sensitivity analysis para likelihoods em BPT:** Complementar a sensitivity analysis de priors (Fairfield & Charman 2017) com análise sistemática de sensibilidade a especificações alternativas de likelihood.

3. **Calibração empírica inter-pesquisadores:** Estudo experimental em que múltiplos pesquisadores especificam likelihood ratios para as mesmas evidências, permitindo medir variância interpessoal e identificar fontes de desacordo.

4. **Integração de PPCs com a tipologia de testes de PT:** Conectar PPCs à distinção entre hoop, smoking gun e doubly decisive tests, mostrando como diagnósticos podem refinar a classificação de testes.

5. **Software para BPT com model checking embutido:** Extensão do *CausalQueries* ou ferramenta standalone que implemente PPCs como etapa automática do workflow de BPT.

---

## 8. Referências-chave

### Bayesian Process Tracing — Fundamentos

- Barrenechea, Rodrigo, and James Mahoney. 2019. "A Set-Theoretic Approach to Bayesian Process Tracing." *Sociological Methods & Research* 48(3): 451-484.
- Befani, Barbara, and Gavin Stedman-Bryce. 2017. "Process Tracing and Bayesian Updating for Impact Evaluation." *Evaluation* 23(1): 42-60.
- Befani, Barbara. 2020. "Diagnostic Evaluation and Bayesian Updating: Practical Solutions to Common Problems." *Evaluation* 26(4): 415-438.
- Befani, Barbara, Corinna Elsenbroich, and Jen Badham. 2021. "Diagnostic Evaluation with Simulated Probabilities." *Evaluation* 27(2).
- Behrens, Lars, and Ingo Rohlfing. 2025. "The Integration of Bayesian Regression Analysis and Bayesian Process Tracing in Mixed-Methods Research." *Sociological Methods & Research*. DOI: 10.1177/00491241241295336.
- Bennett, Andrew. 2008. "Process Tracing: A Bayesian Perspective." In Janet M. Box-Steffensmeier, Henry E. Brady, and David Collier (eds.), *The Oxford Handbook of Political Methodology*. Oxford: Oxford University Press, pp. 702-721.
- Bennett, Andrew, and Jeffrey T. Checkel (eds.). 2015. *Process Tracing: From Metaphor to Analytic Tool*. Cambridge: Cambridge University Press.
- Bennett, Andrew, Tasha Fairfield, and Andrew E. Charman. 2022. "Understanding Bayesianism: Fundamentals for Process Tracers." *Political Analysis* 30(2): 298-305.
- Fairfield, Tasha, and Andrew E. Charman. 2017. "Explicit Bayesian Analysis for Process Tracing: Guidelines, Opportunities, and Caveats." *Political Analysis* 25(3): 363-380.
- Fairfield, Tasha, and Andrew E. Charman. 2019. "A Dialogue with the Data: The Bayesian Foundations of Iterative Research in Qualitative Social Science." *Perspectives on Politics* 17(1): 154-167.
- Fairfield, Tasha, and Andrew E. Charman. 2022. *Social Inquiry and Bayesian Inference: Rethinking Qualitative Research*. Cambridge: Cambridge University Press.
- Fairfield, Tasha, and Andrew E. Charman. 2025. "Bayesian Reasoning for Qualitative Replication Analysis: Examples from Climate Politics." *Political Science Research and Methods*, 1-16.
- Humphreys, Macartan, and Alan M. Jacobs. 2015. "Mixing Methods: A Bayesian Approach." *American Political Science Review* 109(4): 653-673.
- Humphreys, Macartan, and Alan M. Jacobs. 2023. *Integrated Inferences: Causal Models for Qualitative and Mixed-Method Research*. Cambridge: Cambridge University Press.

### Posterior Predictive Checks — Tradição estatística

- Box, George E.P. 1980. "Sampling and Bayes' Inference in Scientific Modelling and Robustness." *Journal of the Royal Statistical Society, Series A* 143(4): 383-430.
- Gabry, Jonah, Daniel Simpson, Aki Vehtari, Michael Betancourt, and Andrew Gelman. 2019. "Visualization in Bayesian Workflow." *Journal of the Royal Statistical Society, Series A* 182(2): 389-402.
- Gelman, Andrew, and Cosma Rohilla Shalizi. 2013. "Philosophy and the Practice of Bayesian Statistics." *British Journal of Mathematical and Statistical Psychology* 66(1): 8-38.
- Gelman, Andrew, Xiao-Li Meng, and Hal Stern. 1996. "Posterior Predictive Assessment of Model Fitness via Realized Discrepancies." *Statistica Sinica* 6(4): 733-807.
- Gelman, Andrew, Aki Vehtari, Daniel Simpson, et al. 2020. "Bayesian Workflow." arXiv preprint, arXiv:2011.01808.
- Gelman, Andrew, John B. Carlin, Hal S. Stern, David B. Dunson, Aki Vehtari, and Donald B. Rubin. 2013. *Bayesian Data Analysis*, 3rd ed. Chapman & Hall/CRC.
- Guttman, Irwin. 1967. "The Use of the Concept of a Future Observation in Goodness-of-Fit Problems." *Journal of the Royal Statistical Society, Series B* 29: 83-100.
- Meng, Xiao-Li. 1994. "Posterior Predictive p-Values." *The Annals of Statistics* 22(3): 1142-1160.
- Rubin, Donald B. 1984. "Bayesianly Justifiable and Relevant Frequency Calculations for the Applied Statistician." *The Annals of Statistics* 12(4): 1151-1172.
- Tran, Dustin, Francisco J.R. Ruiz, Susan Athey, and David M. Blei. 2016. "Model Criticism for Bayesian Causal Inference." arXiv preprint, arXiv:1610.09037.

### Críticas e debates

- Hay, Colin. 2016. "Process Tracing: A Laudable Aim or a High-Tariff Methodology?" *New Political Economy* 21(5): 500-504.
- Zaks, Sherry. 2021. "Updating Bayesian(s): A Critical Evaluation of Bayesian Process Tracing." *Political Analysis* 29(1): 58-74.
- Zaks, Sherry. 2022. "Return to the Scene of the Crime: Revisiting Process Tracing, Bayesianism, and Murder." *Political Analysis* 30(2): 306-310.

### Process tracing — Fundamentos gerais

- Beach, Derek, and Rasmus Brun Pedersen. 2019. *Process-Tracing Methods: Foundations and Guidelines*, 2nd ed. Ann Arbor: University of Michigan Press.
- Collier, David. 2011. "Understanding Process Tracing." *PS: Political Science and Politics* 44(4): 823-830.
- Van Evera, Stephen. 1997. *Guide to Methods for Students of Political Science*. Ithaca: Cornell University Press.
- Waldner, David. 2015. "Process Tracing and Qualitative Causal Inference." *Security Studies* 24(2).

### Métodos bayesianos em ciências sociais

- Jackman, Simon. 2009. *Bayesian Analysis for the Social Sciences*. Wiley.
- Vehtari, Aki, Andrew Gelman, and Jonah Gabry. 2017. "Practical Bayesian Model Evaluation Using Leave-One-Out Cross-Validation and WAIC." *Statistics and Computing* 27: 1413-1432.

---

## 9. Veredicto final sobre a contribuição

**A contribuição é real, genuína e preenche um gap claramente identificável na literatura.**

Não se trata de uma contribuição revolucionária, mas de uma ponte metodológica que (a) é logicamente necessária (se BPT é bayesiano, deveria ter model checking), (b) responde a críticas explícitas e reiteradas (Zaks 2021, 2022), (c) tem precedente direto na estatística aplicada a inferência causal (Tran et al. 2016), e (d) complementa — em vez de substituir — as ferramentas existentes (sensitivity analysis de priors, *CausalQueries*, contribuição tracing).

O principal desafio será operacionalizar o conceito de "dados replicados" no domínio qualitativo de forma convincente e demonstrar utilidade prática com uma aplicação empírica concreta.
