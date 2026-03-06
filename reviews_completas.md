# Reviews Completas — PPP-BPT Paper Draft v1

Data: 2026-03-05

---

# PARTE 1: Edmans Review (Contribution, Execution, Exposition)

---

## Carta Editorial — Framework Edmans

### Decisão: Reject-and-Resubmit

### Scores consolidados

| Dimensão     | Score | Rating      |
|-------------|-------|-------------|
| Contribution | 6/10  | Adequate    |
| Execution    | 6/10  | Adequate    |
| Exposition   | 6.5/10| Adequate    |
| **Global**   | **6/10** | **Adequate but not compelling** |

### Síntese editorial

O manuscrito identifica uma lacuna genuína e logicamente necessária na literatura de BPT — a ausência de ferramentas formais de diagnóstico análogas aos PPCs quantitativos — e propõe uma solução sensata com uma formalização limpa. Contudo, as três dimensões convergem num diagnóstico comum: a distância entre a ambição conceitual e a força da demonstração é grande demais para um top journal na forma atual.

Na Contribution, o gap é real mas a formalização é relativamente direta (soma discreta substituindo integral), e a aplicação empírica não demonstra que o PPC muda conclusões substantivas — o caso confirma o modelo original com refinamentos incrementais. Na Execution, o problema central é a circularidade não resolvida: os likelihoods do PPC são atribuídos pelo mesmo tipo de julgamento subjetivo que gerou os likelihoods originais, e não há testes de robustez nem dados primários independentes. Na Exposition, repetição extensiva (fórmula 3x, core insight 4x, comparação com sensitivity analysis 3x), ausência de resultados concretos/memoráveis no abstract, e marcadores de incompletude (TODOs, VERIFYs, referências fantasma) sinalizam um manuscrito prematuro.

### Hierarquia Edmans aplicada

A hierarquia Contribution > Execution > Exposition é parcialmente aplicável aqui. A contribuição não é o bottleneck fatal — o gap é real e a proposta é sensata. O bottleneck está na Execution: sem resolver a circularidade, sem dados primários, sem stress test, e sem critérios formais para discrepâncias, o paper não demonstra que a ferramenta funciona. A Exposition, embora com problemas reais (repetição, hedging excessivo), é corrigível numa rodada de edição disciplinada.

A boa notícia: o bottleneck é de Execution, não de Contribution. Isso significa que revisão substantiva pode resolver o problema.

### Prioridades para revisão

1. Resolver a circularidade com protocolo concreto.
2. Obter pelo menos uma fonte primária independente (Historia de la Ley N. 20.028 da BCN).
3. Incluir um stress test / exercício de calibração.
4. Eliminar repetições e comprimir 15-20%.
5. Reescrever abstract com resultado diagnóstico concreto e memorável.

---

## Parecer de Contribution (Framework Edmans)

### Score: 6/10

### Resumo da contribuição alegada

O manuscrito propõe "posterior predictive checks" (PPCs) qualitativos para Bayesian Process Tracing (BPT), argumentando que a literatura de BPT importou o maquinário bayesiano de atualização (priors, likelihoods, posteriors) mas não o maquinário de diagnóstico (model checking). A contribuição consiste em: (a) formalizar a distribuição posterior preditiva qualitativa como análogo discreto da fórmula PPC padrão, (b) operacionalizá-la como workflow de seis passos, e (c) demonstrá-la empiricamente reanalisando o caso canônico de Fairfield e Charman (2017) sobre a reforma tributária chilena de 2005.

### Avaliação por dimensão

#### Novidade [Adequada / tendendo a Fraca]

O gap identificado é real: nenhum trabalho anterior propõe formalmente PPCs para BPT. A Tabela 1 do manuscrito mapeia convincentemente as contribuições adjacentes e o que falta em cada uma. O paper merece crédito por nomear e formalizar uma lacuna genuína.

No entanto, a novidade é mais limitada do que o manuscrito sugere, por três razões:

