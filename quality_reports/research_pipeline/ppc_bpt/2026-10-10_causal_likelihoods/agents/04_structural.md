# Agente 04: a melhor rota estrutural e seu limite de identificação

10 de outubro de 2026. Missão: desafiar a conclusão de não identificação usando payoffs e decisões concretas. Li a auditoria 01, o texto integral do email BP de janeiro de 2017 e as definições de Fairfield e Charman (2025), p. 9, na cópia extraída local. Não alterei o manuscrito. Os relatórios 02/03 ainda não estavam disponíveis ao iniciar esta nota.

## Resultado

Um modelo estrutural pode converter fontes em restrições causais verificáveis e indicar exatamente quais dados faltam. As fontes atualmente reunidas não permitem calcular uma likelihood pontual de ação ou de documento sob SA e CA. Inserir uma função logística com escala escolhida produziria os números desejados, mas apenas esconderia a parcela inventada. A saída mais promissora combina: (a) reconstrução de payoffs específicos por política; (b) hipóteses que conservem as definições originais; (c) calibração independente de comportamento e observação; (d) PPC de episódios ou fontes efetivamente reservados.

## 1. As hipóteses originais não são dois tipos puros de empresa

Na p. 9, SA diz que o apoio ocorre principalmente diante de ameaças regulatórias e visa prevenir políticas mais custosas; as políticas apoiadas impõem custos líquidos, embora inferiores aos das alternativas salientes. CA diz que o apoio ocorre principalmente quando a política cria vantagens competitivas e oportunidades, gerando benefícios líquidos no contexto econômico e político corrente ou antecipado. A intensidade do apoio, a distribuição de erros de decisão e a probabilidade de escrever uma justificativa específica não são fornecidas por essas definições.

Não decorrem delas as restrições artificiais “CA ignora ameaças”, “SA nunca tem ganhos de mercado”, “CA apoia qualquer imposto” ou “um email SA transforma a BP inteira numa empresa SA”. Tampouco o sinal de um custo direto identifica o sinal do benefício líquido: participação de mercado, transferência, subsídio e custo de competidores podem mudar o resultado.

## 2. Ponte estrutural mínima

Considere uma empresa, uma política moderada P e uma ameaça regulatória R em uma data determinada. Defina:

- d: efeito econômico líquido percebido de P, relativamente ao contrafactual especificado, incluindo ganhos competitivos e custos diretos;
- q: probabilidade percebida de R sem o apoio a P;
- L: perda adicional associada a R;
- a: quanto o apoio altera a probabilidade de P;
- b: eficácia do apoio a P em evitar R;
- k: custo incremental do apoio, incluindo lobbying e custos políticos relevantes.

Uma representação deliberadamente simples é ΔU = a d + b q L − k. Ela é uma aproximação sob alternativas e efeitos bem definidos, não uma identidade geral nem um modelo já estimado. Em uma versão completa, usar-se-iam probabilidades de todos os ramos da árvore de decisão sob apoiar e não apoiar, evitando dupla contagem de políticas mutuamente exclusivas.

SA e CA restringem a interpretação e o sinal do componente econômico da política e a importância da ameaça. Elas não fornecem a, b, q, L ou k. Mesmo conhecendo ΔU, a passagem à ação requer uma regra:

Y = 1{ΔU + ε ≥ 0}, de modo que P(Y=1 | H,X) = 1 − F_H(−ΔU_H(X)).

Fixar ε=0 é uma hipótese substantiva de maximização determinística e medição perfeita; não é ausência de hipótese. Escolher F logística é outra hipótese, e sua escala em relação aos dólares de ΔU precisa de calibração. A normalização usual da escala em escolha discreta permite identificar coeficientes relativos a partir de dados suficientes; não permite obter probabilidades sem esses dados.

Para evidência documental Z, ainda é preciso acrescentar um modelo de produção e observação do registro:

P(Z | H,X) = Σ_y ∫ P(Z | y,ψ,X) P(y | H,θ,X) p(θ,ψ | H,X) dθ dψ.

Uma ação pode deixar vários emails correlacionados; uma ausência de email pode resultar de retenção, busca ou seleção. Essas etapas não devem ser ocultadas numa probabilidade genérica de “encontrar evidência”.

