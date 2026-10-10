# S03 — Mechanism Configurations: leitura de fidelidade

- `reader_id`: `/root/read_framework`
- Artefato: `paper_draft_v1.Rmd`.
- SHA-256 informado no despacho: `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`.
- Responsabilidade exclusiva: linhas 101–261, seção **Mechanism Configurations**.
- Contexto consultado: manuscrito completo, linhas 1–541; `CLAUDE.md`; skill `argument-fidelity-gate`.
- Natureza deste registro: interpretação ancorada no texto, sem crítica substantiva, proposta de correção, alteração do manuscrito, execução de scripts ou validação independente de resultados/citações.
- Localizadores abaixo referem-se às linhas do Rmd, exceto quando explicitado.

## Tese e função da seção

A seção apresenta uma operacionalização de “scenarios within worlds” de Fairfield e Charman (2022, Eq. 3.11): representar passos causais como links binários, organizar hipóteses por configurações desses links e usar essa estrutura para previsões e diagnósticos mais granulares. O argumento estabelece dois níveis preditivos: integração sobre estados de links dentro de uma configuração e média sobre configurações ponderada pelos respectivos posteriores. A decomposição também é apresentada como resposta aos problemas de compartilhamento de mecanismos, construção de hipóteses compostas e contingências implícitas nos juízos de verossimilhança (105–135, 180–188).

A seção inclui uma ilustração chilena e um cálculo trabalhado, mas sua função principal é metodológica. O workflow exige identificar evidência holdout, produzir previsões, avaliar coerência qualitativamente, localizar discrepâncias, revisar e documentar. A circularidade é reconhecida e tratada por protocolos e credibilidade graduada; a seção não afirma eliminá-la (199–240). As condições de escopo são domínio suficientemente conhecido, disponibilidade de holdout e previsões distinguíveis ao nível de links (247).

O enquadramento autorizado em `CLAUDE.md` é extensão construtiva de FC, com lacuna de operacionalização. A própria abertura da seção reconhece explicitamente a fundação matemática anterior (105). As ambiguidades registradas abaixo não alteram esse reconhecimento.

## Claims explícitos, evidência e escopo

Aqui, “evidência” significa o suporte apresentado pelo manuscrito: definição, analogia, exemplo, equação, argumento ou referência. Não significa confirmação independente da validade científica de cada claim.