1. **A formalização é relativamente direta.** A "qualitative posterior predictive distribution" é simplesmente a substituição da integral por uma soma sobre hipóteses discretas — uma operação que qualquer leitor com treinamento bayesiano derivaria em poucos minutos. O manuscrito reconhece que "good qualitative researchers already perform [this] implicitly" (Seção 3.1). Quando a principal contribuição formal é uma fórmula que o autor admite ser o que pesquisadores competentes já fazem informalmente, o Bayesian update do leitor é modesto.

2. **O workflow de seis passos é essencialmente uma codificação de boas práticas.** Os passos — obter posterior, identificar evidência potencial, derivar predições, avaliar coerência, diagnosticar, iterar — são razoáveis mas não surpreendentes. Não há inovação conceitual profunda em nenhum passo individual; a contribuição está na sistematização. Sistematização tem valor, mas é uma contribuição incremental.

3. **A conexão lógica entre PPCs quantitativos e BPT é, como o próprio manuscrito admite, "logically necessary."** Se a conexão é logicamente necessária, a sua articulação é mais um trabalho de preenchimento de lacuna do que uma descoberta.

#### Importância [Adequada]

A importância potencial é real. BPT é uma metodologia em crescimento na ciência política, e a ausência de diagnósticos formais é uma vulnerabilidade amplamente reconhecida — Zaks (2021) articula isso claramente. Um survey paper sobre BPT certamente mencionaria PPCs qualitativos se o framework fosse aceito pela comunidade.

Porém, a importância prática depende de uma questão que o manuscrito não resolve: **o PPC qualitativo realmente muda decisões analíticas?** Na aplicação empírica (Seção 4), o resultado é que "the posterior predictive check does not reveal a stark discrepancy that would call for a fundamental revision of the model." Os diagnósticos são refinamentos interessantes (o confound "low-stakes", o teste de sequência temporal, o contrafactual comparativo), mas nenhum deles altera a conclusão substantiva.

#### Adequação ao escopo [Adequada]

A bibliografia é predominantemente da área-alvo. Para journals metodológicos de CP (Political Analysis, PSRM, SMR), o escopo é adequado.

#### Generalizabilidade [Limitada]

Fragilidade significativa. O manuscrito demonstra o framework em um único caso — e um caso particularmente favorável: posterior extremo (~1.0), hipóteses bem definidas, caso canônico com vasta literatura secundária. Sem pelo menos uma segunda aplicação a um caso com características diferentes (posterior moderado, mais hipóteses, menos literatura secundária), a generalizabilidade permanece uma promessa, não uma demonstração.

#### Trade-offs [Parcial]

A análise de trade-offs é incompleta em dois pontos: (1) Custo de implementação vs. benefício diagnóstico não é discutido. (2) O risco de falsa segurança — um PPC que "passa" pode gerar falsa confiança na análise.

#### Hipóteses [Claras e direcionais]

Ponto forte. O manuscrito tem uma hipótese metodológica clara e direcional: PPCs qualitativos podem identificar features diagnósticas invisíveis na análise BPT original.

### Veredicto geral sobre contribution

O manuscrito identifica uma lacuna real e logicamente necessária, propõe uma solução sensata, e a demonstra com competência em um caso canônico. No entanto, para um top journal, a contribuição enfrenta um problema de proporcionalidade. A formalização é relativamente direta, o workflow codifica boas práticas mais do que inova, e a aplicação empírica não demonstra que o PPC muda conclusões substantivas.

### Sugestões construtivas

1. **Adicionar uma segunda aplicação com características contrastantes** — caso com posterior moderado (0.60-0.75), mais hipóteses, ou menos literatura secundária. Idealmente revelando um problema genuíno.

2. **Fortalecer a demonstração empírica com dados primários** — pelo menos a Historia de la Ley (documento público).

3. **Desenvolver critérios mais explícitos para seleção de evidência no Step 2** — incluir pelo menos um item para o qual a hipótese dominante faz uma predição mais fraca.

