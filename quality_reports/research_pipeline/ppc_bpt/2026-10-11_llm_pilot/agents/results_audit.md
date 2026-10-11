# Auditoria independente dos resultados do piloto LLM

Data: 11/10/2026. Auditor: subagente `llm_ppc_architecture`.

**Conclusão: PASS para a correspondência numérica entre os dados principais e os resultados analisados. A calibração probabilística do LLM e a validade histórica permanecem não demonstradas.**

## Escopo e separação de tarefas

O auditor implementou previamente `scripts/model.R`, mas não implementou nem leu o código da análise que gerou as estimativas auditadas. Nesta etapa, recalculou em uma execução independente de R as contagens, marginais, probabilidades conjuntas, distâncias de variação total, posteriores plug-in e checks, diretamente de `data/worlds.csv` e `data/coded.csv`. As probabilidades das oito células de referência foram escritas explicitamente no cálculo independente. Este parecer não constitui revisão independente do código de geração teórica que o mesmo agente implementou.

Por solicitação posterior do coordenador, o auditor também implementou e executou `scripts/iid_benchmark.R`. Esse benchmark é uma implementação adicional, sujeita à conferência independente pelo coordenador; não está coberto pela afirmação de independência desta auditoria da análise anterior.

## Dados e correspondência

Há 192 mundos principais, sem IDs duplicados ou valores ausentes: três braços, duas hipóteses, 32 mundos por célula braço–hipótese e quatro blocos de oito. Há 195 linhas codificadas, incluindo três controles fora da amostra principal. Todos os mundos principais foram encontrados na codificação por ID.

Os 576 bits principais recuperados pelo codificador coincidem com os estados registrados. Não há bits indeterminados ou flags de contradição na amostra principal. Isso vale para A, B e C. Os 64 pares B–C têm estados idênticos, como exige o desenho; não são amostras adicionais independentes.

Os controles separados foram recuperados corretamente: `AUDIT_UNKNOWN_K` tem K indeterminado; `AUDIT_CONTRA_Q` tem Q indeterminado e flag de contradição; `AUDIT_CONTRA_A` tem A indeterminado e flag de contradição.

Esta comparação valida a correspondência estado–codificação registrada. Não substitui a revisão semântica dos documentos nem uma validação humana independente do codificador.

## Resultados recalculados

Tabela 1. Frequências e reconstrução do PPC principal, calculadas independentemente. Os pesos fixos são 0,6/0,4; o plug-in usa a posterior recalculada com as frequências de cada braço.

| Quantidade | A: prompt e LLM | B: R e LLM | C: R e templates |
|---|---:|---:|---:|
| E=(Q=1,A=1), SA | 15/32 = 0,46875 | 10/32 = 0,31250 | 10/32 = 0,31250 |
| E=(Q=1,A=1), CA | 9/32 = 0,28125 | 7/32 = 0,21875 | 7/32 = 0,21875 |
| PPC com pesos fixos | 0,39375 | 0,27500 | 0,27500 |
| Posterior SA plug-in | 0,62500 | 0,5882352941 | 0,5882352941 |
| PPC principal plug-in | 0,3984375000 | 0,2738970588 | 0,2738970588 |
| PPC condicional Qrep=1, pesos fixos | 0,6986842105 | 0,6482051282 | 0,6482051282 |
| PPC condicional Qrep=1, plug-in | 0,7043585526 | 0,6446455505 | 0,6446455505 |

As representações `states` e `coded` coincidem porque todos os bits principais foram recuperados. A maior diferença absoluta entre o recálculo e `ppc_estimates.csv` é 4,44 × 10⁻¹⁶. Não foram detectados erros de denominador nos resultados condicionais: Q=1 ocorre em 19 mundos SA e 16 CA em A, e em 13 SA e 15 CA em B/C.

O resultado condicional plug-in mantém a posterior obtida do evento conjunto observado E=(Q=1,A=1) e muda somente o alvo da replicação, fixando Qrep=1. Não equivale a refazer a inferência tratando Q observado como fixado experimentalmente. Essa distinção está explícita em `analysis_notes.txt`.

Tabela 2. Distância de variação total das oito células, contra a distribuição sintética estipulada.

| Braço | SA | CA |
|---|---:|---:|
| A | 0,15625 | 0,08750 |
| B | 0,16250 | 0,08125 |
| C | 0,16250 | 0,08125 |

As marginais Q, K, A, QA e KA de todas as combinações braço–hipótese foram recalculadas. A maior diferença nas marginais publicadas é zero; a maior diferença em TV e erro máximo por célula é 2,78 × 10⁻¹⁷.

