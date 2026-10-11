# Debate e auditoria do desenho

Data: 11 de outubro de 2026. Agente responsável: `redo_design`.

## Escopo da inspeção

Foram lidos `protocol.md` e `scripts/run_novel.py` antes da seleção de implicações. Esta nota não utiliza resultados do benchmark nem propõe alterações a seus defeitos. Nenhuma análise foi implementada pelo agente de desenho.

## Propostas debatidas

`redo_design` propôs separar descoberta de implicações, confirmação em novas gerações e avaliação independente. A proposta também distinguiu três comparadores: templates originais, IA aberta e templates ampliados com os indicadores descobertos.

`redo_identification` confirmou que a extensão coerente é `p(D,R|H)=p(D|H)g(R|H,D)`: o kernel documental é normalizado, preserva a likelihood inicial e o posterior obtido de D. Observáveis R usados para avaliar ficam fora dessa atualização. Propôs estimar o kernel conjunto em gerações novas, com o mesmo prompt de geração e sem revelar ao gerador os checks descobertos. Ressaltou que frequências assim obtidas pertencem ao simulador, não à história real.

`redo_validation` exigiu congelar o benchmark antes de observar as candidatas e não construir defeitos para favorecer o que a IA descobrir. Também observou que o cenário nulo deve fornecer os fundamentos estruturais usados pelo oráculo: exigir uma resposta dependente de uma premissa omitida produziria uma falha artificial. Diferenciou número de mundos da IA, dependência dentro de chamadas e número de conjuntos simulados em R.

Os três agentes concordaram que novos observáveis ausentes do template original são **não especificados**, não zeros. Os templates ampliados são uma ablação: se utilizarem o mesmo kernel conjunto e os mesmos indicadores, sua igualdade com os textos da IA será esperada. A comparação pode mostrar valor da descoberta e ampliação dos checks, mas não demonstrará vantagem da redação livre por si só.

## O que pode ser chamado de novo

O prompt não enumera as consequências documentais a selecionar. Entretanto, explicita payoffs, choques, regra de decisão, calendário e mecanismo de comunicação. As consequências admissíveis serão **consequências compostas não enumeradas, derivadas desses fundamentos explícitos**. Isso é uma novidade em relação à lista inicial de observáveis, não uma descoberta científica nem identificação de uma nova relação causal histórica.

O pedido ao gerador inclui explicitamente propor uma implicação. Logo, eventual resultado é descoberta assistida e solicitada de consequências; não deve ser descrito como surgimento totalmente espontâneo de uma teoria no texto. Uma consequência pode combinar duas premissas sem constituir um mecanismo novo.

A consequência que depende de uma premissa adicional sem modelo precisa ser rejeitada ou classificada como sugestão de pesquisa fora do PPC. Exemplos de extrapolações indevidas seriam deduzir que executivos necessariamente pedirão uma emenda, financiarão determinada campanha ou publicarão certas justificativas quando tais ações não integram as escolhas modeladas. A possibilidade narrativa de uma ação não estabelece sua frequência.

## Inspeção do desenho congelado

O protocolo resolve a circularidade do piloto anterior: os documentos não recebem um vetor de indicadores sorteado e o gerador de confirmação não recebe o codebook descoberto. A seleção ocorre em contexto novo com prompt e corpus de descoberta. O limite de três checks e a ordem de ocorrência restringem seleção por conveniência.

A ordem definida no runner é a ordem lexicográfica dos pedidos e, depois, a ordem dos mundos. Portanto, a seleção não representa uma busca exaustiva por todos os checks úteis. Esse é um limite deliberado, que deve ser relatado sem substituir posteriormente os selecionados por candidatos que combinem melhor com os defeitos do benchmark.

A regra de admissibilidade exige ao menos duas premissas e exclui simples repetição de datas, sigilo, fidelidade marginal e regra de decisão. Esse filtro é necessário, mas não basta para afirmar novidade substantiva: a auditoria deverá verificar se a relação conjunta selecionada acrescenta uma função observável ao PPC, se é não redundante com as demais e se permanece computável sem saber H.

O kernel empírico pode ser esparso. Consequências lógicas verdadeiras não garantem que suas frequências amostradas sejam calibradas. Uma IA que gere todas as decisões mais prováveis e quase nenhum erro poderá produzir implicações pertinentes e, simultaneamente, um PPC excessivamente severo. O desempenho contra o nulo congelado deve ser apresentado mesmo quando desfavorável.

## Auditoria após seleção

Sem alterar os checks, verificar todos os candidatos e registrar: presença real no corpus; ordem de ocorrência; combinação de premissas; premissa extra; disponibilidade documental; possibilidade de codificação sem H; redundância; razão de inclusão ou exclusão. A auditoria poderá concluir que um check escolhido é apenas parcial ou inadmissível. Nesse caso, o relatório deverá mostrar a limitação e a sensibilidade pertinente, sem substituí-lo por outro selecionado após conhecer os defeitos.

O tratamento de dúvida, ausência e contradição deve estar operacionalizado antes da confirmação e do PPC. Uma descrição em texto livre do indicador precisa ser convertida em categorias reproduzíveis; isso é operacionalização do check congelado, não autorização para alterar sua hipótese.

## Conclusão do debate

O desenho permite testar se a IA acrescenta checks não enumerados e se eles detectam incompatibilidades que o template original não representa. A versão ampliada dos templates discrimina esse ganho da mera geração de prosa. O piloto permanece um teste sintético de operacionalização; as fontes históricas conhecidas permitem apenas aplicação retrospectiva exploratória.