4. **Explicitar o custo-benefício do PPC** — quando vale a pena fazer um PPC?

5. **Considerar um exemplo "worked" onde o PPC falha e leva a revisão** — mesmo que hipotético.

6. **Reposicionar a contribuição com mais modéstia** — enfatizar auditabilidade e sistematização.

7. **Engajar mais diretamente com a literatura de design-based inference e credibility revolution em CP.**

---

## Parecer de Execution (Framework Edmans)

### Score: 6/10
### Tipo de paper: Misto (metodológico com aplicação empírica)

### Resumo da estratégia

O paper propõe "qualitative posterior predictive checks" como ferramenta diagnóstica para BPT, formalizando a distribuição preditiva posterior qualitativa como análogo discreto da fórmula padrão de PPC e operacionalizando-a em um workflow de seis passos. A demonstração empírica reanalisa o caso canônico de Fairfield e Charman (2017) sobre a reforma tributária chilena de 2005.

### Princípio "Dados vs. Evidência"

Os dados constituem evidência de que o framework *gera predições articuladas e estruturadas* — isso é demonstrado. Porém, os dados são insuficientes para demonstrar o que o paper mais precisa demonstrar: que PPCs revelam problemas *reais* de especificação que de outra forma passariam despercebidos. O caso escolhido não revela nenhuma discrepância fundamental. O paper encontra "yellow flags" e "amber flags", mas não uma falha clara.

### Avaliação por dimensão

#### T.1 Distância premissas-conclusões: ADEQUADA (7/10)

A formalização é correta e não trivial. O workflow é operacional. Porém, a afirmação de que "extreme posteriors generate the most testable predictions" é matematicamente correta mas retoricamente conveniente, pois o caso escolhido tem justamente um posterior extremo.

#### T.2 Parcimônia: BOA (7/10)

O mecanismo proposto é claro. O workflow é parcimonioso o suficiente para ser praticável.

#### T.3 Caminho causal: ADEQUADO COM RESSALVAS (6/10)

O paper demonstra parcialmente que os problemas identificados são reais, mas não demonstra convincentemente que não seriam detectados por meios existentes.

#### E.1 Mensuração: PROBLEMÁTICA (4/10)

Calcanhar de Aquiles da execução. O sistema de "green flag / yellow flag / amber flag" não é definido com critérios claros. As likelihoods atribuídas às novas evidências são especificadas pelo próprio autor, sem justificativa independente. Não há calibração, consulta a especialistas externos, ou exercício de elicitação.

#### E.2 Robustez: INSUFICIENTE (3/10)

Não há testes de robustez sobre a demonstração empírica. O que aconteceria com likelihoods alternativos? O paper recomenda que PPCs complementem a análise de sensitividade de priors, mas não faz análise de sensitividade dos *próprios* PPCs.

#### E.3 Seleção amostral: PROBLEMÁTICA (4/10)

Caso único, e o mais favorável possível: posterior extremo, caso canônico, análise original transparente. A seleção das quatro evidências potenciais é justificada substantivamente mas não é sistemática. O paper não discute evidências potenciais que foram consideradas e descartadas.

#### E.4 Explicações alternativas: PARCIALMENTE ABORDADA (5/10)

O paper é honesto sobre a principal explicação alternativa: que um pesquisador qualitativo competente chegaria às mesmas conclusões sem o aparato formal. Mas não demonstra de forma convincente que a formalização adiciona valor marginal substantivo.

### Veredicto geral sobre execution

A execução empírica não está à altura da ambição conceitual. O principal problema é que a demonstração não demonstra o que mais precisa demonstrar: que PPCs revelam problemas que de outra forma passariam despercebidos. A ausência de robustez (sem sensitividade dos novos likelihoods, sem variação de caso, sem evidências descartadas) enfraquece a força probatória.

### Sugestões construtivas

