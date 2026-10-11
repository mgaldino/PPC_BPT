# Auditoria independente da seleção de implicações

Data: 11 de outubro de 2026. Agente: `redo_design`.

## Escopo e decisão

Inspecionei o protocolo, o prompt gerador, os 16 documentos/candidatos em `data/discovery_corpus.json` e a saída integral de `raw/select_checks/answer.json`. Não consultei resultados de desempenho do benchmark. Esta auditoria não altera a seleção primária congelada: permanece apenas `check_1`, relação entre tipo de choque e decisão interna posterior.

O indicador escolhido é admissível como consequência composta não enumerada. Combina a informação recebida, o canal de benefício relevante, o custo e a decisão. Seus componentes podem ser codificados sem conhecer a hipótese geradora. A previsão positiva enunciada pelo seletor é específica de CA; o mesmo indicador tem previsão inversa sob SA, que precisa ser representada no kernel correspondente. Não se deve aplicar a ordenação CA às duas hipóteses.

O seletor rejeitou uma candidata potencialmente não redundante (`discovery_SA_02_02`). A razão dada, redundância com a decisão interna e simples repetição do limiar, é incompleta: a candidata prevê **anúncios públicos** condicionados ao choque, compostos por dois processos com erro, enquanto o check escolhido mede apenas a decisão interna. Um processo de comunicação pode mudar sem alterar esse check. Esse achado não autoriza trocar o check, acrescentá-lo depois de conhecer os defeitos nem escolher o menor p. Autoriza registrar que a seleção automática pode perder informação útil e preparar uma avaliação posterior independente.

## Auditoria de todos os candidatos

| Candidato | Decisão do seletor | Auditoria | Justificativa independente |
|---|---|---|---|
| `discovery_CA_01_01` | Excluir | CONFIRMADA | Frequências de explicações internas exigem uma regra de escolha de conteúdo ou uma premissa de franqueza que não está no modelo. Nondisclosure de números, isoladamente, já é explícita. |
| `discovery_CA_01_02` | Incluir | CONFIRMADA | Primeira relação admissível entre conteúdo do choque e decisão posterior, reunindo premissas para construir uma tabela observável. A exigência de documentos comparáveis é satisfeita no cenário sintético, sem validar disponibilidade histórica. |
| `discovery_CA_01_03` | Excluir | DEFENSÁVEL, LIMÍTROFE | Contradição interna–pública é mensurável, mas a probabilidade do contrário e sua independência já são explicitadas no prompt. A exclusão é coerente com o veto a repetir fidelidade e independência. Não implica que o indicador seria inútil. |
| `discovery_CA_01_04` | Excluir | CONFIRMADA | Reexprime uma célula da relação escolhida e a regra de payoff no suporte limitado do cenário. Não acrescenta um observável independente. |
| `discovery_CA_02_01` | Excluir | CONFIRMADA | A relação choque/retirada já está coberta. Frequência relativa de temas discutidos não é estabelecida pelo modelo de escrita e confidencialidade de números já é dada. |
| `discovery_CA_02_02` | Excluir | CONFIRMADA | Descreve a célula choque regulatório/apoio do indicador selecionado. |
| `discovery_CA_02_03` | Excluir | DECISÃO DEFENSÁVEL; JUSTIFICATIVA PARCIAL | O limiar de decisão está explícito. A alegação do seletor de que não existem valores dos dois lados do limiar no corpus é imprecisa: há benefícios relevantes 2 e 12, abaixo e acima do custo 6. Dois valores, entretanto, não identificam empiricamente uma descontinuidade contra uma resposta suave. |
| `discovery_CA_02_04` | Excluir | CONFIRMADA | Reúne a relação selecionada com calendário e ausência pública de números, ambos dados. |
| `discovery_SA_01_01` | Excluir | CONFIRMADA | Fornece a ordenação SA para o mesmo tipo de choque × decisão. Deve informar o kernel SA do check existente, não contar como um segundo indicador. |
| `discovery_SA_01_02` | Excluir | CONFIRMADA NO NÚCLEO | A ausência de associação entre choque competitivo e retirada sob SA pertence ao mesmo indicador. O comentário sobre registros públicos é menos operacionalizado que a candidata SA_02_02 e remete à informação privada explícita. |
| `discovery_SA_01_03` | Excluir | CONFIRMADA | Reexpõe limiar SA e exceções do processo de reversão já estabelecido. |
| `discovery_SA_01_04` | Excluir | CONFIRMADA | Reexpõe a probabilidade de reversão e sua independência. Seria útil como teste de fidelidade do simulador, mas não satisfaz a definição restrita de nova implicação. |
| `discovery_SA_02_01` | Excluir | CONFIRMADA | Mesma relação choque/decisão sob SA, acrescida da privacidade de números já especificada. |
| `discovery_SA_02_02` | Excluir | PARCIAL; REDUNDÂNCIA NÃO CONFIRMADA | Liga choque regulatório a retirada anunciada publicamente. O anúncio resulta da composição de decisão e comunicação. Não é determinado pelo check interno e pode carregar informação adicional sobre o canal documental. Combina mais de uma premissa, é codificável sem H e está proposta no corpus. |
| `discovery_SA_02_03` | Excluir | CONFIRMADA | Cobre a célula choque competitivo/apoio sob SA e acrescenta apenas confidencialidade explícita dos números. |
| `discovery_SA_02_04` | Excluir | DEFENSÁVEL | A parte informativa sobre choque/apoio já está coberta; a sequência fixa de datas, omissão de números e erro ocasional repetem premissas. A candidata não operacionaliza uma nova dependência específica além dessas partes. |

