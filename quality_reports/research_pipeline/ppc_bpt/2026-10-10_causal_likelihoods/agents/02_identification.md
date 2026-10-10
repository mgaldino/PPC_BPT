# Agente 02: identificação, envelopes preditivos e o que falta medir

Data: 2026-10-10. Escopo: proposta metodológica; nenhuma edição do manuscrito. Contrato documental lido: `ppc_bpt:8bcda550633f:round1`, PASS documental. Fontes canônicas: `paper_draft_v1.Rmd`, linhas 394–505, e contrato correspondente. Conversas diretas realizadas com agentes 01 (fontes) e 03 (elicitação).

## Conclusão operacional

O pedido do usuário está correto: estimar adesões sem ligar o gerador a SA/CA não fornece o PPC do BPT pretendido. As fontes verificadas não contêm frequências condicionais de episódios com mecanismos SA/CA conhecidos independentemente, nem uma função estrutural suficiente para calcular essas frequências. Os valores pontuais das tabelas do manuscrito não podem ser recuperados dessas fontes por uma transformação matemática objetiva.

É possível avançar concretamente: construir conjuntos de likelihoods compatíveis com fontes e julgamentos separados; calcular envelopes exatos do PPC; localizar o parâmetro de observação ou decisão cujo aprendizado reduziria o envelope; e documentar quando o resultado permanece inconclusivo. Neste caso, o envelope sem julgamentos adicionais é vacuoso. Isso é um resultado verificável sobre a informação disponível, não um PPC pontual executado com sucesso.

## 1. Fixar o evento e a unidade antes dos números

Para McCoy, uma especificação defensável é: empresa ExxonMobil, episódio de apoio federal ao carbon pricing, contexto político e interlocução definidos, e protocolo de observação fixado. Seja `Y=1` quando o procedimento registra uma declaração elegível de um representante com o conteúdo operacional de que a utilidade do apoio público depende da expectativa de não aprovação da política.

Isso define um vestígio observável. Não define SA como `Y=1`, nem CA como `Y=0`. Um representante pode divergir da direção; a firma pode combinar motivos; declarações podem ser estratégicas; extração e divulgação podem selecionar trechos. A fonte pode estabelecer que a fala ocorreu. Não estabelece a taxa com que essa fala ocorreria em mundos SA ou CA.

API é uma associação empresarial, McCoy representa uma empresa, e investimentos CCS pertencem a projetos/firms distintos. Agrupá-los exige um modelo de composição e agregação. Não são quatro realizações independentes de um único mecanismo corporativo.

Os cerca de 0,71 do manuscrito são a posterior da hipótese no argumento agregado reconstruído. Não se tornam, sem modelo adicional, `P(H_Exxon=SA | E_Exxon)`. Os cálculos abaixo usam um peso genérico `w`; não transportam 0,71 a Exxon.

## 2. O que o gerador causal precisa conter

Uma fatoração ilustrativa, a ser adaptada ao caso, é

\[
p(Y\mid H,C,S)=\sum_z\int p(Y\mid z,\phi,C,S)\,p(z\mid H,\eta,C)\,p(\eta,\phi\mid H,C,S)\,d\eta\,d\phi.
\]

`H` é o mecanismo; `z` são estados/ações que ele pode gerar; `C` fixa contexto e desenho da política; `S` representa o procedimento de acesso/seleção; `eta` são parâmetros de ação; `phi`, de registro, veracidade, acesso e codificação. A equação não identifica os componentes. Ela lista o que deve ser estimado, elicitado ou delimitado.

Mais documentos sobre o mesmo episódio podem melhorar a reconstrução de `z`, mas não viram automaticamente mais realizações independentes de `p(z|H)`. Concordância entre codificadores mede uma propriedade da codificação, não a taxa de emissão verdadeira do vestígio sob SA/CA.

## 3. Resultado formal: o Bayes factor do MESMO evento não basta

Sejam `a=P(Y=1|SA,C,S)` e `b=P(Y=1|CA,C,S)`. Suponha, excepcionalmente, que o Bayes factor `r=a/b` desse exato evento e contexto seja conhecido, com `r>=1`. Todos os pares

\[
(a,b)=(rt,t),\qquad 0<t\leq 1/r,
\]

têm o mesmo Bayes factor e produzem a mesma atualização das odds após `Y=1`. Porém a probabilidade preditiva antes de inspecionar esse evento é

