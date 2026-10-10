# Agente 09 — Implementação da família causal e cálculo exato

Data: 10 de outubro de 2026. Papel: implementação, não revisão independente. Li as instruções do projeto, `02_identification.md` (incluindo o adendo E3), `06_completion.md`, `proposta.md` e `data/published_weights.csv`. O pedido explícito de exemplo numérico até o PPC, com as autorizações atuais do usuário, cobre estes cálculos ilustrativos. Nenhum manuscrito ou dado de entrada foi alterado.

## Arquivos e execução

Criei `causal_ppc.R` em base R. O caminho do script determina a pasta de entrada/saída, de modo que o comando não depende do diretório de trabalho além da localização do arquivo. O script lê os pesos publicados, não contém uma escolha pontual da escala causal e não simula resultados históricos. A função opcional `drawrep()` documenta o gerador e não é chamada. O gráfico foi gerado com o dispositivo PDF nativo e convertido com Poppler.

Comandos executados, ambos com exit code 0:

```sh
LC_ALL=en_US.UTF-8 Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods/causal_ppc.R
pdftoppm -singlefile -r 180 -png quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods/results/ppc_family.pdf quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods/results/ppc_family
```

Outputs: `results/results.csv`, `family.csv`, `frontier.csv`, `posterior_chain.csv`, `sessionInfo.txt`, `ppc_family.pdf` e `ppc_family.png`.

## Resultados computados

| Quantidade | Resultado |
|---|---:|
| Soma posterior em dB | 4 |
| Odds posteriores SA/CA | 2,511886431509580 |
| Posterior SA | 0,715252751049199 |
| BF do E3 | 15,848931924611133 |
| Máximo admissível de `b=P(E3|CA,C)` | 0,0630957344480193 |
| Ínfimo do PPC, não atingido | 0 |
| Máximo do PPC | 0,733219087853802 |
| `a=P(E3|SA,C)` na fronteira ilustrativa `q=0,05` | 0,0681924418339332 |
| `b=P(E3|CA,C)` nessa fronteira | 0,00430265220131586 |
| BF do complemento nessa fronteira | 0,935834126932379 |

A posterior é a comparação agregada original, não o mecanismo de uma firma. `family.csv` contém 1001 especificações positivas, além do zero identificado como limite inadmissível após a observação de E3. A posterior e o BF do evento observado estão como `NA` nessa linha-limite. O grid é uma aproximação gráfica da família analítica, não uma distribuição de probabilidade sobre especificações, uma amostra, uma elicitação ou um conjunto de estimativas. Os limites e a fronteira são calculados analiticamente, não estimados do grid.

## Verificações de implementação executadas

- Entrada sem valores ausentes ou etapas duplicadas, com as cinco etapas e a classificação de origem esperadas.
- Cada coluna das likelihoods binárias soma 1 em toda a família; distribuição preditiva também normalizada.
- BF do evento permanece constante nas 1001 especificações positivas.
- Posterior reconstruída por odds com os demais pesos permanece constante nas 1001 especificações positivas.
- Enumeração das duas respostas reproduz a fórmula exata da mistura.
- Inversão do BF do complemento recupera as likelihoods, inclusive o extremo `a=1`, e reconhece a não identificação quando ambos os BFs valem 1.
- A fronteira tem `q=0,05` e perturbações para cada lado têm o sinal correspondente.
- A função de geração de réplicas não é executada; não há Monte Carlo nem escolha silenciosa de um prior sobre a escala.

Esses são controles executados pelo implementador. A revisão independente foi solicitada ao agente 10 e não é substituída por este registro. Os controles não validam os julgamentos substantivos publicados, a transportabilidade das fontes, a definição do evento composto ou o auxiliar de replicação.

## SHA-256

```text
daf6c99e212754702ccfe8525a5eb1f0b132c510446ca62b33d5ac9716784854  causal_ppc.R
721af49e3a1467de9ffc2e95724ca2c07c954b326c6b24d3e24a299f6eda0d5f  data/published_weights.csv
4d9dd087be4d4d2862e7448091bb58acc41775a87ff33412eb90fd1f3e67baea  results/results.csv
756423e2813bdcbb71ef7fdf7320a178620c0b61729e71685e8960a65af4a3c7  results/family.csv
```
