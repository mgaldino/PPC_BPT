# Revisão independente da atribuição de ganho à IA

Data: 11 de outubro de 2026. Escopo: formulação de implicações, comparação com templates e atribuição de desempenho. Revisão por agente, separada da implementação. O único arquivo escrito por esta revisão é este parecer.

**Conclusão:** o piloto documenta a formulação, pela IA, de uma relação observável composta que não estava enumerada no prompt. Ele não identifica melhoria exclusiva da IA no diagnóstico posterior preditivo. O resultado documental forte pertence à análise secundária após auditoria por outro agente e também é alcançado por um check de uma premissa explícita. As distribuições empíricas produzidas pela IA apresentam excesso de alarmes no nulo e um padrão rígido de erros de comunicação que põe em dúvida a fidelidade à amostragem independente solicitada.

## Base da revisão e verificações

Foram lidos integralmente `protocol.md`, os três congelamentos em `data/{analysis_freeze,secondary_freeze,attribution_freeze}.json`, `agents/selection_audit.md` e as cinco tabelas solicitadas: `results/{rejection_rates,explicit_premise_rates,sampling_fidelity,batch_fidelity,template_equivalence}.csv`.

Para confrontar as interpretações com suas fontes, também foram inspecionados o prompt `prompts/discovery_CA_01.txt`, `data/codebook.json`, `raw/select_checks/answer.json`, os trechos relevantes de `scripts/analyze.R` e `scripts/oracle.R`, e as tabelas `results/{exact_distribution_checks,joint_kernel,conditional_implications,batch_bootstrap,missingness,strict_missingness}.csv`. A leitura de `agents/independent_coding_review.md` serviu apenas para delimitar a verificação documental. Este parecer não refez a codificação nem executou o pipeline, novas chamadas ou simulações. Os números abaixo são resultados registrados, confrontados com o cálculo declarado nos scripts, e não uma reprodução independente.

As unidades são distintas: houve 16 mundos de descoberta em quatro chamadas, 128 mundos de confirmação em 16 chamadas, oito chamadas por hipótese, e 1.000 conjuntos de 12 mundos por condição do benchmark sintético. Os 1.000 conjuntos avaliam um pipeline já realizado. Eles não são 1.000 repetições independentes da descoberta, seleção ou geração pela IA.

Identidade dos artefatos centrais, SHA-256 recalculado nesta revisão:

| Artefato | SHA-256 |
|---|---|
| `protocol.md` | `feaeb91baac1dfb03128ba8996fe952caeb84a714078c449c34ba7ac54c7d1ac` |
| `data/analysis_freeze.json` | `5a479cfe6f7874179cf94eaedf02d1b00538fee6a6bfb5763e69565ea447bf95` |
| `data/secondary_freeze.json` | `968e2459e195d5533e7ff3ef006a5325f3d6b09170ad25519cd408fbbbbb0082` |
| `data/attribution_freeze.json` | `170318dc46a903325c84dbe9383b4ca63af4f25100dd37e8ff73d8ebb7ffbeeb` |
| `results/rejection_rates.csv` | `0e4b2af9946aa2e87eb103a801f8d026f42a25cac9f73224a1c91bd4039b43ca` |
| `results/explicit_premise_rates.csv` | `eee40be548ef41c83b99436d06bab1125a6b71cd06773b8a4af55563a9844c5c` |

## Achados adjudicados

Os enunciados examinados abaixo são alegações possíveis sobre a atribuição, não citações atribuídas ao autor. Cada status qualifica o achado explicitamente formulado.

### ATR-01 — “O check primário apenas repete uma única premissa ou estava enumerado no prompt”

**Status: REFUTED.** Dimensão: novidade operacional. Proposta: `safe`, preservar a conclusão restrita.

**Evidência que refuta:** `prompts/discovery_CA_01.txt` fornece tipos de choque, benefícios, custo, regra de decisão e erros, mas não enuncia a diferença entre as taxas de retirada condicionadas aos dois tipos de choque. `data/codebook.json`, `checks[0]`, constrói essa relação e a tabela 2×2. Sob CA, reduzir o benefício competitivo de 12 para 2 torna o payoff negativo, enquanto reduzir apenas a carga regulatória deixa o benefício relevante acima do custo 6. A comparação entre decisões posteriores aos dois choques combina essas premissas. O seletor usa `discovery_CA_01_02` e a auditoria confirma a admissibilidade.