1. **Segundo caso com posterior moderado.**
2. **Sensitividade dos likelihoods do PPC.**
3. **Exercício de elicitação independente** — pedir a um especialista que atribua likelihoods independentemente.
4. **Formalizar o rubric de flags** — vincular rótulos a magnitudes na probabilidade preditiva posterior vs. avaliação de domínio.
5. **Transparência sobre evidências descartadas.**
6. **Dados primários para pelo menos um item** — Historia de la Ley N. 20.028.
7. **Confrontar diretamente o argumento de "valor marginal."**
8. **Resolver as inconsistências de terminologia** — "yellow flag" vs "amber flag".

---

## Parecer de Exposition (Framework Edmans)

### Score: 6.5/10

### Avaliação por dimensão

#### Clareza [Adequada]

**Qualidade da escrita:** Fluente e gramaticalmente correta. Porém, [TODO] aparece seis vezes e [VERIFY] duas vezes — sinais de incompletude.

**Significância substantiva:** Problema mais sério. O abstract e a introdução não contêm nenhum "número memorável" ou resultado concreto que permita ao leitor avaliar imediatamente o que o PPC revelou.

**Precisão da linguagem:** Passagens com hedge excessivo. Exemplo: "this pattern is *partly* captured...but the comparative evidence goes further: it suggests a *possible* hypothesis revision toward a composite hypothesis" — o acúmulo de hedges torna a claim quase vazia.

#### Extensão [Longo]

**Repetição interna ao longo do manuscrito:**
1. A fórmula do PPC é apresentada três vezes: Seção 2.2, Seção 3.1, e Seção 3.2. Uma vez é suficiente.
2. A frase "core insight" sobre erros de likelihood aparece em quatro lugares: abstract, introdução, abertura da Seção 3, e Seção 3.1.
3. A Seção 2.4 ("This Contribution") repete quase integralmente o parágrafo de contribuição da introdução. Deveria ser eliminada.
4. A comparação com sensitivity analysis aparece pelo menos três vezes.
5. A Seção 5.2 repete a motivação do paper sem acrescentar insights novos da aplicação empírica.

Estimativa: eliminando repetições, o manuscrito poderia ser reduzido em 15-20% sem perda de conteúdo.

#### Citações [Algumas problemáticas]

1. Fatos institucionais citados desnecessariamente (dado do SII atribuído a Fairfield).
2. Checkel (2021) com afirmação inverificável (55% de publicações com formalização bayesiana).
3. Referência a LOO-CV (Vehtari et al. 2017) mencionada de passagem e não utilizada.
4. Referências fantasma: Collier 2011, Beach and Pedersen 2019, Flores-Macias 2012, Fairfield 2010, Fairfield 2013 — na bibliografia mas não citadas no corpo.
5. Citações excessivas na introdução (6 trabalhos em uma frase para documentar extensões do BPT).

### Veredicto geral sobre exposition

A repetição extensiva sugere que o texto foi montado por seções sem uma passagem final de edição unificada. A ausência de resultados concretos e memoráveis no abstract enfraquece o pitch. Os marcadores de incompletude (TODOs, VERIFYs, referências fantasma) sinalizariam a um editor que o manuscrito foi submetido prematuramente. Nenhum desses problemas é fatal, e todos são corrigíveis com uma rodada disciplinada de revisão.

### Top 5 sugestões de melhoria

1. **Eliminar repetições sistemáticas** — fórmula uma vez (3.1), core insight uma vez (intro), comparação com sensitivity analysis uma vez (3.4). Eliminar Seção 2.4. Redução estimada: 15-20%.
2. **Reescrever abstract e primeiro parágrafo da intro com resultados concretos.**
3. **Remover todos os TODOs e VERIFYs do corpo do texto.**
4. **Limpar a bibliografia** — remover referências fantasma.
5. **Ser mais assertivo nos resultados diagnósticos da Seção 4** — menos hedging.

---

---

# PARTE 2: Review-Paper (Dois Pareceristas)

---

## Carta Editorial

### Decisão: Revise & Resubmit (major)

### Síntese

