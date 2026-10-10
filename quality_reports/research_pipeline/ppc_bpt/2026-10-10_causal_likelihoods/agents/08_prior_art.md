# Agente 08 — Literatura existente e proposta mínima de contribuição

10 de outubro de 2026. Escopo: literatura primária pertinente e proposta metodológica final. Li as notas 01–07, consultei diretamente os capítulos 15–16 de *Integrated Inferences* e documentação dos autores do SHELF, e debati com 06 e 07. Não editei manuscrito nem executei análise R. Os limiares abaixo foram conferidos em JavaScript pelas fórmulas de 06.

## Resultado

O PPC de modelos causais usados em process tracing já existe; também existe tratamento explícito de como justificar probabilidades de pistas com dados e hipóteses causais. A contribuição candidata deve ser mais específica: **completar a distribuição preditiva de uma BPT expressa principalmente em razões de likelihood, preservando seu evento, hipóteses e contexto; identificar a informação absoluta adicional necessária; e concentrar coleta ou elicitação nessa informação**. Envelopes e perguntas por limiar podem tornar esse trabalho econômico e auditável.

O exemplo E3 de Fairfield–Charman entrega hoje uma demonstração real dessa lacuna e um PPC parcialmente identificado. Não entrega as probabilidades absolutas extraídas das fontes, um diagnóstico causal confirmado ou um método já validado para publicação. Uma contribuição empírica convincente exige demonstrar que a informação adicional pode ser obtida e que estreita o envelope de forma substantivamente útil.

## 1. O que as fontes primárias já fazem