**Limite:** a relação é uma consequência simples do mecanismo integralmente fornecido. “Não enumerada no prompt” é diferente de “não implicada pelas premissas”, “desconhecida na ciência” ou “inacessível a regras, código ou pesquisadores”. O artefato demonstra uma formulação compatível com dedução. Não observa o processo cognitivo interno do modelo nem estima a confiabilidade dessa capacidade em novos mecanismos.

### ATR-02 — Atribuição indevida de benefício da IA ao contraste com C0

**Status: CONFIRMED.** O defeito de atribuição existe se essa conclusão for feita. Dimensão: identificação. Proposta: `safe`, restringir a interpretação do contraste.

**Evidência do defeito:** `protocol.md`, item 6, e `data/analysis_freeze.json`, campo `C0`, deixam os novos indicadores **não especificados** em C0. Portanto, C0 não tem taxa de rejeição definida para esses checks. Não se pode recodificar essa ausência como probabilidade zero do observável nem como poder zero de um teste concorrente. O contraste incorpora expansão do conjunto de observáveis e informação disponibilizada, além da presença da IA.

O comparador de `data/attribution_freeze.json` usa a mesma premissa de erro público de 5% dada à IA. Em `results/explicit_premise_rates.csv`, detecta 1.000/1.000 falhas documentais e rejeita 25/1.000 conjuntos nulos. Essa evidência elimina a necessidade de uma implicação nova para obter a detecção documental observada neste benchmark. Ela não testa todas as consequências que um sistema sem IA poderia descobrir, nem exclui vantagens da IA em outros problemas ou em tempo de trabalho. O comparador foi acrescentado como auditoria secundária, não como braço completo originalmente randomizado.

### ATR-03 — Generalização excessiva da igualdade entre L e C+

**Status: PARTIAL.** Dimensão: atribuição por etapa. Proposta: `safe`, declarar exatamente o que a equivalência controla.

**Evidência favorável ao núcleo:** `results/template_equivalence.csv` registra 128/128 estados coincidentes e kernels primário e secundário idênticos. Para os indicadores codificados e a regra de PPC utilizada, trocar a prosa pelos templates expandidos conserva a distribuição e os resultados. A prosa da IA não acrescenta ganho numérico depois que esses estados já foram extraídos.

**Evidência que limita a conclusão:** `protocol.md`, item 6, define C+ com os mesmos estados extraídos de L. C+ não descobriu os indicadores independentemente e não gerou probabilidades independentes. É um controle da representação documental após a codificação. Sua igualdade com L não mede o efeito de retirar a IA das fases anteriores e não demonstra ausência geral de benefício de descoberta, interpretação ou economia de trabalho.

### ATR-04 — Atribuição do sucesso secundário à seleção automática original

**Status: CONFIRMED.** O defeito consiste em reunir dois procedimentos distintos sob uma única alegação confirmatória. Dimensão: seleção e escopo. Proposta: `safe`, manter resultados e proveniências separados.

**Evidência do defeito:** `raw/select_checks/answer.json` conserva apenas um check e rejeita `discovery_SA_02_02`. `agents/selection_audit.md` contesta essa exclusão por envolver anúncios públicos, que não são determinados pelas decisões internas devido ao erro de comunicação. `data/secondary_freeze.json` explicita a correção por auditoria e o conhecimento das definições das condições do benchmark, embora declare não haver inspeção dos resultados antes do congelamento.

A inclusão antes dos resultados reduz a possibilidade de escolha pelo menor p observado. Ela não torna a seleção secundária uma confirmação independente, pois o desenho dos defeitos já era conhecido. Não há base nestes artefatos para afirmar seleção deliberada após ver os resultados. Há base para separar **pipeline com seleção automática** de **pipeline após auditoria independente por agente**. O ganho do segundo procedimento não pertence exclusivamente ao primeiro seletor. A candidata já existia no corpus, portanto a falha da seleção tampouco demonstra incapacidade do gerador de propor uma implicação documental. Não houve painel humano identificado neste processo.