## 3. O exemplo BP 2017: o que a fonte identifica

Fonte: [email BP de 27–30/01/2017, BPA_HCOR_00052952, p. 1](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00052952.pdf). O email interno relaciona a vantagem de um imposto sobre carbono à possibilidade de evitar uma futura regra de emissões das refinarias. A expectativa de ausência dessa regra sob Trump diminui, segundo o autor, o benefício do imposto para a BP.

| Quantidade | Informação que a fonte dá | Informação que falta |
|---|---|---|
| Direção da ameaça q | Perspectiva menor sob a administração Trump | Probabilidade numérica anterior e posterior; crença da instância decisória |
| Benefício de evitar R | Componente do cálculo foi explicitamente considerado | Valor de L; eficácia b; alternativas e horizonte |
| Efeito líquido de P, d | Não quantificado nesse email | Incidência direta, margem e volume adicionais, efeitos sobre rivais, transferências |
| Custo de apoio k e eficácia a | Não quantificados | Esforço, custo e impacto esperado de apoiar |
| Regra de decisão F | Não descrita | Ruído, heterogeneidade, fricções, autoridade do emissor |
| Emissão e observação documental | Um email foi produzido e disponibilizado | Universo de oportunidades e mecanismo de seleção |

A fonte apoia a derivada positiva do benefício em relação à ameaça nesse raciocínio. Não fornece uma probabilidade de apoio de 0,8 ou 0,2. Também não fornece o contrafactual completo de benefício líquido necessário para decidir se a política em questão se enquadra na definição de SA ou CA.

O documento BP sobre Washington, resumido e localizado pelo agente 01, oferece US$ 38 milhões e US$ 137 milhões de perdas projetadas em anos distintos e US$ 13 milhões de oposição a I-1631. Esses valores não são três observações da mesma quantidade: projeções anuais não são automaticamente valor presente; gasto realizado não é eficácia; oposição a um desenho e promoção de outro não identificam um motivo constante. Não usei esses valores para estimar parâmetros.

## 4. Prova curta de que a ponte não está numericamente fechada

Fixe uma hipótese H e até suponha que ΔU esteja conhecido. Para qualquer r entre zero e um, existe uma distribuição de ε cuja massa à direita de −ΔU seja r. Portanto a mesma estrutura de payoffs admite P(Y=1 | H,X)=r até restringirmos ou estimarmos F. Se ε for eliminado, ainda será preciso conhecer o sinal de ΔU, que os documentos disponíveis não identificam. Se atribuirmos uma distribuição a ΔU, os números passam a depender dessa distribuição.

Para um documento, a não identificação é ainda maior: uma mesma ação e payoff podem gerar diferentes probabilidades de registro e divulgação. Essa demonstração não diz que toda literatura é inútil ou que julgamentos nunca podem ser justificados. Diz que não existe transformação algébrica de uma frase ou de um valor de custo isolado numa likelihood causal única.

## 5. Um teste prospectivo preciso que evita números arbitrários

Uma primeira etapa pode ser um teste de restrições, assumidamente sem posterior preditiva pontual:

1. Fixar unidade: empresa × proposta legislativa concreta × janela decisória. Fixar também qual órgão da empresa decide e qual documento registra sua previsão financeira.
2. Antes de observar a posição posterior, obter uma árvore de alternativas e projeções internas contemporâneas. Registrar intervalos documentados para a, b, q, L, k e d. Intervalos devem refletir as fontes; não inventar limites por conveniência.
3. Reservar o comportamento posterior: decisão formal e esforço verificável de apoio ou oposição. Não usar a frase que classifica o mecanismo como o próprio resultado a prever.
4. Se todos os valores admissíveis implicarem ΔU>0, a maximização determinística prevê apoio. Se todos implicarem ΔU<0, prevê ausência de apoio. Se o sinal variar, a previsão é indeterminada. Uma violação rejeita a combinação da hipótese causal com os auxiliares de decisão e medição, e não automaticamente a motivação sozinha.
5. Repetir a coleta em episódios comparáveis. A frequência de violações e seu padrão servem para avaliar a adequação do comportamento determinístico e para motivar um modelo estocástico calibrado.

