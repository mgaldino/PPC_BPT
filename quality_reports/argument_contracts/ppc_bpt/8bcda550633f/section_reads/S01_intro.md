# S01 — Leitura fiel do resumo e da introdução

- **reader_id:** `/root/read_intro`
- **Data:** 2026-10-10
- **Artefato:** `paper_draft_v1.Rmd`
- **SHA-256 conferido:** `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`
- **Responsabilidade exclusiva:** resumo, linha 25; seção Introduction, linhas 34–49.
- **Contexto lido:** manuscrito completo, linhas 1–541; `CLAUDE.md`; skill `argument-fidelity-gate`.
- **Natureza do registro:** extração interpretativa, sem crítica, proposta de revisão ou verificação externa das referências e evidências citadas. Não foram executados scripts analíticos nem modificado o manuscrito.

## Tese da seção

A prática de avaliar a verossimilhança por um cenário dominante deixa caminhos causais alternativos e contingências internos às hipóteses implícitos. O artigo propõe operacionalizar a estrutura matemática já disponível em Fairfield e Charman por meio de elos binários de mecanismo e suas configurações. Essa decomposição pretende permitir previsões posteriores em dois níveis e diagnósticos de adequação que localizam quais elos sustentam ou prejudicam uma explicação, inclusive identificando configurações compostas. As duas aplicações anunciam a utilidade dessa granularidade tanto com posterior quase certo quanto com posterior não extremo. A tese metodológica é apresentada como uma extensão operacional de uma base bayesiana existente, explicitamente reconhecida nas linhas 38 e 42.

## Claims, localizadores, evidência e alcance

Nesta tabela, “evidência” identifica o apoio que o próprio manuscrito oferece. As remissões ao restante do manuscrito servem para interpretar a promessa introdutória; não constituem auditoria independente desse apoio.

| Claim explícito | Localizador principal | Evidência ou apoio oferecido no manuscrito | Scope/hedge |
|---|---|---|---|
| BPT tornou a avaliação de explicações causais explícita e auditável por verossimilhanças numéricas e atualização bayesiana. | L36 | Referências a Fairfield–Charman 2017/2022 e Humphreys–Jacobs 2015/2023. | Caracterização do método, não demonstração empírica nesta seção. |
| Na prática, a avaliação de verossimilhanças se concentra em um cenário dominante dentro de cada hipótese. | L25, L36, L38 | L38 atribui aos próprios Fairfield e Charman o reconhecimento da prática; L64–68 distinguem Eq. 3.11 da aproximação Eq. 3.12. | L36 contém expressamente “in practice”; L38 distingue infraestrutura disponível e prática. O primeiro período do resumo não contém esse qualificador. |
| Fairfield e Charman já oferecem a infraestrutura matemática para múltiplos caminhos causais internos à hipótese. | L38, L42 | No contexto, L64 explicita a soma sobre cenários, a atomização e o reconhecimento de fatores compartilhados; L66–68 nomeiam a contribuição como operacionalização. | Não é um claim de que o artigo cria pela primeira vez a possibilidade matemática de estrutura interna. |
| A prática do cenário dominante permite comparar hipóteses, mas deixa indeterminado quais partes fazem o trabalho explicativo. | L38 | L83 contrasta média sobre hipóteses e integração sobre cenários internos; exemplos localizados nas L165–175 e L427–437. | “Each hypothesis thus functions” remete à prática descrita no período anterior, não a uma impossibilidade do formalismo completo de Fairfield e Charman. |
| Os problemas de mecanismos compartilhados, contingências não modeladas e hipóteses compostas têm uma dimensão comum de estrutura interna. | L40 | Síntese das posições atribuídas a Zaks 2021/2022, Bennett 2023, Jacobs 2023 e Soifer 2023; desenvolvida nas L52–68. | A introdução associa os problemas à prática dominante. A expressão “the framework provides no structural basis” na mesma linha tem referente menos explícito; ver ambiguidades. |
| A proposta decompõe hipóteses em configurações de elos de mecanismo: variáveis binárias que indicam a presença ou ausência de etapas causais. | L25, L42 | Definições nas L105–107, Tabela 3 nas L142–157 e Tabela 8 nas L403–415. | Proposta de representação metodológica. A introdução não fornece critérios empíricos gerais de escolha ou delimitação de elos. |
| Hipóteses podem compartilhar elos e continuar mutuamente exclusivas como configurações. | L42 | Analogia com modelos de regressão na própria linha; desenvolvimento nas L109–121. | A exclusividade é atribuída às configurações completas, não aos seus componentes. |
| A decomposição cria um espaço interno de parâmetros e permite PPCs, com integração sobre incerteza nos passos causais ativos e uma distribuição preditiva em dois níveis. | L25, L42, L44 | Fórmulas nas L182 e L186; L188 chama o primeiro nível de PPC e o segundo de BMA. | L44 refere-se a parâmetros internos ao modelo. O contexto L83 reconhece que a média preditiva entre hipóteses já é possível. |
| PPCs diagnosticam adequação e permitem interrogar a razoabilidade das verossimilhanças com maior granularidade que o teste no nível da hipótese. | L25, L42, L44 | Discussão geral de PPCs citada em L44; distinção entre diagnóstico, verdade e atualização nas L194–196. | O contexto L196 limita a checagem à coerência interna e afirma que um modelo pode passar o PPC e ainda estar errado; L209 não estabelece p-valor nem limiar formal de rejeição. |
| O artigo formaliza um workflow e aborda a circularidade com elicitação por canais humanos e LLMs. | L25 | Seis etapas nas L199–213; protocolos e credibilidade graduada nas L216–240; aplicações nas L349–391 e L485–504. | O verbo do resumo é “address”, não “eliminate”. L240 nega a eliminação da circularidade; L533 informa que não houve segundo analista humano cego e que os protocolos foram apenas parcialmente implementados. |
| As aplicações contrastam Chile, com posterior aproximadamente 1,0, e oil majors, com posterior aproximadamente 0,71. | L25, L46 | Chile: L268–281 e Tabela 6; petróleo: L398 e Tabela 9. | São probabilidades provenientes das análises BPT originais, utilizadas como ponto de partida das demonstrações. L46 atribui ambas a Fairfield–Charman 2022; L398 identifica a análise do petróleo como Fairfield–Charman 2025. |
| No Chile, o PPC identifica uma configuração composta de apelo à equidade e baixo interesse material empresarial que explica melhor o padrão de evidência que uma hipótese isolada. | L25, L46 | Configuração nas L159–163; evidência comparativa e silêncio do lobby nas L321 e L325; diagnóstico nas L331–346. | No corpo, L325 reconhece ambiguidade do silêncio do lobby e L345 chama o baixo interesse material de “likely co-determinant”; L346 dispensa revisão fundamental e recomenda considerar a composição. Não encontrei no resumo ou na introdução uma métrica quantitativa para “better accounts”. |
| No petróleo, a decomposição revela verossimilhanças originais mal calibradas e heterogeneidade empresarial que desafia uma estrutura binária de hipóteses. | L25, L46 | Exemplo L427–437; evidências L455–461; diagnósticos L465–469 e Tabela 9. | O corpo localiza a revisão de verossimilhanças em E1/E2 sob HSA e qualifica a inferência como “likely miscalibrated” em L465. L502–504 também registra divergência dos canais e inversão agregada sob a avaliação cética. |
| O framework resolve problemas de exclusividade mútua, hipóteses compostas ad hoc e ausência de checagem de modelos ao explicitar estrutura interna. | L25; formulação próxima em L40–44 | Desenvolvimento formal e argumentativo nas L115–133, aplicações e discussão L520–528. | O resumo usa “resolves”, de força mais ampla que a formulação operacional contextualizada da introdução. A leitura da ausência de estrutura requer a distinção entre prática e possibilidades formais explicitamente preservada em L38/L42. |