### ATR-05 — Fidelidade ao amostrador independente tratada como estabelecida

**Status: CONFIRMED.** O defeito é tratar essa fidelidade como estabelecida. Dimensão: fidelidade do simulador e dependência. Proposta: `needs_design`, nova avaliação com unidades e geração aleatória controladas.

**Evidência do defeito:** o prompt exige erro público de 5%, independente dos demais sorteios, e proíbe balanceamento e quotas. `results/batch_fidelity.csv` registra exatamente um erro público em cada uma das 16 chamadas de oito mundos. `results/sampling_fidelity.csv` registra 8/64 erros em cada hipótese, isto é, 12,5%, e distâncias de variação total entre as distribuições conjuntas empírica e do oráculo de 0,140 para CA e 0,125625 para SA. Os desvios não se resumem ao arredondamento de uma frequência.

O padrão observado é uma quota de 1/8 **no resultado**, não evidência de uma intenção ou rotina interna específica do modelo. Uma realização desse padrão tem probabilidade positiva sob sorteios independentes, portanto não constitui prova lógica de dependência. Ainda assim, impede tratar a independência solicitada como verificada. Os testes binomiais sob independência em `sampling_fidelity.csv` são diagnósticos contra essa referência, não correções da dependência. `results/batch_bootstrap.csv` apresenta intervalo [0,125, 0,125] para erro público porque todas as chamadas observadas têm a mesma taxa. Esse intervalo degenerado não certifica estabilidade em outras execuções, prompts ou tamanhos de chamada.

### ATR-06 — Confusão entre normalização empírica e fidelidade ao mecanismo

**Status: CONFIRMED.** O defeito é confundir coerência interna com fidelidade ao alvo. Dimensão: validade probabilística. Proposta: `safe`, separar as duas verificações.

**Evidência do defeito:** `scripts/analyze.R`, função `make_predictive`, usa contagens divididas pelo total por hipótese e calcula a cauda contra a própria distribuição resultante. `results/exact_distribution_checks.csv` confirma massa total aproximadamente 1 e autorrejeição de cerca de 5%. Isso é coerente com a construção do teste para aquela distribuição empírica congelada. Não verifica se a distribuição coincide com os fundamentos sintéticos que deveriam ser simulados.

Quando o alvo vem do oráculo nulo, `results/rejection_rates.csv` registra 12,6% de rejeição na análise primária empírica e 20,1% na secundária empírica. Assim, um teste pode ser exato para o seu kernel e produzir muitos alarmes contra o processo que o kernel pretendia representar. A normalização das contagens não recupera a probabilidade de erro de 5% declarada no prompt. Essa diferença não prova ajuste oportunista aos alvos: a análise usa frequências de confirmação e os congelamentos são explícitos. O problema é a correspondência entre o simulador e o alvo.

Zeros amostrais e apenas 64 mundos por hipótese também importam. A sensibilidade Dirichlet reduz os alarmes nulos para 2,8% e 0,5%, respectivamente, mas não demonstra que o problema de dependência entre textos foi modelado. Ela integra incerteza de probabilidades sob um modelo multinomial para as contagens. Não é uma correção geral da quota observada por chamada nem justificativa para substituir silenciosamente o resultado empírico primário.

### ATR-07 — Superioridade avaliada apenas pelo número de rejeições a limiar 0,05

**Status: CONFIRMED.** O defeito é comparar detecção sem considerar alarmes falsos e origem do check. Dimensão: avaliação. Proposta: `needs_design`, comparação a tamanho controlado em amostra separada.

**Evidência do defeito:** todos os valores abaixo vêm de `results/rejection_rates.csv` ou `results/explicit_premise_rates.csv`. Cada célula tem denominador 1.000 conjuntos.

