---
title: "De onde vêm as probabilidades?"
subtitle: "Elicitação e validação de checagens preditivas no process tracing Bayesiano"
author: "Relatório metodológico para Manoel Galdino"
date: "10 de outubro de 2026"
lang: pt-BR
fontsize: 11pt
papersize: a4
geometry: margin=2.25cm
colorlinks: true
linkcolor: blue
urlcolor: blue
header-includes:
  - \usepackage{booktabs}
  - \usepackage{longtable}
  - \usepackage{float}
  - \usepackage{fancyhdr}
  - \pagestyle{fancy}
  - \fancyhf{}
  - \fancyhead[L]{\small PPC em process tracing Bayesiano}
  - \fancyhead[R]{\small Elicitação e validação}
  - \fancyfoot[C]{\thepage}
  - \setlength{\headheight}{14pt}
  - \setlength{\emergencystretch}{3em}
  - \newcommand{\keepblock}[1]{\par\ifdim\dimexpr\pagegoal-\pagetotal\relax<#1\relax\newpage\fi}
---

# Recomendação e alcance

**A proposta é construir probabilidades auditáveis para respostas documentais delimitadas, apoiá-las em evidência comparável quando houver e preservar a incerteza onde só houver julgamento.** O ganho metodológico depende de mostrar como as probabilidades foram obtidas e o que a validação pode testar. Dividir uma hipótese em mecanismos não cria, por si só, informação sobre suas probabilidades.

Recomendamos um piloto no caso chileno de 2005, com uma bancada, dois blocos documentais e uma pergunta por bloco. O produto completo associa cada número a uma fonte ou razão explícita, preserva especificações individuais, calcula as previsões antes de revelar o material reservado e avalia tanto o desempenho quanto a fragilidade das suposições. Quando ninguém consegue defender probabilidades absolutas, o procedimento termina com restrições, faixas ou uma conclusão de não identificação. Uma alocação uniforme automática não resolve essa ausência.

O relatório entrega um protocolo, formulários e regras de decisão. **Nenhum especialista humano foi entrevistado, nenhuma probabilidade foi estimada e nenhuma validação empírica foi executada.** As fontes documentais indicadas foram conferidas; os alvos reservados permanecem candidatos sujeitos a auditoria. Os dez subagentes produziram propostas e críticas metodológicas, não dados de um painel de especialistas. O manuscrito foi preservado.

O método desenvolve a operacionalização de cenários já permitida por Fairfield e Charman (2022), especialmente sua equação 3.11. Sua contribuição potencial é um procedimento reproduzível de elicitação, aquisição e diagnóstico com limites explícitos. A aceitação em *Political Analysis* dependerá da contribuição demonstrada, da aplicação e da avaliação comparativa; o presente desenho ainda não oferece essa demonstração.

# O problema que a elicitação consegue resolver

Uma fonte histórica pode mostrar que um parlamentar ofereceu certa justificativa. Não fornece automaticamente a frequência com que essa justificativa apareceria se um mecanismo causal estivesse ativo. Precisamos separar os objetos da Tabela 1.

\keepblock{22\baselineskip}

**Tabela 1. Procedência de probabilidades e alcance da informação.** As linhas representam bases distintas, que devem continuar identificáveis na análise.

| Objeto | Como obter informação | O que permanece condicionado |
|---|---|---|
| Frequência de uma resposta documental em uma classe | Inventário definido, leitura de todas as unidades selecionadas, contagens com denominador e genealogia | Seleção, comparabilidade, gênero e número de oportunidades |
| Erro de recuperação ou codificação | Auditoria contra registros identificados independentemente; dupla codificação e adjudicação | Dupla concordância não estabelece verdade; itens nunca localizados podem continuar desconhecidos |
| Probabilidade de resposta sob mecanismo causal | Julgamento humano condicionado a cenário preciso, com fontes, analogias e alternativas | Transporte e relação entre mecanismo e comunicação pública |
| Peso posterior de uma configuração | Prior e likelihoods de evidências delimitadas, com atualização reconstruível | Justificação dos insumos e dependência das fontes |
| Desempenho da previsão integrada | Previsão congelada antes de resposta desconhecida e resolução documentada | População de alvos e método de seleção; acerto não identifica cada componente |

A orientação de Morgan é pertinente: elicitação requer verificar se existe expertise relevante, preparar a pergunta e documentar as razões do julgamento. Não oferece um mecanismo para tornar precisos conhecimentos que os especialistas não possuem. A orientação da EFSA também organiza a elicitação desde a definição do problema até documentação e agregação. Adaptamos esses princípios ao alvo documental; não reivindicamos que essas referências tenham validado esta aplicação. [Morgan (2014)](https://pmc.ncbi.nlm.nih.gov/articles/PMC4034232/); [EFSA (2014)](https://efsa.onlinelibrary.wiley.com/doi/10.2903/j.efsa.2014.3734).

## Por que uma boa previsão não valida todos os números

Considere uma resposta binária e dois estados, apenas para explicitar o limite:

$$q=P(Y=1\mid D)=w p_1+(1-w)p_0.$$

Para $0<w<1$, substituir $p_1$ por $p_1+\delta$ e $p_0$ por $p_0-w\delta/(1-w)$ mantém $q$, sempre que as probabilidades permaneçam admissíveis. Portanto, mesmo conhecer perfeitamente a previsão marginal não identifica ambas as condicionais. Com pesos também incertos, há ainda mais combinações equivalentes. É uma propriedade elementar da mistura, não uma nova prova de identificação causal.

O protocolo pode revelar incoerência, previsões malsucedidas, sensibilidade excessiva ou falta de contraste entre cenários. **Não pode certificar probabilidades de motivações privadas apenas porque acertou discursos públicos.** Validar essas condicionais exige informação adicional que discrimine configurações, ou assumir relações que precisam permanecer visíveis na análise de sensibilidade.

# Caso, unidade e resposta a prever

O recorte jurídico é a revogação do benefício preservado pelo artigo 18, inciso terceiro, da Lei 19.578, para ações adquiridas antes de 29 de julho de 1998. Evita-se designar o objeto simplesmente como a eliminação de todo o artigo 57 bis. A História da Lei 20.028 disponibilizada pela BCN tem 71 páginas; seu índice localiza a comissão do Senado na página 33 e a discussão em plenário na 45. A compilação informa que omite documentos de mera tramitação. [BCN, História da Lei 20.028](https://obtienearchivo.bcn.cl/obtienearchivo?id=recursoslegales%2F10221.3%2F37346%2F2%2FHL20028.pdf).

**Unidade proposta:** a decisão da bancada UDI no Senado de aceitar essa revogação, durante a tramitação de 2005. A filiação de cada parlamentar na data será conferida pelo custodiante. Fixar uma bancada evita presumir homogeneidade entre UDI e RN. Esse recorte é uma escolha de desenho, não a unidade original de todas as inferências do paper; seus pesos precisam ser construídos para essa unidade.

**Oportunidades candidatas:** o conjunto de intervenções completas atribuíveis à bancada no relatório da comissão, páginas impressas 33–44, e na discussão em plenário, páginas 45–68. O custodiante verificará limites, atribuição, integridade e dependências. Relato resumido de comissão e transcrição de plenário são gêneros distintos. Cada previsão condicionará no estágio, papel dos atores, número de intervenções e extensão do bloco; não se cortarão trechos para fabricar unidades aparentemente equivalentes.

**Pergunta exata:** “No bloco especificado, os parlamentares da bancada oferecem, em sua própria voz, uma justificativa distributiva para aceitar a revogação, contestam essa justificativa como fundamento para aceitá-la, fazem ambos, ou não fazem nenhum desses movimentos?”

Uma afirmação qualificada conecta distribuição de benefícios ou ônus, justiça ou equidade à aceitação da revogação. Menção isolada, pergunta retórica ou citação do adversário sem endosso não bastam. Uma contestação nega a adequação desse fundamento para aceitar a medida; oferecer uma razão adicional não é contestação. O manual deverá trazer exemplos conhecidos e casos limítrofes antes do congelamento.

\keepblock{16\baselineskip}

**Tabela 2. Categorias exaustivas da resposta documental.** A presença é relativa ao bloco delimitado, sem inferência automática sobre sinceridade ou posição de todos os integrantes.

| Código | Regra |
|---|---|
| A | Há afirmação própria qualificada e não há contestação qualificada |
| C | Há contestação própria qualificada e não há afirmação qualificada |
| M | Há ambas, por uma ou mais pessoas; conservar autoria e conflito |
| S | Nenhuma das duas é encontrada após leitura suficiente; outras razões podem existir |
| I | Cobertura, contexto, atribuição ou interpretação impedem decidir entre A/C/M/S após o procedimento |

Aplicar I apenas se a dúvida puder mudar o código. Se ambas as posições já estão inequivocamente registradas, M está determinado. Ausência de intervenção descoberta durante a leitura integra S, com subcódigo próprio. Uma oportunidade estruturalmente vazia já identificada pelos metadados será registrada antes da elicitação como não informativa, segundo regra fixada. Não retirar silenciosamente um bloco depois de descobrir silêncio, conflito ou indisponibilidade. Se houver I, conservar sua causa e incluí-lo na prestação de contas do conjunto original de oportunidades.

## O que já se pode usar como cartão de desenvolvimento

Um cartão real pode identificar a mensagem presidencial de 13 de maio de 2005 e registrar que ela associa revogação, concentração do benefício em rendas elevadas e bolsas educacionais. O percentual de 93% nela apresentado descreve a distribuição alegada dos recursos do benefício entre contribuintes. **Esse 93% não é a probabilidade de encontrar uma justificativa distributiva sob um mecanismo.** O cartão registra uma alegação do Executivo, sem auditar a estatística tributária subjacente. [BCN, mensagem presidencial, pp. 4–8](https://obtienearchivo.bcn.cl/obtienearchivo?id=recursoslegales%2F10221.3%2F37346%2F2%2FHL20028.pdf).

Esse material serve para desenvolvimento e treino de codificação. Uma manifestação do Executivo não vira uma observação intercambiável com falas da UDI; transportar sua frequência exigiria uma justificativa adicional. O relatório não preenche qualquer probabilidade com base nesse cartão.

# O procedimento de elicitação

## Preparar o pacote e fechar os cenários

O autor e um custodiante definem o manifesto antes da leitura destinada a formar a reserva. O custodiante poderá ler conteúdo para reconhecer reproduções e genealogias; registrará cada agrupamento e exclusão. Uma segunda pessoa confere a curadoria sem acesso às previsões. O manifesto conserva todos os candidatos e seus destinos.

Cada especialista recebe o mesmo pacote: descrição da unidade e do desfecho conhecido; regras de observação; metadados do bloco; cartões de evidência de desenvolvimento com fonte, passagem e dependência; definições dos cenários; registro do que está em $K$ e do que está em $D$. Não recebe probabilidades do paper nem o diagnóstico que se deseja obter. Evidências desfavoráveis não serão removidas para tornar o pacote mais simples.

Os dois componentes são:

- **E:** o desafio público baseado em equidade gerou preocupação eleitoral que contribuiu causalmente para a aceitação pela bancada.
- **B:** a redução do interesse material da base pertinente em preservar o benefício facilitou causalmente essa aceitação.

O cartão deve especificar dirigentes e grupos pertinentes, referência temporal da redução em B e que mudança em resistência, apoio ou momento da decisão conta como contribuição causal. B não é confirmado por uma perda material pequena isolada. E não é definido por uma fala sobre equidade. Não se exige que cada componente seja individualmente necessário; eles podem contribuir conjuntamente. Se o painel não consegue interpretar essas fronteiras de forma comum, a etapa numérica deve esperar sua revisão.

Escolhemos B como **redução relativamente a um episódio anterior especificado**, em correspondência com o elo de declínio do manuscrito. Um interesse material permanentemente baixo pode facilitar a aceitação por outra via, mas não satisfaz essa definição de B. Essa alternativa deve continuar explicitada entre as demais causas relevantes; não será silenciosamente tratada como refutada por B=0.

Os estados 00, 10, 01 e 11 são mutuamente exclusivos e exaustivos **nesse espaço de dois componentes**. O 00 admite outras explicações; não representa uma única causa residual nem exaustão das teorias politicamente relevantes. Fixar contexto e explicitar alternativas relevantes evita que especialistas imaginem mundos incompatíveis sob a mesma etiqueta. As configurações são uma versão operacional proposta, a ser submetida à verificação substantiva do piloto.

## Construir âncoras sem inventar denominadores

O custodiante procura oportunidades de desenvolvimento do mesmo tipo, antes de olhar a resposta dos alvos reservados. Para cada classe, registra ator e papel, estágio, gênero, tema, audiência, critérios de inclusão, número de intervenções, reproduções e janela temporal. Conta as categorias em todas as unidades selecionadas; publica $n_A,\ldots,n_I$ e $N$. Quando existirem, essas frequências serão descrições dessa classe. Não serão apresentadas como estimativas consistentes de uma superpopulação sem desenho que o justifique.

A exigência de classes comparáveis pode resultar em poucas ou nenhuma observação. Nesse caso, registrar “sem âncora empírica disponível”. Episódios de reformas anteriores podem oferecer analogias, mas não recebem rótulos de mecanismo verdadeiro por conveniência. Uma família documental controla dependência; ela não é automaticamente uma classe homogênea para transporte de frequências.

Para cada vetor, o especialista registra: que padrão da âncora considera relevante; que diferença de contexto altera esse padrão; em que direção e por quê; e o que o faria desistir da comparação. Não aplicar fatores multiplicativos arbitrários para aparentar uma correção empírica. O ajuste de transporte continua sendo julgamento, identificado como tal. Se houver só uma ordenação defensável, conservar a ordenação.

## Entrevistar antes de combinar

O piloto terá dois especialistas de domínio, entrevistados separadamente. Dois é uma escala de viabilidade proposta, não um tamanho capaz de garantir qualidade ou representar a comunidade. Cada um realiza treino em material conhecido, explica a tarefa com suas palavras e distingue $P(Y\mid c)$ de $P(c\mid Y)$. Erros de compreensão são corrigidos antes da fase pontuável.

A instrução central será: **“Suponha verdadeiro o cartão indicado. Usando o pacote e o protocolo, distribua 100 pontos entre os resultados possíveis deste bloco. Os pontos exprimem sua incerteza sobre sua resposta, não cem casos observados, nem sua confiança no cartão.”**

Primeiro recolher razões e ordenação qualitativa das categorias. Depois pedir o vetor normalizado, sua procedência e uma explicação da passagem das razões aos pontos. Perguntar que informação transferiria massa de uma categoria para outra. Não oferecer números do manuscrito como âncora. Branco significa não respondido; zero exige justificativa própria, pois exclui um resultado.

Uma revisão privada após discussão facilitada pode esclarecer ambiguidades no piloto, preservando versões e dissenso. Ela não torna os julgamentos independentes. Alternativas completas serão elicitadas somente para suposições decisivas identificadas antes da revelação, com registro de quais componentes ficaram sem análise de sensibilidade. Não converter limites subjetivos em parâmetros Beta/Dirichlet nem denominá-los intervalos de credibilidade sem modelo adicional.

O procedimento adapta a separação entre preparação, estimativa privada, discussão e nova estimativa do IDEA. Não pretende reproduzir nem testar integralmente esse protocolo no piloto pequeno. [Hemming et al. (2018)](https://doi.org/10.1111/2041-210X.12857). Materiais de treinamento adicionais estão disponíveis no [SHELF](https://shelf.sites.sheffield.ac.uk/).

# Transformar julgamentos em previsão posterior

## A folha de cálculo necessária

Se a finalidade é testar a implementação completa do PPC decomposto, apenas os vetores $P(Y\mid c)$ são insuficientes. Para cada especialista $e$, guardar uma especificação $M_e$ com:

1. Conhecimento inicial $K$, unidade, regra fixa de observação $O_j$ e quatro estados definidos. Todos os metadados informativos disponíveis dos dois blocos, incluindo composição, número e extensão das intervenções, entram em $K$ antes de formar o prior, ou explicitamente em $D$ se usados para atualização. Não ficam como condicionantes exclusivos de $v$.
2. Prior $\pi_{ec}=P_e(c\mid K)$, normalizado e justificado.
3. Conjunto de desenvolvimento $D=(D_1,\ldots,D_n)$, com itens agrupados por origem quando necessário, mais dependências explícitas.
4. Likelihoods de cada item condicionadas aos anteriores, ou razões coerentes relativamente a um estado de referência.
5. Vetores absolutos $v_{ecj}(y)=P_e(Y_j=y\mid c,K,D,O_j)$, para cada bloco $j$.

$O_j$ designa somente a regra de observação fixada, não novos fatos sobre os mecanismos. O mesmo conjunto informacional dos dois blocos sustenta os pesos $w_{ec}$ usados nas duas previsões. Assim, informações como quantidade de intervenções não afetam as respostas previstas enquanto são indevidamente ignoradas na composição dos estados.

Para um estado de referência $c_0$ com denominadores positivos, definir:

$$r_{etc}=\frac{P_e(D_t\mid c,K,D_{<t})}{P_e(D_t\mid c_0,K,D_{<t})},\qquad r_{etc_0}=1.$$

Então:

$$w_{ec}=\frac{\pi_{ec}\prod_{t=1}^{n}r_{etc}}{\sum_{c'}\pi_{ec'}\prod_{t=1}^{n}r_{etc'}},\qquad q_{ej}(y)=\sum_c w_{ec}v_{ecj}(y).$$

A fatoração sequencial não pressupõe independência dos itens; tratá-los como incondicionais o faria. Se o estado de referência atribuir probabilidade zero a um item ocorrido, usar outro estado adequado ou likelihoods diretas e verificar suporte. Não remendar o problema com um valor mínimo escolhido após conhecer a resposta. Prior zero elimina um estado na atualização; não usá-lo apenas para representar pouca plausibilidade.

Razões de likelihood podem atualizar os pesos dos estados, mas não determinam as probabilidades absolutas de A/C/M/S/I. Essa é precisamente a informação adicional exigida para prever $Y$. Quando os especialistas já conhecem $D$, prior e likelihoods serão reconstruções retrospectivas; não prometer que conseguem apagar esse conhecimento. Registrar outros fatos conhecidos que não couberam no pacote e avaliar sua relevância.

Não redistribuir o posterior quase unitário do caso chileno entre os quatro estados, nem transportar o 0,71 do petróleo. A unidade e a partição mudaram. Uma elicitação direta de $P(Y\mid K,D)$ é uma crença condicional legítima e pode ser avaliada; seu histórico não é uma reprodução calculada da atualização BPT acima. Caso a ponte não seja defensável, declarar que a implementação completa permanece pendente e entregar a parte sustentada.

## Combinar depois de calcular

Usar pesos iguais entre especialistas no piloto, preservando suas previsões separadas. Para o conjunto de pessoas com respostas completas aos cenários do alvo:

$$q_{\mathrm{pool},j}(y)=\sum_e\alpha_e q_{ej}(y),\qquad \alpha_e=1/E_{\mathrm{completo}}.$$

O resultado é um pool de previsões, e de previsões posteriores se cada componente foi calculado pela ponte. Não é automaticamente um posterior sobre quais especialistas estão corretos. Tal atualização entre modelos exigiria priors de modelo e evidências marginais comparáveis que razões internas aos estados não fornecem.

Calcular cada pacote antes de combinar evita cruzar pesos de um especialista com respostas de outro. Não multiplicar pareceres como observações independentes; não preencher células recusadas para manter o tamanho do painel. Fixar o conjunto completo por alvo e reportar cobertura, perdas e respostas parciais. Preferir o mesmo conjunto para os dois blocos quando viável; qualquer diferença deve permanecer explícita.

## Como obter $y^{rep}$

Para um bloco, $q_j$ já é uma distribuição sobre cinco resultados possíveis. Pode-se enumerar os cinco valores ou sortear uma categoria de $\operatorname{Categorical}(q_j)$. Não é necessário gerar um discurso plausível. O significado é uma resposta possível segundo nossa incerteza sobre um registro histórico fixo ainda desconhecido.

Isso constitui uma checagem preditiva de evidência reservada. Replicar produção, preservação e busca de um novo arquivo exigiria um modelo de observação adicional; não é o procedimento mínimo escolhido aqui. Como só foram especificadas marginais para os dois blocos, não sortear um vetor conjunto, multiplicar suas probabilidades ou calcular uma cauda agregada supondo independência. Uma média de escores marginais pode descrever desempenho, mas não cria essa distribuição conjunta.

# Validação, custódia e critérios de resultado

## Antes da revelação

O custodiante mantém uma matriz de exposição por pessoa e alvo: leitura do documento, conhecimento do fato por outra fonte e reconhecimento do episódio. O índice e trechos iniciais da BCN até a página 14 já foram expostos na preparação desta oficina. Isso não informa toda a exposição anterior do autor. As páginas do Senado foram identificadas como candidatas, não certificadas como desconhecidas. Uma URL nova pode repetir exatamente uma evidência conhecida.

Texto completo conhecido serve para treinar codificação e compreensão. Não pontuar sua leitura como previsão cega. Para a tarefa pontuável, entregar contexto sem resposta; arquivar pacote, versões do instrumento, probabilidades, alternativas e carimbo de congelamento antes de revelar o conteúdo ao autor/facilitador e aos eliciadores. A leitura anterior autorizada pelo custodiante fica registrada separadamente. As duas previsões devem ser congeladas antes de revelar qualquer uma delas, pois comissão e plenário podem transmitir a mesma informação.

Curadores e codificadores podem conhecer os textos, mas não as previsões. Dois codificadores aplicam o manual, registram passagem, autoria, contraexemplos e discordâncias; um procedimento de adjudicação resolve o código ou conserva I. Isso avalia aplicação do protocolo ao registro, sem transformar consenso em verdade sobre motivos. Para auditar recuperação, é necessário um conjunto identificado independentemente que inclua itens não recuperados, e não apenas revisar o que a busca já encontrou.

Se o desenho autoral já incorpora conhecimento dos alvos, a aplicação é retrospectiva mesmo que novos participantes desconheçam as respostas. Essa aplicação pode testar usabilidade e desempenho de participantes naquele corpus; não será descrita como teste independente da descoberta autoral.

## Depois da revelação

Apresentar a previsão inteira, o resultado, as razões, a sensibilidade e os custos, por bloco e por especialista. Usar escores próprios para avaliar distribuições, sem tratá-los como testes de hipótese causal. Para a realização $y_j$:

$$\operatorname{Brier}_{ej}=\sum_{k\in\{A,C,M,S,I\}}\big(q_{ej}(k)-\mathbb{1}\{y_j=k\}\big)^2,$$

$$\operatorname{LogLoss}_{ej}=-\log q_{ej}(y_j).$$

Menor é melhor; com essa convenção o Brier varia entre zero e dois. Probabilidade zero para o resultado observado produz perda logarítmica infinita. Não suavizar números depois da revelação. Brier e log avaliam a previsão integrada; não isolam calibração e não validam suas condicionais causais. [Gneiting e Raftery (2007)](https://doi.org/10.1198/016214506000001437).

I permanece visível, com sua causa, pois desempenho em prever irresolução não equivale a discriminação dos mecanismos. Resultados condicionados à resolução exigiriam uma previsão condicional predefinida e seu denominador; não basta apagar os I depois. Com dois blocos de uma reforma, apresentar diagnóstico descritivo, não curva de calibração, ranking confiável de especialistas ou intervalo que pressuponha blocos independentes.

\keepblock{18\baselineskip}

**Tabela 3. Interpretação dos possíveis resultados do piloto.** Os critérios são anteriores à pontuação.

| Resultado | Conclusão autorizada |
|---|---|
| Pergunta e cenários compreendidos, cadeia reproduzida | Executabilidade demonstrada nas condições do piloto |
| Cenários produzem previsões praticamente iguais | O alvo discrimina pouco essas configurações |
| Resultado recebe pouca massa em todos os pacotes defensáveis | Problema de adequação do conjunto de previsões; investigar conteúdo, observação e especificação |
| Diagnóstico muda entre pacotes plausíveis | Conclusão sensível à elicitação; apresentar a faixa e as suposições decisivas |
| Desempenho documental favorável segundo os escores predefinidos | Resultado favorável para aquele alvo; não certifica motivo nem elo |
| Falta âncora, reserva ou números defensáveis | Limitação registrada; instrumento parcial ou demonstração retrospectiva |

O conjunto de sensibilidade conterá **pacotes coerentes completos para as consultas marginais**, variando pressupostos relevantes de pesos e respostas e recalculando as previsões. Extremos de células de diferentes pacotes não formam uma distribuição. Falha preditiva não aumenta automaticamente a probabilidade de um rival e não localiza sozinha o elo causal responsável. Depois de revisar o modelo com a resposta revelada, uma nova avaliação exige outra oportunidade elegível.

# Execução em fases e teste posterior de eficácia

Cinco pessoas podem cumprir o piloto: autor/facilitador, custodiante que também codifica, segundo codificador e dois especialistas que eliciam. Quem codifica não recebe os vetores antes da resolução. Se funções forem acumuladas de outro modo, publicar quem conhecia o quê em cada momento. Recrutamento e disponibilidade não foram verificados nesta oficina.

\keepblock{15\baselineskip}

**Tabela 4. Teto de trabalho proposto para planejar o piloto.** Horas de pessoas, excluindo recrutamento e aquisição externa; não são custos observados nem garantia de execução.

| Fase | Autor | Custodiante | Segundo codificador | Dois especialistas, total | Total |
|---|---:|---:|---:|---:|---:|
| Delimitação, inventário e exposição | 6 | 6 | 0 | 0 | 12 |
| Treino cognitivo em bloco conhecido | 8 | 3 | 3 | 6 | 20 |
| Aplicação completa em dois candidatos | 12 | 6 | 4 | 6 | 28 |
| Total planejado | 26 | 15 | 7 | 12 | 60 |

O teste cognitivo verifica se três horas por especialista por fase são suficientes. Se não forem, reduzir consultas ou rever o orçamento antes da aplicação; não pressionar para preencher números. Primeiro completar a ponte e uma previsão ainda não revelada; depois preencher e congelar a segunda, sem abrir a primeira. Essa divisão evita confundir um formulário condicional com o método inteiro.

Para quatro estados, $J$ blocos de $k$ categorias e $n$ itens sequenciais de desenvolvimento, a ponte usa $3+3n+4J(k-1)$ quantidades livres por especialista, adotando razões relativas. Com dois blocos e cinco categorias: **$35+3n$**, além de razões, alternativas e documentação. A hipótese de duas famílias de desenvolvimento faria 41 por especialista, mas é somente uma conta de planejamento. Não omitir evidência pertinente para cumprir esse limite; se o pacote exigir mais, rever a escala. Um ensaio delimitado não será apresentado como reprodução integral de Fairfield e Charman.

Depois de comprovar viabilidade, a avaliação de eficácia poderá comparar três braços: previsão direta competente; elicitação estruturada direta; elicitação estruturada com decomposição. Mesmo pacote informacional, alvos e orçamento total, incluindo treinamento. O segundo versus terceiro contraste isola melhor o ganho adicional da decomposição; primeiro versus segundo avalia a estruturação. Não usar a melhoria entre duas respostas consecutivas da mesma pessoa como efeito causal, devido a aprendizagem e ancoragem.

A opção principal para esse estudo futuro é **individual, sem discussão entre participantes**. Se o objeto for o protocolo completo com discussão, randomizar painéis independentes e realizar a inferência nessa unidade; um painel por braço não separa método de composição. Um desenho de randomização pode avaliar o efeito sobre participantes para aquele corpus fixo, mas não transforma perguntas em episódios históricos independentes.

Os números de 18–24 participantes e 8–12 oportunidades, sugeridos em uma proposta inicial, são hipóteses de planejamento. Exigem inventário, viabilidade e dimensionamento; não há justificativa de poder ou disponibilidade produzida aqui. Pesos por desempenho também são uma extensão: o piloto usa pesos iguais. Aprender pesos exigiria itens comparáveis de calibração e teste separados, evitando seleção no conjunto final. Métodos de ponderação de especialistas não transferem automaticamente validação entre quantis de grandezas, categorias documentais e estados causais latentes. [Cooke e Goossens (2008)](https://rogermcooke.net/rogermcooke_files/RESS3860-TUDdatabase.pdf).

# O que os dez participantes mudaram

As dez propostas foram escritas antes da leitura recíproca e preservadas com hashes. A crítica cruzada incluiu mensagens diretas de objeção e concessão, com registros separados da primeira rodada e da ratificação. O limite do ambiente permitia três subagentes ativos simultaneamente; a oficina foi escalonada. Todos os dez trabalharam sobre questões metodológicas, não apenas leitura de seções.

\keepblock{20\baselineskip}

**Tabela 5. Efeito da discussão sobre a proposta.** As decisões refletem argumentos, não votação como substituto de evidência.

| Participante e foco | Mudança incorporada |
|---|---|
| 01, protocolo humano | Reduziu alternativas obrigatórias e aceitou pacotes individuais completos |
| 02, fontes de petróleo | Mudou para Chile no piloto; distinguiu família de dependência e classe de ancoragem |
| 03, comparação chilena | Incorporou extensão e oportunidades de fala; retirou antes/depois como teste principal |
| 04, calibração | Fixou pesos iguais no piloto; separou scores documentais de validade causal |
| 05, identificação | Explicitou ponte K/prior/D e limites da atualização entre modelos humanos |
| 06, dependência | Retirou conjunta obrigatória para os dois blocos e preservou pacotes marginais |
| 07, custódia | Admitiu leitura pelo custodiante para genealogia, com controles de seleção e exposição |
| 08, instrumento | Passou a quatro estados e cinco categorias, com recusas e treino anterior ao congelamento |
| 09, avaliação adversarial | Separou piloto e ensaio de eficácia; resolveu interferência de discussão entre participantes |
| 10, viabilidade | Substituiu orçamento inicial por fases; incorporou custo de priors e likelihoods |

Persistem condições empíricas: cenários interpretáveis para a unidade, especialistas disponíveis, reserva adicional, material comparável e carga sustentável. A posição final é uma recomendação de desenho com essas condições, não validação por consenso. O ganho potencial para o paper será demonstrado se a aplicação mostrar melhor rastreabilidade, previsões úteis e diagnóstico de fragilidade a custo mensurável. A novidade comparativa e a superioridade do procedimento ainda precisam de pesquisa e teste.

\newpage

# Instrumento pronto para preenchimento

## Ficha 1. Manifesto e exposição

**Episódio:** Chile/2005, revogação definida neste protocolo. **Unidade:** UDI no Senado. Lista nominal e filiação na data: \underline{\hspace{3cm}}.

**Bloco:** comissão / plenário. Identificador: \underline{\hspace{3cm}}. Limites e paginação conferidos: \underline{\hspace{3cm}}.

URL, arquivo e hash: \underline{\hspace{3cm}}.

Data e título da sessão; gênero; papel dos atores; quantidade e extensão das intervenções: \underline{\hspace{3cm}}.

Fonte de desenvolvimento reproduzida ou citada no bloco; genealogia e destino de cada candidato: \underline{\hspace{3cm}}.

**Registro individual de exposição:** já leu o documento? Já conhece sua resposta por outra fonte? Reconheceu o episódio? Para cada resposta, registrar fonte, conteúdo, pessoa e momento: \underline{\hspace{3cm}}.

**Situação:** candidato / reserva elegível para participante / retrospectivo / estruturalmente vazio / pendente. Responsável e justificativa: \underline{\hspace{3cm}}.

Versão do pacote K/D e do manual: \underline{\hspace{3cm}}. Custodiante e segundo codificador: \underline{\hspace{3cm}}.

## Ficha 2. Cartões e compreensão

**E:** qual liderança; qual preocupação eleitoral; como alterou apoio, resistência ou timing? \underline{\hspace{3cm}}

**B:** quais interesses materiais; em relação a qual situação anterior; como a redução facilitou aceitação? \underline{\hspace{3cm}}

Condições comuns e outras causas que podem variar: \underline{\hspace{3cm}}.

Para 00/10/01/11, o especialista explica o que está assumido e o que será previsto. Explica por que cada coluna soma 100 e por que descrer pessoalmente no cenário não permite reduzir todas as suas células. Resultado: compreendeu / corrigido no treino / suspender números. Registro: \underline{\hspace{3cm}}.

**Rota selecionada antes da sessão:** previsão direta / condicionais por cenário / mistura com pesos elicitados / posterior calculado com Ficha 5. Produtos de rotas diferentes conservarão seus rótulos.

\newpage

## Ficha 3. Probabilidades de resposta de um bloco

Usar a pergunta e as categorias da Tabela 2. Primeiro registrar razões e ordenação, depois números. Repetir a ficha para o segundo bloco; não abrir o primeiro antes de congelar ambos.

Especialista e versão: \underline{\hspace{3cm}}. Bloco: \underline{\hspace{3cm}}.

Ordem e justificativa sob 00: \underline{\hspace{3cm}}.

Sob 10: \underline{\hspace{3cm}}.

Sob 01: \underline{\hspace{3cm}}.

Sob 11: \underline{\hspace{3cm}}.

\keepblock{12\baselineskip}

**Tabela 6. Alocação de 100 pontos em cada coluna usada.** Campos vazios não são zeros. A coluna direta é alternativa de rota, não obrigação adicional.

| Resultado | 00 | 10 | 01 | 11 | Direta |
|---|---|---|---|---|---|
| A | ______ | ______ | ______ | ______ | ______ |
| C | ______ | ______ | ______ | ______ | ______ |
| M | ______ | ______ | ______ | ______ | ______ |
| S | ______ | ______ | ______ | ______ | ______ |
| I | ______ | ______ | ______ | ______ | ______ |
| Soma | ______ | ______ | ______ | ______ | ______ |

Como passou das razões aos pontos? \underline{\hspace{3cm}}

Que informação mudaria a alocação? \underline{\hspace{3cm}}

**Recusa ou limitação:** conhece alvo / cenário indefinido / só ordenação defensável / falta âncora absoluta / fora da especialidade / outra. Explicação e informação necessária: \underline{\hspace{3cm}}.

## Ficha 4. Procedência e sensibilidade

Para cada vetor: fonte, página, passagem e acesso: \underline{\hspace{3cm}}.

Base: lógica / contagem / analogia / experiência / julgamento sem âncora.

Se contagem: numerador e denominador por categoria, regra de inclusão, unidades dependentes: \underline{\hspace{3cm}}.

Se transporte: semelhança e diferença de ator, papel, estágio, gênero, audiência e contexto; direção esperada do ajuste: \underline{\hspace{3cm}}.

Alternativa completa e premissa alterada: \underline{\hspace{3cm}}.

Consequências da alteração sobre outros vetores/pesos; componentes mantidos e justificativa: \underline{\hspace{3cm}}.

Preservar a versão central. Alternativas são especificações de sensibilidade; não são quantis nem contagens adicionais. Não corrigir apenas a célula que falhou depois da revelação.

\newpage

## Ficha 5. Ponte Bayesiana, preenchida uma vez por especificação

**Encaminhamento por rota:** previsão direta usa a coluna direta da Ficha 3 e dispensa esta ficha; condicionais sem pesos conservam os quatro vetores separadamente e não produzem previsão marginal integrada; mistura com pesos elicitados usa somente o campo abaixo; posterior calculado usa K/D, prior e atualização da Tabela 7. Não preencher prior ou razões fictícias para completar uma rota diferente.

**Pesos diretamente elicitados, se essa for a rota:** $w_{00}$ ______; $w_{10}$ ______; $w_{01}$ ______; $w_{11}$ ______; soma ______. Conhecimento condicionado, fonte, razões e alternativas que sustentam esses pesos: \underline{\hspace{3cm}}. Identificar a previsão resultante como mistura com pesos elicitados, sem alegar reconstrução calculada da atualização.

**K:** contexto, desfecho, metadados informativos dos dois blocos e fatos conhecidos que definem o prior. Fonte e versão: \underline{\hspace{3cm}}.

**D:** itens usados para atualizar; origem, dependências, ordem, conteúdo já conhecido e omissões pertinentes: \underline{\hspace{3cm}}.

O especialista já conhecia D antes de reconstruir o prior? Sim / não / parcialmente. Descrever a reconstrução retrospectiva e outros conhecimentos: \underline{\hspace{3cm}}.

\keepblock{13\baselineskip}

**Tabela 7. Prior, atualização e pesos dos estados.** Repetir as linhas de razão para todos os itens/famílias pertinentes; $c_0$ deve ser identificado. Guardar justificativas junto aos valores.

| Componente | 00 | 10 | 01 | 11 |
|---|---|---|---|---|
| Prior $\pi$ (soma 1) | ______ | ______ | ______ | ______ |
| Razão para $D_1$ dado K | ______ | ______ | ______ | ______ |
| Razão para $D_2$ dado K, $D_1$ | ______ | ______ | ______ | ______ |
| Demais itens, em anexo | ______ | ______ | ______ | ______ |
| Peso posterior calculado $w$ | ______ | ______ | ______ | ______ |

Estado de referência e suporte positivo: \underline{\hspace{3cm}}.

Justificativa do prior e de cada razão, incluindo credibilidade das fontes e condicionamento: \underline{\hspace{3cm}}.

Conferências: normalização / suporte / dependência / unidade comum / probabilidades absolutas na Ficha 3 / cálculo reconstruível / atualização retrospectiva identificada. Revisor distinto do responsável pelo cálculo: \underline{\hspace{3cm}}.

\newpage

## Ficha 6. Congelamento, resolução e avaliação

**Rota de avaliação:** direta, mistura elicitada e posterior calculado têm distribuições marginais que podem receber Brier/log loss, mantendo seus rótulos. Condicionais sem pesos permitem comparar o registro com as implicações de cada cenário; não geram um escore principal de previsão integrada nem validam as probabilidades condicionais ao mecanismo verdadeiro, que permanece desconhecido.

Pacotes individuais e alternativas congelados em: \underline{\hspace{3cm}}.

Regra do pool, especialistas completos e perdas: \underline{\hspace{3cm}}.

Codificador 1: código, trechos e autoria \underline{\hspace{3cm}}.

Codificador 2: código, trechos e autoria \underline{\hspace{3cm}}.

Adjudicação: resultado, motivo, conflito e causa de I, se houver \underline{\hspace{3cm}}.

Distribuições previstas, Brier e log loss por pessoa/pool; sensibilidade; horas efetivas; divergências de procedimento: \underline{\hspace{3cm}}.

**Tabela 8. Registro de desempenho por bloco.** Preencher somente se a rota produzir a distribuição marginal correspondente; conservar também os cinco valores previstos e o código observado. Não inserir zeros em campos inaplicáveis.

| Bloco | Previsão | Brier | Log loss | Rota e versão |
|---|---|---|---|---|
| Comissão | Especialista 1 | ______ | ______ | ______ |
| Comissão | Especialista 2 | ______ | ______ | ______ |
| Comissão | Pool | ______ | ______ | ______ |
| Plenário | Especialista 1 | ______ | ______ | ______ |
| Plenário | Especialista 2 | ______ | ______ | ______ |
| Plenário | Pool | ______ | ______ | ______ |

Conclusão permitida pela Tabela 3; informação nova necessária; versão a testar depois: \underline{\hspace{3cm}}.

**Estado desta entrega:** fichas preparadas, não preenchidas. Nenhum campo em branco constitui estimativa implícita. As fontes do relatório, propostas, mensagens de debate e decisões de revisão devem acompanhar o PDF como registro de desenvolvimento do método.