## Não-afirmações e fronteiras interpretativas

1. **Não se afirma na introdução que o formalismo de Fairfield e Charman careça, em princípio, de caminhos internos às hipóteses.** As L38 e L42 dizem expressamente o contrário. A fonte contextual mais específica é L64; a formulação negativa explícita é L66: o que falta não é a base matemática, mas sua operacionalização.
2. **Não se exige exclusividade dos mecanismos componentes.** L42 permite explicitamente compartilhar elos e situa a exclusividade no nível das configurações. Não atribuir ao artigo uma defesa da exclusividade de cada elo entre hipóteses.
3. **Não se afirma que não haja qualquer previsão bayesiana sem decomposição de mecanismos.** A formulação introdutória em L44 é sobre integração em parâmetros internos; L81–83 apresentam a previsão por média entre hipóteses e delimitam seu alcance diagnóstico.
4. **Não se afirma que a verificação preditiva demonstre verdade causal.** A introdução usa adequação e diagnóstico; a negação explícita aparece em L196. Não converter a promessa “succeeds or fails” do resumo em teste conclusivo de verdade.
5. **Não se afirma eliminação da circularidade.** L25 anuncia que o problema será abordado; L240 nega expressamente a eliminação e L533 reconhece implementação parcial dos protocolos. Não encontrei na introdução uma afirmação de independência comprovada dos canais.
6. **Não se anuncia rejeição integral da explicação por apelo à equidade no Chile.** L46 anuncia uma composição que mantém esse mecanismo; L331 e L346 preservam a operação do apelo e indicam ausência de revisão fundamental.
7. **Não se apresenta coleta primária independente nos dois casos.** O resumo e a introdução não reivindicam isso; L533 afirma dependência de fontes secundárias. Essa fronteira deriva do contexto, não de uma negação expressa na introdução.
8. **Não encontrei no resumo ou na introdução** uma alegação de identificação de efeito médio, uma população de inferência estatística, uma taxa de erro calibrada, um teste formal de superioridade preditiva da composição ou uma demonstração empírica universal de que todos os usuários de BPT adotem apenas um cenário. Trata-se de contribuição metodológica com duas aplicações, não de estimando empírico único.

## Ambiguidades textuais a preservar para a síntese