\[
q=P(Y^{rep}=1\mid E,C,S)=wa+(1-w)b=[wr+(1-w)]t.
\]

Portanto seu conjunto possível tem fecho

\[
q\in[0,\;w+(1-w)/r].
\]

O extremo zero é entendido como limite: se o próprio evento observado foi usado na atualização, um modelo que lhe dê exatamente probabilidade zero não admite essa posterior. A escala pode, entretanto, ser arbitrariamente pequena. Esta prova não usa números de outro evento e não converte decibéis entre perguntas distintas. Um Bayes factor favorecendo SA pode coexistir com o fato de ambos os modelos preverem muito mal o evento.

Se `r<1`, parametrizar simetricamente ou usar `q=t[wr+1-w]`, com `0<t<=min(1,1/r)`. Conhecer apenas a ordem `a>=b` deixa `q` variar de zero a um. Nem mesmo a ordem é imposta logicamente pelas fontes McCoy/API.

## 4. Envelope exato do check para um evento binário

Defina um conjunto compatível `K` de especificações completas, incluindo a posterior derivada do treinamento e as probabilidades do vestígio reservado. Para `Y_obs=1` e discrepância `T(Y)=Y`,

\[
\underline p=\inf_{k\in K}\{w_k a_k+(1-w_k)b_k\},\qquad
\overline p=\sup_{k\in K}\{w_k a_k+(1-w_k)b_k\}.
\]

Cada valor corresponde a uma distribuição replicada Bernoulli válida; o conjunto representa a variação entre distribuições ainda compatíveis. Não se deve sortear uniformemente especificações em `K`: isso introduziria um novo prior não justificado.

Se `w` for fixo e `K` realmente for o retângulo independente `a in [aL,aU]`, `b in [bL,bU]`, então

\[
[\underline p,\overline p]=[wa_L+(1-w)b_L,\;wa_U+(1-w)b_U].
\]

Se também `w in [wL,wU]`, os extremos são o mínimo/máximo dessas expressões nos dois extremos de `w`. Esta simplificação só é exata se as combinações extremas forem conjuntamente admissíveis. Caso a mesma elicitação determine posterior e likelihood preditiva, preservar seu acoplamento; a caixa independente é no máximo um envelope externo.

**Aplicação completa à informação documental disponível:** as fontes fixam a ocorrência/codificação da fala, mas não fornecem limites quantitativos não triviais para `a` e `b`. Com `a,b in [0,1]`, temos `[pL,pU]=[0,1]`, qualquer que seja o peso fixo `w`. Observar `Y=1` não distingue, pelo PPC, um evento raro de um evento esperado sem adicionar restrições ao modelo. Se insistirmos em probabilidades estritamente positivas para eventos observados, o mesmo intervalo é o fecho.

Este cálculo é de um check preditivo do vestígio sob os mecanismos, não de assinaturas. Seu resultado é **não informativo**, e não uma evidência de bom ajuste. Não convém chamá-lo de um exemplo empírico bem-sucedido de PPC discriminante.

Para vários vestígios, não multiplicar marginais sem independência. Se uma discrepância é a ocorrência conjunta de `J` vestígios e só há marginais `p_j`, os limites de Fréchet são `max(0,sum(p_j)-(J-1))` e `min(p_j)`. Aplicar separadamente em cada hipótese e preservar o acoplamento dos parâmetros. Com nenhuma restrição quantitativa, isso também não resolve o problema.

## 5. Fontes primárias e restrições que elas efetivamente sustentam

**API, princípios de 2021, p. 1:** o documento admite tanto preempção de programas duplicativos quanto interoperabilidade; pede políticas complementares de inovação. Portanto a codificação “substituir toda regulação” não é fiel à fonte. Tampouco a formulação real é impossível sob CA. Fonte lida integralmente: <https://www.api.org/~/media/files/news/2021/03/api-isf-on-carbon-pricing3_20_21>.

**BP, estratégia de Washington, documento BPA_HCOR_00278794, pp. 1–2:** registra oposição à I-1631, custos projetados para a empresa e promoção de outro desenho, cap-and-trade. Logo, “desejar carbon pricing” precisa ser condicionado ao desenho. Um custo absoluto negativo não exclui uma vantagem competitiva relativa, e tampouco identifica uma distribuição de utilidades ou uma regra de decisão estocástica. Fonte lida: <https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00278794.pdf>.