| Procedimento | Nulo | Falha documental | Troca SA/CA |
|---|---:|---:|---:|
| Primário, kernel empírico | 12,6% | 13,6% | 17,4% |
| Primário, sensibilidade Dirichlet | 2,8% | 4,6% | 4,7% |
| Primário, oráculo | 4,6% | 5,4% | 4,2% |
| Secundário auditado, kernel empírico | 20,1% | 100,0% | 32,0% |
| Secundário auditado, sensibilidade Dirichlet | 0,5% | 99,1% | 2,4% |
| Secundário auditado, oráculo | 4,9% | 100,0% | 5,0% |
| Premissa explícita, cauda binomial | 2,5% | 100,0% | 1,9% |

O primário não oferece evidência convincente de detecção documental adicional: seu indicador não contém a comunicação pública, que é o processo alterado nesse defeito. A elevada detecção documental secundária é substantivamente presente neste benchmark, inclusive com a sensibilidade Dirichlet conservadora. Porém, o defeito é muito grande, com erro público alterado de 5% para 80% em `scripts/oracle.R`, e o check da premissa explícita também o detecta. A detecção secundária não identifica benefício exclusivo da descoberta pela IA.

Os 100% observados significam 1.000 rejeições em 1.000 conjuntos. O intervalo de Wilson registrado tem limite inferior de aproximadamente 99,62%, não estabelece poder populacional exatamente igual a 1. Os intervalos dessas taxas descrevem a incerteza Monte Carlo do benchmark condicional ao pipeline realizado, sem incorporar novas execuções da descoberta e geração. A diferença de desempenho entre procedimentos precisaria ser avaliada de modo pareado e com controle de tamanho. As tabelas atuais não autorizam chamar a taxa de 32% sob troca SA/CA de ganho científico quando o mesmo teste rejeita 20,1% do nulo.

### ATR-08 — “A baixa rejeição da troca SA/CA prova que a implicação é inválida”

**Status: REFUTED.** Dimensão: objetivo do diagnóstico. Proposta: `safe`, distinguir discriminação entre hipóteses de incompatibilidade da mistura.

**Evidência que refuta:** `protocol.md`, itens 1 e 7, declara que a troca é um controle de discriminação e pode não rejeitar a mistura. `scripts/oracle.R`, `make_dataset`, inverte a hipótese comportamental. As duas distribuições condicionais permanecem componentes admissíveis da preditiva, com pesos diferentes. Um conjunto pode parecer mais compatível com a outra hipótese e continuar plausível sob a mistura posterior. Rejeição global baixa não equivale a ausência de informação discriminante. Tampouco valida a mistura para casos históricos.

### ATR-09 — “A IA tem benefício exclusivo e replicável de dedução/diagnóstico”

**Status: UNRESOLVED.** Dimensão: identificação de benefício incremental. Proposta: `needs_design`.

Não há grupo independente sem IA que tenha recebido os mesmos fundamentos completos, tarefa de busca, orçamento e critérios de seleção, seguido por avaliação cega em mecanismos e defeitos novos. C0 é restrito, C+ herda estados da IA, e o check explícito cobre uma parte particular da comparação. O caso atual oferece uma demonstração de possibilidade de formulação e evidência contrária à necessidade de novidade para detectar a falha documental específica. Não estima a contribuição exclusiva, sua frequência em outros problemas ou seu custo relativo. Esse limite impede uma conclusão de superioridade, mas também impede concluir inutilidade geral da IA.

## Próximo desenho que identificaria benefício incremental

O estimando deve ser o efeito de **adicionar assistência da IA** a um processo de construção de PPCs que já recebe as mesmas informações. Uma execução útil seria:

1. Congelar vários mecanismos sintéticos e seus oráculos. Separar mecanismos de desenvolvimento, calibração e avaliação final. Defeitos finais e seus resultados ficam ocultos de todos os geradores, seletores e revisores até o congelamento dos checks. Incluir defeitos de dependência conjunta que preservem as marginais explícitas, além de controles que testes de premissas devem detectar.
2. Randomizar equipes ou sessões independentes entre construção sem IA e construção com IA, com os mesmos fundamentos, documentos disponíveis, tempo ou orçamento e número máximo de checks. Um sistema determinístico que enumere consequências com as mesmas regras pode ser um terceiro comparador. O baseline precisa conter ao menos as verificações diretas das premissas explícitas. Definir se o alvo é efeito com recursos iguais ou ganho por unidade de custo.
3. Definir previamente a política de seleção e auditoria. Se revisão humana ou por outro agente fizer parte de um braço, isso deve constar da intervenção. Para separar geração de candidatos e seleção, variar essas etapas em desenho fatorial ou manter uma seleção cega comum. Julgar novidade, admissibilidade e redundância sem acesso a braço, defeitos ou desempenho.
4. Para isolar o valor de formular checks, usar o mesmo gerador probabilístico controlado em todos os braços. Avaliar o uso do LLM como amostrador em experimento separado, variando tamanho de chamada e número de chamadas. Dessa forma, defeitos de amostragem não são atribuídos à qualidade das implicações.
5. Congelar o conjunto de checks, o tratamento de ausência, a agregação do PPC e o controle de múltiplas verificações. Calibrar o tamanho em amostra nula separada, com regra comum aos braços. Avaliar no conjunto final a diferença pareada de detecção a igual taxa de alarme, cobertura de tipos de defeito, custo, tempo e número de implicações válidas não redundantes. Repetir descoberta e seleção em vários mecanismos e sementes. Os intervalos devem refletir essa repetição do processo completo.

Esse desenho identificaria ganho da assistência da IA relativamente aos comparadores especificados. Mesmo um resultado positivo não provaria exclusividade universal de uma capacidade. A pergunta empiricamente identificável é se a assistência aumenta a qualidade ou reduz o custo sob uma informação e um protocolo de comparação definidos.

## Conclusão curta proposta para o relatório

> Neste piloto sintético, a IA formulou uma relação observável composta que não estava enumerada no prompt. Isso demonstra uma possibilidade de ampliar o repertório de checks, mas não estabelece ganho exclusivo da IA sobre templates com a mesma informação. A seleção automática reteve apenas um check e a detecção documental forte apareceu na análise secundária após auditoria por outro agente. Um teste de uma premissa explícita também detectou todas as falhas documentais simuladas, com menos alarmes no nulo que o kernel empírico da IA. As gerações exibiram exatamente um erro público por chamada de oito mundos, e os PPCs empíricos rejeitaram 12,6% e 20,1% dos conjuntos nulos a limiar de 5%. O resultado apoia o uso da IA como fonte de candidatos a implicações, com auditoria e controle da simulação, e deixa em aberto seu benefício incremental em uma comparação com informação e recursos iguais.

## Encaminhamento e limites

Contagem: **5 CONFIRMED, 1 PARTIAL, 2 REFUTED, 1 UNRESOLVED**. O item não resolvido é precisamente a atribuição de superioridade, não um impedimento para relatar os resultados descritivos. As restrições de conclusão nos itens confirmados e na parte confirmada de ATR-03 são encaminháveis como mudanças de interpretação. Não autorizam alterar indicadores, substituir resultados primários por sensibilidades ou redesenhar o experimento retroativamente. O manuscrito, os dados, o codebook e os scripts não foram alterados por esta revisão.

## Adendo: conferência limitada das conclusões do relatório técnico

Data: 11 de outubro de 2026. Foi solicitada uma conferência da abertura e das seções 1, 6 e 7 de `report.md`, sem revisão transformativa e sem edição do relatório. A versão conferida tem SHA-256 `900a4b98ccdfcf1eefc28a737cf8d994c254d4c611b9ab1bf5644adcbd34edf3`. A nova tabela `results/exact_operating_rates.csv` tem SHA-256 `42e8412d1b8ff9cab37f0e60cddc760da151b59f494f6d02713f442420c64fd0`.

**Concordo com as conclusões centrais do relatório.** A abertura restringe a novidade à formulação de consequências compostas não enumeradas e não reivindica superioridade contra templates com as mesmas premissas. A seção 1 mantém C0 não especificado, identifica C+ como estados herdados da IA e conserva a seleção automática separada da análise secundária auditada. A seção 6 não atribui todo o excesso de alarmes a uma causa única, e a seção 7 apresenta a comparação com informação e recursos iguais como trabalho futuro, não como experimento já realizado.