| Claim explícito | Localizador | Evidência apresentada no texto | Scope/hedge |
|---|---|---|---|
| FC já oferecem a base matemática para estrutura interna; a proposta operacionaliza cenários como links binários. | 105 | Remissão à Eq. 3.11 de FC; exemplos de percepção, decisão e resposta. | Contribuição de operacionalização. Não é reivindicação de inexistência prévia de estrutura matemática. |
| Um link representa um passo causal ativo (`1`) ou ausente (`0`); uma configuração é um vetor em `{0,1}^n`; uma hipótese causal é uma configuração. | 105–107 | Definição explícita de `m_j` e `c`. | Definição “in this framework”; interpretação do mesmo termo em 180–188 permanece ambígua, conforme A1. |
| Configurações podem compartilhar links e continuar mutuamente exclusivas se especificam configurações gerais diferentes. | 111–117 | Analogia com modelos de regressão que compartilham covariáveis; exemplo `{m1,m2,m3}` versus `{m1,m2,m'3}`; referência à analogia do motor de Bennett. | Exclusividade no nível das configurações, não dos links. |
| Hipóteses compostas são configurações específicas com links de múltiplos relatos, testáveis link a link. | 119; 159–163 | Definição de composição e exemplo chileno `{m1,m2,m3,m4,m'1}`. | Na ilustração, o apelo à equidade operou parcialmente porque a perda de valor material reduziu as stakes empresariais. |
| Contingências expressas por “it depends” podem ser representadas como links e integradas sobre seus estados. | 121 | Interpretação da crítica de Zaks e argumento de explicitação de contingências. | Formulação forte: “problem dissolves”. O trecho não oferece catálogo ou regra geral para mapear toda contingência a um link. |
| A comparação entre BPT e a proposta é integração implícita de cenários versus links explícitos, com diagnóstico no nível de links. | 123–133 | Tabela 2, que reconhece cenários, Eq. 3.11, compartilhamento de mecanismos em princípio e atomização de FC. | A tabela caracteriza BPT por concentração da likelihood no cenário dominante, preservando reconhecimento de infraestrutura teórica. |
| A parcimônia pode operar pelo PPC, porque links adicionais devem produzir previsões confirmadas. | 133 | Linha “Parsimony” da Tabela 2. | A seção não apresenta aqui regra quantitativa de penalização ou teorema sobre complexidade. |
| O espaço completo tem `2^n` configurações, mas conhecimento de domínio permite considerar apenas histórias coerentes. | 135; 259 | Argumento combinatório e analogia com seleção de modelos quantitativos. | “In practice”, “typically a small fraction”; em 259, “typically 3–6 configurations”. Critérios formais de poda aparecem como futuro trabalho em 533. |
| As três hipóteses chilenas podem ser decompostas em cinco links de equity appeal, quatro de core constituency e três de median voter. | 140–157 | Tabela 3, com descrições de cada passo. | Exemplo referente à aceitação da eliminação do Art. 57 bis em 2005; não é tipologia geral de mecanismos. |
| A previsão de deliberação reativa sob `H_EA` pode integrar as incertezas sobre percepção de ameaça e superação da resistência. | 165–173 | Três probabilidades condicionais (0,95; 0,60; 0,10), posteriores aproximados (0,95; 0,90) e soma apresentada como aproximadamente 0,874. | “To illustrate”; “worked calculation”; posteriores aproximados. A seção não mostra sua derivação da evidência original. |
| A previsão agregada do exemplo é semelhante à atribuição direta de 0,90, mas a estrutura dirige a atenção para `m4` se as deliberações forem ambíguas. | 175 | Interpretação do exemplo e contrafactual sobre uma discrepância. | “Likely source”, não certeza de localização única ou prova de causa da discrepância. |
| A distribuição preditiva proposta tem integração dentro de configurações e média entre configurações. | 180–188 | Duas equações: soma sobre `m` condicional em `c_i` e soma sobre `c_i` ponderada pelo posterior. | O texto denomina o primeiro nível “proper PPC” e o segundo BMA. A relação entre `c_i`, `m` e `n_i` é objeto de A1/A2. |
| Formalizar torna a comparação entre hipóteses/links explícita, inclui a incerteza e permite auditoria e substituição de julgamentos. | 192 | Três argumentos numerados em prosa. | Inclui a afirmação de que previsões informais superestimam confiança com posterior não extremo; não é acompanhada aqui de demonstração empírica independente. |
| PPC diagnostica coerência interna e pode motivar revisão de likelihoods, evidência ou espaço de hipóteses. | 196 | Distinção conceitual entre checking e atualização, referência a Gelman/Shalizi. | Explicitamente não testa verdade; um modelo pode passar e estar errado. |
| O workflow tem seis passos: BPT, holdout, previsão, avaliação, diagnóstico/revisão e documentação. | 201–213 | Especificação operacional dos passos. | Posteriores de links “where possible”; previsão por link “where decomposed”; mínimo prático de 3–5 itens de ao menos dois domínios; previsão antes de examinar o holdout; avaliação qualitativa. |
| Circularidade pode surgir de erros positivamente correlacionados entre likelihoods originais e preditivas. | 218–222 | Representação multiplicativa com `exp(epsilon)` e `exp(eta)` e condição `Corr(epsilon,eta)>0`. | Formalização da fonte de viés; objetivo de design é reduzir correlação. Não são apresentados nesta seção estimadores da correlação ou mensuração empírica desses erros. |
| Pré-especificação, analista cego, triangulação humano–LLM e diversificação de prompts visam fontes diferentes de correlação. | 226–236 | Quatro protocolos e justificativas, incluindo estilos standard/skeptical/minimalist. | São protocolos propostos; a frase sobre aplicações diz implementar “versions” deles. Não afirma execução integral de todos. |
| Credibilidade é graduada e a validade diagnóstica depende de julgamentos prospectivos com erros que provavelmente não compartilham a mesma fonte latente. | 240 | Contraste entre avaliação exploratória post hoc pelo mesmo pesquisador e avaliação cega, prospectiva e multicanal. | Explicitamente não elimina circularidade; “unlikely” não equivale a independência demonstrada. |
| O framework é mais valioso em domínios conhecidos, com holdout identificável e implicações distinguíveis por link. | 247 | Três condições de escopo. | “Most valuable”, não afirmação de condições suficientes ou necessárias para validade geral. |
| PPC complementa a sensibilidade a priors e é apresentado como exame de likelihoods via previsões sobre evidência não observada. | 251 | Contraste das perguntas feitas por cada procedimento; referência a FC (2017). | Um modelo pode passar em um e falhar no outro; não substitui a sensibilidade. |
| Julgamento qualitativo pode ser contestado e seleção confirmatória de holdout é possível. | 255–257 | Resposta às objeções com transparência, substituição de juízos, pré-especificação e relato de todos os checks. | “Yes, in principle”; protocolos “mitigate” o risco de seleção, não o eliminam. |