O agente 01 localizou ainda o email BPA_HCOR_00052952 com a avaliação de que benefícios regulatórios do imposto mudam sob Trump. Minha tentativa de abrir esse PDF retornou timeout; essa leitura específica pertence ao agente 01, não a este agente. Sua interpretação, mesmo se confirmada, fornece contexto/incentivos, não frequência condicional de mecanismos.

Não há incompatibilidade lógica entre SA/CA amplos e qualquer fala corporativa isolada. Para impor probabilidade zero, seria necessário um submodelo adicional: motivo puro, direção unificada, representante informado, fala verdadeira, horizonte e proposta definidos, seleção/codificação sem erros. O zero viria dessas premissas conjuntas, não da fonte sozinha.

## 6. Procedimento que pode produzir números sem apresentá-los como fatos extraídos

1. Definir o episódio-alvo e a hipótese antes de codificar o holdout; não misturar indústria, firma e associação.
2. Separar três tipos de informação: fatos da fonte; restrições estruturais da hipótese; parâmetros ainda desconhecidos.
3. Procurar episódios-âncora cujo mecanismo seja avaliado por evidência independente do vestígio a prever. Contar o vestígio em um conjunto enumerado de oportunidades, com seleção documentada e transporte contextual defendido. Mecanismos latentes não devem receber rótulos certos só para criar os denominadores.
4. Quando não houver âncoras suficientes, elicitar intervalos/quantis de parâmetros elementares com especialistas, registrar argumento, contestação e amplitude, sem dizer que são probabilidades estimadas dos documentos. Zero e um exigem premissas particularmente fortes.
5. Estimar o canal de acesso/codificação com controles e adjudicação independentes; essas medições não calibram por si sós o mecanismo.
6. Propagar cada especificação completa até a posterior e o PPC; usar envelope. Se o envelope atravessa a faixa de ausência de discrepância e a de discrepância, declarar o diagnóstico inconclusivo.
7. Localizar o elo que domina a largura do envelope. A coleta adicional deve mirar esse elo, por exemplo distribuição de conhecimento/fidelidade de representantes ou utilidades relativas para o desenho específico, e não apenas acumular relatos do mesmo documento.

Um exercício estrutural com os dados BP seria um avanço se obtivesse os payoffs relevantes para SA/CA, a alternativa regulatória, a exposição competitiva relativa e a regra de escolha. Substituir tudo isso por `logit(probabilidade)=beta*lucro` com `beta` arbitrário apenas transfere a invenção de números para outro parâmetro.

## 7. Interpretação e novidade a não exagerar

PPC verifica adequação de uma distribuição geradora assumida; previsão de holdout e PPC de dados reutilizados têm condicionamentos distintos. Ver definição de réplica e condicionamento em Gelman, Meng e Stern (1996), seção 2.1: <https://sites.stat.columbia.edu/gelman/research/published/A6n41.pdf>. A separação entre comparação relativa e adequação absoluta é anterior a esta proposta.

A contribuição potencial para BPT é uma disciplina implementável que impeça converter peso de evidência relativo em previsão absoluta sem os componentes necessários, explicite os componentes identificados e gere diagnósticos robustos quando existirem limites defensáveis. O caso atual mostra onde falta informação. Não certifica novidade nem prontidão para Political Analysis.

## Debate registrado

- Agente 01: nenhuma taxa SA/CA certificada; fontes API corrigem a premissa de substituição total; documentos BP sustentam dependência do desenho e do contexto.
- Agente 03: não encontrou ordem ou limites quantitativos não triviais impostos pelas fontes McCoy/API; divergência entre representante e firma e mistura de motivos impedem zeros automáticos.
- Minha posição: concordância com ambos; fornecer cálculo de envelope e prova de insuficiência de BF, sem forçar probabilidade pontual. Uma nova rodada estrutural pode superar a conclusão apenas acrescentando informação/premissas identificadas, não renomeando probabilidades arbitrárias.

## Adendo: exemplo do próprio BPT, E3 de Fairfield–Charman (2025)

A coordenação localizou o texto integral em `sources/fairfield_charman_2025.txt`. Li as linhas 684–769, que descrevem e avaliam o E3, e o tratamento geral da dependência nas linhas 387–395. Fonte primária: <https://doi.org/10.1017/psrm.2025.16>.

