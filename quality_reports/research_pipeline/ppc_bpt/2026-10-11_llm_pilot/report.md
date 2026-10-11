---
title: "IA como gerador de evidências para PPC"
subtitle: "Piloto executado com três braços no caso do carbono"
author: "Relatório metodológico para Manoel Galdino"
date: "11 de outubro de 2026"
lang: pt-BR
fontsize: 11pt
papersize: a4
geometry: margin=2.3cm
colorlinks: true
header-includes:
  - \usepackage{booktabs}
  - \usepackage{longtable}
  - \usepackage{float}
  - \floatplacement{figure}{H}
  - \usepackage{fancyhdr}
  - \pagestyle{fancy}
  - \fancyhf{}
  - '\fancyhead[L]{\small IA e PPC no caso do carbono}'
  - \fancyhead[R]{\small Piloto executado}
  - \fancyfoot[C]{\thepage}
  - \setlength{\headheight}{14pt}
  - \setlength{\emergencystretch}{3em}
---

# Resultado do piloto

Foi possível executar a sequência modelo causal, mundos replicados, documentos sintéticos, codificação e PPC. Foram gerados 192 mundos principais, com dois documentos por mundo: 64 pelo prompt probabilístico, 64 por sorteio em R seguido de redação pela IA e 64 pelos mesmos sorteios com templates. O desenho e as probabilidades foram registrados antes das gerações válidas. Os subagentes debateram o desenho e revisaram separadamente fontes, código, resultados, semântica e implicações.

A IA preservou os três indicadores nos 64 mundos do braço híbrido. A codificação recuperou também todos os indicadores dos outros dois braços. Isso é um resultado de fidelidade neste domínio simples. O prompt puro produziu frequências próximas das prescritas, mas este piloto não permite certificar sua calibração nem concluir que os desvios observados sejam viés do modelo. A amostra de referência em R também apresentou desvios, e cada chamada da IA gerou oito mundos potencialmente dependentes.

A avaliação de implicações adicionais foi mais exigente. Na chamada de descoberta, três sugestões reformularam o modelo, uma continha erros matemáticos e de unidade, e uma propunha uma hipótese auxiliar sobre produção documental. O exame dos textos também encontrou duas atribuições causais adicionais no braço de prompt puro, apesar da preservação dos indicadores. A IA demonstrou utilidade para produzir documentos e formular perguntas; um ganho científico sobre a referência sem IA ainda precisa ser demonstrado.

O piloto utiliza probabilidades deliberadamente sintéticas. As fontes fornecem a observação reduzida do caso, não os coeficientes do simulador. Portanto, os números abaixo não estimam as likelihoods históricas de SA e CA e não reproduzem o PPC do modelo original de Fairfield e Charman. Essa delimitação é necessária para não atribuir ao experimento uma solução do problema empírico que ele ainda não oferece.

# Das fontes ao modelo: origem de cada elemento

