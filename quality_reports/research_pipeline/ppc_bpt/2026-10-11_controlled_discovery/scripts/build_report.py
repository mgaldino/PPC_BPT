"""Format the frozen R results. No statistical estimation in this document builder."""
import csv,json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def rows(name):return list(csv.DictReader((ROOT/'results'/name).open()))
rates=rows('rejection_rates.csv')
def pct(v):return f'{100*float(v):.2f}'.replace('.',',')+'%'
def num(v,d=4):return f'{float(v):.{d}f}'.replace('.',',')
def table(headers,body,caption):
    out=['| '+' | '.join(headers)+' |','|'+'|'.join(['---']*len(headers))+'|']
    out+=['| '+' | '.join(map(str,row))+' |' for row in body]
    return '\n'.join(out)+'\n\nTable: '+caption+'\n\n'
families=['T0','Tpath','TpathXOR','TIA','Tfull']
labels={'T0':'Diretos','Tpath':'Caminhos','TpathXOR':'Paridades','TIA':'IA','Tfull':'Conjunto'}
def rate(n,c,f):return next(x for x in rates if x['N']==str(n) and x['condition']==c and x['family']==f)
out=[r'''---
title: "IA, implicações novas e PPC no carbono"
subtitle: "Teste com informação comum, sorteios controlados e falhas de dependência"
author: "Relatório experimental para Manoel Galdino"
date: "11 de outubro de 2026"
lang: pt-BR
papersize: a4
fontsize: 10pt
geometry: margin=2.0cm
colorlinks: true
linkcolor: blue
urlcolor: blue
header-includes:
  - \usepackage{booktabs}
  - \usepackage{float}
  - \usepackage{graphicx}
  - \usepackage{longtable}
  - \setlength{\parskip}{4pt}
  - \setlength{\parindent}{0pt}
  - \makeatletter
  - \renewcommand{\maketitle}{\begin{center}{\Large\bfseries\@title\par}\vspace{4pt}{\normalsize\@author\par}{\small\@date\par}\end{center}\vspace{5pt}}
  - \makeatother
---

**Resultado:** a IA formulou uma consequência composta que não estava enunciada no prompt, mas não melhorou o diagnóstico da falha principal em relação a templates composicionais comparáveis. No teste principal, com 96 episódios, os checks selecionados pela IA detectaram a falha difícil em apenas **4,08%** dos conjuntos, contra **88,16%** do check conjunto das 16 configurações observáveis. Com 384 episódios, a IA alcançou **85,74%**, praticamente o mesmo resultado dos templates de paridade (**85,90%**). Os sorteios controlados resolveram a fidelidade dos estados, mas a prosa da IA expôs informação latente que deveria permanecer oculta.

Este é um experimento sintético inspirado no problema do carbono. Os números não são estimativas históricas de $P(Y\mid SA)$ ou $P(Y\mid CA)$. A execução incluiu 13 chamadas reais de IA, 24 episódios com documentos, 60.000 conjuntos de avaliação e 300.000 conjuntos de referência. Cinco subagentes distintos participaram do desenho, implementação e revisões. O manuscrito original não foi alterado.

# 1. O que tornou o teste mais exigente

O primeiro requisito foi igualdade de informação. IA e templates receberam as mesmas regras econômicas, documentais e probabilísticas e, na geração textual, os mesmos sorteios de R. O segundo foi separar descoberta de simulação: a IA propôs funções dos observáveis, enquanto R calculou suas probabilidades e produziu as réplicas. Nenhuma probabilidade do PPC foi estimada contando histórias geradas pela IA.

O terceiro requisito foi uma falha que preservasse os checks diretos definidos antes da descoberta. Isso exige uma delimitação lógica: uma distribuição não pode satisfazer todas as premissas de um modelo e violar uma consequência válida delas. A falha principal preserva cada distribuição marginal e cada par de erros, mas viola a independência mútua. Assim, os checks locais isolados passam em distribuição, enquanto a combinação das três etapas muda.

Incluímos templates que também fazem deduções. O algoritmo de caminhos enumera os três pares de nós não adjacentes da cadeia. O check conjunto utiliza todas as 16 configurações. Superar apenas um template que repete taxas locais não seria evidência suficiente de contribuição específica da IA.

# 2. Modelo gerador e origem dos números

Uma coalizão fictícia de quatro empresas atua como um único agente. A proposta de precificação de carbono custa 6. O benefício de evitar regulação e o benefício competitivo, antes desse custo, começam em 12. Um aviso privado reduz exatamente um deles para 2. Sob acomodação estratégica (SA), importa o primeiro benefício. Sob vantagem competitiva (CA), importa o segundo.

Definimos $S=0$ quando cai o benefício regulatório e $S=1$ quando cai o competitivo. $A$ registra a decisão efetiva de apoio, $M$ a posição escrita no memorando e $P$ a posição anunciada. Apoio vale 1 e retirada vale 0. O anúncio é produzido a partir do memorando. Há três oportunidades distintas de reversão.

Escrevendo $h=0$ para SA, $h=1$ para CA e $\oplus$ para soma módulo dois:

$$
S\sim\operatorname{Bernoulli}(0{,}5),\qquad
U,V,W\overset{ind}{\sim}\operatorname{Bernoulli}(0{,}2),
$$
$$
A=S\oplus h\oplus U,\qquad M=A\oplus V,\qquad P=M\oplus W.
$$

O analista pode observar os quatro registros, mas não H nem os sorteios internos. O primeiro resíduo observável é $U^*=S\oplus A=U\oplus h$. Os outros são $V=A\oplus M$ e $W=M\oplus P$. Usar H verdadeiro para codificar $U$ seria vazamento da verdade do simulador e foi proibido.

''']
out.append(r'\newpage'+'\n\n')
out.append(table(['Elemento','Base neste experimento'],[
['SA e CA','Motivação substantiva do caso do carbono no paper e em Fairfield e Charman.'],
['Valores 12, 2 e 6; erros de 20%','Estipulações experimentais, sem estimação pelas fontes.'],
['Posterior SA=0,6','Prior sintético 0,5 e verossimilhanças de D iguais a 0,375 e 0,25.'],
['Registros avaliados','Dados sintéticos sorteados em R; não são documentos históricos.'],
['Implicações da IA','Propostas obtidas em seis contextos novos, sem acesso às falhas.']
],'Origem das informações. O apoio histórico à distinção de mecanismos não identifica as probabilidades usadas no piloto.'))
out.append(r'''
O posterior vem de uma evidência inicial reservada D. A hipótese é comum aos N episódios de cada conjunto. Para os novos registros $R=(r_1,\ldots,r_N)$, a distribuição preditiva é

$$
p(R\mid D)=0{,}6\prod_{i=1}^N q_{SA}(r_i)
          +0{,}4\prod_{i=1}^N q_{CA}(r_i).
$$

A mistura fica **fora** do produto. O PPC usado aqui avalia evidência reservada sob um posterior anterior. Essa adaptação não é automaticamente o mesmo procedimento de reutilizar toda a evidência observada para estimar e checar o modelo.

# 3. Falhas ocultas e checks diretos

Antes da primeira chamada de IA congelamos quatro leis. O nulo usa os erros independentes acima. F1 mistura a lei nula com um regime em que os dois canais documentais compartilham a mesma reversão. Ela preserva erros marginais, mas modifica o par V,W. Funciona como controle positivo dos checks diretos enriquecidos.

A falha principal, F2, altera a lei dos três erros para

$$
q_{F2}(u,v,w)=q_0(u,v,w)-0{,}03(-1)^{u+v+w}.
$$

Ao somar sobre qualquer erro, a perturbação se cancela. Todas as probabilidades permanecem positivas. A probabilidade de cada erro continua 0,20 e a de dois erros específicos simultâneos continua 0,04. O padrão conjunto muda. F2-fraca mistura 75% do nulo e 25% de F2, também congelada previamente.

''')
er=rows('..'+'/data/error_laws.csv') if False else list(csv.DictReader((ROOT/'data/error_laws.csv').open()))
out.append(table(['U,V,W','Nulo','F2'],[[f"{x['U']},{x['V']},{x['W']}",num(x['null'],3),num(x['F2'],3)] for x in er],
'Leis dos erros. A diferença aparece na combinação das três etapas; as marginais e todos os pares permanecem iguais.'))
out.append(r'''
Os sete checks diretos examinam S, $U^*$, V, W e os três pares dos resíduos. A invariância de cada um sob F2 foi comprovada nas probabilidades enumeradas, separadamente em SA e CA. A dependência entre os sete checks pode mudar, portanto não prometemos invariância exata de seu agregado. O controle Bonferroni mantém a garantia de nível nominal a partir das caudas individuais; sua maior conservação é registrada separadamente.

# 4. O que a IA descobriu e como foi selecionado

Seis chamadas novas receberam quatro episódios cada, com uniformes fornecidos por R. Cada chamada gerou quatro documentos por episódio e até duas candidatas, sem lista de consequências procuradas. Um seletor em contexto separado auditou as 12 candidatas e escolheu as primeiras três válidas segundo uma regra congelada. Não conhecia F1, F2 ou os resultados. Um auditor adicional, também sem acesso às falhas, confirmou todas as tabelas de codificação por enumeração dos 16 estados.

''')
out.append(table(['Check selecionado','Conteúdo','Limite'],[
['V+W','Número de divergências nos dois elos documentais.','Agrega categorias do par V,W já disponível.'],
['S xor P','Relação entre o aviso inicial e a posição pública final.','Combina as três reversões e H.'],
['A xor P','Discordância entre decisão e anúncio.','É função de V+W: vale 1 quando V+W=1.']
],'Três funções selecionadas. Não são três dimensões independentes de informação nem três descobertas históricas.'))
out.append(r'''
A implicação entre início e fim é a candidata central. Sob SA, anúncio e aviso discordam quando ocorre um número ímpar de reversões. Sob CA, a relação é invertida. O prompt não forneceu essa probabilidade nem enunciou esse check. Sua derivação é

$$
\Pr(P\ne S\mid SA)=3(0{,}2)(0{,}8)^2+(0{,}2)^3=0{,}392,
$$
$$
\Pr(P\ne S\mid CA)=0{,}608.
$$

Sob F2, as probabilidades passam a 0,512 e 0,488. Portanto a IA de fato formulou uma consequência composta útil em princípio. O resultado ainda depende da amostra, do modo de resumir os dados e dos outros checks com que ela é combinada.

Além de IA e diretos, congelamos o template de caminhos, com (S,M), (A,P), (S,P), e o check conjunto das 16 células. Após conhecer as escolhas da IA, **antes de qualquer avaliação**, acrescentamos um controle secundário: aplicar XOR uniformemente aos três caminhos. Esse adendo testa se uma vantagem decorre apenas de comprimir tabelas de quatro categorias em duas. Não substituiu o comparador primário ou a seleção.

# 5. Avaliação e resultados

Para cada N=24,96,384 geramos 50.000 conjuntos nulos para caudas dos checks, outros 50.000 para calibrar o agregado e 5.000 por condição para avaliação. Todos os braços receberam exatamente os mesmos dados e referências. O orçamento foi de até três checks adicionais para IA e caminhos. Informação e amostras foram igualadas; tempo computacional e esforço de programação não foram igualados.

Para cada indicador categórico, usamos o desvio multinomial contra a mistura posterior, com H comum. A cauda inclusiva fornece o p do componente. O mínimo dos p dos componentes define o agregado, que recebe uma segunda calibração nula. Essa etapa controla a multiplicidade e a dependência entre checks. O limiar foi 5%, sem ajustar escolhas às falhas. Empates são conservadores. A calibração é adicional ao PPC e não uma propriedade automática de p-valores preditivos bayesianos.

''')
out.append(table(['N=96','Diretos','Caminhos','Paridades','IA','Conjunto'],[
    [lab]+[pct(rate(96,c,f)['rate']) for f in families]
    for c,lab in [('null','Falso alarme'),('F1','F1: canais'),('F2','F2: ordem 3'),('F2_weak','F2 fraca')]
],'Taxas de rejeição no tamanho primário, 5.000 conjuntos por célula. Paridades é o comparador secundário. O check conjunto usa a distribuição de 16 estados.'))
out.append(r'''
O resultado principal é desfavorável à seleção de checks feita pela IA. Na falha que motivou o teste, ela teve 204 rejeições em 5.000 conjuntos, compatíveis com sua taxa de falso alarme. O check conjunto teve 4.408. Seu falso alarme de 5,58% tem intervalo de Wilson de 4,98% a 6,25%, incluindo o alvo de 5%. Não se afirma igualdade exata de tamanho entre procedimentos.

Em F1 a IA superou os templates de paridade em 1,66 ponto percentual, com intervalo pareado de 95% de 1,30 a 2,02 pontos. Porém, F1 já modifica um par de erros que os checks diretos examinam. Esse resultado não demonstra detecção de uma falha invisível aos checks locais. A falha fraca também mostrou pouco poder da seleção IA. Não alteramos a seleção depois desses resultados.

![Detecção da falha principal F2 em N=96 e N=384. Pontos mostram as taxas em 5.000 conjuntos por tamanho; segmentos, intervalos de Wilson de 95%. A falha preserva cada check direto isolado.](results/hard_fault_power.png){width=100%}

''')
out.append(table(['N / condição']+[labels[f] for f in families],[
    [f'{n} / '+('F2' if c=='F2' else 'nulo')]+[pct(rate(n,c,f)['rate']) for f in families]
    for n in [24,384] for c in ['null','F2']],
'Sensibilidades de tamanho previamente fixadas. As mesmas candidatas são mantidas em todos os tamanhos.'))
out.append(r'''
Com 384 episódios, a consequência entre início e fim ganha poder. IA supera o template de pares de quatro categorias em 16,22 pontos percentuais, mas sua diferença frente ao template de paridade é de **−0,16 ponto**, com intervalo pareado de 95% de **−0,39 a +0,07 ponto**. A aparente vantagem frente ao primeiro template desaparece quando ele também usa uma compressão simples das mesmas relações. O check conjunto detecta todos os 5.000 conjuntos F2 nesse tamanho, resultado amostral que não significa poder universal de 100%.

Os intervalos quantificam a variação Monte Carlo da avaliação, condicionada a este corpus, seleção e referências. Não incluem a incerteza de outra descoberta da IA, outro modelo ou outro mecanismo. A evidência não sustenta superioridade geral da IA nem equivalência universal dos métodos.

# 6. Exemplo completo: dos documentos ao PPC

Usamos primeiro o **conjunto F2 número 1, com 96 episódios**, sem selecioná-lo por seu resultado. Os 96 conjuntos de quatro documentos estão integralmente em `results/first_F2_documents.csv`. São uma representação por templates dos estados R, não novos documentos históricos ou 96 novas gerações de IA.

Considere um registro com (S,A,M,P)=(0,0,0,1). O aviso privado relata queda do benefício regulatório. O registro direto informa retirada de apoio. O memorando também registra retirada. O anúncio público declara apoio. A codificação preserva a divergência. Nesse registro, $U^*=0$, V=0, W=1 e $S\oplus P=1$. Nenhum cálculo precisa observar H verdadeiro.

A tabela seguinte mostra todas as combinações dos resíduos nesse conjunto. Ela ajuda a entender o diagnóstico, embora o check conjunto avaliado use as 16 células S,A,M,P, preservadas no pacote.

''')
rp=rows('first_F2_residual_patterns.csv')
out.append(table(['U*,V,W','Observado','Esperado SA','Esperado CA'],[
    [f"{x['Ustar']},{x['V']},{x['W']}",x['count'],num(x['expected_SA'],3),num(x['expected_CA'],3)] for x in rp],
'Padrões do primeiro conjunto F2, N=96. Expectativas condicionais às hipóteses sob o modelo nulo, sem substituir H pelo seu valor verdadeiro.'))
out.append(r'''
Os erros marginais observáveis são 20, 18 e 21, próximos de 19,2 sob SA. Contudo, os seis registros em (1,1,1) e a ausência dos três padrões com exatamente dois erros são conjuntamente difíceis de conciliar com a lei independente. Sob SA, esperavam-se apenas 0,768 registros em (1,1,1). Tentar usar CA para explicar um padrão compromete a explicação dos demais. O check conjunto preserva essa exigência de uma hipótese comum.

O indicador novo $B=S\oplus P$ vale 1 em 47 dos 96 episódios. A distribuição posterior preditiva de sua contagem é uma mistura de binomiais:

$$
\Pr(K=k\mid D)=0{,}6\operatorname{Bin}(k;96,0{,}392)
 +0{,}4\operatorname{Bin}(k;96,0{,}608).
$$

Para k=47, a massa é 0,0095434. Massa de um ponto não é p-valor: é preciso compará-lo com as réplicas mediante a discrepância fixada. O desvio utilizado é

$$
T(\mathbf n)=2\left[\sum_c n_c\log(n_c/N)
-\log\left(0{,}6\prod_c q_{SA,c}^{n_c}
+0{,}4\prod_c q_{CA,c}^{n_c}\right)\right].
$$

O coeficiente multinomial cancela na razão contra o modelo saturado. O p do componente é $(1+\#\{T^{rep}\ge T^{obs}\})/50001$. O componente novo tem p=0,0872 e não rejeita isoladamente a 5%. Depois da calibração dos dez checks do braço IA, seu p global é 0,4206. O modelo completo, por outro lado, tem p Monte Carlo mínimo de 1/50001, aproximadamente 0,000020; esse piso não é uma probabilidade exata de zero.

''')
first=rows('first_F2_family_checks.csv')
out.append(table(['Procedimento','p global'],[[labels.get(x['family'],'Diretos Bonferroni'),num(x['p'],6)] for x in first],
'PPCs e calibração no primeiro conjunto F2. O template de caminhos também rejeita neste conjunto particular; as taxas gerais mostram que isso ocorre raramente em N=96.'))
out.append(r'''
O protocolo também exigia guardar o primeiro conjunto em que IA rejeitasse e diretos não rejeitassem. Ele é o número 123, com p IA=0,01894 e p diretos=0,10154. Houve apenas 19 desses conjuntos em 5.000. A auditoria verificou que a rejeição é conduzida por $A\oplus P$, cujo p é 0,00314, enquanto o check novo $S\oplus P$ tem p=0,57763. Como $A\oplus P$ tem sua distribuição preservada sob F2, **esse exemplo não demonstra que a IA descobriu a falha de terceira ordem**. Sua inclusão sem essa conferência teria produzido uma narrativa de sucesso enganosa.

\newpage

# 7. Auditoria dos documentos, execução e debate

Os 96 valores de S,A,M,P reportados pela IA nos 24 episódios coincidiram com os sorteios R. A codificação em contextos separados recuperou corretamente todos os 192 campos nos 48 conjuntos de documentos IA/templates. Um subagente leu e codificou independentemente os mesmos 48 conjuntos sem consultar a verdade, com concordância integral após a comparação. Discordâncias entre decisão, memo e anúncio foram preservadas.

Isso não equivale a fidelidade semântica plena. Todos os 24 conjuntos da IA revelaram SA/CA na prosa, embora H devesse permanecer latente para o analista. Também narraram ocorrência ou ausência de reversões internas. Não expuseram os uniformes numéricos ou benefícios privados nos anúncios. Os quatro campos estavam explícitos e puderam ser extraídos sem usar essas revelações. O benchmark estatístico usa somente tabelas dos observáveis e estados R, portanto não explorou H revelado. Ainda assim, o gerador de documentos precisa de uma barreira de publicação que permita apenas fatos observáveis. Não fizemos uma correção silenciosa nem certificamos o cegamento dos textos.

O debate teve consequências concretas: o revisor de identificação exigiu H comum e resíduos observáveis; o revisor de atribuição exigiu templates composicionais e distinguiu marginais de agregado; o adversarial refinou F2 e delimitou seu caráter artificial; o implementador executou R; um auditor cego conferiu linguagem e tabelas; o revisor matemático conferiu a implementação separadamente. As mensagens e pareceres estão em `agents/`. Esses pareceres não são fontes empíricas independentes, nem sua concordância calibra probabilidades históricas. O revisor matemático recalculou 61.200 desvios e reconstituiu todos os 360.000 p-valores globais e decisões, com concordância integral.

Foram seis chamadas de descoberta, uma de seleção e seis de codificação, pelo Codex CLI autenticado no ChatGPT, alias solicitado `gpt-5.6-sol`, esforço `low`. Todos os autorrelatos foram UNKNOWN. O alias registra a solicitação, sem garantir uma versão imutável dos pesos. As chamadas usaram 243.105 tokens de entrada e 13.993 de saída, incluindo instruções internas do CLI na entrada. Nenhuma ferramenta foi acionada pelos modelos nessas chamadas. Não houve chamada a API externa paga. Os subagentes de coordenação não estão incluídos nessa contagem de tokens.

# 8. Consequência para o método e para o paper

O piloto dá uma resposta concreta à proposta de usar IA: **ela consegue formular uma implicação composta não enunciada, mas o ganho precisa ser demonstrado no procedimento completo de seleção, mensuração e PPC**. Aqui, a implicação existiu, foi logicamente válida e teve poder em amostras maiores. Os templates de composição alcançaram desempenho semelhante em F2. No tamanho principal, a seleção IA deixou de usar informação conjunta que permitia detectar a falha.

Uma arquitetura defensável é deixar a IA propor implicações e formas de encontrar registros, exigir a derivação de cada proposta a partir das premissas, compilar suas probabilidades em um gerador controlado e comparar seu diagnóstico com checks conjuntos ou algoritmos de composição. Quando a IA propuser um observável fora do modelo, será necessário explicitar uma regra causal e de mensuração adicional antes de lhe atribuir probabilidade. O texto produzido por um modelo de linguagem não fornece por si só essa regra.

A implementação deve preservar a hipótese comum ao avaliar várias partes do mecanismo. Checar cada resumo separadamente, marginalizando H em cada um, pode aceitar diferentes explicações para diferentes partes do mesmo conjunto. Um resumo conjunto ou uma discrepância construída para a incompatibilidade entre partes evita essa perda de poder. Este achado é mais útil para aperfeiçoar a operacionalização do BPT do que afirmar que mais narrativas geradas melhoram o PPC.

Para um paper metodológico, este pacote fornece um teste negativo transparente da vantagem exclusiva da IA e um caso positivo de detecção de uma falha que preserva marginais e pares. Não fornece ainda probabilidades identificadas por fontes históricas, uma aplicação histórica validada, ganho de produtividade medido ou generalização para uma classe ampla de mecanismos. A escolha deste mecanismo e da falha foi deliberada e conhecida pelos projetistas, embora oculta às chamadas de descoberta. O número 384 representa episódios sintéticos independentes dentro de um cenário, não 384 fontes independentes do caso real. Tratar documentos sobre o mesmo episódio como novas réplicas inflaria informação.

A contribuição permanece compatível com a operacionalização de cenários dentro de hipóteses de Fairfield e Charman. Este experimento não demonstra ausência de estrutura interna no BPT. Ele mostra por que explicitar a lei conjunta, o objeto replicado e a discrepância é necessário para que um PPC possa diagnosticar uma falha.

# 9. Fontes e reprodução

O contexto substantivo de SA/CA pode ser conferido em [Fairfield e Charman, análise de replicação qualitativa sobre política climática](https://doi.org/10.1017/psrm.2025.16). Os registros históricos usados nos pilotos anteriores permanecem no repositório, mas não foram convertidos aqui em estimativas das taxas de reversão.

A distinção entre checks de independência, simulação posterior preditiva e calibração está discutida no [capítulo 16 de *Integrated Inferences*](https://integrated-inferences.github.io/book/16-evaluating-models.html), consultado em 11 de outubro de 2026. Nossa comparação usa evidência sintética reservada e uma calibração Monte Carlo explícita, sem presumir uniformidade de PPCs em geral.

`README.md` documenta os comandos. `protocol.md`, `protocol_addendum.md` e os três congelamentos registram a cronologia. `scripts/prepare.R` produz as leis e os sorteios; `scripts/analyze.R` calcula as avaliações; `scripts/worked_example.R` exporta os documentos e contas do exemplo. `scripts/build_report.py` somente organiza resultados no relatório. Prompts, respostas e eventos originais estão preservados. Os arquivos RDS permitem reproduzir as caudas e decisões sem novas chamadas de IA. O manifesto verifica integridade e os hashes do manuscrito confirmam que ele permaneceu inalterado.
''')
(ROOT/'report.md').write_text('\n'.join(out))
print(ROOT/'report.md')