O E3 é o **evento composto inteiro** de participação das empresas no CLC, desenho do carbon tax com eliminação de regras federais e waiver de responsabilidade, contribuições e contexto discutidos pelos autores. Não se deve transferir seu peso de evidência a apenas uma frase, a apenas uma empresa ou ao episódio API de 2021. FC julgam esse E3 como aproximadamente 12 dB a favor de SA; os 12 dB são julgamento substantivo publicado, não frequência calculada de documentos.

A cadeia publicada é 6 dB de prior, -4 dB para E1, -3 dB para E2, +12 dB para E3 e -7 dB para E4. Logo:

\[
\begin{aligned}
r&=10^{12/10}=15.8489319246111,\\
w&=\frac{10^{4/10}}{1+10^{4/10}}=0.715252751049199.
\end{aligned}
\]

Esta posterior mantém o escopo agregado de FC. Defina `C=(E0,E1,E2)` como o prefixo observado; `D` contém toda a evidência, inclusive E3 e E4. Em uma representação sequencial coerente dos pesos, escreva

\[
P(E_3=1\mid CA,C)=t,\qquad P(E_3=1\mid SA,C)=rt,
\quad0<t\leq1/r=0.0630957344480193.
\]

Uma família de modelos completos pode preservar os demais likelihood ratios condicionais e todas as odds publicadas para qualquer `t` desse intervalo. Pelo produto da regra da cadeia, os fatores absolutos comuns cancelam na posterior de H. A normalização binária é fornecida pelos complementos `1-t` e `1-rt`. Nas histórias não observadas, as distribuições condicionais precisam ser completadas coerentemente, mas não afetam essa conta. A questão da dependência está explicitamente remetida ao Apêndice B.1 por FC; não li esse apêndice neste agente. Portanto a formulação sequencial é uma condição requerida para esta reconstrução, e não uma alegação de que verifiquei os números condicionais do apêndice.

Agora replique **esse E3 composto**, condicionando no prefixo C e usando a posterior H|D. A realização replicada é uma nova emissão do mesmo processo hipotético, independente da realização original e do E4 original dado H, C e a especificação t. Não é um holdout: E3 já participou do ajuste. Para cada modelo fixo da família,

\[
\begin{aligned}
H^{rep}&\sim\operatorname{Bernoulli}(w),\\
Y^{rep}\mid H^{rep}=SA&\sim\operatorname{Bernoulli}(rt),\\
Y^{rep}\mid H^{rep}=CA&\sim\operatorname{Bernoulli}(t).
\end{aligned}
\]

Com `Y_obs=1` e `T(Y)=Y`, o PPC condicional ordinário tem

\[
p_{PPC}(t)=[wr+(1-w)]t,
\]

e seu conjunto possível é

\[
0<p_{PPC}\leq w+(1-w)/r=0.733219087853802.
\]

O fecho do envelope é **[0; 0,7332191]**. Estes números foram calculados diretamente em JavaScript a partir dos decibéis publicados, com os resultados acima registrados; nenhum `t` pontual foi escolhido. Um prior uniforme em `t` seria uma escolha adicional, não uma consequência da fonte.

Este é o exemplo end-to-end honesto: evento real do BPT → julgamento relativo publicado → posterior original preservada → família normalizada de likelihoods SA/CA → réplicas definidas → envelope exato do PPC. Ele demonstra que a BPT original pode permanecer idêntica enquanto seu PPC varia de quase zero a 73,3%. Não demonstra um PPC empírico discriminante nem que as likelihoods originais estejam erradas.

### Uma rota adicional para elicitação coerente

Se for possível justificar também o BF do **complemento exato** do mesmo evento, `r0=(1-a)/(1-b)`, e `r1=a/b`, então, se `r1!=r0`,

\[
b=\frac{1-r_0}{r_1-r_0},\qquad a=r_1b.
\]

Isso torna explícita a informação que falta. Para `r1>1`, coerência exige `0<=r0<1` (com atenção aos extremos e eventos de probabilidade zero). Não autoriza supor `r0=1/r1`. O complemento de um E3 composto contém muitas alternativas heterogêneas, cuja ponderação volta a exigir fontes e/ou julgamento; pode ser necessário decompor uma partição exaustiva de cenários. Se `r1=r0=1`, os dois BFs não identificam a escala e todo `a=b` continua possível.
