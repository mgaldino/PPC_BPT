# Parecer independente de identificação: teste controlado de descoberta

Data: 2026-10-11. Autor: subagente redo_identification. Este parecer não implementa o piloto e não usa saídas de descoberta. O desenho foi debatido diretamente com novel_attribution e llm_ppc_redteam e atualizado pela proposta do coordenador de perturbar a distribuição dos três erros. Nenhum resultado futuro de descoberta foi consultado.

## Decisão científica

Aprovo como desafio principal a perturbação de terceira ordem no espaço dos erros com p=.2 e delta=.03. Ela preserva distribuições marginais e todos os pares de erros, mas altera a composição das três etapas. Essa alternativa é adequada para testar consequências novas em relação a checks locais. Não preserva a independência mútua estipulada pelo modelo: é justamente essa premissa que viola. Preservar literalmente todas as premissas de um modelo gerativo completo preservaria sua distribuição e tornaria impossível melhorar a detecção por outro PPC.

A comparação justa deve incluir templates que componham deterministicamente os mesmos mecanismos. A vantagem possível da IA é descobrir/selecionar/operacionalizar um check útil com orçamento limitado; não existe acesso lógico exclusivo às consequências de um modelo finito inteiramente especificado.

## Modelo e hipótese compartilhada

Cada mundo contém S (canal do choque), A (decisão de apoio), M (posição registrada no memorando) e P (posição da nota pública). Defina S~Bernoulli(.5), h=0 para SA e h=1 para CA, e

A = S XOR h XOR U,
M = A XOR V,
P = M XOR W.

Sob o null, U,V,W são mutuamente independentes Bernoulli(.2), independentes de S. Todos os valores .2, .5 e .03 são escolhas sintéticas, não probabilidades históricas. A etapa com memorando falível é uma nova especificação sintética e precisa ser apresentada assim, pois o piloto anterior estipulava memorando fiel.

A hipótese é comum aos n mundos do dataset, com pesos .6/.4 condicionados à evidência inicial do exercício anterior. A preditiva é

p(y_1,...,y_n | D) = .6 prod_i p_SA(y_i|D) + .4 prod_i p_CA(y_i|D).

Misturar H independentemente a cada linha é outro modelo. Os checks só podem usar os quatro campos documentados. Para trabalhar com resíduos observáveis, use U'=S XOR A, V=A XOR M e W=M XOR P. U'=U XOR h; integrar a distribuição de U' sob a mistura resolve isso sem acessar o H verdadeiro do oráculo. Nunca fornecer h do benchmark ao codificador ou à estatística observada.

## Alternativas congeladas

F1, controle de dependência simples: U=V=W=B, B~Bernoulli(.2). Preserva cada marginal de erro e as transições adjacentes, mas altera pares de erros. Portanto, é um controle positivo para o baseline direto enriquecido; não sustenta uma vitória em uma tarefa que só uma implicação composta pudesse resolver.

F2, desafio principal: para u,v,w binários, k=u+v+w,

q0(u,v,w) = .2^k .8^(3-k),
qF2(u,v,w) = q0(u,v,w) - .03 (-1)^k.

| Número de erros k | Probabilidade por célula null | Probabilidade por célula F2 | Número de células |
|---:|---:|---:|---:|
| 0 | .512 | .482 | 1 |
| 1 | .128 | .158 | 3 |
| 2 | .032 | .002 | 3 |
| 3 | .008 | .038 | 1 |

As massas são positivas e somam um. Ao marginalizar qualquer erro, o termo perturbador cancela; por isso todas as marginais de um ou dois erros permanecem idênticas. Mas

Pr(U XOR V XOR W=1) = .392 no null e .512 em F2.

Essa é a probabilidade de uma diferença entre a entrada e a saída da cadeia, após considerar o sinal da hipótese. A composição é uma consequência dedutível da independência mútua, sem precisar ser fornecida como estatística ao descobridor.

Verifiquei em R, sem escrever saídas de análise, positividade, normalização, todas as marginais de um erro, todas as distribuições conjuntas de dois erros e os valores .392/.512. Todas as verificações passaram.