| Ambiguidade | Base localizada | Estado desta leitura |
|---|---|---|
| O alcance de “BPT needs within-hypothesis structure”, “the framework provides no structural basis” e “giving hypotheses the internal structure” pode variar entre falta operacional e falta teórica. | L25, L40, L42, diante do reconhecimento expresso em L38/L42 e da distinção L64–68. | A introdução e o contexto sustentam a leitura operacional. O resumo isolado e alguns segmentos de L40 não mantêm o qualificador explícito. Registrar essa diferença de alcance sem apagar nenhum dos trechos. |
| A configuração é uma combinação fixa de estados ativos/ausentes ou uma hipótese que ainda admite variação interna dos estados? | L42 define uma combinação específica; L107 formaliza um vetor binário completo; L180–188 integram sobre estados dos elos dentro de cada configuração. | A introdução não resolve a relação entre esses dois usos. A leitura da seção formal deve determinar se há distinção adicional localizada entre configuração, hipótese e parâmetros internos. |
| “Better accounts for the evidence” no Chile significa diagnóstico qualitativo de uma composição ou comparação formal já estimada entre modelos? | L25/L46; L331; Tabela 6, L345–346; avaliação qualitativa em L209. | O contexto oferece diagnóstico qualitativo e recomendação de considerar a composição. Não encontrei nas partes atribuídas a este leitor uma comparação formal quantificada entre a composição e as hipóteses originais. |
| O adjetivo “miscalibrated” no resumo e na introdução conserva a incerteza indicada no diagnóstico detalhado? | L25/L46 versus “likely miscalibrated” em L465 e divergência multicanal nas L502–504. | Claim anunciado assertivamente, diagnóstico detalhado com qualificação. A síntese deve preservar tanto o objeto localizado E1/E2 quanto a força verbal de cada passagem. |
| Qual é a fonte temporal da segunda aplicação? | L46 atribui os dois casos a Fairfield–Charman 2022; L398 atribui a reanálise do petróleo a Fairfield–Charman 2025. | Divergência de identificação bibliográfica no próprio texto; não foi verificada externamente por este leitor. |

## Terminologia a preservar

- **BPT:** Bayesian process tracing; atualização e comparação das explicações causais por verossimilhanças e probabilidades posteriores (L25/L36).
- **Dominant scenario:** cenário causal privilegiado na avaliação prática da verossimilhança; sua caracterização deve manter a distinção entre a aproximação e a soma completa de cenários (L36–38; contexto L64–68).
- **Mechanism link:** etapa causal discreta binária, ativa ou ausente (L25/L42; definição L105).
- **Mechanism configuration:** combinação específica dos elos; compartilhamento de elos não equivale a identidade de configurações (L42). A relação entre configuração e incerteza interna permanece registrada acima.
- **Within-hypothesis structure / internal parameter space:** representação interna que sustenta a integração sobre elos, sem negar a existência da Eq. 3.11 (L38/L42/L44).
- **PPC:** checagem de adequação/coerência preditiva posterior; no vocabulário do artigo, a integração interna distingue-se da média entre hipóteses, chamada BMA em L188.
- **Composite configuration / low business stakes:** composição do mecanismo de apelo à equidade com baixo interesse material empresarial no benefício tributário; não sinônimo de hipótese Core Constituency inteira (L46; L159–163).
- **Miscalibrated likelihoods:** diagnóstico do artigo sobre as atribuições originais, particularmente E1/E2 sob HSA no petróleo; não calibração frequentista já demonstrada pela introdução (L46; L465).
- **Multi-channel elicitation:** elicitação humana e por LLMs com variação de prompts; os limites da independência e da implementação permanecem parte do escopo (L25; L232–240; L533).

## Perguntas ao agente macro

1. A leitura responsável pela formalização localizou distinção suficiente para reconciliar “hipótese = configuração específica” com integração sobre estados ativos/ausentes dentro dela? Localizadores iniciais: L42, L107, L180–188. Se não, manter a relação entre esses objetos como ambiguidade textual.
2. O contrato central deve registrar o déficit operacional como tese explícita, preservando as formulações menos qualificadas do resumo/L40 como variação de alcance? A base para essa leitura é L38/L42 e, de modo ainda mais explícito, L64–68.
3. A leitura do Chile encontra alguma comparação formal da configuração composta com as hipóteses originais além do diagnóstico qualitativo em L331–346? Essa distinção determina o alcance exato de “better accounts” nas L25/L46.
4. A leitura do petróleo reconcilia a afirmação assertiva de má calibração com “likely” em L465 e a divergência multicanal em L502–504? É preciso preservar objeto, força e canais específicos do diagnóstico.
5. Para a identificação das aplicações, qual fonte o macro registrará para o petróleo, diante de L46 (2022) e L398 (2025)? Este leitor apenas registra a divergência interna.

## Conclusão da leitura

A tese introdutória e as promessas de contribuição estão localizadas. A leitura operacional da extensão de Fairfield e Charman está sustentada expressamente no texto. As ambiguidades acima seguem ao macro para reconciliação com os leitores das demais seções; este relatório não atribui `PASS` ao contrato global e não avalia a validade científica dos claims.
