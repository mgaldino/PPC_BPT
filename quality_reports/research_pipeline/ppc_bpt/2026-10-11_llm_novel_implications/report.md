---
title: "IA, implicações novas e PPC no caso do carbono"
subtitle: "Piloto executado com descoberta separada da avaliação"
date: "11 de outubro de 2026"
lang: pt-BR
fontsize: 11pt
papersize: a4
geometry: margin=2cm
colorlinks: true
header-includes:
  - \usepackage{float}
  - \floatplacement{figure}{H}
  - \renewcommand{\maketitle}{\begin{center}{\Large IA, implicações novas e PPC no caso do carbono}\\[5pt]Piloto executado com descoberta separada da avaliação\\[5pt]11 de outubro de 2026\end{center}\vspace{6pt}}
---

**A IA formulou consequências compostas que não estavam enumeradas no prompt, mas este piloto não demonstrou ganho diagnóstico exclusivo em relação a templates com as mesmas premissas.** A geração probabilística apresentou um desvio importante: exatamente um erro documental por chamada de oito mundos, em todas as 16 chamadas de confirmação. A frequência foi 12,5%, embora o prompt pedisse 5%, independência e ausência de quotas.

O PPC que usou diretamente as frequências da IA teve taxa exata de falso alarme de 21,4% no cenário correto quando incluiu os dois checks, com 201 alarmes em 1.000 conjuntos simulados. Detectou todas as falhas documentais deste benchmark, mas um template que verifica uma premissa já explícita também detectou todas, com 25 alarmes em 1.000 conjuntos. A dedução de implicações e a calibração das probabilidades são tarefas separadas.

# 1. O teste realizado e o resultado comparativo

O experimento gerou 16 mundos de descoberta e 128 mundos de confirmação, com dois documentos por mundo. O gerador recebeu incentivos, informação, decisão e comunicação, mas não recebeu uma lista dos checks pretendidos nem vetores de estados sorteados externamente. Uma chamada separada selecionou implicações. Novas chamadas, com o mesmo prompt aberto, produziram a confirmação. Os resultados foram codificados em contexto separado, com identificadores cegos. Três agentes debateram o desenho e um quarto fez uma auditoria cega de documentos; um quinto revisou a atribuição do ganho. Os pareceres estão preservados no pacote.

Antes da descoberta, congelou-se um benchmark com 1.000 conjuntos corretos, 1.000 com troca SA/CA e 1.000 com erro documental elevado. Cada conjunto contém 12 mundos de uma coalizão, sob uma hipótese comum. Os 36.000 mundos são dados sintéticos de validação. Outros 36 mundos receberam documentos para conferir a passagem texto → código → PPC.

Table: Frequência de PPC $\leq$ 0,05 em 1.000 conjuntos por condição. A coluna “correto” mede alarmes falsos no benchmark. A troca SA/CA muda a composição das hipóteses admissíveis; não constitui necessariamente falha da classe do modelo. C+ é o template enriquecido com os estados recuperados da IA.

| Procedimento | Correto | Troca SA/CA | Falha documental |
|---|---|---|---|
| Templates antigos (C0) | não especificado | não especificado | não especificado |
| IA / C+, um check | 12,6% | 17,4% | 13,6% |
| IA / C+, dois checks | 20,1% | 32,0% | 100,0% |
| Dois checks, Dirichlet | 0,5% | 2,4% | 99,1% |
| Referência: gerador correto | 4,9% | 5,0% | 100,0% |
| Template: premissa explícita | 2,5% | 1,9% | 100,0% |

O resultado de um check é a análise originalmente selecionada. A análise de dois checks é secundária: uma auditoria independente por agente contestou a exclusão de uma implicação pública. Essa correção foi registrada antes de inspecionar a confirmação e calcular desempenho, mas depois de conhecer os tipos de defeito do benchmark. Portanto, ela não é uma confirmação independente da escolha do check. As taxas dos procedimentos baseados no kernel da IA são condicionais ao corpus observado; as referências usam as probabilidades estipuladas.

