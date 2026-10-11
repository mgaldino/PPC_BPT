# Auditoria final de atribuição e fidelidade do relatório

Data: 11 de outubro de 2026. Revisor: `novel_attribution`. Escopo: correspondência entre as conclusões do relatório técnico, os resultados preservados e as auditorias independentes. Não houve implementação, nova simulação ou edição do relatório por este revisor.

**Veredito final: PASS.** Um achado concreto de escopo foi confirmado durante a revisão e corrigido pelo coordenador. A versão final preserva o resultado primário negativo, reconhece o ganho observado em F1, distingue calibração Monte Carlo de exatidão e mantém explícitas a redundância entre indicadores e a revelação de H nos textos. Não permanece correção material de atribuição pendente no escopo auditado.

## Artefatos e verificações

Versão final conferida de `report.md`: SHA-256 `91514aeb91f3e926dd4c693d594ec9e98bbe85dc124ab2a2252b770091032b50`. Os localizadores abaixo se referem a essa versão. Fontes centrais:

| Artefato | SHA-256 |
|---|---|
| `results/rejection_rates.csv` | `cdfe8a44749fb46ca16bf32adcd7c88420c13e75f265b984c04271adaa10a0b1` |
| `results/paired_differences.csv` | `912c7db34d7271b70fbc2c9e141bcaa5582b2139de1bf3d6019f7189ed60ab5b` |
| `agents/analysis_review.md` | `dc02179fd63c96829686b9886465e262630e87d85e8b01a49dd6f2dd35ecf355` |

Também foram consultados `protocol.md`, `protocol_addendum.md`, `agents/blind_semantics.md`, `verification/summary.json`, os congelamentos, os metadados das 13 chamadas e os arquivos dos exemplos. A contagem das chamadas, seus tokens e seus eventos de ferramentas foi recalculada diretamente de `raw/*/status.json` por uma leitura local, sem novas chamadas. A revisão matemática independente foi lida como evidência documentada, sem atribuir a este revisor a reprodução que outro agente executou.

Não refiz os 360.000 p-valores, não avaliei o PDF renderizado e não consultei novamente as fontes históricas externas. A conclusão de fidelidade histórica aqui se limita a verificar que o relatório separa parâmetros estipulados, textos sintéticos e fontes motivadoras, sem reivindicar validação histórica inexistente.

## Achado confirmado e resolvido

### FAT-01 — Negação de ganho mais ampla que os resultados

**Classificação: CONFIRMED. Situação final: RESOLVED.** Dimensão: escopo da conclusão. Severidade: pequena, mas substantiva. Correção: `safe`.

Na versão inicial lida, a abertura dizia que a IA “não melhorou o PPC em relação a templates composicionais comparáveis”, sem delimitar a falha. Entretanto, em F1, N=96, TIA rejeita 94,06% e TpathXOR 92,40%. `results/paired_differences.csv`, linha identificada por `N=96, condition=F1, first=TIA, second=TpathXOR`, registra diferença de 0,0166 e intervalo de 95% [0,0130151, 0,0201849]. Logo, ausência de qualquer ganho em qualquer condição não era sustentada.

A versão final, `report.md:25`, restringe a alegação a “não melhorou o diagnóstico da falha principal”. `report.md:158` registra explicitamente o ganho de 1,66 ponto percentual em F1, com intervalo de 1,30 a 2,02 pontos, e explica que F1 já viola um par verificado pelos checks diretos. `report.md:251` passou a dizer “desempenho semelhante em F2”. A correção foi conferida no arquivo final. Ela preserva tanto o resultado negativo principal quanto o resultado positivo limitado, sem converter F1 em detecção de uma falha invisível aos checks locais.

## Alegações de problema confrontadas e refutadas

### FAT-02 — O relatório confundiria calibração Monte Carlo com probabilidades exatas ou tamanho exatamente igual

**Classificação: REFUTED.** `report.md:140–142` descreve duas referências nulas distintas de 50.000 conjuntos por N. `report.md:219` explicita a cauda com correção +1 e o piso de 1/50001. `report.md:156` apresenta o falso alarme Tfull de 5,58% e seu intervalo de Wilson, e afirma que não se estabelece igualdade exata de tamanho. `report.md:176` condiciona os intervalos ao corpus, à seleção e às referências realizadas.

Os valores conferem com as tabelas: Tfull em N=96 rejeita 279/5.000 no nulo, com intervalo [0,0497720, 0,0625100]. A compatibilidade desse intervalo com 5% não é apresentada como prova de calibração perfeita. O relatório também não confunde o piso Monte Carlo com probabilidade exata zero.

### FAT-03 — Os números contradiriam a conclusão principal negativa ou a comparação com paridades

**Classificação: REFUTED.** Em F2, N=96, a tabela registra TIA=204/5.000=4,08%, T0=225/5.000=4,50% e Tfull=4.408/5.000=88,16%. O contraste pareado TIA−T0 é −0,0042, com intervalo [−0,0072090, −0,0011910]. Não há ganho principal da seleção IA contra F2.

Em N=384, F2, TIA=4.287/5.000=85,74% e TpathXOR=4.295/5.000=85,90%. A diferença de −0,0016 e seu intervalo [−0,00388549, 0,000685489] sustentam a descrição de desempenho próximo. `report.md:174–176` apresenta a diferença em pontos percentuais e rejeita expressamente uma conclusão de equivalência universal. O resultado amostral Tfull=5.000/5.000 também recebe a ressalva de que não significa poder universal igual a 100%.

### FAT-04 — Novidade seria confundida com três indicadores informacionalmente independentes