## Comparadores congelados antes da IA

1. **Direto enriquecido:** checks das marginais/transições fornecidas e todos os pares de U',V,W. Cada distribuição é calculada sob H comum. Ele recebe as mesmas premissas que a IA.
2. **Compiler de composição:** a partir do grafo em cadeia, enumera todos os pares de nós ligados por caminhos de comprimento pelo menos dois, sem acessar faults: (S,M), (A,P), (S,P). São exatamente três checks compostos, definidos por regra geral de caminhos e não pelos candidatos da IA. Este é o menor baseline forte decisivo e tem o mesmo orçamento de até três checks que a seleção da IA.
3. **IA:** prompt de mecanismos e uma amostra nula produzida por sorteios R; gera candidatos sem receber faults, estatísticas desejadas ou alvos. Um procedimento de seleção congelado e cego aos faults seleciona até três indicadores, justificando mensuração e premissas. Não substituir candidatos malsucedidos depois de observar o benchmark.
4. **Referência completa:** omnibus das 16 células observáveis ou biblioteca universal de 15 caracteres de Walsh não constantes sobre S,A,M,P. Ela demonstra o que já está acessível por enumeração determinística. Se a IA superar um omnibus por selecionar um contraste mais direcionado, a interpretação é eficiência de seleção, não descoberta de informação inexistente no modelo.

O compiler de caminhos precisa estar congelado antes da descoberta. Não mapear retrospectivamente cada achado da IA para um template e depois chamar isso de competição independente. A igualdade entre uma IA e uma cópia de seus checks continua sendo apenas uma ablação.

## Calibração e menor teste decisivo

O núcleo decisivo pode usar n=96, três condições (null,F1,F2), 5.000 datasets independentes por condição e referência de 100.000 datasets nulos dividida entre construção dos escores individuais e calibração do agregado. n=24 e n=384 são extensões pré-fixadas de tamanho amostral. As sementes e faults devem ser congelados antes da descoberta.

Para cada procedimento, agregar os checks pela mesma regra min-p e calibrar o agregado a 5% usando a referência nula independente. Não comparar um método com três testes a outro com um único teste sem controlar o tamanho conjunto. Usar ranks Monte Carlo finitos, correção +1 e tratamento de empates declarado; desempate aleatório em R pode aproximar/executar o mesmo tamanho nominal em distribuições discretas. A amostra que calibra o limiar não é a amostra que estima falsos alarmes e poder.

A avaliação principal compara, ao mesmo tamanho real, poder de detecção de F2 entre IA e compiler de caminhos. Se ambos detectam F2 igualmente, a IA reproduziu uma dedução operacionalizada. Se a IA seleciona menos checks ou alcança maior poder, relatar o ganho específico e seu orçamento. Se falha, preservar o resultado. Melhorar em relação apenas a checks locais não demonstra vantagem frente a templates capazes de compor os mecanismos.

## Ressalva sobre preservação dos checks diretos

Preservar a distribuição de CADA check direto não preserva a distribuição CONJUNTA de todos os checks diretos. A perturbação pode alterar correlações entre escores; consequentemente, um agregado min-p calibrado no null pode ter outra taxa de rejeição sob F2. Não prometer que o baseline direto será completamente incapaz de detectá-lo.

Como controle negativo matemático adicional, aplicar Bonferroni aos mesmos p-valores marginais: se cada distribuição marginal permanece igual, a probabilidade de rejeitar qualquer um fica no máximo alfa, independentemente da correlação entre checks. Esse controle conservador não precisa substituir o agregado principal calibrado em 5%; serve para delimitar a alegação de invariância.

## Limites de atribuição

F2 rompe independência mútua e tem construção deliberada para uma prova de método, não valida motivações empresariais históricas. Os sorteios em R eliminam o erro de amostragem do LLM como explicação do desempenho, mas também delimitam seu papel à descoberta/operacionalização e, se usada, realização documental. Probabilidades dos eventos e do benchmark continuam vindas do modelo sintético. Dados históricos exigiriam outra validação.
