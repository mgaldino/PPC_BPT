---
title: "Como fazer checagens preditivas no process tracing Bayesiano"
subtitle: "Proposta metodológica, debate entre agentes e plano de validação"
author: "Relatório de trabalho para Manoel Galdino"
date: "10 de outubro de 2026"
lang: pt-BR
fontsize: 11pt
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
  - \fancyhead[R]{\small Proposta metodológica}
  - \fancyfoot[C]{\thepage}
  - \setlength{\headheight}{14pt}
  - \setlength{\emergencystretch}{3em}
---

# Decisão metodológica recomendada

A dificuldade indicada pelo autor é o centro da contribuição: no process tracing, não basta escrever a integral preditiva, pois falta especificar o equivalente observável de $y^{rep}$. A solução recomendada é **prever respostas ainda desconhecidas a perguntas documentais previamente delimitadas**, usando uma distribuição de resultados possíveis. O método não precisa gerar textos, entrevistas ou histórias alternativas completas. Precisa justificar a distribuição das respostas que um procedimento de observação pode produzir.

No núcleo da proposta, $Y_B$ é o vetor de respostas de um bloco reservado. Seus componentes podem registrar sequência temporal, expressão de uma justificativa, decisão explícita, mobilização documentada ou combinação dessas características. Cada pergunta tem categorias exaustivas, regra de codificação e um conjunto de fontes definido antes da revelação. Um sorteio de $Y_B$ representa uma resposta possível segundo o modelo. Para poucos resultados, enumerar suas probabilidades é mais transparente que simular milhares de réplicas.

Essa é uma **checagem preditiva posterior de evidências reservadas**. Deve ser distinguida do PPC convencional que replica observações do mesmo desenho depois de usar esses dados no ajuste. Em um arquivo histórico fixo, a resposta já existe; nossa incerteza é sobre seu conteúdo. Repetir a produção do arquivo, sua preservação ou a história política exige outro modelo e outras hipóteses. Essa extensão é útil em alguns desenhos, mas não deve ser uma exigência geral do método.

A proposta não elimina o julgamento na construção de probabilidades. Torna explícito o que precisa ser julgado, permite auditar a procedência dos números e mostra quando a informação disponível não sustenta uma checagem informativa. O artigo pode avançar ao demonstrar precisamente esse limite e oferecer um procedimento praticável para superá-lo em condições especificadas.

O manuscrito foi lido integralmente, com sete leituras independentes de seções e suplemento, seguidas de três propostas técnicas e debate cruzado. O texto do paper foi preservado. Os exemplos deste relatório são sintéticos; nenhuma simulação de desempenho, nova análise empírica ou implementação do método foi executada. A proposta é completa como desenho a desenvolver, não como método já validado ou garantia de publicação.

# O que o debate decidiu

O proponente A desenvolveu um modelo gerador de resultados de busca, com estados históricos compartilhados e processos de registro. B defendeu uma versão mínima baseada em perguntas reservadas e probabilidades finitas. C trabalhou os limites de identificação, o desenho de coleta e a validação comparativa. As propostas foram salvas antes da leitura dos outros pareceres e depois apresentadas diretamente aos colegas.

**Tabela 1. Decisões decorrentes do debate.** As concessões registram mudanças na proposta, não uma votação sobre validade científica.

| Questão | Objeção relevante | Decisão |
|---|---|---|
| O que replicar? | Um arquivo fixo não é produzido novamente ao sorteá-lo. | Núcleo de previsão de respostas desconhecidas; réplica de produção/observação é extensão separada. |
| Basta um corpus completo? | Completude do arquivo não garante registro de tudo o que ocorreu. | Distinguir disponibilidade, registro e ocorrência histórica. |
| Basta codificar 0/1? | A dicotomização pode ocultar ausência de informação e contradição. | Categorias exaustivas e preservação dos trechos e regras de codificação. |
| É preciso modelar toda a história? | Um gerador amplo acrescenta parâmetros que poucos documentos não identificam. | Modelar somente os alvos; ampliar quando a interpretação exigir. |
| Qual discrepância escolher? | Discriminar rivais não é o mesmo que detectar uma falha compartilhada. | Incluir alvos de adequação comum e alvos de discriminação. |
| Decompor melhora a previsão? | Duas representações da mesma distribuição produzem previsões iguais. | Demonstrar ganho de construção, custo ou diagnóstico sob restrições; não atribuir ganho à notação. |

