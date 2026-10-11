# Auditoria matemática independente de analyze.R

Data: 2026-10-11. Auditor: redo_identification. Esta primeira etapa ocorreu antes da execução da análise principal. Não implementei nem alterei scripts. Li analyze.R, protocol.md, protocol_addendum.md e selected_checks.json. Executei testes independentes de funções em dados de conferência sem gerar referências/avaliações do piloto e sem escrever saídas de análise.

## Veredito pré-execução

**PASS.** Não encontrei erro invalidador. A implementação corresponde ao modelo de hipótese compartilhada, mantém a mistura fora dos produtos, calcula as caudas inclusivas finitas corretamente e usa os mesmos datasets para diferenças pareadas. Pode executar a análise principal, preservando os limites abaixo.

## Achados e conferências

1. **CONFIRMADO — H comum.** `analyze.R:135–145` sorteia um H por coluna/dataset e gera um vetor multinomial de n episódios usando a lei desse H. Essa é uma realização da mistura de produtos, não do produto de misturas. H_truth é usado para gerar e registrar auditoria, não nas estatísticas.
2. **CONFIRMADO — G2 da mistura correta.** `:151–162` calcula a log-verossimilhança saturada sum_k n_k log(n_k/n), compara com log[.6 exp(sum_k n_k log q_SA,k) + .4 exp(sum_k n_k log q_CA,k)] e usa log-sum-exp estável. Os coeficientes multinomiais cancelam entre numerador e denominador. A saturada representa a distribuição empírica das categorias daquele check.
3. **CONFIRMADO — zeros e estabilidade.** Contagens zero contribuem zero à saturada. Todas as probabilidades das categorias são positivas, pois as 16 células nulas são positivas e categorias vazias não são criadas. O log-sum-exp evita underflow da verossimilhança conjunta. Discrepâncias negativas apenas por arredondamento são truncadas; violações substantivas abaixo de -1e-8 provocam erro.
4. **CONFIRMADO — testes independentes do desvio.** Para N=24,96,384, comparei 41 datasets por N, incluindo 16 vetores com toda a contagem numa única célula, em 17 checks. Foram 2.091 comparações com cálculo independente por `dmultinom(...,log=TRUE)` incluindo o coeficiente multinomial. Diferenças absolutas inferiores a 1e-10; todas passaram.
5. **CONFIRMADO — mapas observáveis.** A tabela da primeira implicação é exatamente V+W; a segunda é S XOR P; a terceira é A XOR P. Nenhuma usa H verdadeiro. Confirmei as 48 entradas das três tabelas. Tpath usa pares categóricos; TpathXOR usa suas coarsenings de paridade, conforme o adendo anterior aos resultados.
6. **CONFIRMADO — referências independentes.** `:210–230` usa reference_A para p individuais, reference_B para calibrar o mínimo e novos datasets para avaliar cada condição. Os 18 seeds de três tamanhos × seis fases são distintos. Todos os métodos recebem os mesmos datasets e as mesmas referências.
7. **CONFIRMADO — caudas inclusivas +1.** `:167–176` usa número de estatísticas da referência maiores ou iguais à observada para o componente e número de escores menores ou iguais ao observado para o agregado. Conferi contra contagem ingênua, incluindo empates, valores fora da referência e infinitos. Numerador e denominador usam a correção +1. O arredondamento a 12 casas segue o adendo.
8. **CONFIRMADO — agregação.** `:183–192` calcula o mínimo dos p componentes de cada família; a calibração desse mínimo por reference_B preserva a dependência entre checks. T0-Bonferroni é 7 vezes o menor p de T0, truncado em um. Não recebe uma segunda calibração, conforme sua função de controle conservador.
9. **CONFIRMADO — denominadores e diferenças pareadas.** `:235–257` divide rejeições por 5.000 datasets. Para diferenças, usa D_i=I(rejeição método1)-I(rejeição método2), média de D_i e sd(D_i)/sqrt(5000). Essa é a incerteza Monte Carlo apropriada à comparação pareada, condicional às referências e à seleção fixa. Os intervalos não incluem variação entre corpora de descoberta, versões de IA ou referência estimada.
10. **CONFIRMADO — resultados auditáveis.** As saídas RDS preservam contagens, H verdadeiro, discrepâncias, p componentes, agregados e decisões das referências e avaliações. As tabelas de probabilidade rotuladas como mistura de um episódio são descritivas; não entram indevidamente como q na likelihood conjunta.
11. **CONFIRMADO — exemplo ilustrativo.** `:267–275` escolhe o primeiro F2 com TIA rejeitando e T0 não rejeitando, ou o primeiro F2 se nenhum atender. Esse critério já está no protocolo e será explicitado; não é um exemplo representativo nem uma seleção independente para demonstrar poder.

## Limites que permanecem

- Empates conservadores garantem calibração nominal comum, não tamanho efetivo idêntico entre famílias. Comparar poder junto com falsos alarmes.
- TpathXOR foi acrescentado depois de conhecer candidatos, antes de qualquer avaliação. É uma sensibilidade secundária legítima e deve continuar identificada como tal.
- V+W e A XOR P não são partições idênticas, mas a segunda é coarsening da primeira. Três checks não equivalem a três dimensões independentes de informação. Diferenças de desempenho são do conjunto de estatísticas e sua calibração.
- A calibração de Monte Carlo adicional faz parte deste experimento de evidência reservada. Não deve ser generalizada como garantia automática para todo PPC aplicado à mesma evidência usada no ajuste.
- O comparador Tfull é um teste conjunto forte, não um limite universal de poder. Um check direcionado pode superá-lo diante de uma alternativa específica sem fornecer informação nova fora do modelo.
- A auditoria pós-execução ainda deve conferir resultados e correspondência com os artefatos preservados.