**Humphreys e Jacobs, capítulo 16.** O livro inclui explicitamente checagens de independência, simulação da distribuição preditiva posterior, comparação de discrepâncias, validação leave-one-out e sensibilidade em modelos causais. Mostra que uma especificação pode reproduzir uma margem observacional e falhar numa relação relevante à estrutura causal; também alerta que p-valores bayesianos não têm calibração uniforme automática. Isso impede reivindicar a mera aplicação de PPC à inferência causal qualitativa como inovação. [Capítulo 16, especialmente §§16.1.2–16.1.3](https://integrated-inferences.github.io/book/16-evaluating-models.html).

**Humphreys e Jacobs, capítulo 15.** Os autores discutem diretamente a fundamentação empírica do valor probatório de pistas. Dados não substituem todas as hipóteses sobre estrutura causal; em certas configurações, informação experimental e transportabilidade justificam probabilidades ou limites. Também criticam a especificação independente de prior sobre a hipótese e probabilidade da pista quando ambos deveriam refletir uma mesma estrutura causal. Para nosso trabalho, isso exige preservar o acoplamento entre pesos de H, probabilidades de Y e hipóteses compartilhadas, em vez de montar uma caixa de intervalos cujos extremos não podem coexistir. [Capítulo 15, especialmente §§15.1.1–15.1.2](https://integrated-inferences.github.io/book/15-justifying-models.html).

**SHELF.** O framework fornece protocolos e ferramentas para representar conhecimento especializado em distribuições, inclusive quantidades dependentes; não transforma opinião em frequência observada. Pode disciplinar a âncora ausente de nossa aplicação, desde que se preserve a proveniência do julgamento e se registre a incerteza. A documentação não resolve a validade específica das condicionais SA/CA. [SHELF](https://shelf.sites.sheffield.ac.uk/); [página de elicitação de Jeremy Oakley](https://jeremy-oakley.sites.sheffield.ac.uk/research/expert-elicitation).

Essas leituras delimitam uma possível contribuição, mas não constituem busca bibliográfica exaustiva nem certificação de novidade. Probabilidades imprecisas, análise de sensibilidade e identificação parcial também têm literatura própria que precisaria ser confrontada antes de alegar inovação formal.

## 2. Formulação mais promissora

Título de trabalho: **From Relative Evidence to Predictive Checks in Bayesian Process Tracing**.

Pergunta: *Qual informação adicional mínima permite transformar um argumento BPT já expresso em Bayes factors numa distribuição preditiva verificável, e como obtê-la e validá-la sem substituir o mecanismo por um modelo de uma variável correlata?*

A resposta candidata tem três componentes que precisam funcionar juntos:

1. Um critério de completude: listar o que razões de likelihood identificam e o que deixam livre no espaço de distribuições do mesmo evento.
2. Um procedimento computacional: gerar envelopes de checks sobre distribuições completas e coerentes, preservando seleção, dependência e acoplamento com a posterior de H.
3. Um protocolo de informação adicional: localizar a menor âncora absoluta, ou limite, capaz de mudar uma conclusão diagnóstica; buscá-la em calibração empírica e, se necessário, em elicitação humana documentada.

Nenhum componente isolado garante novidade. O mérito possível está em tornar executável e verificável uma transição que, no caso reconstruído, não está fechada pelos julgamentos relativos publicados. Isso complementa a BPT original; não pressupõe que FC desconheçam cenários, dependência ou a diferença entre comparação e adequação.

## 3. O exemplo E3 e a pergunta que falta responder

As notas 02, 06 e 07 preservam o evento composto E3 e o escopo agregado SA/CA. Com os valores centrais de FC, r=10^(12/10)=15,8489319 e w=P(SA|D)=0,715252751. Se a=P(E3|SA,C), a probabilidade sob CA é a/r. A checagem binária proposta é

q(a)=[w+(1−w)/r]a=0,7332190879a, com 0<a≤1.

O fecho do envelope é [0; 0,7332190879]. O número 0,733219 não é uma probabilidade extraída de uma fonte primária empresarial: é uma transformação dos julgamentos relativos publicados e da especificação replicativa acrescentada. O parâmetro a continua ausente. Se ele for tratado como aleatório em um único modelo, precisará de prior e atualização; variar especificações fixas não fornece esse prior.

Uma pergunta concreta de elicitação é: **“Assumindo SA, o prefixo C e este protocolo de observação, qual limite inferior de P(E3) você consegue sustentar com fontes e razões explícitas? Quais circunstâncias compatíveis com SA poderiam violá-lo?”**

Depois da resposta inicial independente, pode-se apresentar o limiar de decisão: a>0,06819244 implica q>0,05 nesta especificação. Pedir primeiro uma resposta sem mostrar o corte reduz o risco de o julgamento ser ajustado ao resultado desejado. O limiar é uma exigência matemática da análise, não uma avaliação fornecida por um especialista. A convenção de 5% serve para localizar informação relevante, não cria um teste frequentista calibrado nem transforma q>0,05 em validação de SA.

O procedimento não precisa exigir um ponto artificialmente preciso. Se fontes e especialistas sustentarem apenas um limite que já exclua um diagnóstico, reporta-se esse resultado limitado. Se não sustentarem sequer o limite, permanece a indeterminação. Não traduzo a expressão publicada “muito plausível” numa desigualdade numérica sem uma elicitação específica.

## 4. O desenho mínimo de um estudo que demonstraria utilidade

**Demonstração formal.** Um Bayes factor do evento binário deixa uma escala livre. Dois BFs, do evento e de seu complemento exato, podem identificar duas probabilidades sob condições não degeneradas. Para K categorias e dois mecanismos, os K BFs impõem duas normalizações e, em situação regular, deixam K−2 graus de liberdade. Esta contabilidade deve ser apresentada como fundamento transparente do procedimento, sem exagerar a novidade da álgebra.

**Demonstração retrospectiva.** Reconstituir o E3 inteiro, os julgamentos originais e a sua incerteza. Entregar a curva q(a) e o envelope, mostrando que o BPT relativo pode permanecer igual enquanto o check muda. Isso constitui uma prova construtiva de informação faltante, não uma constatação de que o BPT original está errado.

**Elicitação real.** Recrutar especialistas humanos pertinentes ao caso, separar dossiê factual e julgamentos publicados, e registrar familiaridade anterior com E3. Obter respostas independentes sobre o evento, esclarecer desacordos e fazer contestação por outro especialista. Preservar intervalos e alternativas. Agentes de IA podem ajudar a montar o dossiê e criticar a coerência, mas não são dez observações empíricas nem substitutos anônimos de especialistas cujas crenças foram efetivamente elicitadas.

**Aplicação com categoria replicável.** E3 é historicamente composto. Antes de fazer da sua baixa probabilidade um diagnóstico, justificar qual propriedade do mecanismo se esperava reproduzir. Uma categoria ampla e predefinida pode ser melhor para uma aplicação futura, mas precisa de likelihood própria: os 12 dB não podem ser transferidos para “apoio condicionado a riders” ou outra simplificação.

**Validação.** Congelar uma previsão antes de acessar blocos novos, mantendo todas as cópias do mesmo episódio juntas. Usar pistas que expressem expectativas dos mecanismos e canal documental. Brier ou log score de respostas observáveis ajudam a avaliar previsão, mas não validam isoladamente as condicionais a mecanismos latentes. A calibração dessas condicionais requer episódios com atribuição causal fundamentada por evidência independente do alvo, ou outras restrições identificadoras defendidas. Concordância de codificadores valida aplicação de códigos, não motivos verdadeiros.

**Comparação.** Na avaliação de desempenho, comparar o procedimento completo com (a) julgamento relativo sem âncora, que não define o PPC; (b) preenchimento pontual de probabilidades sem documentação; e (c) modelo causal plenamente especificado com todos os componentes conhecidos numa simulação. Separar erros de cálculo, falta de identificação e erro de especificação. Não apresentar uma boa simulação como validação empírica da elicitação.

## 5. Debate e decisão conjunta

O agente 06 propôs privilegiar limites absolutos de a sobre o BF do complemento. Concordo: o complemento exato de E3 reúne muitas histórias, e a fronteira q=0,05 corresponderia a um BF do complemento muito próximo de 1. Uma escala verbal de força de evidência pode não ter resolução defensável nesse ponto.

O agente 07 destacou que T(Y)=Y é um check unilateral da presença do evento e que sua especificidade histórica pode produzir raridade sem inadequação substantiva. Concordo. O exemplo é forte como demonstração de completude e insuficiência; é fraco como aplicação empírica de diagnóstico, enquanto faltarem uma categoria replicativa apropriada e sua âncora.

Também concordamos que a independência da nova emissão de E3 em relação aos registros originais, condicional em H,C e parâmetros, é uma hipótese adicional do gerador. Deve constar da demonstração, sem ser imputada às fontes empresariais.

## 6. Entrega possível agora e trabalho ainda necessário

**Agora:** documentar fontes, preservar hipóteses, reproduzir os pesos relativos publicados, construir a família normalizada de likelihoods, calcular o envelope e mostrar qual julgamento adicional seria suficiente para certas conclusões. Isso responde precisamente por que a conta pontual ainda não fecha.

**Ainda necessário:** obter de fato uma âncora empírica ou uma elicitação humana auditável, justificar a granularidade do evento e o experimento replicado, propagar os intervalos dos julgamentos publicados e validar previsões adicionais em blocos independentes. Nenhum desses itens é substituído por escolher a=0,8 e chamá-lo de plausível.

Uma submissão forte à *Political Analysis* precisaria demonstrar ganho metodológico e desempenho, não apenas uma parametrização elegante. Há uma pergunta relevante e uma rota concreta; não há base nesta rodada para prometer publicação nem para declarar o PPC causal pontual empiricamente resolvido.
