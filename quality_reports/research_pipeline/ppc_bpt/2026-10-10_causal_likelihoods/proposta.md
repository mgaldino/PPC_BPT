---
title: "Das fontes às likelihoods causais no BPT"
subtitle: "O que conseguimos calcular, a informação que falta e como obtê-la"
author: "Síntese coordenada para Manoel Galdino"
date: "10 de outubro de 2026"
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
  - \fancyhead[L]{\small Likelihoods causais e PPC}
  - \fancyhead[R]{\small Fontes, identificação e elicitação}
  - \fancyfoot[C]{\thepage}
  - \setlength{\headheight}{14pt}
  - \setlength{\emergencystretch}{3em}
  - \newcommand{\keepblock}[1]{\par\ifdim\dimexpr\pagegoal-\pagetotal\relax<#1\relax\newpage\fi}
---

# Resultado e fronteira da entrega

O exemplo anterior substituiu o problema por um modelo de assinaturas. Isso não construiu as likelihoods causais exigidas pelo BPT. Nesta rodada preservamos SA e CA, seus contextos e o evento analisado por Fairfield e Charman. **Não obtivemos das fontes examinadas duas probabilidades pontuais empiricamente fundamentadas.** Entregar números como 0,80 e 0,05 continuaria exigindo um julgamento que não foi medido nem elicitado.

O avanço concreto tem quatro partes: localizamos fontes internas que ancoram mecanismos; reconstruímos a posterior publicada; derivamos toda uma família de likelihoods SA/CA normalizadas e seus PPCs; identificamos exatamente a informação adicional que fecharia essa família. O exemplo chega à distribuição replicada e ao envelope do check, cujo resultado é inconclusivo quanto ao ajuste. Não é uma aplicação empírica discriminante concluída.

Dez contribuições, em rodadas com debate, examinaram fontes, identificação, elicitação, escolha estrutural, calibração empírica, normalização, crítica adversarial, literatura, implementação e revisão independente. Consenso entre agentes não substitui evidência. O manuscrito permaneceu intacto.

# O que as fontes permitem afirmar

SA designa apoio motivado principalmente por evitar políticas regulatórias mais custosas; CA, apoio motivado principalmente por ganhos competitivos e oportunidades. São hipóteses contextualizadas, não rótulos de empresas invariantes. A comparação original é agregada: sua posterior não pode ser transportada automaticamente para a motivação de uma firma. [Fairfield e Charman, seção 5](https://doi.org/10.1017/psrm.2025.16).

O apêndice original distingue ainda $H_R$: apoio reputacional a uma política percebida como inviável. Isso difere de SA orientada a assegurar a alternativa menos custosa. Assim, uma fala sobre a utilidade comunicacional de uma proposta que não seria aprovada não se torna automaticamente um indicador de SA. Incluir $H_R$ requer recalcular comparações; não se pode conservar silenciosamente o peso de 71,5% da comparação binária. [Apêndice A.3, pp. 3–4](https://static.cambridge.org/content/id/urn%3Acambridge.org%3Aid%3Aarticle%3AS2049847025000160/resource/name/S2049847025000160sup001.pdf).

\keepblock{15\baselineskip}

**Tabela 1. Auditoria fonte → informação → lacuna.** As fontes foram abertas pelo coordenador e preservadas integralmente; nenhuma linha equivale a uma estimativa de frequência causal.

| Fonte | Informação observada ou reportada | O que continua faltando |
|---|---|---|
| BP, email de janeiro de 2017, p. 1 | O benefício do imposto é ligado a evitar futura regra para refinarias; esse benefício diminui sob Trump | Payoffs completos, probabilidade da ameaça e regra que converte incentivo em apoio |
| BP, Washington, pp. 1–2 | Oposição à I-1631, gastos e perdas projetadas; promoção simultânea de outro desenho de cap-and-trade | Comparação completa com rivais e alternativas; probabilidade de escolha |
| API, princípios de 2021, p. 1 | Preempção ou interoperabilidade; políticas complementares de inovação | Taxas dessas manifestações condicionadas aos mecanismos |
| FC, E3, pp. 12–13 | Evento composto relatado e peso de 12 dB para SA | Escala absoluta da probabilidade do mesmo evento |

O [email BP](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00052952.pdf) é evidência direta de um raciocínio defensivo, mas não mede sua frequência em mundos SA. O [documento de Washington](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00278794.pdf) informa US$13 milhões de oposição à I-1631 e reduções projetadas de RCOP de cerca de US$38 milhões em 2020 e US$137 milhões em 2035. Gasto e projeções anuais não são probabilidades, nem identificam o benefício competitivo líquido. O mesmo documento registra promoção de cap-and-trade; CA não significa apoiar qualquer desenho de precificação.

A [API](https://www.api.org/~/media/files/news/2021/03/api-isf-on-carbon-pricing3_20_21) não exige substituir toda a regulação. Sua formulação admite interoperabilidade e complementos. Essa correção importa antes de qualquer cálculo: probabilidades bem calculadas sobre uma evidência mal codificada não resolvem o problema.

# Exemplo E3: da fonte à família de PPCs

## Manter o evento e reconstruir a posterior

O E3 original reúne participação de Exxon, ConocoPhillips, Shell e BP no CLC em 2017; proposta de imposto começando em US$40/t, substituição de regras federais para fontes estacionárias e proteção de responsabilidade no plano inicial; contribuições reportadas de US$1 milhão da Exxon e US$2 milhões da ConocoPhillips. Conservamos **o pacote inteiro tal como avaliado pelos autores**, inclusive seus detalhes. Não transferimos seu peso a apenas uma cláusula ou ao episódio API. Seja $Y=1$ a ocorrência desse evento e $Y=0$ seu complemento exato. A escolha retrospectiva de um pacote tão específico limita o uso substantivo de um check de raridade; aqui ele serve para auditar a identificação da previsão.

Os julgamentos centrais publicados, com sinal positivo para SA, são:

$$6-4-3+12-7=4\ \mathrm{dB}.$$

Logo, as odds posteriores são $10^{4/10}$ e:

$$w=P(SA\mid D)=\frac{10^{0{,}4}}{1+10^{0{,}4}}=0{,}715252751.$$

Os números 6, 4, 3, 12 e 7 são **julgamentos publicados**, não frequências extraídas dos documentos. Reproduzir a conta não valida esses julgamentos. As casas decimais indicam precisão aritmética, não precisão substantiva.

O apêndice B.1 explicita condicionamento sequencial: o peso de uma evidência depende das anteriores. Portanto, use $C=(E_0,E_1,E_2)$ como prefixo conhecido ao avaliar E3. Os 12 dB de E3 significam:

$$r=\frac{P(Y=1\mid SA,C)}{P(Y=1\mid CA,C)}=10^{12/10}=15{,}848931925.$$

## A likelihood que o peso publicado não determina

Escreva $t=P(Y=1\mid CA,C)$. Toda a tabela abaixo é compatível com esse mesmo peso:

\keepblock{9\baselineskip}

**Tabela 2. Família normalizada de likelihoods causais.** $t$ é a escala ainda desconhecida; não escolhemos um valor central.

| Resposta | Sob SA | Sob CA |
|---|---:|---:|
| $Y=1$: E3 ocorre | $rt$ | $t$ |
| $Y=0$: complemento de E3 | $1-rt$ | $1-t$ |
| Soma | 1 | 1 |

A coerência exige $0<t\leq1/r=0{,}063095734$. Cada $t$ define uma especificação fixa distinta. O fator $t$ cancela no Bayes factor observado; mantendo os demais likelihood ratios condicionais, a posterior publicada permanece a mesma. Não atribuímos um prior uniforme a $t$. Se $t$ fosse tratado como parâmetro aleatório, seria necessário declarar e atualizar seu prior.

## Gerar a réplica causal e calcular o PPC

Para cada especificação fixa $t$, o gerador é:

1. Sortear $H^{rep}$ da posterior: SA com probabilidade $w$, CA com $1-w$.
2. Se SA, sortear $Y^{rep}\sim\operatorname{Bernoulli}(rt)$; se CA, sortear $Y^{rep}\sim\operatorname{Bernoulli}(t)$.
3. Comparar $T(Y^{rep})$ com $T(Y_{obs})$, usando $T(Y)=Y$ e $Y_{obs}=1$.

É um **PPC condicional in-sample**: E3 já integra $D$. Fixamos o prefixo $C$ e acrescentamos o auxiliar de que a nova emissão é independente da original e de E4, dados $H,C,t$. Esse gerador é uma reconstrução explícita nossa, não um procedimento já executado pelos autores. Se esse auxiliar não for aceitável, a família precisa ser reformulada.

Enumerando as duas respostas, sem Monte Carlo:

$$\begin{aligned}
p_{PPC}(t)
&=P\{T(Y^{rep})\geq T(Y_{obs})\mid D,C,t\}\\
&=wrt+(1-w)t\\
&=[wr+(1-w)]t.
\end{aligned}$$

Portanto:

$$\boxed{0<p_{PPC}\leq w+(1-w)/r=0{,}733219088.}$$

O fecho do conjunto é **[0; 73,32%]**. Zero é limite, não uma especificação que atribui probabilidade zero à evidência observada e ainda consegue atualizar. A mesma posterior de SA/CA e o mesmo peso do E3 admitem desde um evento arbitrariamente raro até uma ocorrência bastante esperada.

Esse resultado não demonstra que SA ou CA ajustam mal. Demonstra que a informação relativa publicada não escolhe um PPC. Nem toda probabilidade pequena de um pacote detalhado é uma discrepância substantivamente relevante. Granulação, protocolo de observação e estatística precisam de justificação própria.

![Família de checks condicionais para o E3 original. Cada ponto da curva é uma especificação possível, não uma estimativa ou uma resposta de especialista. O Bayes factor e a posterior das hipóteses permanecem constantes; varia a escala absoluta ainda não fundamentada.](results/ppc_family.png){width=92%}

# Como fechar as probabilidades sem esconder a escolha

Para o alvo binário, falta **um escalar adicional**, se aceitarmos o Bayes factor central. Há duas formas equivalentes de fornecê-lo.

**Âncora absoluta.** Estimar ou elicitar $a=P(Y=1\mid SA,C)$, com intervalo e proveniência. Então $b=a/r$. Se a única informação defensável for $a\in[a_L,a_U]$, o conjunto exato é:

$$p_{PPC}\in\left[\left(w+\frac{1-w}{r}\right)a_L,
\left(w+\frac{1-w}{r}\right)a_U\right].$$

Isso não exige escolher uma média artificial. A incerteza do próprio $r$ também deverá ser propagada; manter os valores centrais aqui é uma condição da demonstração.

**Peso do complemento.** Se houver fundamento para $r_0=P(Y=0\mid SA,C)/P(Y=0\mid CA,C)$, então:

$$b=\frac{1-r_0}{r-r_0},\qquad a=r\frac{1-r_0}{r-r_0}.$$

Para $r>1$, coerência requer $0\leq r_0<1$. Não se pode impor $r_0=1/r$: isso acrescenta uma simetria sem fundamento. O complemento composto contém alternativas diferentes; avaliá-lo pode ser mais difícil que elicitar uma probabilidade absoluta. Para mais de duas categorias, conhecer todos os BFs em geral ainda deixa pesos livres.

## Uma pergunta concreta, orientada ao diagnóstico

Como convenção apenas ilustrativa, considere perguntar se o check poderia ficar abaixo de 0,05. A álgebra responde qual informação seria necessária:

$$p_{PPC}<0{,}05\quad\Longleftrightarrow\quad
P(E_3\mid SA,C)<\frac{0{,}05}{0{,}733219088}\approx0{,}06819.$$

O limiar de aproximadamente **6,82%** foi calculado, não elicitado. O pesquisador precisa justificar se consegue excluir uma probabilidade tão baixa para o pacote E3 sob SA. Dizer apenas que a evidência parece plausível não fornece automaticamente esse limite. O 0,05 tampouco é um teste frequentista calibrado ou uma regra universal de decisão.

Essa pergunta pode concentrar a elicitação na precisão necessária. **Primeiro solicitar um intervalo independente, sem revelar o limiar, o diagnóstico desejado ou a posterior favorecida.** Só depois mostrar quais limites alterariam o resultado e pedir justificativa adicional; esse cuidado reduz ancoragem e ajuste à conclusão. Se ninguém conseguir sustentar um limite, o resultado permanece inconclusivo. Se um especialista o sustentar, registrar que o limite é **seu julgamento informado pelas fontes**, não uma frequência observada. Para testar uma evidência nova, tanto o BF quanto a âncora terão de ser construídos para essa nova evidência e seu contexto.

# Procedimento concreto de obtenção e validação

## Rota empírica, com a BP como piloto de coleta

A unidade deve ser firma × instrumento × versão × janela decisória. O piloto documental já preenchido contém: email BP2017 sobre a ameaça de regra para refinarias; decisão contra I-1631; menção de apoio a outro cap-and-trade. Nenhum desses registros, isoladamente, fornece uma classe com denominadores conhecidos e motivos certificados. O projeto de cap-and-trade não foi identificado no memo; não o ligamos automaticamente a um projeto encontrado em outra fonte.

O procedimento proposto é:

1. **Enumerar oportunidades.** Definir previamente propostas e decisões elegíveis em um registro legislativo/organizacional, incluindo não apoio e oposição. Busca por frases favoráveis a SA não pode definir o denominador.
2. **Separar documentos por função.** Antes de ler a ação-alvo, extrair de registros contemporâneos as alternativas regulatórias, previsões de custo e benefício competitivo. Guardar a decisão posterior em outro bloco. Dois emails da mesma decisão não são duas oportunidades.
3. **Representar os mecanismos.** Estimar modelos rivais com restrições substantivas sobre como ameaça e vantagem competitiva geram decisões. Ou usar episódios com mecanismo avaliado por evidência independente, preservando erro de classificação. Não transformar concordância de codificadores em certeza do motivo.
4. **Estimar a ponte.** Com uma classe defensável, dados de treinamento informam os parâmetros de ação e de emissão/observação documental. Com mecanismos latentes, modelar conjuntamente ou usar limites de classificação; não apresentar $P(Y\mid\text{rótulo})$ como $P(Y\mid H)$ sem essa ponte.
5. **Reservar episódios inteiros.** Congelar probabilidades e regras antes da leitura dos resultados de validação, separando famílias documentais. Avaliar calibração e escores de previsão, além de discrepâncias ligadas ao mecanismo.
6. **Propagar até o PPC.** Sortear hipótese/configuração e parâmetros da posterior, gerar ação e registro sob o mesmo protocolo, aplicar a codificação e calcular a discrepância. Elos podem ser marginalizados; não é necessário gerar prosa com LLM.

A decisão estrutural pode ser representada esquematicamente por ganho líquido $\Delta U_H$ e erro $\epsilon$: $P(Y=1\mid H,X)=P(\epsilon\geq-\Delta U_H(X))$. Os documentos atuais não identificam nem todo $\Delta U_H$ nem a distribuição do erro. Escolher uma logística com escala arbitrária esconderia a mesma lacuna. Payoffs em dólares não se transformam em probabilidades por divisão ou normalização.

## Elicitação quando não houver classe empírica suficiente

O instrumento mínimo deve apresentar o evento, seu complemento, unidade e contexto; separar evidência conhecida e alvo; solicitar intervalo/quantis com justificativas documentais; registrar alternativas e divergências; conferir normalização; e calcular o conjunto de PPCs compatíveis. Respostas numéricas de humanos não foram coletadas nesta rodada. Cem fichas distribuídas por um especialista não são cem observações.

Validar requer separar quatro questões: aplicação do código à fonte; fidelidade do registro ao processo; adequação das condicionais causais; transporte entre episódios. Concordância de leitura só aborda a primeira. Bom escore da previsão agregada também não identifica, por si, cada condicional oculta. [SHELF](https://shelf.sites.sheffield.ac.uk/) fornece instrumentos para representar julgamentos, não uma garantia de verdade causal.

# Proposta final e alcance científico

A proposta é acrescentar ao workflow BPT uma etapa explícita de **completar e auditar a distribuição preditiva**. Cada probabilidade deve ser acompanhada por sua origem: estimativa, julgamento, restrição estrutural ou quantidade não identificada. Quando houver apenas relações entre likelihoods, não gerar uma distribuição única escolhendo escalas silenciosamente; calcular o que permanece livre, coletar ou elicitar a âncora pertinente e reportar o conjunto de diagnósticos que ela sustenta.

Essa proposta operacionaliza a estrutura de cenários já existente em FC. Não demonstra que BPT careça de fundamento matemático, nem reivindica inventar PPC para modelos causais qualitativos. Humphreys e Jacobs já discutem simulação posterior, checks, validação e sensibilidade nesse contexto. [Integrated Inferences, capítulo 16](https://integrated-inferences.github.io/book/16-evaluating-models.html).

Para um artigo metodológico convincente, ainda é necessário mostrar que a obtenção de âncoras em uma aplicação substantiva estreita o conjunto e produz um diagnóstico útil, além de avaliar funcionamento e limites em processos conhecidos. A família E3 fornece uma demonstração de insuficiência dos insumos atuais e um alvo concreto de coleta. Não é, sozinha, solução empírica completa nem evidência de prontidão para Political Analysis.

# Reprodução e verificação

`data/published_weights.csv` preserva os julgamentos publicados; `data/source_ledger.csv` e `data/provenance.md` distinguem fatos, fontes, auxiliares e lacunas. `causal_ppc.R` mantém cálculos separados do relatório. Os valores são obtidos por fórmulas e enumeração binária, sem simular novas observações históricas. O `README.md` reúne comandos e arquivos.

O relatório de revisão independente identifica as verificações de matemática e implementação; a coordenação conferiu fontes e apresentação do PDF. Não houve elicitação humana, calibração empírica de mecanismos ou holdout desconhecido. A conclusão científica continua condicional às definições, ao gerador e aos pesos publicados que foram mantidos para a demonstração.