A divergência inicial mais importante foi entre enfatizar uma réplica do processo documental e enfatizar a previsão epistêmica de material reservado. A convergência resultante é uma arquitetura em níveis: a versão mínima responde à pergunta operacional do autor; extensões observacionais permitem interpretações mais ambiciosas quando suas hipóteses forem sustentáveis.

# Por que o paper atual ainda não resolve o problema

O manuscrito reconhece corretamente a Eq. 3.11 de Fairfield e Charman e a atomização de hipóteses. A contribuição deve continuar sendo uma extensão operacional dessa base. A conferência direta das páginas 122–123 do livro confirma a marginalização sobre cenários e a aproximação por cenários dominantes. Não há fundamento para caracterizar a teoria de FC como desprovida de estrutura interna.

O obstáculo está na passagem entre essa estrutura e dados verificáveis. As linhas 199–213 do Rmd prescrevem identificar holdout, eliciar probabilidades e avaliar coerência, mas não definem em geral o espaço de resultados, a regra de busca ou a distribuição conjunta. Além disso, a definição de configuração como vetor completo de estados, na linha 107, não está compatibilizada com a integração sobre esses mesmos estados dentro da configuração, nas linhas 180–188.

Também precisa ser revista a tese de que PPC só existe com parâmetros internos incertos. Um modelo Bernoulli com probabilidade conhecida já gera observações replicadas; uma posterior degenerada não impede a checagem. A decomposição pode revelar componentes relevantes e facilitar probabilidades coerentes, mas não cria a possibilidade matemática de PPC. A literatura de checagem preditiva liga o procedimento a distribuições de observações e discrepâncias, não à obrigação de haver dois níveis não degenerados de incerteza ([Gelman, Meng e Stern, 1996](https://www3.stat.sinica.edu.tw/statistica/j6n4/j6n41/j6n41.htm)).

Um resultado elementar pode organizar a motivação do novo artigo. Considere duas hipóteses com priors iguais. As probabilidades de uma evidência observada podem ser $(0{,}9;0{,}1)$ ou $(0{,}09;0{,}01)$. Ambos os pares dão Bayes factor 9 e posterior 0,9 para a primeira hipótese. Para uma nova oportunidade da mesma classe, condicionalmente independente dada a hipótese, as probabilidades preditivas são, respectivamente,

$$0{,}9(0{,}9)+0{,}1(0{,}1)=0{,}82,$$
$$0{,}9(0{,}09)+0{,}1(0{,}01)=0{,}082.$$

**O posterior sobre rivais não determina a adequação preditiva absoluta.** Para um evento distinto, também são necessárias probabilidades que liguem as hipóteses a esse novo evento. Razões de verossimilhança isoladas não as fornecem. Esse resultado é matematicamente simples; sua função é demonstrar qual informação adicional a operacionalização exige, sem reivindicar um novo teorema de Bayes.

# Definir o equivalente qualitativo de y-rep

## Uma pergunta precisa de um procedimento de observação

Uma oportunidade observacional deve especificar: ator ou organização; episódio e período; conjunto documental; pergunta; procedimento de recuperação; regra de inclusão; categorias possíveis; critério de encerramento; informação que o analista já conhece. A unidade pode ser uma família documental inteira. Uma notícia que reproduz uma entrevista e outra notícia baseada na primeira não são novas testemunhas independentes.

Uma pergunta possível para o Chile é: “Nos registros partidários delimitados, a decisão definitiva de aceitar a mudança tributária aparece como anterior ao desafio público ou como resposta posterior a ele?”. Essa pergunta não mede automaticamente percepção privada de ameaça eleitoral nem demonstra que a liderança superou resistência. Seu alvo imediato é a sequência documentada da decisão.

**Tabela 2. Exemplo de categorias observáveis para a pergunta temporal.** As regras finais dependeriam da leitura de desenvolvimento e seriam congeladas antes da reserva.

| Código | Resultado do procedimento | Interpretação limitada |
|---|---|---|
| R | Registro explícito de decisão posterior e reativa | Vestígio compatível com resposta ao desafio. |
| A | Registro explícito de decisão definitiva anterior | Vestígio contrário à sequência reativa definida. |
| I | Material acessível inconclusivo ou conflitante | A consulta não resolve a sequência. |
| M | Material necessário inacessível | A oportunidade não foi observada como planejado. |

As categorias se referem a propriedades de registros, e não a um codificador decidindo se a hipótese é verdadeira. Sua exaustividade depende de regras para fontes conflitantes, datas incertas e decisões provisórias. Se categorias diferentes forem substantivamente importantes, devem ser preservadas em vez de comprimidas em I. Guardar a codificação detalhada permite verificar o que uma classificação agregada encobre.

## Modelo mínimo e ontologia

Defina $M$ como a especificação probabilística, $C$ como uma configuração histórica completa e $\psi$ como parâmetros adicionais de observação. A configuração é fixa no mundo, mas incerta para o pesquisador. Denote por $D_A$ a informação já utilizada e por $a_B$ o protocolo do bloco reservado. Uma distribuição preditiva suficientemente geral é

$$
q_M(y_B\mid D_A,a_B)=
\sum_c\int p(y_B\mid c,\psi,D_A,a_B,M)
p(c,\psi\mid D_A,M)\,d\psi.
$$

O condicionamento em $D_A$ no primeiro termo não deve ser retirado sem uma hipótese que permita fazê-lo. A informação já conhecida pode afetar a fonte reservada mesmo depois de condicionarmos nos elos propostos. Dependência residual não desaparece porque os documentos pertencem a arquivos diferentes.

Uma hipótese narrativa pode definir uma restrição sobre $C$ ou pertencer a outro modelo $M$. Hipóteses amplas podem se sobrepor: para somar pesos como alternativas exclusivas, é necessário construir uma partição ou trabalhar diretamente sobre o espaço comum de configurações. Se $C$ já fixa todos os elos, não se volta a sortear os mesmos elos dentro de $C$. Parâmetros adicionais precisam ter significado distinto.

Modelar diretamente $q_M$ para as respostas também é admissível, sem explicitar todas as variáveis históricas intermediárias. Nesse caso, a checagem alcança a distribuição das respostas; a atribuição de sua falha a um mecanismo específico fica mais limitada. Caso e desfecho histórico selecionados fazem parte do condicionamento: prever traços dentro de uma reforma aprovada não equivale a prever os traços em todas as reformas possíveis.

## Como gerar ou calcular concretamente

Suponha, somente para ilustração, posterior $(0{,}8;0{,}2)$ sobre dois modelos: resposta reativa e decisão antecipada. As probabilidades abaixo são estipuladas, não estimadas para o Chile.

**Tabela 3. Gerador categórico mínimo sintético.** Cada coluna de probabilidades soma 1. A última coluna integra os pesos posteriores 0,8 e 0,2.

| Resultado | Modelo reativo | Modelo antecipado | Preditiva |
|---|---:|---:|---:|
| R | 0,70 | 0,20 | 0,60 |
| A | 0,05 | 0,50 | 0,14 |
| I | 0,15 | 0,20 | 0,16 |
| M | 0,10 | 0,10 | 0,10 |

Uma réplica consiste em sortear um dos quatro resultados com probabilidades $(0{,}60;0{,}14;0{,}16;0{,}10)$. Equivalentemente, sorteia-se primeiro o modelo de acordo com o posterior e depois a resposta na coluna correspondente. Para uma só pergunta, não é necessário fazer sorteios: a tabela já fornece a distribuição exata.

Para várias perguntas, sorteia-se uma configuração compartilhada para o vetor inteiro e depois as respostas segundo a distribuição conjunta condicional. Sortear um mecanismo novo e independente para cada fonte faria fontes do mesmo episódio se referirem a histórias diferentes e alteraria artificialmente a dependência. Quando o estado de um fato histórico já tiver sido aprendido com certeza, uma nova consulta ao mesmo fato não constitui uma nova ocorrência independente desse fato.

Essa tabela não demonstra que o modelo real fará boas previsões. Ela demonstra qual objeto precisa ser construído e como se calcula sua distribuição. O trabalho científico está em justificar suas células e seus pressupostos. A geração de texto por LLM não fornece essa justificativa: a frequência com que um modelo escreve uma narrativa depende do treinamento, do prompt e da amostragem textual, não é automaticamente a probabilidade de um arquivo histórico conter certo registro sob uma hipótese causal.

# De onde vêm as probabilidades

Cada probabilidade precisa de uma trilha de procedência. A prioridade é usar restrições substantivas claras, evidência comparável com condições de transporte defendidas, auditoria do processo de registro/recuperação e elicitação prospectiva. Na elicitação, pedir probabilidades de todas as categorias, referências que sustentam o julgamento e intervalos plausíveis. Normalizar uma coluna é necessário, mas não demonstra calibração.

Separar especialistas substantivos de pessoas que conheçam os arquivos pode ajudar a distinguir “o que o mecanismo produz” de “o que o acervo permite encontrar”. A concordância entre codificadores informa consistência; acurácia exige uma referência independente quando disponível. Diferentes LLMs ou prompts podem explorar sensibilidade, mas não devem contar como observações independentes nem substituir uma validação fora do alvo.

Se o modelo for reconstruído com novas configurações, não se pode transportar automaticamente o posterior 0,99 ou 0,71 da análise original. Uma nova partição, novos priors ou novas likelihoods podem alterar os pesos. Deve-se recalcular o posterior a partir de $D_A$ ou apresentar uma ponte modular explícita e seus limites. O posterior publicado pode permanecer como benchmark separado.

O custo de elicitação deve ser visível. Com $J$ perguntas de quatro categorias, uma tabela conjunta irrestrita tem $4^J-1$ probabilidades livres por modelo. Esse crescimento impede recomendar simplesmente muitas perguntas independentes. As alternativas são blocos pequenos, fatorações justificadas, compartilhamento de parâmetros ou apenas checagens marginais. A fatoração é uma hipótese científica, não uma conveniência neutra.

Quando não há base para números pontuais, use um conjunto $\Gamma$ de modelos probabilísticos completos e coerentes. Para cada $\gamma$, calcule o posterior e a previsão correspondentes. Relate

$$\underline q(B)=\inf_{\gamma\in\Gamma}P_\gamma(B\mid D_A,a_B),\qquad
\overline q(B)=\sup_{\gamma\in\Gamma}P_\gamma(B\mid D_A,a_B).$$

Não combine o menor valor de cada célula em uma distribuição que já não soma 1. Não interprete uma faixa de sensibilidade como intervalo de credibilidade, salvo se existir uma distribuição probabilística justificada sobre seus componentes. Se $\Gamma$ permitir quase qualquer resposta, o teste é pouco informativo. Esse resultado deve ser mostrado, não resolvido escolhendo o número que produz o diagnóstico desejado.

# Ausência, dependência e localização das falhas

Considere $X$ como ocorrência real de mobilização e $Z$ como registro recuperado. Com sensibilidade de detecção $d$ e falso positivo $f$,

$$P(Z=1\mid H,a)=d_aP(X=1\mid H)+f_a[1-P(X=1\mid H)].$$

Se $f=0$, a observação informa o produto entre ocorrência e detecção. Um registro raro pode refletir mobilização rara ou pouca capacidade de encontrá-la. Sem informação adicional, não há identificação separada. Registrar o silêncio documental como zero não resolve esse problema.

A extensão gerativa explicita etapas como ocorrência, produção do registro, preservação, acesso e codificação. É apropriada quando essas etapas têm âncoras externas ou restrições defensáveis. Não é necessário estimar um parâmetro diferente para cada documento: um modelo tão flexível pode absorver qualquer discrepância e eliminar a capacidade de checagem. Em arquivos finitos, repetir hipoteticamente a produção ou preservação é um alvo adicional, que deve ser nomeado.

Dependência deve ser registrada por genealogia de fontes e eventos. Blocos diferentes podem depender de uma mesma decisão, informante ou organização. Um produto de probabilidades marginais exige independência; não decorre de ter dividido os arquivos em blocos. Se $P(A)=0{,}8$ e $P(B)=0{,}7$, a probabilidade de $A\cap B$ pode variar de 0,5 a 0,7. O valor 0,56 corresponde a uma hipótese adicional. Marginais permitem checar perguntas individuais e calcular a esperança de uma soma; não determinam a cauda dessa soma.

Há também um limite de localização. Se duas explicações, com valores plausíveis de seus parâmetros observacionais, induzem a mesma distribuição nos alvos escolhidos, nenhum diagnóstico baseado nesses alvos as distingue. Diferenças nas previsões são necessárias, mas poucos alvos podem ter pouco poder para detectá-las. A menor divergência igual a zero impede discriminação uniforme sobre toda a classe; não implica que cada observação seja inútil em qualquer configuração particular.

A saída inicial de uma falha deve ser uma lista de componentes compatíveis com ela: sequência causal, contexto, produção do registro, seleção, recuperação ou codificação. Identificar um elo específico exige previsões distinguíveis e informação que restrinja as explicações observacionais. A melhor unidade diagnóstica pode ser um bloco de elos, como percepção de ameaça e decisão da liderança, e não um elo individual.

\newpage

# Como avaliar uma previsão e decidir o que revisar

É necessário separar quatro operações: prever uma resposta reservada; avaliar sua compatibilidade com uma distribuição; comparar rivais por Bayes factor; e revisar a especificação. Um resultado pode favorecer um rival sem ser surpreendente sob o modelo agregado. Também pode ser improvável sob todos os rivais, embora um deles vença a comparação.

**Tabela 4. Exemplo conjunto sintético que separa atualização e inadequação.** $R$ e $L$ representam determinações documentais sobre sequência reativa e defesa empresarial. Para esta ilustração apenas, pressupõem-se registro, recuperação e codificação perfeitos; isso não decorre de o arquivo ser completo. Pesos anteriores ao bloco: 0,8 para equidade com interesses elevados e 0,2 para equidade com baixos interesses.

| Resposta $(R,L)$ | Interesses elevados | Baixos interesses | Preditiva |
|---|---:|---:|---:|
| (1,1) | 0,65 | 0,08 | 0,536 |
| (1,0) | 0,25 | 0,82 | 0,364 |
| (0,1) | 0,05 | 0,02 | 0,044 |
| (0,0) | 0,05 | 0,08 | 0,056 |

Se o resultado for $(1,0)$, o Bayes factor a favor dos baixos interesses é $0{,}82/0{,}25=3{,}28$. Seu peso posterior passa a aproximadamente 0,451. Entretanto, o padrão tinha probabilidade preditiva 0,364. O apoio relativo ao composto não é demonstração de má especificação das likelihoods anteriores.

Uma discrepância específica, escolhida antes da revelação, poderia indicar a combinação “sem sequência reativa, mas com defesa empresarial”. Na tabela, esse indicador tem probabilidade 0,044. Se observado, cria uma tensão dirigida àquela implicação. Não é teste geral de adequação; tampouco justifica escolher esse indicador somente depois de encontrar o resultado. Uma realização particular rara não basta por si só: em espaços grandes, quase todas as realizações exatas podem ser raras.

Para discrepâncias substantivas $T_k$, comparar o mesmo $T_k$ no observado e no predito. Quando útil, apresentar uma área de cauda

$$p_{T_k}=P\{T_k(Y_B^{rep})\geq T_k(y_B)\mid D_A,a_B\}.$$

Seu significado depende do alvo, do condicionamento e da escolha de $T_k$. Não é automaticamente um teste frequentista com nível conhecido, nem probabilidade de a hipótese ser verdadeira. No núcleo proposto, priorizar gráficos ou tabelas de previsão, discrepâncias direcionais e análise de sensibilidade. Qualquer regra automática de alarme deve ser avaliada no desenho de validação.

Sob $\Gamma$, um diagnóstico robusto exige que a tensão permaneça nas especificações plausíveis pertinentes, por exemplo com a maior área de cauda ainda pequena. O exemplo pode facilmente mudar de interpretação: pesos entre 0,7 e 0,9 e probabilidades condicionais da discrepância entre 0,04–0,06 e 0,01–0,03 admitem caudas de 0,031 a 0,057. Um corte de 0,05 não daria uma decisão robusta.

Brier score ou log score podem comparar previsões repetidas, usando os mesmos alvos e informação. Sua propriedade em expectativa não torna um score isolado uma medida de calibração ([Gneiting e Raftery, 2007](https://sites.stat.washington.edu/people/raftery/Research/PDF/Gneiting2007jasa.pdf)). Em uma sequência prospectiva, prever, revelar, pontuar e depois atualizar constitui outra opção, desde que a ordem e a política adaptativa estejam documentadas. Uma reserva usada para revisar o modelo torna-se desenvolvimento; avaliar a revisão exige nova reserva.

# Procedimento operacional a implementar

1. **Definir alvo e informação inicial.** Fixar caso, período, desfecho condicionado, modelos/configurações e tudo que já foi visto. Distinguir perguntas sobre registros de perguntas sobre fatos históricos.
2. **Construir oportunidades.** Listar fontes por metadados e famílias de origem. Escrever perguntas, categorias, critérios de busca/parada e codificação. Incluir alvos que possam contradizer todos os rivais, além dos que os discriminam.
3. **Auditar a possibilidade de reserva.** Verificar se os resultados realmente não foram usados na modelagem, elicitação ou escolha de perguntas. Se já conhecidos, rotular o exercício como retrospectivo/exploratório.
4. **Especificar probabilidades.** Preencher distribuições normalizadas, sua procedência e dependências. Declarar parâmetros fixos, estimados, elicitados ou apenas limitados por faixas. Verificar as restrições lógicas.
5. **Obter o posterior conjunto.** Usar $D_A$ e a especificação proposta; evitar multiplicação automática de posteriores marginais dos elos ou transporte injustificado de pesos da análise anterior.
6. **Congelar previsões e discrepâncias.** Calcular por enumeração ou simulação; guardar a versão do modelo, o protocolo, as alternativas de sensibilidade e os resultados previstos antes da revelação.
7. **Revelar e codificar.** Codificação preferencialmente cega às previsões. Manter trechos, contexto e discordâncias; inacessibilidade e busca inconclusiva são resultados registrados, não evidências negativas automáticas.
8. **Diagnosticar e documentar.** Separar adequação, comparação de rivais, sensibilidade e possíveis causas de falha. Atualizar ou revisar somente depois de registrar o diagnóstico; avaliar revisões em material adicional.

**Tabela 5. Especificação mínima dos arquivos de uma futura implementação em R.** Trata-se de desenho, não de arquivos analíticos já executados.

| Arquivo | Conteúdo essencial |
|---|---|
| `opportunities.csv` | Pergunta, ator, período, fonte, família, desenho, categorias e regra de parada. |
| `evidence_register.csv` | Data do fato, produção e acesso, exposição anterior, papel treino/reserva, trecho e codificação. |
| `configurations.csv` | Vetores completos, restrições e priors; relação com hipóteses narrativas. |
| `probability_models.csv` | Probabilidades conjuntas/condicionais, procedência, restrições e cenários de sensibilidade. |
| `dependencies.csv` | Eventos e fontes compartilhados, relações de transmissão, fatoração assumida. |
| `R/` | Validação de entradas, posterior, previsão, discrepâncias e exportação de resultados. |

O primeiro protótipo deve privilegiar enumeração exata de espaços pequenos. As funções podem aceitar um modelo completo e devolver probabilidades do bloco, predições marginais, discrepâncias e rastreamento de quais premissas determinam cada resultado. Não é necessário começar construindo um pacote geral ou uma nova infraestrutura de MCMC. Separar scripts de cálculo do documento final, conforme as preferências do projeto.

# Aplicações: o que aproveitar e o que reconstruir

## Chile: piloto do protocolo e limite do diagnóstico privado

O material já utilizado em $E_4/E_5$, incluindo os episódios ILD e “1999 trap”, reaparece na descrição de $e^*_3$. Essa sobreposição precisa ser auditada; não basta atribuir outro rótulo à mesma evidência. Os leitores confirmaram esse problema delimitado, preservando o reconhecimento no paper de que seus protocolos foram apenas parcialmente implementados.

O proponente C localizou o [PDF oficial da História da Lei 20.028](https://www.bcn.cl/obtienearchivo?id=recursoslegales%2F10221.3%2F37346%2F2%2FHL20028.pdf), cujo endereço estava pendente no suplemento. Verificou identidade, estrutura e a nota de omissão editorial de documentos de mera tramitação. O coordenador confirmou a referência no índice oficial; sua abertura direta teve erro. Não houve nova codificação substantiva do corpus nesta tarefa.

Esse acervo pode sustentar um piloto de registro e expressão pública: perguntas sobre justificativas documentadas, sequência dos debates e respostas partidárias. O que foi visto nesta tarefa é desenvolvimento. Uma eventual divisão posterior precisa considerar episódios e fontes comuns, e não páginas aleatórias. Evidências de percepção privada ou override da liderança exigem fontes capazes de registrá-los; debate público favorável não os substitui.

O baixo valor material do benefício precisa de evidência própria, com unidade e período definidos. Silêncio de lobbying, isoladamente, não mede esse valor nem prova que ele causou a ausência de mobilização. Se atas internas ou fontes pertinentes não forem acessíveis, o elo privado deve ser marcado como não testável nesse desenho. Isso é um resultado metodológico útil, em vez de uma lacuna preenchida com probabilidades precisas sem fundamento.

## Petróleo: aplicação mais rica, condicionada à viabilidade

A heterogeneidade empresa–episódio–período oferece mais oportunidades observacionais, mas exige delimitação. A aplicação principal pode usar documentos produzidos durante a janela da análise original e não utilizados na especificação. É preciso auditar primeiro a existência de um inventário e de uma reserva viável. Relatórios de investigação e documentos divulgados são selecionados; frequências no acervo não devem ser generalizadas ao universo corporativo sem justificativa.

Separar data de comportamento, data de produção e data de divulgação. Mudanças de investimento em 2023–2025 não mostram, sozinhas, que uma likelihood de apoio público anos antes estava errada. Se a pergunta for prospectiva, usar um modelo de transição contextual e assumir esse novo alvo explicitamente. Subsídios públicos, preços de carbono, gás e CCS são objetos diferentes; a divergência já registrada entre prompts sobre renováveis deve orientar a delimitação substantiva.

McCoy e os demais exemplos conhecidos permanecem desenvolvimento. A aplicação precisa de uma reserva adicional auditável ou de coleta prospectiva, não de um novo conjunto de textos que repita fatos já conhecidos. Se isso não for viável, a decisão é manter ilustração exploratória ou buscar outra aplicação, sem alterar a classificação da evidência para aparentar validação.

# O que demonstrar para uma contribuição competitiva

O posicionamento mais promissor é um método de checagem preditiva de implicações observáveis no BPT que explicita requisitos de informação, limites de diagnóstico e desenho de aquisição. A formulação por soma não é novidade. A documentação atual de [CausalQueries](https://integrated-inferences.github.io/CausalQueries/reference/data_helpers.html) já prevê geração com draws posteriores e estratégias de observação; o pacote deve ser concorrente ou infraestrutura. [Befani, Elsenbroich e Badham](https://journals.sagepub.com/doi/10.1177/1356389020980476) também constituem antecedente de probabilidades obtidas por simulação. A busca desta tarefa foi dirigida, não exaustiva; a originalidade exata continua a ser estabelecida.

Três resultados elementares devem aparecer com provas curtas: razões de verossimilhança não identificam a preditiva absoluta; ocorrência e detecção podem ser não identificadas separadamente; equivalência observacional impede localização de mecanismos a partir dos mesmos alvos. Um quarto resultado de controle é igualmente útil: decomposições equivalentes da mesma distribuição geram as mesmas previsões. O ganho do método deve vir da construção de restrições defensáveis, da aquisição de informação ou da explicação dos diagnósticos.

**Tabela 6. Quatro famílias mínimas para o estudo de simulação proposto.** Ainda não executadas; variar tamanho e separação de previsões dentro de cada família.

| Família | Variação central | O que avaliar |
|---|---|---|
| Modelo adequado | Mecanismo e observação corretamente especificados | Alarmes, cobertura e comportamento em evidência escassa. |
| Erro substantivo | Elo ausente, configuração omitida ou restrição causal incorreta | Capacidade de detectar falha e de localizar apenas o bloco distinguível. |
| Erro de observação | Detecção, seleção, dependência ou codificação mal especificadas | Risco de culpar o mecanismo e ganho das âncoras/faixas de sensibilidade. |
| Equivalência ou separação fraca | Rivais geram o mesmo padrão ou padrões próximos | Frequência de conclusões inconclusivas e proteção contra falsa localização. |

Erro de observação pode ser introduzido componente a componente antes de combinações, para permitir interpretação. Deriva temporal e elicitação adaptativa são extensões posteriores. Não é necessário iniciar com um fatorial enorme; é necessário incluir situações nas quais o método não deve conseguir diagnosticar.

Comparar BPT com cenários explícitos, CausalQueries e previsão direta com o mesmo orçamento informacional. Quando todos recebem a mesma distribuição conjunta, esperar equivalência; essa comparação verifica implementação. Para avaliar um ganho operacional, comparar o custo de elicitação, a qualidade fora da amostra, o número de probabilidades necessárias e o erro de localização sob procedimentos distintos de construção do modelo. Uma vantagem obtida fornecendo ao método proposto mais informação precisa ser atribuída à informação adicional.

Relatar alarmes, detecção, cobertura preditiva, erro de atribuição a elos, escores fora da amostra e custo para o pesquisador. Distinguir calibração computacional sob um modelo de validação empírica de suas probabilidades. Poucos checks históricos podem revelar uma tensão relevante; não demonstram calibração geral nem validade causal universal. Priors parcimoniosos e avaliação externa podem controlar complexidade; acrescentar um elo sem mudar as previsões não recebe penalização automática de PPC.

A *Political Analysis* exige materiais que permitam reproduzir as análises, incluindo fontes e derivação dos dados qualitativos conforme o desenho. Isso está explícito nas [diretrizes oficiais de replicação de 2025](https://www.cambridge.org/core/services/aop-file-manager/file/678f5f7189ee789cdb3a1df2/replication-guidelines-2025-v1.pdf). Provas, comparações e validações acima são recomendações científicas desta equipe, não uma lista de exigências universais da revista. A proposta oferece um caminho mais defensável; sua competitividade dependerá da execução e do ganho efetivamente demonstrado.

# Plano de execução e critérios de continuidade

A primeira fase deve produzir uma especificação pequena e verificável: uma ou duas famílias de oportunidades, categorias completas, uma distribuição conjunta, versões de sensibilidade e exemplos que separem adequação de comparação. Passa de fase quando outro pesquisador conseguir reconstruir todas as probabilidades a partir dos insumos, sem inferir silenciosamente decisões do autor.

A segunda fase implementa enumeração em R e compara resultados analíticos com os computacionais, incluindo zeros, categorias ausentes, dependência e distribuições que não normalizam. Depois executa as quatro famílias de simulação. Passa quando se conhece o comportamento do procedimento tanto em condições favoráveis quanto em condições de não identificação. Rodar o algoritmo sem erro é apenas verificação computacional.

A terceira fase audita a reserva empírica e realiza a aplicação. O modelo e as previsões precisam estar congelados antes de revelar os alvos. Se a auditoria mostrar que toda a informação pertinente já é conhecida, deve-se planejar nova aquisição ou reduzir o claim à ilustração exploratória. O estudo não deve depender da esperança de que registros privados indispensáveis venham a aparecer.

A quarta fase é a reescrita pelo autor, após os resultados: motivação pela dificuldade de replicação qualitativa; condições mínimas; protocolo; resultados formais; simulações; aplicação; limites. O enquadramento baseado em “criar parâmetros para tornar PPC possível” deve ceder lugar ao problema de especificar e verificar distribuições de evidências. As conclusões sobre Chile e petróleo serão determinadas pela nova análise, não preservadas como metas a confirmar.

# Verificações, artefatos e limites desta entrega

O contrato de fidelidade cobre as seis seções principais e o suplemento, com SHA-256 da fonte canônica começando por `8bcda550633f`. As tensões do texto foram registradas como tais. Seu PASS é documental, não científico. Dez problemas foram adjudicados: cinco confirmados e cinco parciais; a limitação já reconhecida pelo paper foi preservada nos veredictos parciais.

Os exemplos numéricos foram conferidos por substituição e leitura independente. Os cálculos originais 0,87425 e 0,41125 estão aritmeticamente corretos sob seus pesos implícitos, mas não estabelecem os pressupostos desses pesos. A célula preditiva de API no paper é incompatível com sua tabela: $0{,}75(0{,}71)+0{,}15(0{,}29)=0{,}5325$, e não 0,58. A identificação desse erro não substitui a revisão do modelo gerador.

O diretório desta entrega conserva as três propostas independentes, suas versões esclarecidas quando pertinentes, os registros de críticas e respostas, as posições finais, as fontes consultadas e a adjudicação. O manuscrito e o suplemento preexistentes não foram editados. Não foram executados testes empíricos, simulações de desempenho, chamadas a serviços pagos, publicação ou envio a terceiros. A compilação e a inspeção visual deste relatório verificam apenas a entrega documental.

Continuam abertas a originalidade frente à literatura, as âncoras das probabilidades, a utilidade sob elicitação viável e a disponibilidade de reserva empírica. Na ausência dessas condições, o método deve oferecer diagnóstico limitado ou inconclusivo.