Os templates C0 não especificam os novos observáveis. “Não especificado” não significa probabilidade zero nem zero alarmes. C+ mantém exatamente o mesmo kernel da IA e necessariamente produz o mesmo PPC. O template da premissa explícita é o controle mais informativo para atribuir um possível ganho exclusivo.

# 2. O que veio das fontes e o que foi estipulado

SA representa acomodação estratégica diante de alternativas regulatórias mais custosas; CA representa vantagem competitiva. O piloto usa versões reduzidas dessas hipóteses. O documento BP de janeiro de 2017 relata que evitar uma futura regra de emissões para refinarias poderia tornar o imposto de carbono atraente e que a expectativa de essa regra não ser adotada diminuía tal benefício. Isso motiva examinar a resposta a mudanças na alternativa regulatória. O documento não informa probabilidades de comportamento da coalizão, não estima um payoff 12/2 e não prova retirada efetiva de apoio. [BP, 27 de janeiro de 2017, p. 1](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00052952.pdf).

Table: Proveniência dos elementos usados no experimento.

| Elemento | Origem e alcance |
|---|---|
| Hipóteses SA e CA, coalizão e política de carbono | Estrutura inspirada no estudo de Fairfield e Charman e nas fontes do caso. |
| Relevância de alternativas regulatórias para o apoio | Documento BP de 2017, como motivação substantiva. |
| Quatro firmas tratadas como uma coalizão, custo 6, benefícios 12 → 2 | Escolhas sintéticas, não valores extraídos de fontes. |
| Dia 0, sinal no dia 10, memo no dia 11, nota no dia 12 | Calendário artificial para tornar a informação e a sequência auditáveis. |
| 5% de inversão comportamental e 5% de erro público | Probabilidades de referência estipuladas; não estimativas históricas. |
| 60% de peso posterior em SA | Herdado do exemplo sintético anterior, não do posterior histórico de Fairfield e Charman. |
| Frequências nas respostas da IA | Dados observados sobre o simulador, sob este prompt e esta configuração. |
| Qual candidata é nova, redundante ou identificável | Julgamento explícito do seletor e dos revisores, preservado nos pareceres. |

O cenário começa com a coalizão apoiando a proposta. O benefício regulatório e o competitivo valem 12; o custo comum vale 6. O benefício competitivo é medido **antes** desse custo, que é subtraído uma única vez. Um aviso privado reduz apenas uma dimensão a 2. Sob SA, o payoff é o benefício regulatório menos 6. Sob CA, o payoff é o competitivo menos 6. A regra de apoio é payoff não negativo, sujeita a inversão de 5%. O memo registra fielmente a decisão; a nota pública pode invertê-la com probabilidade 5%.

A continuidade com o BPT foi fixada por uma extensão condicional. Seja $D$ a evidência inicial reduzida do piloto anterior. Com prior de 0,5 e verossimilhanças sintéticas 0,375 e 0,25:

$$P(SA\mid D)=\frac{0{,}5(0{,}375)}{0{,}5(0{,}375)+0{,}5(0{,}25)}=0{,}6.$$

Para os novos registros $R$, definimos $p(D,R\mid H)=p(D\mid H)g(R\mid H,D)$. Integrar $R$ preserva a verossimilhança inicial. A nova etapa é, porém, uma especificação adicional do modelo sintético: não decorre automaticamente da informação histórica já disponível.

$$p(R^{rep}_{1:12}\mid D)=0{,}6\prod_{j=1}^{12}g(R^{rep}_j\mid SA,D)+0{,}4\prod_{j=1}^{12}g(R^{rep}_j\mid CA,D).$$

Sorteia-se uma hipótese para o conjunto inteiro. Os novos registros ficam fora da atualização inicial: trata-se de um **check posterior preditivo de evidência reservada**, não de um PPC que reutiliza esses mesmos registros no posterior. Os 12 mundos repetidos são uma bancada de validação; sua independência condicional não foi estabelecida para episódios históricos reais.

# 3. Implicações que surgiram sem serem enumeradas

O prompt continha os fundamentos acima e solicitava a geração de histórias documentais e uma candidata adicional por mundo. Não mencionava a tabela choque × decisão, a tabela choque × anúncio público ou os defeitos do benchmark. “Nova” significa uma consequência composta não enunciada previamente no prompt. Não significa nova teoria científica, novidade em relação a especialistas ou ausência no treinamento do modelo.