Um segundo teste, mais fraco, usa monotonicidade: uma queda exógena de q, mantendo d, a, b, L, k e o choque decisório relevantes constantes, não aumenta ΔU. Isso pode restringir apoio ou esforço. Contudo, CA também pode incorporar hedge; logo essa monotonicidade isolada não discrimina SA de CA. O email de 2017 ilustra a ligação, mas não fornece o conjunto de invariâncias necessário para testá-la causalmente.

## 6. Dados mínimos para chegar a um PPC numérico de BPT

A versão numérica precisa de calibração independente ou elicitação humana documentada. Um desenho realizável seria:

- Um universo previamente delimitado de episódios decisórios, com propostas especificadas e não apenas notícias selecionadas.
- Registros contemporâneos de previsões de lucro líquido e alternativas regulatórias, obtidos antes da ação que será prevista. A classificação do mecanismo não pode ser feita pelo próprio Y. Projeções internas podem ancorar o sinal percebido de d, mas erro e seletividade devem permanecer auditáveis.
- Variação separada em ameaça e vantagens competitivas, suficiente para distinguir seus papéis. Dois episódios não estimam adequadamente vários parâmetros estruturais.
- Decisões e esforço, inclusive não apoio, com denominador definido. Os dados de calibração precisam tornar estimável a ponte incentivo→ação; a escolha de F deve ser comparada e testada, não “extraída” dos textos.
- Auditoria documental em oportunidades nas quais se conhece a decisão, para avaliar produção, acesso e codificação das evidências que serão usadas no BPT.
- Divisão por episódio ou família documental: estimação num bloco, previsão no outro. A mesma cadeia de emails não pode ocupar ambos os blocos.

No caso da BP, o plano prospectivo mais direto é reservar decisões e documentos posteriores a uma janela fixa e estimar a ponte com episódios anteriores cujos payoffs internos estejam documentados. O conjunto disponibilizado por investigações legislativas pode não ser completo ou transportável; esse problema deve entrar no desenho, não virar um prior estreito por omissão.

O alvo final seria P(Y_novo | H, D_calibração), mantendo SA/CA como restrições causais sobre o mecanismo, seguido de P(Y_rep | D_calibração,D_BPT) e de uma discrepância definida antes da consulta do bloco de validação. Se H for misturado pela posterior, apresentar também verificações específicas por H; a média pode esconder inadequação de cada explicação.

## 7. Recomendação ao coordenador

A alegação defensável hoje é uma demonstração construtiva dos requisitos de identificação, acompanhada por um exemplo de restrições ancorado na BP. Não há uma tabela numérica legítima P(Y|SA), P(Y|CA) completa a derivar dos arquivos atuais. Para satisfazer literalmente o pedido de exemplo completo até um PPC causal, será preciso realizar calibração empírica adicional ou elicitação real; alternativamente, aceitar probabilidades imprecisas e verificar se o conjunto permitido gera um resultado informativo. Não chamar um intervalo [0,1] de solução operacional do PPC.

Uma contribuição publicável deve mostrar em pelo menos um caso que a coleta ou elicitação adicional estreita essas probabilidades e que os resultados resistem a mudanças justificadas dos auxiliares. A formalização acima identifica o objeto dessa coleta, sem prometer uma eliminação de julgamento que os dados não suportam.

## Debate posterior à primeira redação

Li integralmente as notas 02 e 03 após sua disponibilização. Concordo com a separação entre julgamento disciplinado e frequência empírica e com a exigência de não criar rótulos SA/CA a partir do próprio vestígio. Ao agente 05, esclareci que projeções prévias podem ancorar sinal de benefício líquido, mas não necessariamente motivo principal; classificações latentes devem manter essa incerteza.

A família de likelihoods do E3 composto de FC construída por 02 é uma demonstração numérica metodologicamente superior ao exemplo de assinaturas: conserva o mesmo evento, as hipóteses originais e os julgamentos relativos publicados. Seu envelope não inventa um valor pontual para a escala. Ressaltei a 02 que cada t fixo representa uma especificação completa alternativa; se t for tratado como parâmetro aleatório desconhecido, precisa de prior e atualização próprios. Uma integração uniforme em t não seria imposta pela fonte.