## Não-afirmações e limites explícitos

1. **Não reivindica a invenção da infraestrutura matemática para cenários internos.** Atribui a fundação à Eq. 3.11 de FC (105); a Tabela 2 registra cenários e atomização existentes (128, 132).
2. **Não requer exclusividade dos mecanismos ou links.** A exclusividade é declarada entre configurações completas e o compartilhamento de componentes é permitido (112–119).
3. **Não apresenta PPC como teste de verdade.** Um modelo pode passar e estar errado (196).
4. **Não apresenta a avaliação qualitativa como teste com p-value ou limiar formal de rejeição.** Ambos são explicitamente excluídos do passo 4 (209).
5. **Não equipara diagnóstico a mera atualização com mais evidência.** A resposta descrita a discrepâncias é revisão da especificação, da interpretação ou do conjunto de hipóteses (196, 211).
6. **Não afirma neutralidade das LLMs.** A justificativa declarada para triangulação é diversidade das fontes de erro (232).
7. **Não afirma eliminar circularidade.** A defesa é condicionada e graduada (240).
8. **Não afirma que todo check retrospectivo tem a mesma credibilidade de um check prospectivo cego.** O primeiro é exploratório; o segundo é descrito como mais crível (240).
9. **Não exige enumerar/aplicar todas as `2^n` configurações.** Permite poda por conhecimento substantivo (135, 259).
10. **Não substitui sensibilidade a priors.** PPC é complementar (251).
11. **Não afirma aplicação integral dos quatro protocolos nas duas demonstrações.** Diz implementar “versions” (236); o contexto explicita implementação parcial e ausência de segundo analista cego humano (533).

Não encontrei na seção uma reivindicação de estimando populacional, identificação de efeito causal médio, jogadores/equilíbrio de modelo estratégico, calibração externa validada dos valores elicitados ou independência empiricamente demonstrada entre os canais. Esses campos não descrevem o tipo de contribuição aqui apresentado.

## Ambiguidades textuais preservadas

### A1 — Configuração como estado fixo ou objeto com estados internos incertos

Em 107, `c=(m1,...,mn)` é explicitamente um vetor de estados binários que especifica quais links estão ativos; hipótese causal é identificada com esse vetor. Em 180–188, há integração sobre quais links estão ativos **dentro de cada configuração**, condicionada em `c_i`. A Tabela 2 usa “Over links within each config + over configs” (129), e o exemplo computa probabilidades de ausência de links sob a hipótese nominal (165–173). Não encontrei uma definição adicional que estabeleça a relação entre o vetor fixo e o objeto condicionado. As duas formulações pertencem ao texto; não escolho entre uma leitura como estado causal completo e outra como estrutura/modelo cujos links possuem estados internos incertos.

### A2 — Espaço comum, subconjuntos e notação de conjuntos

A definição global usa `n` links e vetores binários completos (107, 135). Os exemplos nomeiam configurações por conjuntos dos links presentes (117, 161), enquanto a distribuição interna usa `n_i` e a Tabela 3 agrupa símbolos diferentes em hipóteses distintas (146–157, 182). Não encontrei definição explícita de `n_i`, nem convenção que diga se links omitidos dos conjuntos estão fixados em zero ou ficam não especificados. A questão é particularmente visível porque o composto de 161 omite `m5` e acrescenta `m'1`; não é possível decidir apenas pela seção se a ausência de `m5` tem conteúdo causal ou é abreviação.

### A3 — Valores pontuais e pesos conjuntos no cálculo trabalhado

O exemplo fornece dois posteriores marginais aproximados (171) e multiplica seus valores na soma (173). Não encontrei nessa seção explicação da origem numérica dos posteriores ou declaração da dependência/independência usada para os pesos conjuntos. A fórmula geral posterior de 182 permite uma distribuição conjunta. O contexto em 533 reconhece que os posteriores dos links são estimativas pontuais sem propagação formal de incerteza. Esta é uma indefinição de interpretação/proveniência da ilustração, não uma conclusão de auditoria matemática.

### A4 — Eventos com probabilidade, evidência e contrafactuais holdout

O exemplo define o evento previsto como deliberação “reactive” (167–173), enquanto o workflow fala genericamente em identificar observações ainda não examinadas e fixar evidência holdout antes de inspecionar o material (205–207, 228). Não encontrei definição geral do objeto a pré-especificar: fonte, domínio, pergunta, variável ou resultado. O texto claramente exige previsão anterior à inspeção; o nível de pré-especificação fica aberto.

### A5 — Força e natureza da localização diagnóstica