SA designa *Strategic Accommodation*: apoio a uma política onerosa para evitar alternativas ainda mais custosas. CA designa *Competitive Advantage*: apoio por benefícios líquidos associados a vantagens competitivas. O E3 publicado reúne participação das quatro empresas no CLC, o desenho do imposto, compensações regulatórias e jurídicas e contribuições financeiras. [Fairfield e Charman, pp.12–13](https://doi.org/10.1017/psrm.2025.16).

O piloto retém apenas a proposta de substituição regulatória e a adesão coletiva. Uma réplica continua sendo um mundo da coalizão de quatro empresas; as empresas não viram quatro observações independentes. Tampouco as duas peças documentais do mesmo mundo são réplicas independentes.

**Tabela 1. Origem da informação e papel na análise.** Os números do simulador são escolhas de teste e não resultados da leitura histórica.

| Elemento | Conteúdo | Origem e limite |
|---|---|---|
| $Q_{obs}=1$ | Proposta oferece substituir regulações de carbono | Relato de E3: regulações federais de fontes estacionárias. Proposta de alcance federal, não necessariamente apresentada pelo governo |
| $A_{obs}=1$ | Coalizão de quatro firmas adere | Participação e apoio político relatados em E3; não implementação do imposto |
| $K_{obs}=?$ | Ganho competitivo líquido esperado | Não observado diretamente para a coalizão; não codificar ausência documental como zero |
| Distribuição de $Q,K$ | Bernoulli(0,5), independentes | Escolha sintética para auditoria |
| Regra de adesão | Coeficientes 0,1 e 0,6 | Escolha sintética para criar dependências distintas |
| Prior | $P(SA)=0,5$ | Escolha didática; não prior publicado |
| Canal documental | Registro completo e fiel de estados | Simplificação forte; não estima arquivamento, ocultação ou busca |
| Codificação | Recuperar $Q,K,A$ a partir dos textos | Procedimento executado e auditado |

Uma leitura independente das fontes confirmou $(Q,A)=(1,1)$ e $K$ desconhecido. Preço inicial, cláusula de responsabilidade e financiamento ficaram fora da representação. O peso publicado de aproximadamente 12 dB refere-se ao E3 completo; ele não foi transferido ao evento reduzido.

O [email da BP de janeiro de 2017, p.1](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00052952.pdf), fornece um exemplo substantivo da importância de expectativas regulatórias: a possibilidade de evitar uma futura regra de emissões de refinarias era apresentada como benefício, temporariamente reduzido sob Trump. Isso informa um mecanismo e uma direção de mudança, mas não uma frequência de decisões da coalizão. A passagem desse documento aos coeficientes 0,1 e 0,6 não foi realizada nem alegada.

# Modelo causal de teste e três braços

Definimos $Q$ como oferta de substituição regulatória, $K$ como previsão de ganho competitivo líquido e $A$ como adesão coletiva. O desenho probabilístico é:

$$Q,K\overset{ind}{\sim}\operatorname{Bernoulli}(0,5),$$
$$P(A=1\mid SA,Q,K)=0,1+0,6Q+0,1K,$$
$$P(A=1\mid CA,Q,K)=0,1+0,1Q+0,6K.$$

As equações descrevem respostas de adesão a incentivos. Constituem uma operacionalização estilizada de respostas do tipo SA e CA, não as definições puras dos motivos históricos. Por exemplo, o modelo permite a configuração $K=1$ sob a regra chamada SA. Não se deve interpretá-lo como se tivesse identificado a motivação efetiva das empresas. As setas causais são premissas do experimento, não identificadas por essas distribuições.

$$ (H,Q,K)\longrightarrow A;\qquad
(Q,K,A)\longrightarrow(D_{\text{interno}},D_{\text{público}})\longrightarrow Y_{\text{codificado}}.$$

**Tabela 2. Probabilidade de adesão em cada configuração de incentivos.** Valores sintéticos congelados antes da geração.

| $Q$ | $K$ | $P(A=1\mid SA,Q,K)$ | $P(A=1\mid CA,Q,K)$ |
|---:|---:|---:|---:|
| 0 | 0 | 0,10 | 0,10 |
| 0 | 1 | 0,20 | 0,70 |
| 1 | 0 | 0,70 | 0,20 |
| 1 | 1 | 0,80 | 0,80 |

O apoio isolado tem probabilidade 0,45 sob ambas as regras. A diferença está nas dependências: $P(Q=1,A=1)$ é 0,375 sob SA e 0,25 sob CA; para $P(K=1,A=1)$ os valores se invertem. Assim, um simulador que acerte apenas a proporção geral de apoio pode perder a distinção substantiva do modelo.

**Tabela 3. Execução dos três braços.** Cada braço contém 32 mundos por hipótese, em quatro blocos de oito.

| Braço | Sorteio dos acontecimentos | Produção dos documentos | Contraste que permite |
|---|---|---|---|
| A: prompt puro | IA recebe distribuição conjunta e sorteia | Mesma chamada da IA | Auditar sorteio e redação |
| B: híbrido | R, seed 20261011 | IA recebe estados prontos, sem H | Separar sorteio de redação |
| C: referência | Mesmos estados de B | Templates determinísticos | Comparação pareada com B |

Cada memorando revela os três indicadores. A nota pública revela $Q,A$ e omite a avaliação interna $K$, por instrução. Essa diferença entre documentos é imposta; ela não pode ser anunciada como descoberta empírica. Os textos têm até 45 palavras. Os geradores também sugerem uma consequência adicional em campo separado, que não é promovida a fato do documento nem incorporada ao PPC principal.

Foram concluídas 31 chamadas pelo Codex CLI: 16 de geração principal, uma de controle determinístico, 13 de codificação e uma de descoberta. O modelo solicitado foi `gpt-5.6-sol`, esforço `low`, com autenticação ChatGPT. Nenhuma chamada válida usou ferramentas. Os logs registram 28.460 tokens de saída. O alias inicial `gpt-6-sol` foi recusado antes de produzir respostas; as 17 recusas e a emenda operacional estão preservadas. Não foi utilizado acesso por chave de API paga.

Não há snapshot imutável identificado nem seed de geração do LLM. Chamadas novas não receberam a conversa desta pesquisa nem fontes históricas como entrada. Pré-treinamento e instruções sistêmicas do ambiente não são controlados. A codificação recebeu somente textos com identificadores embaralhados. Gerador e codificador principal usaram o mesmo modelo, em chamadas separadas; isso permite erros compartilhados e não substitui avaliação humana.

# Exemplo completo: fonte, mundo, texto, posterior e PPC

O observado reduzido é $Y_{obs}=(Q=1,A=1)$, com $K$ desconhecido. A likelihood integra os dois valores possíveis de $K$:

$$P(Y_{obs}\mid SA)=0,5\,[0,5(0,7)+0,5(0,8)]=0,375,$$
$$P(Y_{obs}\mid CA)=0,5\,[0,5(0,2)+0,5(0,8)]=0,25.$$

Com prior igual, a atualização é:

$$P(SA\mid Y_{obs})=
\frac{0,5\times0,375}{0,5\times0,375+0,5\times0,25}=0,60.$$

A posterior de 60% pertence a este modelo sintético. Não é uma nova estimativa histórica nem a posterior publicada de aproximadamente 71,5%.

Na réplica real do piloto `B_SA_06`, R sorteou $(Q,K,A)=(1,0,1)$. Sob a regra SA, a adesão nessa configuração tem probabilidade 0,7. O LLM recebeu o estado pronto e produziu:

> SYNTHETIC — INTERNAL MEMO: The proposal offers replacement of overlapping command-and-control carbon rules. Although our assessment anticipates no net competitive gain, the four-firm coalition will collectively join the proposal.

> SYNTHETIC — PUBLIC NOTE: The proposal offers replacement of overlapping command-and-control carbon rules, and the four-firm coalition will collectively join it.

São textos efetivamente gerados, preservados sem revisão. O codificador recuperou $(1,0,1)$. A partir da dupla documental, o evento que corresponde ao observado reduzido é $Q=1,A=1$. Neste exemplo, $T^{rep}=Q+A=2$.

O check principal foi definido antes da geração como a cauda superior de $T(Q,A)=Q+A$, com $T_{obs}=2$. Para produzir a distribuição posterior preditiva, podemos sortear H com pesos 0,6 e 0,4 e então sortear o mundo. No piloto, fizemos a versão estratificada equivalente: 32 réplicas de cada H e ponderação pelas probabilidades posteriores. A referência exata, por enumeração, é:

$$p_{PPC}=P(T^{rep}\geq T_{obs}\mid Y_{obs})$$
$$=0,60\times0,375+0,40\times0,25=0,325.$$

O número 0,325 é a probabilidade preditiva de uma réplica alcançar o extremo superior desse escore. Ele não é a probabilidade de SA ser verdadeira, nem uma medida de erro causal, nem evidência de calibração histórica. Este check de dois indicadores num único caso tem pouco poder para diagnosticar inadequação. O resultado não mostra uma discrepância extrema nessa direção, condicionado às premissas sintéticas.

Há outro alvo legítimo: manter $Q^{rep}=1$ fixo e replicar apenas a adesão ao mesmo desenho de proposta. Nesse caso, as probabilidades são 0,75 e 0,50, e o PPC é $0,6(0,75)+0,4(0,50)=0,65$. Replicar o desenho da proposta e fixá-lo são perguntas diferentes. O desenho principal foi o primeiro; não escolhemos entre 0,325 e 0,65 depois de ver resultados.

# A IA respeitou as probabilidades e os estados?

**Tabela 4. Frequências efetivamente obtidas, frente ao modelo prescrito.** Denominador de 32 mundos por hipótese e braço. As frequências de C são idênticas às de B porque usam os mesmos estados.

| H | Evento | Alvo | A: prompt | B e C: R |
|---|---|---:|---:|---:|
| SA | $Q=1$ | 0,5000 | 0,5938 | 0,4063 |
| SA | $K=1$ | 0,5000 | 0,5000 | 0,4688 |
| SA | $A=1$ | 0,4500 | 0,5625 | 0,4688 |
| SA | $Q=A=1$ | 0,3750 | 0,4688 | 0,3125 |
| SA | $K=A=1$ | 0,2500 | 0,3750 | 0,2500 |
| CA | $Q=1$ | 0,5000 | 0,5000 | 0,4688 |
| CA | $K=1$ | 0,5000 | 0,5000 | 0,4375 |
| CA | $A=1$ | 0,4500 | 0,5000 | 0,4063 |
| CA | $Q=A=1$ | 0,2500 | 0,2813 | 0,2188 |
| CA | $K=A=1$ | 0,3750 | 0,4063 | 0,3438 |

O prompt puro colocou mais massa no apoio e em algumas conjuntas que o alvo. Isso é observável; concluir que há viés de amostragem exigiria outra evidência. A distância de variação total entre as oito células observadas e o alvo foi 0,15625 sob SA e 0,08750 sob CA no braço A. Nos sorteios R foi 0,16250 e 0,08125. Essas diferenças não demonstram superioridade de A ou B: são realizações pequenas. A garantia de B vem do algoritmo de sorteio especificado e auditado; a frequência de uma amostra finita não precisa igualar exatamente o parâmetro.

**Tabela 5. Reconstrução do PPC a partir das réplicas e dos documentos.** Todos os valores da coluna principal usam pesos 0,6/0,4 do modelo de referência. O braço A é uma aproximação do gerador pretendido, não um PPC exato de um modelo implícito conhecido.

| Origem | $\widehat P(Y\mid SA)$ | $\widehat P(Y\mid CA)$ | Mistura com pesos 0,6/0,4 |
|---|---:|---:|---:|
| Enumeração exata | 0,37500 | 0,25000 | 0,32500 |
| A: estados e documentos | 15/32 = 0,46875 | 9/32 = 0,28125 | 0,39375 |
| B: estados e documentos | 10/32 = 0,31250 | 7/32 = 0,21875 | 0,27500 |
| C: estados e documentos | 10/32 = 0,31250 | 7/32 = 0,21875 | 0,27500 |

Se interpretássemos as frequências empíricas de A como a likelihood de outro modelo, sua posterior plug-in seria 0,625 e seu PPC plug-in seria 0,3984375. Para B/C, os valores plug-in seriam aproximadamente 0,58824 e 0,27390. Esses cálculos não substituem a referência exata: reutilizam a mesma amostra Monte Carlo para estimar likelihood e previsão e ignoram incerteza adicional sobre o simulador implícito. Servem para tornar visível a exigência de compatibilidade entre posterior e gerador.

![Reconstrução preditiva do modelo sintético. Pontos distinguem estados gerados e códigos recuperados dos documentos; a linha tracejada é 0,325. As barras mostram percentis de 2.000 reamostragens de quatro chamadas por hipótese. São intervalos exploratórios condicionais à codificação, sem garantia de cobertura com tão poucos blocos.](results/ppc_reconstruction.png){width=100%}

O bootstrap de chamadas produziu intervalos exploratórios de 0,3375–0,4625 para A e 0,2000–0,3625 para B/C. A exclusão de 0,325 no primeiro intervalo não será usada como rejeição formal: há apenas quatro blocos por hipótese e nenhuma garantia de que esse bootstrap represente a distribuição real de chamadas do modelo. Repetir todos os documentos como se fossem observações independentes produziria precisão artificial.

Como referência de tamanho amostral, executamos adicionalmente 100.000 amostras multinomiais hipotéticas com 32 mundos iid por hipótese. Os quantis centrais de 95% da mistura foram 0,2125–0,44375. Uma enumeração independente dos dois totais binomiais confirmou esses limites e mostrou que cerca de 27,35% das amostras iid teriam erro absoluto pelo menos tão grande quanto o observado em A. Esse benchmark adicional não é um p-valor válido para saídas do LLM; indica por que o desvio de 0,06875, isoladamente, não demonstra falha.

Na fidelidade factual, os três braços recuperaram 64/64 vetores; os 576 bits principais foram recuperados corretamente. B copiou corretamente todos os estados recebidos de R. Não houve IDs extras, gerações ausentes ou textos acima do limite de palavras. O controle determinístico respeitou os quatro estados com probabilidades zero/um. Os três controles de codificação foram reconhecidos: duas contradições e uma avaliação competitiva desconhecida. Um subagente separado codificou cegamente 16 pares, incluindo um controle, sem discordância com o codificador principal. Não houve codificação humana.

Esses acertos não garantem fidelidade causal da linguagem. Em `A_CA_09`, o texto usou “therefore” para ligar ausência de ganho à não adesão. Em `A_CA_28`, usou “so” na mesma ligação. O estado e uma regra probabilística não determinam o motivo realizado naquele episódio. O codificador de três bits aceita os textos porque os fatos permanecem corretos. A leitura semântica encontrou essas duas atribuições adicionais entre 64 mundos de A; não encontrou equivalentes explícitos nos 64 mundos de B. Não se deve generalizar esse resultado a documentos complexos.

# O que a IA acrescentou como implicações

Uma chamada independente recebeu somente o modelo e contexto genérico, sem resultados do caso, e apresentou cinco implicações. O resultado foi auditado com enumeração independente e cotejo com as fontes já conhecidas.

**Tabela 6. Auditoria das cinco implicações da chamada de descoberta.** A unidade válida é o mundo com decisão coletiva, não a firma individual.

| ID | Proposta da IA | Avaliação |
|---|---|---|
| I1 | Comparar configurações discordantes de $Q,K$: 0,7 versus 0,2 | Conta correta; troca indevida de mundos por firmas. É substituição direta na regra |
| I2 | Alterar Q mantendo K constante | Dedução correta dos coeficientes; útil como roteiro de comparação, sem novidade substantiva |
| I3 | Alterar K mantendo Q constante | Dedução correta; mesma limitação |
| I4 | Composição dos aderentes em Q e K | Erros numéricos, inconsistência interna e unidade errada. Rejeitada na forma gerada |
| I5 | Ênfase relativa de motivos nos documentos | Hipótese auxiliar plausível, mas exige modelo de escrita, seleção e codificação |

I4 mostra um risco concreto. Sob SA, os valores corretos são $P(Q=1\mid A=1)=0,375/0,45=5/6$ e $P(K=1\mid A=1)=0,25/0,45=5/9$. A IA apresentou outros valores e um raciocínio que não concordava com a própria conclusão. Como a resposta original foi preservada, essa falha pode ser inspecionada e reproduzida como objeto de avaliação.

I5 pode ajudar a formular uma busca: procurar justificativas contemporâneas em atas e avaliações internas e distinguir alívio regulatório de benefícios competitivos. Entretanto, coeficientes na regra de adesão não são automaticamente intensidade de linguagem ou pesos de utilidade. A ideia precisa de uma ponte entre motivação, registro e acesso ao documento. Neste piloto, a própria instrução omite K das notas públicas, impedindo tratar essa diferença textual como descoberta.

Além das cinco sugestões, cada mundo A/B produziu uma hipótese adicional separada do documento: 128 candidatas arquivadas. A segunda auditoria leu todas e atribuiu um tema primário a cada uma: 67 sobre linguagem e justificativas; 26 sobre obstáculos e não adesão; 21 sobre negociação e emendas; 14 sobre planejamento e recursos. O mapa de IDs foi conferido, sem duplicatas ou omissões. As duas candidatas mais concretas foram debatidas com o revisor adversarial.

\newpage

**Tabela 7. Duas implicações adicionais úteis para formular buscas.** Não são acontecimentos observados nem previsões já calibradas.

| Candidata e origem | Observação a buscar | Premissas e situação nas fontes |
|---|---|---|
| `B_SA_24`: resistir a emendas que enfraqueçam a substituição regulatória | Emenda datada e reação documentada da coalizão, comparando as demais alterações no pacote | Exige oportunidade, monitoramento e incentivo para reagir. O original usa “may”, que precisa virar previsão definida. Nenhuma reação específica foi confirmada |
| `A_CA_11`: pedir cronograma para retirar regras sobrepostas | Submissão formal ou negociação que solicite datas e condições de retirada | Exige que preferências de implementação gerem essa demanda específica. Não confundir retirada de regras, prevenção de regras futuras e interoperabilidade |

Ambas foram propostas em mundos $(Q,K,A)=(1,1,1)$, apesar de rótulos H distintos. Portanto, não discriminam SA e CA automaticamente. Poderiam motivar checks de adequação de uma hipótese auxiliar compartilhada ou comparações posteriores, desde que se especifique por que e com que probabilidade cada mecanismo produziria a ação.

O documento [API2021, p.1](https://www.api.org/~/media/files/news/2021/03/api-isf-on-carbon-pricing3_20_21), permite preempção ou interoperabilidade para reduzir duplicação; não registra a reação a uma emenda nem o cronograma específico sugerido. O email BP2017 trata de evitar uma regra futura, o que é distinto de retirar uma regra em vigor. O confronto delimita exatamente o que procurar, sem transformar a sugestão em confirmação. O documento [BP2019, pp.1–2](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00278794.pdf), mostra estratégias de política e comunicação em outro contexto, sem identificar o comportamento previsto para a coalizão em 2017.

A leitura integral encontrou também inferências indevidas nas candidatas: em `A_CA_16`, supor que participação produz um pacote de advocacy não permite concluir que ausência de participação produz ausência do pacote; em `B_SA_08`, observar $(1,0,1)$ não estabelece suficiência causal do alívio regulatório; em `B_SA_30`, ganho competitivo líquido nulo não exclui argumentos competitivos positivos compensados por perdas. Essas propostas permaneceram fora do corpus factual e do PPC.

Há, portanto, utilidade demonstrada de formulação de perguntas concretas. Não há demonstração de originalidade científica, confirmação histórica ou capacidade adicional de diagnóstico. A seleção das duas melhores entre 128 candidatas é exploratória e não constitui uma taxa de acerto em teste independente.

# O que o piloto implica para o método e o paper

O braço híbrido fornece a arquitetura mais controlável para a próxima etapa: um programa sorteia o processo causal e documental; a IA produz manifestações linguísticas; uma codificação separada recupera os observáveis; o PPC compara os dados reais com a distribuição produzida. Aqui o programa probabilístico e os documentos são deliberadamente simples. O experimento demonstrou execução e preservação de indicadores, sem demonstrar que linguagem natural acrescente poder diagnóstico sobre templates.

A exigência científica para a IA é mais alta que produzir histórias convincentes. É necessário mostrar que sua contribuição ao canal documental permite detectar uma falha substantiva que o controle sem IA perde, mantendo baixo risco de inventar motivos. Isso requer modelar também quem conhece o quê, por que registra ou omite, como documentos sobrevivem e como são encontrados. Os parâmetros desse canal demandam evidência externa ou análise de sensibilidade, como os parâmetros comportamentais.

Para consequências novas, o procedimento defensável é: registrar a sugestão, identificar suas premissas extras, verificar deduções em código, congelar a codificação e procurar informação ainda não usada. As fontes deste piloto já eram conhecidas. Nenhuma correspondência retrospectiva é validação em holdout, e estabilidade entre duas amostras do mesmo LLM não valida a história.

Há antecedentes para cada parte. Humphreys e Jacobs já discutem avaliação preditiva em modelos causais de inferência integrada, incluindo evidência qualitativa; a novidade não deve ser anunciada como inventar PPC no BPT. [Integrated Inferences, capítulo 16](https://integrated-inferences.github.io/book/16-evaluating-models.html). Gu e colegas distinguem compreensão de probabilidades de capacidade de amostragem e encontram dificuldades nos modelos que testam. Isso justifica a auditoria de sorteios, mas não determina o desempenho deste modelo específico. [Gu et al., COLING 2025](https://aclanthology.org/2025.coling-main.360/).

O problema destacado no parecer anterior pelo framework Edmans permanece parcialmente aberto: probabilidades históricas não justificadas não se tornam justificadas porque a IA gera textos coerentes com elas. O avanço desta rodada é transformar uma proposta abstrata em um experimento reproduzível, com um resultado positivo restrito e falhas observáveis. Ainda faltam identificação ou fundamentação das likelihoods históricas, diagnóstico demonstrado em material independente e ganho sobre o controle sem IA para sustentar uma contribuição forte a Political Analysis.

Uma sensibilidade analítica adicional preservou a forma das regras, variando o intercepto entre 0 e 0,2 e o coeficiente dominante entre 0,3, 0,6 e 0,8, mantendo o menor em 0,1 e excluindo probabilidades acima de um. Nos oito cenários admissíveis, o PPC conjunto variou de aproximadamente 0,1542 a 0,4073. Essa faixa não é um intervalo identificado pelas fontes; são cenários de escolha do analista. Ela mostra que a regularidade da redação não resolve a incerteza sobre os parâmetros substantivos.

# Reprodução e limites da entrega

`model.R` gera estados e enumera probabilidades; `analyze.R` calcula métricas, PPC e bootstrap; `run_pilot.py` conserva prompts e respostas; `verify_run.py` audita completude, estados, controles e hashes. Os cálculos ficam separados deste documento. Os dados brutos e os resultados de todas as chamadas estão preservados. O script de geração não substitui resultados existentes; uma nova replicação deve usar outra pasta.

São reproduzíveis a análise dos arquivos preservados e os sorteios R com seed declarado. Novos textos do LLM podem mudar, mesmo com o mesmo alias e prompt. O pequeno tamanho, a geração de oito mundos por chamada, a falta de calibração humana do codificador, os documentos curtos e a ausência de seleção documental limitam a generalização. A auditoria causal de linguagem foi adicional à recuperação dos indicadores e não deve ser confundida com um benchmark amplo preregistrado.

O manuscrito original não foi alterado. A entrega é um piloto e um relatório de seus resultados, não uma versão de artigo pronta para submissão.
