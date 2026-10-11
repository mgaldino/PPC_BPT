# Protocolo congelado: descoberta com sorteios controlados

11 de outubro de 2026. Este protocolo é um experimento metodológico sintético no cenário do carbono. O pedido atual autoriza sua execução. O manuscrito permanece intacto.

## Hipótese testada

A IA pode formular consequências compostas ausentes da lista de premissas e melhorar a detecção de falhas relativamente a checks locais. A vantagem exclusiva sobre composição determinística é uma questão distinta, que será testada. Nenhum resultado favorável é pressuposto.

## Informação e cegamento

`foundations.txt` é a única descrição substantiva fornecida a geradores IA e templates. Ambos recebem os mesmos uniformes gerados em R. Seis chamadas independentes de descoberta recebem quatro episódios cada, três chamadas por hipótese. Os geradores não recebem descrição de falhas, estatísticas-alvo, resultados ou fontes históricas. O contexto CLI será efêmero, sem ferramentas e em diretório vazio. Prompts, respostas, modelo solicitado e autorrelato serão preservados. A população de modelos não é amostrada aleatoriamente.

Cada chamada produz documentos e até duas implicações adicionais, com derivação e tabela de codificação dos 16 estados observáveis. Um seletor em contexto novo escolhe até três implicações válidas, distintas e derivadas, na ordem de primeira ocorrência, sem acesso às falhas. Não pode criar uma implicação nova. Auditoria independente pode rejeitar tradução inválida, mas não acrescentar candidatas ou otimizar usando poder. Se não houver candidatas válidas, o resultado primário registra falha de descoberta. Probabilidades preditivas serão calculadas em R pelas regras, nunca pelas frequências de texto da IA.

## Modelo e réplicas

Seja h=0 para SA e h=1 para CA. S é Bernoulli(.5). U,V,W são Bernoulli(.2), mutuamente independentes. A=S xor h xor U; M=A xor V; P=M xor W. H é sorteado uma vez por conjunto, com pesos .6/.4 provenientes de D sintético. A distribuição do conjunto é .6 vezes o produto das massas SA mais .4 vezes o produto das massas CA. A matriz de 16 estados é ordenada lexicograficamente por S,A,M,P, com P variando mais rápido.

## Falhas reservadas e anteriores à descoberta

- Nulo: U,V,W independentes com probabilidade .2.
- F1, controle de dependência entre canais: mistura .5 da lei nula e .5 da lei em que V=W=B, B Bernoulli(.2), independente de U. Preserva marginais de erros e distribuições adjacentes observadas. Viola o par V,W e deve ser visível aos checks diretos enriquecidos.
- F2, desafio principal: q(U,V,W)=produto Bernoulli(.2) - .03*(-1)^(U+V+W). Preserva cada marginal e cada par de erros. Viola a independência mútua. A probabilidade de um número ímpar de reversões muda de .392 para .512. É uma perturbação artificial de ordem três, sem alegação de frequência ou realismo histórico.
- F2-fraca: mistura .75 da lei nula e .25 de F2, definida antes dos resultados.

Preservar cada distribuição individual de checks não preserva sua distribuição conjunta. Por isso a taxa do agregado direto será medida, sem prometer cegueira exata. Preservar todas as premissas da distribuição conjunta e violar uma consequência logicamente válida seria impossível.

## Comparadores congelados

T0 verifica S, os três resíduos observáveis U*=S xor A, V=A xor M, W=M xor P, e seus três pares. U* integra H, sem consultar H verdadeiro. São sete checks categóricos. T0-Bonferroni é um controle adicional com correção por sete testes.

Tpath acrescenta a T0 os três pares não adjacentes da cadeia, (S,M), (A,P), (S,P), obtidos por distância no grafo, independentemente de candidatas ou falhas. TIA acrescenta até três checks escolhidos pela IA a T0. Tfull usa a tabela conjunta dos 16 estados, sem seleção de implicações. O orçamento de até três checks adicionais é igual para Tpath e TIA, mas não se alega equivalência de tempo computacional. Tfull é um comparador forte, não um limite teórico de poder.

Todas as tabelas de codificação são funções apenas de S,A,M,P. Cada check terá discrepância de desvio multinomial contra a mistura posterior SA/CA. Sua cauda inclusiva será estimada com 50.000 réplicas nulas. O mínimo dos p-valores componentes define o agregado da família. Outras 50.000 réplicas nulas calibram a cauda desse agregado, preservando dependência entre checks. Rejeição com p global<=.05. Empates são conservadores, sem randomização. Tfull também é calibrado, embora tenha um único componente. As duas referências e os conjuntos de avaliação são independentes.

## Avaliação

N primário=96 episódios por conjunto. N=24 e N=384 são sensibilidades previamente fixadas. Serão 5.000 conjuntos por condição e N, com H comum sorteado do posterior. Os braços recebem exatamente os mesmos conjuntos e as mesmas referências nulas. Reportar falso alarme, poder, intervalos de Wilson e diferenças pareadas IA menos templates, com erro-padrão da diferença pareada. A comparação não transforma um PPC usual em p-valor automaticamente calibrado: a calibração adicional é parte deste experimento de evidência reservada.

Os dados usados para mostrar um exemplo completo serão o primeiro conjunto F2 de N=96 em que o agregado IA rejeita e T0 não rejeita, se existir. Essa seleção será explicitamente ilustrativa. Se não existir, usar o primeiro F2. Mostrar também todas as taxas, que não dependem da escolha do exemplo. A auditoria textual usará todos os 24 episódios de descoberta, sem escolher casos favoráveis.

## Critérios de interpretação

Ganho vs T0 demonstra valor de consequências compostas. Ganho vs Tpath, a falso alarme semelhante, fornece evidência condicional de seleção útil pela IA neste mecanismo e neste corpus. Igualdade demonstra que a IA automatiza uma dedução também alcançada por templates composicionais. Tfull ajuda verificar se seleção trouxe sensibilidade relativa a uma verificação conjunta. Não inferir generalização para Political Analysis, qualidade de hipóteses históricas ou identificação de probabilidades a partir das fontes. O teste resolve a amostragem por construção, mas não a elicitação empírica.