A primeira implicação admitida foi proposta em `discovery_CA_01_02`:

> Across comparable episodes, researchers should predict that private notices changing only the alternative-regulation burden will usually be followed by stable coalition support, whereas notices reducing competitive benefit below proposal cost will usually precede withdrawal.

Seu indicador é a tabela 2 × 2 entre tipo de aviso e decisão interna. Sob CA, o aviso competitivo deve estar mais associado à retirada; sob SA, a ordenação se inverte. O dado a codificar é o conteúdo do aviso e a decisão, sem usar a hipótese verdadeira escondida.

A segunda candidata, `discovery_SA_02_02`, foi inicialmente rejeitada pelo seletor:

> Prediction: When internal memoranda document a reduced expected burden from alternative regulation, subsequent public records should show a sharp increase in withdrawal announcements, although a small minority should retain support or be publicly misreported.

O revisor considerou a exclusão parcialmente equivocada: a decisão pública contém uma etapa adicional de comunicação. Se $W$ indica retirada interna e $C$ indica inversão pública, $W_{pub}=W\oplus C$. Assim, o anúncio não é uma cópia determinística da decisão interna. Sob as premissas, $P(W_{pub}=1\mid X)=0{,}05+0{,}90P(W=1\mid X)$. Essa relação entre expectativas não torna os dois registros equivalentes nos dados.

Havia 16 candidatas, muitas repetidas. Alegações sobre a frequência de justificativas em documentos internos foram excluídas por exigir uma regra adicional de seleção do conteúdo e de franqueza. Datas, sigilo e taxa marginal de erro, isoladamente, já estavam no prompt. O resultado foi um check na seleção automática e dois após auditoria, mantendo a análise secundária separada.

Table: Implicações nas 128 gerações de confirmação. As taxas resultam dos textos codificados; não foram entregues ao gerador como respostas esperadas.

| H geradora | Aviso | Mundos | Retira no memo | Retira na nota |
|---|---|---|---|---|
| CA | competitividade | 36 | 88,9% | 66,7% |
| SA | competitividade | 36 | 8,3% | 19,4% |
| CA | regulação | 28 | 0,0% | 0,0% |
| SA | regulação | 28 | 89,3% | 75,0% |

As relações direcionais apareceram, mas suas frequências não reproduziram integralmente as probabilidades estipuladas. O prompt permaneceu aberto durante a confirmação; a lista de checks foi fornecida somente aos codificadores.

# 4. Dos documentos gerados aos números

Exemplo fixo, primeiro mundo da primeira chamada SA (`confirmation_SA_01_01`). Memorando produzido pela IA:

> SYNTHETIC — INTERNAL MEMO, DAY 11: The private notice reduced the expected burden from alternative regulation to 2. Continued endorsement would therefore yield 2 minus the proposal cost of 6, or -4. The coalition decided to withdraw support, consistent with the negative payoff.

Nota pública do mesmo mundo:

> SYNTHETIC — PUBLIC NOTE, DAY 12: The coalition no longer supports the federal carbon-pricing proposal. Private commercial assessments remain confidential.

O documento permite codificar aviso regulatório, retirada interna e retirada pública. A escolha do indicador pertence ao pesquisador; a classificação é uma leitura dos documentos; a contagem resulta dessas classificações. A passagem da contagem para uma probabilidade histórica exigiria validação externa que este experimento não fornece.

O primeiro prompt de codificação exigiu tanto a dimensão que mudou quanto a declaração de que a outra ficou constante. Isso excedia a identificação do canal do aviso e produziu 44 tipos indeterminados, sem ambiguidade nas decisões. O arquivo original foi preservado. Uma correção cega recuperou 41 canais diretamente enunciados e inferiu outros três pela regra do mundo fechado de que exatamente uma dimensão mudou. Esses três estão marcados separadamente; a regra não pode ser transportada automaticamente para fontes reais.

