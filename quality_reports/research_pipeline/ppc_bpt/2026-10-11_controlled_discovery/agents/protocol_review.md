# Auditoria independente do protocolo e preparação

Data: 2026-10-11. Auditor: redo_identification. Escopo: `protocol.md`, `foundations.txt`, `scripts/prepare.R` e dados de preparação de 16 estados, oito estados de erro e 24 episódios com uniformes controlados. Nenhuma resposta de descoberta foi consultada. Nenhum arquivo de implementação foi alterado.

## Veredito

Não encontrei erro invalidador na preparação. A tradução SA/CA está correta, as quatro leis são válidas, F2 preserva os sete checks diretos individualmente e F1 altera o par de resíduos V,W como planejado. O protocolo preserva H compartilhado, descreve comparadores com a mesma informação e distingue calibrar checks de identificar probabilidades históricas.

## Achados confirmados

1. **Coerência substantiva dos rótulos.** `foundations.txt:1–2` estabelece S=0 quando cai o benefício regulatório e S=1 quando cai o benefício competitivo. Sob SA, o apoio pretendido é S; sob CA, é 1-S. Portanto, `prepare.R:27`, A=S XOR h XOR U, implementa corretamente os payoffs. Recalculei todos os 24 resultados diretamente dos payoffs regulatório/competitivo menos custo 6, independentemente da fórmula XOR de A. S,A,M,P coincidiram integralmente com controlled_truth.csv.
2. **Cadeia de comunicação correta.** `foundations.txt:2` diz que a nota pública lê o memorando M. `prepare.R:28` implementa P=M XOR W, não P=A XOR W. Essa distinção é fundamental para a composição proposta.
3. **Ordenação das células.** `prepare.R:3–4` e states.csv contêm 16 estados na ordem 8S+4A+2M+P, de 0 a 15, com P variando mais rápido. O índice de erro `1+4u+2v+w` em `:16` coincide com a ordem de error_laws.csv. Conferências de unicidade e correspondência passaram.
4. **Massas.** Todas as oito probabilidades em cada uma das quatro leis de erro são estritamente positivas e somam um. As probabilidades conjuntas dos 16 estados também somam um por condição e H. Recalculei as leis sem usar os valores gravados como fórmulas de referência.
5. **F1.** `prepare.R:8` implementa .5 da lei nula mais .5 da lei com U independente e V=W=B, B~Bernoulli(.2). Nos sete checks diretos, preserva S,U*,V,W,U*V,U*W e altera apenas VW, em cada H. A maior diferença de probabilidade entre células de VW é .08.
6. **F2 e F2-fraca.** `prepare.R:9–10` coincide com as fórmulas do protocolo. Agreguei as 16 células por cada um dos sete mapas diretos em cada hipótese. As distribuições foram invariantes, com diferenças inferiores a 1e-14. Isso confirma invariância individual dos checks, não da distribuição conjunta de seus sete escores.
7. **Paridade da cadeia.** A probabilidade de um número ímpar de erros é .392 no null, .296 em F1, .512 em F2 e .422 em F2-fraca. Todos esses números foram recalculados das oito células de erro.
8. **Sorteios controlados.** Os 24 uniformes por canal alimentam episódios agrupados em seis chamadas, quatro episódios por chamada e H constante em cada chamada. São 12 episódios SA e 12 CA. Essa alocação deliberada da descoberta não deve ser confundida com as réplicas preditivas, cujo H será sorteado de .6/.4 por dataset.
9. **Hipótese compartilhada.** `protocol.md:17` e `foundations.txt:2–3` exigem H comum ao conjunto. A implementação da simulação/calibração ainda precisa ser auditada em analyze.R. Misturar a probabilidade de cada linha separadamente seria outra especificação.
10. **Comparação justa.** `protocol.md:30–32` define sete checks diretos, três caminhos compostos determinísticos e até três checks adicionais da IA, com Tfull separado. Os caminhos (S,M),(A,P),(S,P) decorrem de regra gráfica anterior à descoberta e constituem um controle de composição adequado. Igualdade IA/Tpath significará automatização da mesma dedução, não falta de utilidade operacional.

## Pontos a conferir na próxima etapa

- `protocol.md:34` usa a expressão discrepância de desvio multinomial contra a mistura. A likelihood do conjunto, se usada para a discrepância, deve ser .6 L_SA + .4 L_CA, calculada após os produtos. Uma discrepância baseada no centro marginal qbar poderia ser usada com calibração correta por H comum, mas não deve ser chamada de likelihood conjunta do modelo.
- A referência para escores individuais, a referência de calibração agregada e os datasets de avaliação devem ser independentes, com tratamento finito Monte Carlo (+1) e empates documentado. Os mesmos datasets entre métodos dão comparação pareada, não independência artificial entre braços.
- O protocolo escolhe caudas inclusivas conservadoras sem desempate aleatório. Portanto, todas as famílias terão o mesmo nível nominal, mas podem ter tamanhos efetivos diferentes devido à discrição. A comparação de poder deve ser lida com as taxas de falso alarme; o texto não deve dizer que os tamanhos são exatamente iguais por construção.
- T0-Bonferroni oferece o controle de invariância individual. O agregado T0 por min-p pode reagir a alterações da dependência entre checks, mesmo quando cada distribuição marginal permanece igual. Essa ressalva já está corretamente no protocolo.
- A escolha de um exemplo em que IA rejeita e T0 não rejeita é explicitamente ilustrativa em `protocol.md:40`. Não usar sua existência como evidência de poder; as taxas de todos os 5.000 datasets são a evidência pertinente.
- Qualquer tradução de implicação em tabela de 16 estados deve ser auditada contra a candidata original antes dos resultados. Rejeitar traduções inválidas é permitido pelo protocolo; criar ou escolher uma nova implicação pelo seu poder não é.

## Verificações executadas

R somente de leitura: dimensões, índices, positividade, normalização, leis de erro, sete mapas categóricos por H, diferenças de F1, probabilidades de paridade, grupos de chamadas e reconstrução dos 24 episódios a partir dos payoffs e uniformes. Todas passaram. Essas verificações certificam a preparação sintética, sem validar alegações sobre o caso histórico do carbono.
