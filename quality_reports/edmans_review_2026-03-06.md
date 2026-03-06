# Carta Editorial — Framework Edmans (Contribution, Execution, Exposition)

## Decisao: Revise & Resubmit (major)

## Scores consolidados
| Dimensao     | Score | Rating   |
|-------------|-------|----------|
| Contribution | 6/10  | Adequada mas nao forte |
| Execution    | 6.5/10  | Promissora com gaps empiricos |
| Exposition   | 6.5/10  | Competente mas inflada |
| **Global**   | **6.5/10**  | **R&R major** |

## Sintese editorial

O manuscrito identifica uma lacuna genuina e logicamente necessaria no toolkit de BPT — a ausencia de model checking — e propoe uma solucao formalmente coerente e intelectualmente honesta. A formalizacao da distribuicao preditiva posterior discreta, o workflow de seis passos, e o tratamento sofisticado da circularidade como problema de erros correlacionados sao contribuicoes solidas. A adicao de um segundo caso (oil majors) com posterior nao-extremo e uma melhoria substancial sobre uma versao single-case, pois demonstra que o framework gera insights qualitativamente diferentes conforme a extremidade do posterior.

No entanto, os tres pareceristas convergem em um problema central: **a demonstracao empirica nao fecha o gap entre a promessa teorica e a validacao**. Nenhum dos dois casos produz o "true positive" — uma aplicacao onde o PPC revela misspecification nao-trivial e leva a revisao substantiva. O caso Chile confirma coerencia (util pedagogicamente, pouco diagnostico). O caso Oil Majors conflate diagnostico com updating (a evidencia nova move o posterior, mas nao fica claro que isso e diagnostico de especificacao vs. BPT standard). O stress test detecta misspecification grosseira — trivial — e o paper reconhece honestamente que misspecification moderada escapa a ferramenta.

Um segundo problema transversal e a **redundancia e extensao**. O paper repete seu insight central ("extreme posteriors generate sharp predictions") pelo menos sete vezes. Subsecoes defensivas ("what the PPC is not," "what qualitative PPCs do not do") se sobrepoe. A stress test poderia ser condensada. O resultado seria um manuscrito 20-25% mais curto e mais impactante.

## Hierarquia Edmans aplicada

A hierarquia contribution > execution > exposition favorece este paper: a contribuicao e genuina (lacuna real, solucao formal coerente), e os problemas de execution e exposition sao corrigiveis. O bottleneck **nao** e a contribuicao per se — e a demonstracao empirica. O paper esta mais proximo de um "framework paper with illustration" do que de um "framework paper with validation," e revisores de top journals exigem o segundo.

Crucialmente, a contribuicao e forte o suficiente para justificar investir em melhorar a execucao. A lacuna identificada e real, a solucao e internamente coerente, e a comunidade de BPT beneficiaria da ferramenta. O deficit e em mostrar que a ferramenta funciona de forma nao-trivial.

## Prioridades para revisao

1. **Separar diagnostico de updating no caso Oil Majors.** Os tres pareceristas flagaram este problema. A evidencia post-2020 move o posterior, mas o paper precisa articular operacionalmente como isso e diagnostico de especificacao (nao apenas BPT standard com mais evidencia). Sugestao: formular explicitamente que predicao o modelo original fazia sobre a holdout evidence, comparar com o observado, e mostrar que a discrepancia implica que likelihoods originais estavam miscalibradas — nao apenas que o posterior se move.

2. **Confrontar o "formalization premium" problem.** As observacoes diagnosticas do Chile (low-stakes confound, temporal sequence, comparative counterfactual) sao substantivamente interessantes, mas seriam identificaveis sem o aparato formal. O paper precisa de um argumento mais forte para por que calcular P(e*|e_obs) = 0.85 agrega valor sobre o raciocinio substantivo ordinario. Opcao: mostrar que sem a formalizacao, pesquisadores sistematicamente ignoram certas discrepancias (evidencia empirica sobre isso seria ideal).

3. **Discutir contaminacao de training data dos LLMs.** A convergencia entre humano e LLMs pode refletir que os LLMs foram treinados com o livro de Fairfield e Charman. A possibilidade de eco (nao independencia) precisa ser discutida e, idealmente, testada — por exemplo, usando um caso recente o suficiente para estar fora dos training data (o caso Oil Majors com evidencia post-2020 serve parcialmente para isso).

4. **Cortar 20-25% do manuscrito.** Consolidar subsecoes defensivas, mover stress test para appendix ou condensar, eliminar repeticoes do insight sobre posteriors extremos, encurtar future work para 2-3 frases. Isso melhoraria o impacto sem perder conteudo.