**Classificação: REFUTED.** A tabela da seção 4 identifica `V+W` como agregação de categorias do par direto `(V,W)` e `A XOR P` como função de `V+W`. A identidade é `A XOR P=(V+W) mod 2`. O relatório declara que não são três dimensões independentes de informação.

A conclusão positiva fica centrada em `S XOR P`, cuja probabilidade é derivada das três etapas e não foi enumerada no prompt. O adendo de TpathXOR é identificado como posterior à leitura das candidatas e anterior à avaliação. Não se atribui exclusividade lógica à IA nem se apresenta o novo comparador como parte do protocolo primário original. Essa descrição corresponde ao protocolo, ao adendo e à auditoria semântica.

### FAT-05 — O exemplo 123 seria usado como evidência de descoberta bem-sucedida da nova falha

**Classificação: REFUTED.** `report.md:235` informa o critério seletivo do exemplo e os 19 casos em 5.000 nos quais TIA rejeita e T0 não. Explicita que o mínimo é conduzido por `A XOR P`, p≈0,00314, enquanto `S XOR P` tem p≈0,57763. O primeiro indicador tem distribuição preservada sob F2. A frase em destaque nega que o exemplo demonstre descoberta da falha de terceira ordem.

As taxas gerais permanecem expostas. O arquivo de diferenças pareadas registra também 40 casos no sentido contrário, T0 rejeitando e TIA não, coerentes com o resultado principal desfavorável. A escolha do exemplo é tratada como ilustração condicionada, sem substituir a avaliação integral.

### FAT-06 — Fidelidade dos códigos seria usada para ocultar falha de cegamento dos documentos

**Classificação: REFUTED.** `report.md:241–243` separa recuperação dos campos observáveis de fidelidade semântica plena. Informa que todos os 24 conjuntos da IA revelam SA/CA e que narram reversões internas. Não certifica cegamento textual nem afirma correção silenciosa desses documentos.

A auditoria semântica independente registra os 24 IDs que revelam H, entre 48 conjuntos IA/templates, e extrai os 192 campos por enunciados explícitos. A verificação documentada confronta esses códigos com a verdade R. O uso estatístico é limitado às funções de S,A,M,P, que não consultam H verdadeiro. Assim, o vazamento é uma falha material do gerador documental, preservada no relato, sem ser transformado em informação admissível para o PPC.

### FAT-07 — Contagens de chamadas, agentes ou auditoria numérica estariam infladas

**Classificação: REFUTED no escopo verificado.** A leitura direta dos 13 arquivos `raw/*/status.json` confirmou seis chamadas de descoberta, uma de seleção e seis de codificação, todas com saída zero, alias solicitado `gpt-5.6-sol`, autorrelato `UNKNOWN`, 243.105 tokens de entrada, 13.993 de saída e zero eventos de ferramentas dos modelos. Essas são as contagens de `report.md:247` e `verification/summary.json`.

As contas de conjuntos também fecham: três tamanhos × quatro condições × 5.000=60.000 avaliações, e três tamanhos × duas referências × 50.000=300.000 referências. Os 360.000 p-valores globais auditados correspondem a 60.000 avaliações × seis famílias de testes. `agents/analysis_review.md` documenta separadamente as 61.200 conferências de desvios e a reconstituição dos 360.000 p-valores e decisões.

A identidade dos cinco subagentes foi confirmada pelo coordenador nesta revisão: `llm_ppc_redteam`, `llm_ppc_architecture`, `redo_identification`, `novel_attribution` e `controlled_blind_semantics`. Os papéis de identificação e revisão matemática pertencem ao mesmo agente, portanto a enumeração de seis funções em `report.md:245` não implica seis pessoas ou seis fontes independentes. As 13 chamadas experimentais não foram somadas a esses cinco subagentes. A redação final “Esses pareceres não são fontes empíricas independentes” substitui a referência anterior a “pessoas algorítmicas”. Não foi feita auditoria de faturamento da conta, apenas da rota de execução preservada pelo pacote.

### FAT-08 — O teste conjunto seria apresentado como universalmente superior ou o experimento como validação histórica

**Classificação: REFUTED.** O relatório distingue Tpath, TpathXOR e o teste das 16 células. Mostra a vantagem de Tfull em F2 e também a taxa inferior de Tfull em F1, sem declarar um limite teórico universal de poder. A discussão sobre H comum aponta uma limitação do agregado dos checks neste desenho. Não generaliza que qualquer resumo conjunto domina todo check direcionado.

`report.md:27`, a tabela de origem dos parâmetros e `report.md:257–265` reiteram que os números são sintéticos, que os parâmetros não foram estimados de fontes históricas e que o estudo não mede ganho de produtividade. Também reconhecem que os projetistas conheciam a falha e que 384 episódios simulados não equivalem a 384 fontes históricas independentes. Fairfield e Charman permanecem como fundamento da operacionalização, sem alegação de ausência de estrutura interna no BPT.

## Encaminhamento final

Contagem: **1 CONFIRMED, corrigido e verificado; 7 REFUTED; nenhuma pendência material UNRESOLVED neste escopo.** O veredito PASS vale para a correspondência das conclusões com os resultados e para a transparência dos limites descritos. Não certifica cegamento dos textos, validação histórica, generalização para outros mecanismos ou igualdade universal de desempenho.

O relatório pode ser entregue com a conclusão negativa delimitada à falha principal e o ganho em F1 preservado. Qualquer regeneração posterior deve manter essas duas correções de escopo e a distinção entre evidência operacional, estatística e histórica. Este parecer é um novo arquivo e deve entrar no manifesto final do pacote. O único arquivo escrito por esta auditoria foi `agents/final_attribution_review.md`.