## Auditoria pós-execução dos resultados

**PASS.** Recalculei os resultados a partir das contagens e referências preservadas em audit_draws_N24.rds, audit_draws_N96.rds e audit_draws_N384.rds, sem modificar a análise.

- Para cada N e cada uma das quatro condições, selecionei 300 datasets distribuídos regularmente entre os 5.000. Recalculei o desvio de todos os 17 checks por likelihoods multinomiais explícitas. Foram 61.200 comparações; a maior diferença absoluta foi 3.212e-12.
- Recalculei todos os p componentes de reference_B e de todos os datasets de avaliação por funções de distribuição empírica independentes sobre as referências, com a correção +1. Reconstituí todos os mínimos e p globais. Os 360.000 p globais e decisões (60.000 datasets × seis famílias) coincidiram com as saídas.
- Recalculei integralmente as contagens de rejeição e proporções de rejection_rates.csv, e todas as diferenças, erros-padrão e quatro células de concordância de paired_differences.csv.
- Revalidei a matriz de probabilidades categóricas por check e as invariâncias dos sete checks diretos sob F2. Conferi os p-valores exportados em evaluation_pvalues.csv contra as matrizes RDS.
- Conferi a escolha e todos os campos do exemplo: dataset F2 número 123, N=96, primeiro entre 19 em que TIA rejeita e T0 não rejeita. As contagens e p globais coincidem com os dados integrais.

### Resultado substantivo confirmado

| N | Condição | T0 | Tpath | TpathXOR | TIA | Tfull |
|---:|---|---:|---:|---:|---:|---:|
| 96 | Nulo | .0484 | .0486 | .0490 | .0482 | .0558 |
| 96 | F2 | .0450 | .0494 | .0402 | .0408 | .8816 |
| 384 | Nulo | .0480 | .0484 | .0488 | .0498 | .0478 |
| 384 | F2 | .0448 | .6952 | .8590 | .8574 | 1.0000 |

No N primário=96, a seleção IA não trouxe ganho contra F2. Ela rejeitou menos que T0 e Tpath nesta realização. A diferença pareada TIA−T0 é -.0042, com IC Monte Carlo [-.007209,-.001191]. Não apresentar os 19 casos isolados de vitória como desempenho geral favorável: existem 40 casos no sentido contrário.

Em N=384, as consequências compostas trazem grande ganho frente aos checks locais, mas a vantagem de TIA sobre Tpath categórico é explicada pela sensibilidade do contraste comprimido: TIA=.8574 e TpathXOR=.8590. A diferença pareada TIA−TpathXOR é -.0016, IC [-.003885,.000685]. Isso não demonstra equivalência formal, mas não fornece evidência de superioridade da IA sobre esse comparador determinístico. Tfull tem poder superior nos dois tamanhos.

A taxa nula Tfull=.0558 em N=96 tem IC Wilson [.049772,.062510], que inclui .05 por pequena margem. A afirmação adequada é compatibilidade com o nível nominal dentro desta incerteza Monte Carlo, não prova de calibração perfeita. O intervalo é condicional às referências e ao corpus de descoberta.

### Por que a composição isolada tem pouco poder em N=96

O indicador S XOR P tem probabilidade .392 sob SA e .608 sob CA no null. Em F2, essas probabilidades são .512 e .488. No componente isolado, a mistura mantém ambiguidade entre hipóteses. Para exatamente 48 discordâncias em 96 episódios, o desvio é 4.58683 e o p componente é .049399 usando a referência congelada; esse valor não basta para o agregado de dez checks rejeitar.

Além disso, cada discrepância componente integra H separadamente. O mínimo dos p-valores pode aceitar um componente mediante SA e outro mediante CA, sem testar diretamente se a mesma hipótese explica todos. Isso não é erro de calibração: é perda de poder pela escolha do agregado. O check conjunto de 16 células preserva essa exigência de H comum simultaneamente a todos os campos. A inferência explicativa é consistente com seu poder .8816 em N=96. Não é necessário nem autorizado retunar checks após observar esse diagnóstico.

### O exemplo 123 não demonstra a detecção do mecanismo novo

No exemplo selecionado, TIA rejeita com p=.0189396 e T0 não rejeita com p=.101538. Contudo, quem dirige o mínimo de TIA é **A XOR P**, p componente .00313994; S XOR P tem p=.577628. A XOR P e V+W têm distribuições invariantes sob F2. Portanto, o exemplo mostra uma flutuação de um check preservado, selecionada pelo critério ilustrativo; não mostra a descoberta do defeito de terceira ordem pela nova consequência S–P.

TpathXOR também rejeita, p=.0197796, e Tpath rejeita, p=.0312794. Tfull tem p aproximadamente .000060. Essa distinção deve acompanhar qualquer apresentação do exemplo. A evidência sobre desempenho vem das taxas integrais, não da existência de um caso favorável.

## Conclusão final da auditoria

O experimento e seus cálculos estão corretos e refutam uma alegação forte de vantagem exclusiva da IA neste desenho. A IA formulou consequências operacionais; em amostras maiores, checks compostos melhoram sobre marginais/pares locais. Os templates que calculam a mesma compressão alcançam desempenho semelhante, e o check conjunto completo é superior. O resultado primário de ausência de ganho e a falha do exemplo em representar a nova perturbação precisam permanecer destacados.