5. **Operacionalizar "broadly coherent."** Termo central do framework que nunca e definido. Propor criterios minimos na Secao 3.3.

## Recomendacao estrategica ao autor

O paper esta bem posicionado para **Political Analysis** ou **PSRM** — ambos publicam contribuicoes metodologicas para BPT e tem audiencia adequada. Para APSR/AJPS/JOP, a audiencia seria demasiado restrita (o universo de aplicacoes formais de BPT e ~10-15 papers).

A revisao mais impactante seria encontrar ou construir o "true positive" — um caso onde o PPC revela misspecification real. Se isso nao for viavel com as aplicacoes existentes, a alternativa e (a) fortalecer a separacao conceitual e empirica entre diagnostico e updating no caso Oil Majors, e (b) implementar o Protocol 1 (blind second analyst) em pelo menos um caso para demonstrar que a convergencia nao depende de um unico analista.

A contribuicao e real e a execucao e corrigivel. Com uma revisao focada nos cinco pontos acima, o paper tem potencial de publicacao em Political Analysis.

---

## Parecer completo — Contribution (Score: 6/10)

**Novidade: Adequada.** A lacuna e real e a formalizacao e nova, mas o insight subjacente ("cheque predicoes out-of-sample") e pratica implicita de bons pesquisadores. A multi-channel elicitation com LLMs e o aspecto mais genuinamente novo.

**Importancia: Adequada.** Preenche lacuna logica no BPT, mas audiencia potencial e restrita (~10-15 aplicacoes formais). Nenhum dos dois casos produz revisao substantiva de modelo.

**Generalizabilidade: Limitada.** Ambos os casos vem de Fairfield e Charman. Holdout evidence do Chile depende parcialmente das mesmas fontes. Ausencia de caso negativo (true positive).

**Trade-offs: Parcial.** Custo de implementacao vs. beneficio marginal nao discutido. Convergencia LLM pode refletir eco, nao independencia. Risco de falsa seguranca com PPC "passed" insuficientemente discutido.

**Hipoteses: Claras e direcionais.** As proposicoes metodologicas seguem da logica bayesiana interna.

**Sugestoes-chave:** (1) True positive case. (2) Quantificar custo-beneficio. (3) Problematizar convergencia multi-canal. (4) Aplicacao fora do universo Fairfield-Charman.

---

## Parecer completo — Execution (Score: 6.5/10)

**Tipo: Misto (metodologico + empirico).**

**Dados vs. Evidencia:** Os dados sao sugestivos mas nao claramente evidencia diagnostica. O caso Chile mostra coerencia (pouco diagnostico). O caso Oil Majors conflate diagnostico com updating. O stress test detecta misspecification grosseira (trivial).

**Mensuracao (5/10):** Predictive likelihoods sao precisos (0.85, 0.90) mas a precisao e espuria. Incerteza nao propagada. WoE no Oil Majors (8-10 dB) sem protocolo sistematico.

**Robustez (7/10):** Multi-channel elicitation funciona razoavelmente. Concordancia ordinal e resultado positivo. Mas ausencia de blind second analyst (Protocol 1 proposto mas nao implementado).

**Selecao amostral (5/10):** Dois casos da mesma fonte. Holdout evidence parcialmente derivada das mesmas fontes (Chile). Oil Majors melhor (genuinamente post-2020).

**Explicacoes alternativas (6/10):** "Formalization premium" — o PPC e formalizacao do que bons pesquisadores ja fazem? Nao adequadamente confrontado.

**Sugestoes-chave:** (1) Caso com misspecification nao-planejada. (2) Confrontar formalization premium. (3) Discutir contaminacao training data. (4) Implementar Protocol 1. (5) Separar diagnostico vs. updating no Oil Majors.

---

## Parecer completo — Exposition (Score: 6.5/10)

**Clareza: Boa.** Escrita profissional, sem typos. Redundancia excessiva (insight sobre posteriors extremos repetido 7x). Frases-formula desnecessarias. "Broadly coherent" nunca operacionalizado.

**Extensao: Longo.** Intro mistura contribuicao com literatura. Subsecoes defensivas se sobrepoe ("what is not" aparece 2x). Stress test e future work poderiam ser condensados/movidos. Estimativa de corte viavel: 20-25%.

**Citacoes: Algumas problematicas.** Densidade excessiva nos paragrafos de review (11 citacoes em um paragrafo). Citacoes de fato institucional na intro. Barrenechea e Mahoney (2019) possivelmente sobrevalorado.

**Sugestoes-chave:** (1) Cortar redundancia sobre posteriors extremos. (2) Reestruturar intro: contexto → contribuicao → literatura. (3) Consolidar subsecoes defensivas. (4) Mover stress test para appendix. (5) Operacionalizar "broadly coherent."