Ambos os pareceristas reconhecem que o paper identifica uma lacuna genuína e importante na literatura de BPT e que a formalização é elegante. Convergem em três críticas centrais: (1) a circularidade do procedimento não está adequadamente resolvida; (2) a demonstração empírica depende excessivamente de fontes secundárias da própria Fairfield; e (3) faltam critérios formais para distinguir quando um PPC "passa" versus "falha".

### Pontos de consenso entre pareceristas

- Gap real, formalização correta.
- Circularidade é o problema central.
- Demonstração empírica insuficiente (fontes da própria Fairfield).
- Critérios de flags indefinidos.
- Conexão com tipologia de testes subdesenvolvida.
- Segundo caso ou stress test necessário.

### Pontos divergentes

- P1 mais cético sobre valor marginal da formalização; P2 aceita mais facilmente mas exige desenvolvimento formal mais rigoroso.
- P2 pede desenvolvimento técnico (independência condicional, espaço de hipóteses incompleto, calibração via simulação); P1 pede extração de lições teóricas substantivas.

### Prioridades para revisão

1. Confrontar a circularidade com protocolo concreto. [P1 #3 + P2 #1]
2. Obter pelo menos uma fonte primária independente — Historia de la Ley. [P1 #2 + P2 #3]
3. Incluir stress test / exercício de calibração. [P2 #6]
4. Formalizar critérios de discrepância. [P2 #2]
5. Mapear PPCs na tipologia de testes. [P1 #4 + P2 #5]

---

## Parecer — Parecerista 1 (Teoria & Substância)

### Recomendação: R&R major

### Resumo do paper

O manuscrito propõe "qualitative posterior predictive checks" (PPCs) como ferramenta diagnóstica para Bayesian Process Tracing (BPT). Argumenta que a comunidade de métodos qualitativos importou a maquinaria bayesiana de atualização (priors, likelihoods, posteriors) mas não a maquinaria de diagnóstico (model checking). Formaliza a distribuição preditiva posterior qualitativa, operacionaliza-a em um workflow de seis etapas, e demonstra o procedimento reanalisando a aplicação canônica de Fairfield e Charman (2017) sobre a reforma tributária chilena de 2005.

### Avaliação geral

O paper identifica um gap genuíno e importante na literatura de BPT: a ausência de ferramentas formais de diagnóstico análogo aos PPCs da estatística bayesiana quantitativa. A intuição central — de que um modelo que aprendeu dos dados deveria ser capaz de gerar previsões sobre dados não observados, e que falhas nessas previsões são diagnósticas — é poderosa e correta. A formalização é elegante na sua simplicidade. E o paper é bem escrito.

No entanto, o paper tem fragilidades significativas em três dimensões: (1) a contribuição marginal sobre o que bons pesquisadores qualitativos já fazem informalmente não está suficientemente articulada; (2) a demonstração empírica depende quase inteiramente de fontes secundárias da própria autora do estudo original; e (3) o paper não confronta com rigor suficiente a objeção de circularidade.

### Comentários maiores

**1. A contribuição marginal precisa ser defendida com mais força contra o "so what?"**

O paper reconhece que "good qualitative researchers already perform implicitly" a operação que os PPCs formalizam. Essa concessão é honesta, mas o paper não articula com precisão suficiente por que a formalização importa. O argumento atual é basicamente "transparência e auditabilidade." O paper precisa demonstrar que a formalização *produz insights que o pesquisador não teria obtido sem ela*. Os três diagnósticos identificados (low-stakes confound, temporal sequence test, comparative counterfactual) são do tipo que um comparativista experiente poderia articular sem qualquer formalismo. Sugestão: mostrar que o framework *obriga* o pesquisador a considerar predictions que ele não teria considerado espontaneamente, ou que a estrutura revela inconsistências internas nas likelihoods.

**2. A demonstração empírica é substancialmente insuficiente para as ambições do paper.**

O paper propõe um framework de diagnóstico cujo valor reside em confrontar previsões do modelo com evidência externa. Mas a "evidência externa" vem, em grande medida, dos próprios trabalhos de Fairfield (2015a, 2015b) e Fairfield e Charman (2022). Para e\*_1 (committee records), o paper admite que "complete committee transcripts were not directly accessed." Para e\*_3 (internal deliberations), reconhece que "direct access to internal party records was not obtained." Sugestão: (a) obter pelo menos uma fonte primária genuinamente independente (Historia de la Ley da BCN); (b) considerar um segundo caso; ou (c) ajustar as claims para "demonstração ilustrativa" em vez de teste.

**3. O problema da circularidade não é adequadamente resolvido.**

A Seção 3.5 trata da objeção com Gelman e Shalizi (2013): "the check is not circular because the predictions are derived from the model." No contexto qualitativo, o argumento é muito mais frágil. As likelihoods para a evidência nova são atribuídas pelo mesmo tipo de julgamento subjetivo. A "disciplina temporal" é um atenuante importante, mas o paper não demonstra que foi seguida no caso demonstrativo. Sugestão: (a) articular condições sob as quais a disciplina temporal é factível; (b) discutir protocolos concretos (pre-registro, domain experts externos, adversarial collaboration); (c) ser mais honesto sobre os limites do exercício demonstrativo.

**4. A relação com a tipologia de testes (hoop, smoking gun, doubly decisive) precisa de elaboração.**

A Seção 3.4 menciona brevemente a relação mas não a desenvolve. Os quatro itens de evidência na Seção 4 poderiam ser classificados usando a tipologia. Sugestão: tabela classificando cada e\*_k pela tipologia e mostrando o que o PPC adiciona.

**5. O tratamento das hipóteses compostas é teoricamente subdesenvolvido.**

O diagnóstico mais interessante (low-stakes confound) aponta para uma hipótese composta (H_EA + low business stakes) não presente no hypothesis set original. Se a forma correta é "equity appeal conditional on low business stakes," isso tem implicações para generalização: equity appeals deveriam falhar quando os stakes para elites organizadas são altos. Sugestão: articular explicitamente a proposição teórica que emerge do PPC e discutir implicações para outros casos.

**6. Falta discussão sobre o "garden of forking paths" qualitativo.**

O workflow é apresentado como processo sequencial, mas a iteração entre passos cria graus de liberdade não discutidos. Quantos itens o pesquisador deve considerar antes de parar? Se os três primeiros dão "green flag," ele para? Sugestão: guidance sobre pre-especificação dos itens de evidência, número mínimo de checks, e como lidar com resultados mistos.

### Comentários menores

1. Terminologia inconsistente para os flags (green/yellow/amber sem definição formal da diferença).
2. Estatística de Checkel (2021) sobre 55% das publicações precisa de verificação — parece implausível.
3. Seção 2.1 tem problema de periodização (Bennett 2008 na "primeira fase" vs Van Evera 1997).
4. Falta discussão sobre o papel da equipe de pesquisa na mitigação de viés.
5. "Approximately 1.0" para a posterior é impreciso — reportar o valor numérico exato.
6. Abstract muito longo (~220 palavras; target journals pedem 150-200).
7. Falta nota sobre scope em relação ao BIQQ framework (Humphreys e Jacobs 2015, 2023).
8. Tabela 1 poderia incluir Beach e Pedersen (2019).

### Referências sugeridas

- Hacker & Pierson (2010) — Winner-Take-All Politics — para business power como moderador
- Fairfield & Charman (2019) — Dialogue with the Data
- Dunning (2012) — Natural Experiments in the Social Sciences
- Rohlfing (2012) — Case Studies and Causal Inference
- Mahoney (2012) — The Logic of Process Tracing Tests in the Social Sciences (SMR 41(4))
- Crasnow (2012) — The Role of Case Study Research (Philosophy of Science 79(5))
- Ricks & Liu (2018) — Process-Tracing Research Designs (PS)
- Levy (2008) — Case Studies: Types, Designs, and Logics of Inference

---

## Parecer — Parecerista 2 (Método & Inferência)

### Recomendação: R&R major

### Resumo do paper

O manuscrito propõe "posterior predictive checks" (PPCs) qualitativos para BPT, formalizando uma distribuição preditiva posterior qualitativa como análogo discreto da fórmula PPC padrão, operacionalizando-a como workflow de seis etapas e demonstrando o procedimento reanalisando o caso canônico de Fairfield e Charman (2017).

### Avaliação geral

O paper aborda uma lacuna genuína e importante. A formalização é clara e corretamente derivada. O workflow é prático. Entretanto, há problemas substanciais: a tensão entre o que o paper promete — um diagnóstico formal — e o que entrega — um procedimento dependente dos mesmos julgamentos subjetivos que pretende disciplinar. A aplicação empírica sofre de circularidade parcial e falta de evidência primária independente. Faltam critérios claros para distinguir quando um PPC "passou" versus "falhou."

### Comentários maiores

**1. A circularidade no coração do procedimento não está adequadamente resolvida.**

O problema é mais profundo do que o texto admite. Na fórmula PPC qualitativa, o pesquisador especifica likelihoods para a nova evidência P(e\* | H_i) usando o mesmo tipo de julgamento subjetivo que gerou os likelihoods originais. A defesa de que "as predições são derivadas do modelo" é valida formalmente mas fraca na prática: se o pesquisador atribui likelihoods enviesados tanto para a evidência original quanto para a nova evidência, o PPC não detectará o problema. Isso é fundamentalmente diferente do PPC quantitativo, onde os dados replicados são gerados pelo modelo sem julgamento adicional.

Sugestão: Formalizar as condições sob as quais o PPC consegue detectar erros (vieses não correlacionados entre likelihoods originais e preditivos). Explorar protocolos: especificação adversarial, pre-registro dos likelihoods preditivos, avaliadores externos.

**2. Ausência de critérios formais para o que constitui uma "discrepância."**

O paper usa "green flag", "yellow flag", "amber flag" sem definir critérios claros. Nas PPCs quantitativas, o posterior predictive p-value fornece uma métrica. O paper qualitativo não oferece nenhum equivalente.

Sugestão: Framework semi-formal expressando discrepâncias em decibéis (linguagem já usada em BPT), ou protocolo baseado em pre-registro e avaliação cega.

**3. A aplicação empírica depende excessivamente de fontes secundárias.**

Três das quatro evidências PPC são avaliadas usando informações reportadas nos próprios trabalhos de Fairfield. Não é um PPC genuinamente "out-of-sample." O paper admite mas não dá o peso que merecem a estas limitações.

Sugestão: Obter a Historia de la Ley N. 20.028 da BCN (publicamente acessível). Tabela explicitando, para cada e\*_k, qual a fonte e se a informação já constava do corpus de Fairfield e Charman.

**4. O status formal da fórmula PPC qualitativa merece mais desenvolvimento.**

(a) A fórmula assume independência condicional entre as evidências dado H_i — suposição forte e possivelmente violada em contextos qualitativos.
(b) A fórmula assume que as hipóteses são mutuamente exclusivas e exaustivas. O próprio paper sugere que uma hipótese composta seria mais adequada, mas não discute formalmente o que acontece quando o espaço de hipóteses é incompleto.

Sugestão: Formalizar explicitamente a suposição de independência condicional. Adicionar subsecção sobre espaço de hipóteses incompleto.

**5. A relação entre PPC qualitativo e testes de process tracing (hoop, smoking gun) precisa de mais elaboração.**

O PPC qualitativo essencialmente propõe um novo teste de process tracing usando evidência não-observada. Qual é a relação formal entre o diagnóstico PPC e a classificação como "hoop", "smoking gun" ou "doubly decisive"?

Sugestão: Secção mapeando formalmente os resultados de PPCs na tipologia de testes, com classificação dos e\*_k da aplicação chilena.

**6. A demonstração não explora adequadamente cenários onde o PPC deveria falhar.**

Um teste convincente requer mostrar não apenas que funciona quando o modelo está correto, mas que detecta problemas quando o modelo está errado. O paper não inclui nenhum exercício contrafactual ou de simulação.

Sugestão: Stress test — partir de likelihoods deliberadamente enviesados, derivar predições PPC, mostrar que o PPC detecta as discrepâncias.

**7. A contribuição em relação a CausalQueries (Humphreys e Jacobs 2023) e Behrens e Rohlfing (2025) precisa de mais clareza.**

CausalQueries permite especificar um modelo causal e derivar predições sobre observáveis — sobreposição significativa com o PPC qualitativo. O paper deveria ser mais preciso sobre o que oferece que CausalQueries não oferece.

### Comentários menores

1. Inconsistência na terminologia de flags (yellow vs amber sem distinção formal).
2. Claim de Checkel (2021) sobre 55% parece implausível.
3. Recomendação de "3 a 5 itens" é útil mas arbitrária — qual o fundamento?
4. A evidência E_0 operando contra H_EA merece mais desenvolvimento explicativo.
5. Falta discussão sobre poder estatístico no equivalente qualitativo.
6. 98 dB como nível de certeza extraordinariamente alto — discutir se é realista em contexto qualitativo.
7. Falta tabela sistematizando itens de evidência originais (E_0-E_5) junto com novos (e\*_1-e\*_4), fontes, tipos e status.
8. TODOs no final do manuscrito são pré-requisitos, não itens opcionais.
9. Figura ausente — diagrama do workflow ou da relação posterior/predições/resultados seria recomendável.
10. Seção 5.4 propõe tipologia de testes PPC como agenda futura — parte deveria ser desenvolvida neste paper.

### Referências sugeridas

- Talts et al. (2018) — Validating Bayesian Inference Algorithms with Simulation-Based Calibration (arXiv:1804.06788)
- Schad, Betancourt & Vasishth (2021) — Toward a Principled Bayesian Workflow in Cognitive Science (Psychological Methods 26(1))
- Kruschke (2015) — Doing Bayesian Data Analysis, 2nd ed. — caps 12-13 sobre PPC
- Rohlfing (2012) — Case Studies and Causal Inference
- Bayarri & Berger (2000) — P Values for Composite Null Models
- Bennett & Checkel (eds.) (2015) — Process Tracing: From Metaphor to Analytic Tool

---

---

# PARTE 3: Proofread

### Score: 78/100 (REPROVADO — threshold 90)

### Erros identificados (7):

1. Seção 5.1 linha 482: referencia "the H_EA/H_MV discrimination problem" mas Step 5 Observation 2 foi reescrito como "temporal sequence test"
2. Linha 83: "across all prior scenarios" é linguagem da versão SSRN com 3 cenários de priors; versão do livro usa priors iguais
3. Linha 435: [TODO] no corpo do texto ("Full access to internal party archives...")
4. 7 referências fantasma na bibliografia (não citadas no corpo)
5. Checkel (2021) — referência não verificada
6. Formato de citações inconsistente em alguns pontos
7. Menção a "amber flag" sem distinção formal de "yellow flag"

---

# Síntese Final — Convergência entre todas as reviews

As 5 reviews (3 Edmans + 2 pareceristas) convergem nas seguintes prioridades:

| # | Prioridade | Mencionada por |
|---|-----------|---------------|
| 1 | Circularidade — protocolo concreto | Todos os 5 |
| 2 | Dados primários independentes (BCN) | 4 de 5 |
| 3 | Stress test / calibração | 3 de 5 |
| 4 | Critérios formais para flags/discrepâncias | 4 de 5 |
| 5 | Reduzir repetição / comprimir 15-20% | Exposition + Proofread |
| 6 | Mapear PPCs na tipologia de testes | P1 + P2 |
| 7 | Segundo caso ou worked example onde PPC falha | 3 de 5 |