## Interpretação das probabilidades da IA

**Confirmado:** o braço B conseguiu transmitir os estados sorteados externamente para documentos dos quais o codificador recuperou todos os bits neste piloto. Os mesmos estados em C produziram a mesma reconstrução numérica. Em A, os estados registrados e o conteúdo recuperado também coincidiram.

**Não confirmado:** que o LLM reproduza exatamente as probabilidades comandadas, que suas réplicas sejam iid ou que os números sejam probabilidades históricas calibradas. Quatro chamadas por hipótese e 32 mundos não fornecem base para uma certificação de equivalência.

**Refutação de uma interpretação indevida:** a diferença entre a frequência de E sob SA em A (0,46875) e seu alvo (0,375) não basta para concluir que o LLM falhou como amostrador. O gerador R também apresenta desvio amostral neste N. As distâncias de A e B/C são próximas, e essa comparação descritiva tampouco prova que os geradores sejam equivalentes.

Os pesos 0,6/0,4 aplicados às simulações de A constituem uma avaliação da aproximação ao gerador pretendido. Se A implicar outra distribuição, essa mistura não é automaticamente o PPC exato do simulador implícito. As estimativas plug-in estão corretamente separadas, mas usam as mesmas frequências Monte Carlo para inferência e replicação e são instáveis em amostras pequenas.

## Benchmark iid adicional, explicitamente hipotético

Executado `scripts/iid_benchmark.R`: 100.000 repetições multinomiais, N=32 por hipótese, independentes entre SA e CA, seed 2026101102. Esse experimento supõe independência apenas no gerador de referência. Não atribui independência às saídas do LLM e não fornece intervalos de confiança ou p-valores válidos para ele.

Tabela 3. Quantis centrais do benchmark iid. As frações da última coluna são a proporção de amostras iid cujo erro absoluto é pelo menos o observado em A; são apenas descrições da referência hipotética.

| Estatística | Quantil 2,5% iid | Quantil 97,5% iid | Observado A | Observado B/C | Fração iid com erro ≥ A |
|---|---:|---:|---:|---:|---:|
| TV SA | 0,08750 | 0,28750 | 0,15625 | 0,16250 | 0,64462 |
| TV CA | 0,08750 | 0,28125 | 0,08750 | 0,08125 | 0,97999 |
| Frequência E, SA | 0,21875 | 0,53125 | 0,46875 | 0,31250 | 0,36091 |
| Frequência E, CA | 0,12500 | 0,40625 | 0,28125 | 0,21875 | 0,83883 |
| PPC com pesos fixos | 0,21250 | 0,44375 | 0,39375 | 0,27500 | 0,27552 |

O benchmark evidencia que os desvios observados não são, por sua magnitude isolada, um diagnóstico de falha. Não determina a causa dos desvios, não demonstra calibração do LLM e não avalia seu desempenho fora dos prompts usados.

## Limites da auditoria

Não foram auditadas aqui a independência das chamadas, a semântica completa de cada documento, os controles determinísticos de geração, nem a validade das implicações novas propostas pelo LLM. Não foram recalculados os intervalos de bootstrap por chamadas; seu caráter exploratório permanece obrigatório. Nenhum achado deste parecer valida historicamente SA/CA ou estima probabilidades a partir das fontes do caso.

## Identificação das versões

SHA-256 dos arquivos examinados ou produzidos nesta etapa:

| Arquivo | SHA-256 |
|---|---|
| `data/worlds.csv` | `02132556afc1ba7ddfc302a2294a1cf29098eedcb7155ceb5953e71b1bcd00f9` |
| `data/coded.csv` | `12ab18bfd677c9a0186bf9dd34eca3a734b7336c21030db8c1436af9b0848437` |
| `results/ppc_estimates.csv` | `3a16849014f3811873b143cdca9d56f3b1abda01af84537a6391857eb8571e42` |
| `results/event_metrics.csv` | `f1f0d9984e60db16d985c7f5e099c4814ed823e22e9c97ff6473815e5b3f3209` |
| `results/joint_distribution_metrics.csv` | `f3318597399faf07daef15cdedbd62a66bb8dcadd1bd244663222020569b4ee0` |
| `scripts/iid_benchmark.R` | `ba204483212f123ae751fced6339d4e665a4a2d5bb36011f3b3bb03e13305502` |
| `results/iid_benchmark.csv` | `18a3eac3882a1e472afa14908ba439e701faa5f1ef1f00d2e752e1e5c022fdb7` |