O exemplo usa “likely source” para `m4` (175); o workflow diz “may localize” (211), mas a descrição geral fala em localizar a falha em links (196). O contrato deve preservar que a ilustração e o procedimento admitem diagnóstico sugestivo, sem converter isso automaticamente em identificação única ou certa. Não encontrei critério formal geral que determine quão conclusiva é a localização.

### A6 — Parcimônia por PPC

Há claim explícito de parcimônia via confirmação de previsões adicionais (133), mas não encontrei regra operacional específica nesta seção que ligue contagem de links a decisão de manter, excluir ou preferir uma configuração. É possível registrar o argumento qualitativo; não há base textual aqui para atribuir um procedimento formal de seleção ou penalização.

### A7 — Unidade da correlação dos erros

A formulação de 222 declara likelihoods verdadeiras e erros para pares hipótese/evidência e escreve correlação entre erros originais e de holdout. Não encontrei descrição da população de julgamentos ou repetições sobre a qual essa correlação seria definida ou medida. A passagem funciona textualmente como formalização conceitual da circularidade.

## Terminologia que precisa permanecer consistente

| Termo | Sentido autorizado e localizador |
|---|---|
| Mechanism link | Passo causal discreto, binário, ativo/ausente; percepção, decisão ou resposta (105). Não equivale automaticamente a variável contínua, coeficiente ou mecanismo completo. |
| Mechanism configuration | Combinação de links; definida como vetor binário (107), com uso adicional como objeto condicionado na distribuição de dois níveis (180–188), ainda ambíguo. |
| Hypothesis | Identificada com configuração em 107; no exemplo, rótulos `H_EA`, `H_CC`, `H_MV` agrupam narrativas e links (140–173). |
| Mutual exclusivity | Entre configurações gerais diferentes, permitindo links compartilhados (112–117). |
| Composite / low-stakes confound | Configuração que reúne equity appeal e declínio do valor material do subsídio, reduzindo stakes empresariais (159–163). O termo “confound” é o rótulo do manuscrito; a seção não define um estimando causal estatístico ao qual aplicá-lo. |
| PPC | Diagnóstico de coerência que incorpora incerteza interna; primeiro nível da estrutura de duas somas; não teste de verdade (188, 196). |
| BMA | Média entre configurações/modelos ponderada por probabilidades posteriores (184–188). |
| Holdout | Observações não examinadas na análise original; previsões devem anteceder exame do material (205–207, 228). |
| Revision | Ajustar likelihoods, reinterpretar evidência ou expandir hipóteses após discrepância (196, 211). |
| Multi-channel | Humano e LLM, incluindo famílias de prompts diferentes, como estratégia para diversificar fontes de erro (232–240). |
| Graded credibility | Avaliação exploratória post hoc com menor força; avaliação cega, prospectiva e multicanal com maior credibilidade (240). |
| Pruning | Restringir espaço combinatório por plausibilidade substantiva/coerência de histórias (135, 259). |

## Perguntas ao agente macro

1. Há em outra seção um localizador que estabeleça se `c_i` é vetor de estados completo ou estrutura que admite incerteza sobre estados internos? A1 altera a leitura do núcleo formal e deve permanecer aberta se não houver passagem definidora.
2. A omissão de `m5` no composto deve ser lida como ausência substantiva ou abreviação? A comparação em 331 explicita o conjunto “puro” incluindo `m5`, mas não encontrei convenção que resolva o significado da omissão.
3. Como o contrato integrará as prescrições prospectivas de 205–207/228–240 com a declaração de implementação parcial de 533? A seção do framework não deve ser lida como prova de execução integral.
4. O contrato vai preservar os diferentes níveis de força de “localizes”, “likely source” e “may localize”, sem inferir certeza de diagnóstico a partir do termo PPC?
5. A reivindicação de parcimônia via PPC em 133/520 deve permanecer claim qualitativo, dado que não encontrei critério formal de seleção nesta seção?
6. A origem dos posteriores de links e a convenção para os pesos conjuntos do exemplo aparecem em material incluído no escopo exato da revisão? Caso não, o contrato deve manter A3 como ausência de explicitação, juntamente com a limitação reconhecida em 533.

## Conclusão da leitura

A seção sustenta uma proposta metodológica de estruturação explícita de mecanismos e diagnóstico preditivo, com ilustração numérica, procedimento de seis passos e ressalvas substantivas sobre interpretação e circularidade. A leitura preserva tanto seus claims fortes de resolução/operacionalização quanto os limites expressos. A ambiguidade central é a relação entre configuração como vetor binário especificado e configuração como modelo com incerteza interna sobre links. Este registro não resolve essa ambiguidade, não emite avaliação científica e não declara PASS do gate global.