## Implicações para a análise e a conclusão

1. Preservar `check_1` como única seleção primária e documentar a data de congelamento do codebook.
2. Não interpretar falta de detecção de uma falha de comunicação como incapacidade geral da IA de formular uma consequência documental. O corpus contém ao menos uma candidata pública que o filtro excluiu de forma contestável.
3. A candidata pública pode ser citada como achado qualitativo da auditoria e hipótese para outro piloto. Calcular retrospectivamente seu poder e usá-lo como resultado confirmatório contaminaria a seleção. Se algum cálculo exploratório for solicitado, precisa ser separado do resultado primário e explicitamente rotulado.
4. As 16 candidatas não são 16 descobertas independentes: foram propostas em quatro chamadas, muitas são duplicatas e diversas repetem premissas. Um indicador retido mede rendimento do pipeline sob uma regra restritiva, não o universo de implicações do mecanismo.
5. A novidade reivindicável continua sendo observacional e operacional em relação ao prompt inicial. As relações seguem logicamente do mecanismo sintético estabelecido. Sua formulação pela IA não funda probabilidades históricas nem demonstra inovação científica.

## Limite da auditoria

Esta é uma adjudicação humana simulada por agente independente, não um painel de pesquisadores humanos. A classificação de novidade contém julgamento. A ambiguidade em SA_02_02 é precisamente um resultado desse julgamento e deve permanecer visível, sem ser resolvida por desempenho no benchmark.

## Adendo: congelamento de análise secundária exploratória

Registro de tempo: **2026-10-11 12:00:28 UTC / 09:00:28 America/Sao_Paulo**. A análise primária permanece com um único check. Após receber o achado acima, o coordenador decidiu acrescentar uma análise secundária de `discovery_SA_02_02`, com rótulo exploratório e origem explícita na auditoria independente por agente. Nesse momento, este auditor não havia lido gerações de confirmação nem resultados de desempenho do benchmark. A inclusão não altera os defeitos nem substitui a seleção primária.

A justificativa é a não equivalência dos observáveis, independentemente de seu eventual poder. Denotando retirada interna por `W_int` e erro de comunicação por `C`, a retirada pública é `W_pub = W_int XOR C`. Como `C` é aleatório, `(choque, W_pub)` não é uma função determinística de `(choque, W_int)`. No modelo correto, a relação entre probabilidades é `P(W_pub=1|choque) = .05 + .90 P(W_int=1|choque)`. Essa igualdade de expectativas sob o modelo não torna os dados públicos redundantes: eles permitem confrontar a composição entre decisão e comunicação.

A inclusão foi congelada depois de conhecer o desenho geral do benchmark, embora antes de seus resultados. Portanto, a análise secundária não é validação confirmatória independente da escolha do check. Seu valor será apresentar uma sensibilidade motivada por auditoria da classificação de novidade. O relatório deve distinguir **pipeline com seleção automática** e **pipeline após auditoria independente por agente**, sem atribuir a revisão a um pesquisador humano que não a realizou.