Uma amostra cega independente de 35 pares concordou com os 105 campos finais, incluindo os controles. Nenhum dos três canais inferidos apenas pelo desenho estava nessa amostra. Os 36 pares do oráculo tiveram seus 108 campos recuperados corretamente. Os rótulos explícitos SA/CA foram ocultados em 37 textos antes da codificação; o conteúdo substantivo ainda pode sugerir o mecanismo. Codificador e gerador usaram o mesmo modelo por chamadas separadas: não é independência entre famílias de modelos.

Table: Kernel conjunto empírico usado no PPC secundário. Cada linha é uma célula documental. Os denominadores são 64 mundos por hipótese; a soma em cada coluna é um. O kernel primário soma as linhas sobre a nota pública.

| Aviso | Memo | Nota | SA | CA |
|---|---|---|---|---|
| regulação | retira | retira | 21/64 | 0/64 |
| regulação | retira | mantém | 4/64 | 0/64 |
| regulação | mantém | retira | 0/64 | 0/64 |
| regulação | mantém | mantém | 3/64 | 28/64 |
| competitividade | retira | retira | 3/64 | 24/64 |
| competitividade | retira | mantém | 0/64 | 8/64 |
| competitividade | mantém | retira | 4/64 | 0/64 |
| competitividade | mantém | mantém | 29/64 | 4/64 |

O número $g(r\mid H,D)$ é a frequência da célula na coluna correspondente. Essa é uma estimativa da distribuição produzida pela IA, não uma obtenção de $P(Y\mid H)$ a partir de documentos históricos. Zeros significam células não observadas nesse corpus, não impossibilidades substantivas. A análise de sensibilidade propaga incerteza de células usando Dirichlet(0,5 por célula).

Table: Fidelidade aos erros estipulados de 5%.

| H | Mundos | Inversões de decisão | Erros públicos |
|---|---|---|---|
| CA | 64 | 4 (6,2%) | 8 (12,5%) |
| SA | 64 | 6 (9,4%) | 8 (12,5%) |

Os 16 erros públicos ocorreram como exatamente um por chamada, em todas as 16 chamadas de oito mundos. Sob o amostrador independente solicitado, a probabilidade do evento “exatamente um em cada chamada” é $[P\{Bin(8,0{,}05)=1\}]^{16}=1{,}37\times10^{-9}$. É um diagnóstico exploratório do padrão, não um teste pré-registrado ajustado para múltiplas comparações. A comparação binomial agregada dá $p=0{,}000687$ sob a mesma referência. O bootstrap por chamada devolve intervalo degenerado de 12,5% para o erro público, ilustrando por que baixa variação entre chamadas não certifica calibração.

# 5. Exemplo completo até o PPC

Os 12 pares abaixo pertencem ao conjunto textual congelado com falha documental. O gerador e o codificador não receberam essa condição. O valor verdadeiro foi revelado para a avaliação depois da codificação. Todos os documentos são sintéticos; os IDs remetem aos textos preservados em `data/benchmark_documents.json`.

Table: Dados documentais reservados do exemplo. O aviso é identificado pelo memorando; apoio/retirada são lidos separadamente em cada fonte.

| ID do par | Aviso | Memo | Nota pública |
|---|---|---|---|
| 009 | competitividade | retira | mantém |
| 011 | competitividade | retira | retira |
| 006 | regulação | mantém | retira |
| 032 | competitividade | retira | mantém |
| 019 | competitividade | retira | mantém |
| 018 | competitividade | retira | mantém |
| 035 | regulação | mantém | mantém |
| 024 | regulação | mantém | retira |
| 025 | regulação | mantém | mantém |
| 010 | regulação | mantém | mantém |
| 013 | regulação | mantém | retira |
| 001 | regulação | mantém | mantém |

Na ordem de células da Tabela 4, o histograma é $n=(0,0,3,4,1,4,0,0)$, com sete divergências entre memo e nota. O check primário enxerga apenas $n^{int}=(0,7,5,0)$. Esse padrão interno é plausível sob CA: seu PPC empírico é 0,741301. Favorecer CA não revela o problema de comunicação.

Para um histograma $n$ de 12 mundos e probabilidades $q_{Hc}$:

$$m(n\mid D)=\frac{12!}{\prod_c n_c!}\left[0{,}6\prod_c q_{SA,c}^{n_c}+0{,}4\prod_c q_{CA,c}^{n_c}\right].$$

Usamos $T(n)=-\log m(n\mid D)$ e a cauda inclusiva

$$p_{PPC}=\sum_{n':m(n'\mid D)\leq m(n\mid D)}m(n'\mid D).$$

A enumeração percorre todos os 455 histogramas de quatro células ou 50.388 histogramas de oito células, com soma das massas igual a um. Não são 50.388 novas respostas da IA; são possibilidades matemáticas da distribuição estimada.

No kernel empírico secundário, ambos os mecanismos atribuem massa zero ao exemplo, porque algumas células aparecem no conjunto reservado e nunca apareceram nas gerações de confirmação. Isso produz PPC zero. Com a sensibilidade Dirichlet, a massa do histograma é 0,000000817728 e o PPC é 0,003202. Com as probabilidades verdadeiras do cenário sintético, a massa é $4{,}42135\times10^{-9}$ e o PPC é $8{,}66759\times10^{-6}$.

Table: PPC dos três conjuntos textuais congelados. Cada linha tem 12 mundos, escolhidos por ID do conjunto, sem selecionar o mais extremo.

| Conjunto | IA: interno | IA: conjunto | Dirichlet: conjunto | Oráculo: conjunto |
|---|---|---|---|---|
| Correto | 0,191744 | 0,319629 | 0,537952 | 0,263835 |
| Troca SA/CA | 0,447026 | 0,815405 | 0,894391 | 0,335292 |
| Falha documental | 0,741301 | 0,000000 | 0,003202 | 0,000009 |

O template C+ codifica os mesmos estados em frases fixas. Sua recuperação determinística coincidiu nos 128 mundos, por isso suas massas e PPCs são exatamente iguais aos da IA. Essa igualdade é uma ablação planejada da representação textual, não uma prova de descoberta automática de implicações por templates.

# 6. O ganho que podemos e o que não podemos atribuir à IA

![Frequência de PPC $\leq$ 0,05 nos três tipos de conjunto. Cada barra usa 1.000 conjuntos de 12 mundos. O kernel IA também é o kernel dos templates C+. A referência oráculo conhece a lei sintética; Dirichlet é uma sensibilidade à estimação do kernel. A linha marca 5%, sem presumir que um PPC seja um p-valor calibrado em qualquer aplicação.](figures/diagnostic_rates.pdf){width=100%}

Table: Probabilidades exatas de rejeição sob o oráculo, sem erro Monte Carlo. Estas taxas integram todos os histogramas possíveis sob cada condição. As taxas dos kernels IA são condicionais ao corpus observado; a referência usa a lei estipulada. Não se inclui incerteza de novas chamadas. A Tabela 1 relata realizações finitas dessas probabilidades.

| Procedimento | Correto | Troca SA/CA | Falha documental |
|---|---|---|---|
| IA / C+, um check | 12,9% | 17,6% | 12,9% |
| IA / C+, dois checks | 21,4% | 29,7% | 99,9% |
| Dois checks, Dirichlet | 1,7% | 2,5% | 99,3% |
| Referência: gerador correto | 4,8% | 5,2% | 100,0% |

O PPC primário empírico alarmou em 12,6% dos conjuntos corretos, para uma taxa populacional exata de 12,95%. O secundário alarmou em 20,1% (intervalo Monte Carlo de 95%: 17,7%–22,7%), para taxa exata de 21,37%. Esse aumento impede interpretar seu poder elevado como melhora irrestrita. A sensibilidade Dirichlet produziu apenas cinco alarmes nesta amostra de 1.000, mas seu tamanho exato é 1,70%, e seu poder documental exato é 99,26%. Não confundimos a realização especialmente baixa de cinco alarmes com seu tamanho populacional. Essas priors são separadas para quatro e oito células; Dirichlet(0,5 por célula) em oito células não se projeta em Dirichlet(0,5 por célula) em quatro. Não atribuímos a diferença entre essas sensibilidades somente à inclusão de um observável.

O desvio documentado de amostragem e a estimação com apenas 64 mundos por hipótese são limitações distintas. Zeros empíricos podem surgir mesmo em amostras corretas. O piloto não decompõe quanto da descalibração decorre da geração da IA e quanto decorre da aproximação finita sem regularização. A falha de fidelidade é estabelecida separadamente pelo padrão de erros públicos; a inadequação preditiva é estabelecida pela avaliação do kernel resultante.

As conclusões não dependem dos três canais inferidos pelo desenho: nas oito atribuições binárias possíveis e na exclusão dos três casos, os alarmes do check secundário empírico variaram de 18,7% a 20,1%; a detecção documental permaneceu entre 100,0% e 100,0%. Essa sensibilidade cobre classificações alternativas no cenário de dois tipos de aviso; não valida esse cenário para o mundo real.

O controle com informação equivalente é decisivo. Como o prompt já diz que a comunicação inverte a decisão com probabilidade 0,05, um template pode verificar diretamente $K=\sum_j1\{A_j^{pub}\ne A_j^{int}\}$. Sob a referência, $K\sim Bin(12,0{,}05)$. O PPC unilateral rejeita quando $K\geq3$. Seu tamanho exato é 1,9568% e seu poder teórico contra inversão de 80% é 99,99955%. No benchmark, teve 2,5% de alarmes e 100% de detecção. Isso resolve a falha testada sem depender de uma implicação nova descoberta pela IA.

A troca SA/CA é outro limite deliberadamente preservado. Se $f_0=0{,}6f_{SA}+0{,}4f_{CA}$ e $f_1=0{,}4f_{SA}+0{,}6f_{CA}$, então $f_1\leq1{,}5f_0$. Qualquer teste de tamanho real $\alpha$ tem poder no máximo $1{,}5\alpha$ contra essa mudança de mistura. O aparente poder empírico de 32% acompanhado de 20,1% de alarmes decorre da aproximação descalibrada e da variação Monte Carlo, não de capacidade de refutar uma hipótese rival já incluída. O teto aplica-se às probabilidades populacionais sob o benchmark correto; não é um limite determinístico entre duas proporções de apenas 1.000 conjuntos.

**Conclusão do experimento:** a IA consegue explicitar relações documentais derivadas de premissas que não foram entregues como lista de checks. Este resultado não mostrou que ela ofereça probabilidades melhores, que supere templates igualmente informados, ou que descubra uma falha não capturada por uma premissa direta. Seu possível valor está na busca e operacionalização de implicações; esse valor ainda precisa de comparação própria.

# 7. Consequência para o método e para o paper

O procedimento viável separa quatro funções. Primeiro, explicitar o mecanismo e as fontes que sustentam suas premissas. Segundo, usar a IA para propor consequências e localizar quais premissas adicionais cada consequência exige. Terceiro, transformar candidatas selecionadas em variáveis e modelos de mensuração, preservando ausência de informação. Quarto, construir a distribuição preditiva com um amostrador controlado e uma análise de sensibilidade, comparando-a com evidência reservada. Textos gerados podem ajudar a descobrir checks e testar a mensuração; sua frequência não deve ser automaticamente tomada como a lei probabilística do mecanismo.

Neste caso, um pesquisador poderia implementar os dois indicadores em R depois de vê-los uma única vez. O componente linguístico deixaria de ser necessário em cada réplica. Isso permite uma contribuição sobre descoberta auditável de checks, mas não sustenta por si só uma contribuição de simulação causal por linguagem natural.

O parecer local inspirado no framework Edmans solicitava um diagnóstico que não fosse apenas atualização a favor de outra hipótese e advertia sobre números precisos sem fundamento. Este piloto responde parcialmente: mostra a distinção entre troca de hipótese e falha documental, e expõe probabilidades de geração mal reproduzidas. Continua faltando uma demonstração histórica ou um benchmark mais exigente em que implicações descobertas pela IA acrescentem diagnóstico além de checks diretos das premissas. O parecer local não é um parecer emitido por Alex Edmans ou por um editor de periódico.

Para testar essa contribuição específica, o próximo desenho deveria congelar uma classe de mecanismos com múltiplas etapas, fornecer a todos os braços as mesmas informações e comparar uma rotina sem IA, pesquisadores e IA com o mesmo orçamento de descoberta. Defeitos deveriam afetar consequências compostas, mantendo válidos os checks diretos das premissas. O conjunto de teste precisaria permanecer oculto aos selecionadores, e a avaliação deveria repetir a calibração e a descoberta em novos corpora. Variar tamanho das chamadas ajudaria a verificar se a frequência de eventos raros depende do lote. O presente piloto não resolve essas comparações nem autoriza uma promessa de publicação em *Political Analysis*.

Essa formulação preserva Fairfield e Charman como fundamento: o problema é tornar cenários e implicações operacionais, não atribuir ao seu arcabouço ausência de estrutura interna. A referência de Humphreys e Jacobs já apresenta avaliação de modelos por simulação posterior e ressalta a calibração dos p-valores preditivos. O achado de amostragem do presente piloto deve ser ligado a essa exigência, não usado para afirmar que qualquer LLM ou qualquer prompt necessariamente falhará.

# 8. Reprodução, verificação e limites

Foram realizadas 40 chamadas novas pelo Codex CLI autenticado no ChatGPT: quatro de descoberta, uma de seleção, 16 de confirmação, 14 de codificação e cinco de reparo de mensuração. Todas terminaram com resposta, sem chamadas de ferramentas pelos modelos geradores ou codificadores. O alias solicitado foi `gpt-5.6-sol`, com esforço `low`; as autorreferências variaram entre `UNKNOWN` e nomes genéricos. O alias não é um identificador imutável de pesos. Prompts, respostas, eventos, esquemas e metadados foram preservados.

As verificações independentes conferiram enumeração, massas multinomiais e Dirichlet-multinomiais, integração da hipótese comum, caudas inclusivas e correspondência do oráculo. A revisão de atribuição confrontou as conclusões com os comparadores. A reprodução das análises a partir dos arquivos preservados é determinística; novas chamadas ao serviço de IA podem produzir outros resultados. Os intervalos Monte Carlo da Tabela 1 não incluem toda a incerteza de novas gerações, escolha de prompt ou seleção de checks.

Arquivos principais no diretório deste relatório:

- `scripts/oracle.R`: benchmark congelado, sem acesso do gerador às condições defeituosas.
- `scripts/run_novel.py`: prompt aberto, descoberta, seleção e confirmação.
- `scripts/code_novel.py` e `scripts/repair_measurement.py`: códigos originais e correção documentada.
- `scripts/analyze.R`: cálculos, controles, sensibilidade e figura.
- `scripts/verify_run.py`: auditorias estruturais, hashes e concordância.
- `scripts/build_report.py`: formatação deste relatório a partir dos resultados.
- `agents/`: debate, seleção, auditoria probabilística, codificação independente e atribuição.

O `README.md` contém os comandos. Nenhum documento histórico foi tratado como uma observação independente para calibrar o simulador. As fontes BP e Fairfield–Charman já eram conhecidas; sua menção aqui é retrospectiva. O manuscrito principal e o suplemento permaneceram intactos.

**Referências e fontes consultadas.**

Fairfield e Charman. “Bayesian reasoning for qualitative replication analysis: examples from climate politics.” [Artigo](https://doi.org/10.1017/psrm.2025.16). Fonte para as hipóteses e o contexto do caso; os parâmetros deste piloto são sintéticos.

BP. Correspondência interna de 27–30 de janeiro de 2017. [Documento público, p. 1](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00052952.pdf). Arquivo PDF e extração textual preservados no pacote de fontes de 10 de outubro.

Humphreys e Jacobs. *Integrated Inferences*, capítulo 16. [Evaluating Models](https://integrated-inferences.github.io/book/16-evaluating-models.html). Consulta em 11 de outubro de 2026.

Gu et al. (2025). “Do LLMs Play Dice? Exploring Probability Distribution Sampling in Large Language Models for Behavioral Simulation.” [COLING](https://aclanthology.org/2025.coling-main.360/). Consulta em 11 de outubro de 2026. Referência metodológica sobre amostragem por modelos de linguagem, não validação deste modelo específico.