As taxas exatas alteram a precisão da descrição do tamanho e do poder. Elas não alteram a conclusão de atribuição deste parecer:

| Procedimento | Nulo exato | Troca SA/CA exata | Falha documental exata |
|---|---:|---:|---:|
| Primário empírico | 12,9485% | 17,6299% | 12,9485% |
| Secundário empírico | 21,3651% | 29,6536% | 99,9268% |
| Secundário Dirichlet | 1,70474% | 2,46931% | 99,2560% |
| Secundário oráculo | 4,79672% | 5,18597% | 99,9973% |

As porcentagens anteriores de 12,6%, 20,1% e 0,5% são frequências nos 1.000 conjuntos registrados, não probabilidades exatas do teste sob o processo nulo. Em particular, os cinco alarmes do secundário Dirichlet não estabelecem tamanho populacional de 0,5%. A Tabela 8 e o parágrafo correspondente do relatório fazem essa distinção corretamente. “Detectou todas” na abertura refere-se ao benchmark realizado, enquanto a tabela exata registra poder inferior a 100%. O arredondamento da referência oráculo para 100,0% na Tabela 8 não é uma alegação de probabilidade matematicamente igual a um.

Também está correta a distinção entre desvio do gerador e erro da aproximação por um corpus finito. Há evidência separada de um padrão de erros públicos incompatível em frequência com os 5% estipulados e fortemente desfavorável à referência de sorteios independentes. Não foi estimada a parcela do excesso de alarmes que se deve a esse padrão, à amostra de 64 mundos por hipótese, aos zeros empíricos ou a suas combinações. O relatório não deve converter a taxa exata de 21,3651% em uma decomposição causal desses componentes. A seção 6 explicitamente evita essa conversão.

### ATR-10 — Generalização da dependência do corpus IA a todas as referências

**Status: CONFIRMED.** Dimensão: rótulo de condicionamento. Severidade: pequena, sem mudar a conclusão substantiva. Proposta: `safe`.

**Evidência do defeito:** na versão conferida, `report.md`, linha 36, afirma que “Todas as taxas são condicionais ao único corpus de calibração da IA”. A legenda da Tabela 8, linha 192, também apresenta esse condicionamento para todas as taxas da tabela. A interpretação relevante, de dependência das regiões de rejeição em relação ao corpus observado, aplica-se aos procedimentos empírico e Dirichlet que estimam o kernel da IA. As referências com probabilidades estipuladas, incluindo o teste binomial da premissa explícita, não usam esse corpus para construir o teste. `scripts/analyze.R`, função `make_predictive` no braço `oracle`, usa `oracle_q`; o check explícito usa a cauda de `Binomial(12, 0.05)`.

Condicionar formalmente uma quantidade independente a um corpus não muda seu valor, mas o rótulo global pode levar o leitor a atribuir às referências a mesma dependência de calibração que afeta os braços IA. Correção pontual sugerida: **“As taxas dos procedimentos baseados no kernel da IA são condicionais ao corpus observado. As referências usam as probabilidades estipuladas.”** Na legenda da Tabela 8, restringir analogamente a ressalva aos procedimentos baseados no corpus da IA.

Não identifiquei outro erro concreto de atribuição ou de correspondência numérica nas partes solicitadas. A expressão “controle com informação equivalente” na seção 6 é sustentada para a premissa explícita usada nesse teste, sem constituir comparação completa de descoberta com orçamento igual. O parágrafo final da seção 6 e a proposta futura da seção 7 preservam esse limite.

Este adendo não executou cálculos, chamadas ou simulações. Foram lidas as taxas exatas e sua construção no script, além das passagens especificadas do relatório. O parecer original permanece como registro da revisão das estimativas Monte Carlo. Incluindo o novo ajuste de rótulo, a contagem do parecer passa a **6 CONFIRMED, 1 PARTIAL, 2 REFUTED, 1 UNRESOLVED**. O único arquivo alterado por esta conferência foi `agents/attribution_review.md`.
