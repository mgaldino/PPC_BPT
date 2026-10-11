# Revisão independente da aplicação e do relatório

Revisor: `carbon_method_review`. Data: 11/10/2026. ID exato do modelo: **UNKNOWN**. Papel: revisão estatística, de desenho e de interpretação. O revisor não implementou nem editou o código principal, a tabela de julgamentos ou o relatório.

**Veredicto: PASS para entrega como aplicação retrospectiva condicionada nos julgamentos documentados.** Nenhum erro numérico foi encontrado. As três correções de redação/apresentação solicitadas foram incorporadas pelo coordenador e conferidas. A aplicação entrega uma mudança concreta na conclusão local e os limites de julgamento que a sustentam.

## Identidade do relatório conferido

- `report.md`, versão final relida integralmente: SHA256 `c8235fa8d470bdd96dae8b8e2fb90209da3f05cf4c54dfffd798ecb1fe95659d`.
- `data/evidence_codebook.json`, depois da correção da proveniência de C: SHA256 `66a850f8777322b0adf7f977cf8c7211ec426b7efa8745d7668ef4845856ad8c`.
- `data/judgment_ledger.csv`: SHA256 `66b09806550cd6c63144f657be65d6c1fc9536493ec8c9b0e6dd0471ba4214a9`.
- `scripts/reproduce_published.R`, leitura agora local ao pacote: SHA256 `03f606c67bb7b792219b1a301dbaaca5d0932f38676b2f23b83534ea46a6cf7f`.
- `data/published_weights.csv`: SHA256 `721af49e3a1467de9ffc2e95724ca2c07c954b326c6b24d3e24a299f6eda0d5f`.
- `results/published_posterior_chain.csv`: SHA256 `2e8f5e6d63c3709aac122419dfa8e66ac4a0243700d42e5ea17b37d7c2e34c63`.

A revisão textual não constitui inspeção visual do PDF. Essa verificação pertence à etapa de renderização do coordenador.

## Auditoria estatística independente

Executei `agents/independent_audit.R`, que calcula diretamente as identidades de Bayes e da previsão posterior. O script não carrega as funções do implementador. Ele confere os arquivos executados e mantém sua própria lista de SHA256.

Resultado: **115 verificações, 246.087 valores, erro absoluto máximo de 4,973799e−14**. Estão incluídos:

- todos os 14.400 cenários da grade determinística e sua identidade como combinações de parâmetros
- probabilidades dos três estados e normalização sob cada hipótese
- posterior inicial, posterior com HR, probabilidades preditivas antes e depois da observação e cauda do PPC
- todas as linhas da tabela focal, sensibilidade ao contraditório e fronteiras de maioria
- extremos dos priors e alternativa de mensuração inconclusiva
- todas as 64 linhas de estados do anexo, correspondentes às quatro enumerações completas de E1–E4

Resultados centrais confirmados:

| Resultado | Valor |
|---|---:|
| Posterior SA em M0 | 0,6000000000 |
| Posterior CA em M0 | 0,4000000000 |
| PPC do relato em M0 | 0,1300000000 |
| Posterior SA em M1 | 0,2608695652 |
| Posterior CA em M1 | 0,1739130435 |
| Posterior HR em M1 | 0,5652173913 |
| PPC do relato em M1 | 0,4239130435 |
| Massa preditiva posterior do estado exato observado em M1 | 0,3815217391 |
| BF de HR contra a combinação inicial SA/CA | 5,2 |
| Prior de HR na fronteira de maioria | 0,1612903226 |
| Probabilidade de desautorização sob HR na fronteira de maioria | 0,6923076923 |

O relato e a resposta corporativa entram por uma fatorização dependente. O gerador replica um registro por episódio. A estatística principal verifica o relato, enquanto a posterior condiciona no relato e na resposta. As contas correspondem a essa definição.

## Fidelidade das afirmações finais

**Confirmada:** a conta publicada de 71,53% refere-se ao conjunto de FC. O relatório a separa da inferência nova sobre Exxon2021, que começa com priors próprios. O empréstimo do valor setorial aparece apenas como sensibilidade identificada.

**Confirmada:** SA, CA e HR preservam os conteúdos causais de FC. A versão final inclui o custo econômico líquido em SA. A definição do código Q diz respeito ao relato de um participante e não transforma a fala em observação direta do motivo corporativo.

**Confirmada:** os valores 15%, 10%, 65%, os priors e as probabilidades de resposta possuem autoria e argumentos identificados. A elicitação é reconhecida como retrospectiva. A condição probabilística de q é anterior ao uso da resposta na atualização, enquanto d representa essa resposta condicionalmente ao relato.

**Confirmada:** 13% é apresentado como uma discrepância modesta e sem rejeição decisiva. O relatório não afirma que a maioria central de HR é robusta às alternativas examinadas. Mostra quais julgamentos a eliminam.

**Confirmada:** a melhora do PPC após admitir HR usa o mesmo episódio. O texto a descreve como diagnóstico retrospectivo e separa esse resultado de previsão futura.

**Confirmada:** o anexo FC enumera os 16 vetores para cada âncora e calcula a cauda por massa preditiva. A independência condicional e o completamento das histórias alternativas são explicitamente adicionais aos pesos publicados. A tabela não é apresentada como prova de má calibração de FC.

## Achados corrigidos

1. **CONFIRMED, RESOLVED:** a definição abreviada de SA omitia o custo econômico líquido, importante para separá-la de CA. O coordenador acrescentou a distinção na seção1.
2. **CONFIRMED, RESOLVED:** a expressão “relato puramente instrumental” era mais forte que o código Q. A Tabela2 agora descreve o relato que liga utilidade do apoio à inviabilidade.
3. **CONFIRMED, RESOLVED:** o percentual na primeira equação estava sem escape de LaTeX. O texto final usa `71{,}53\%`.

Não foram identificadas correções numéricas ou objeções substantivas materiais pendentes no relatório conferido. O escopo de validade é a aplicação condicional apresentada, com a incerteza dos julgamentos exposta pela sensibilidade.

## Conferência da finalização do pacote

Após a revisão inicial, o coordenador ajustou larguras e paginação das tabelas, retirou o percentual de HR do modo matemático inline e definiu explicitamente pi, rho e lambda antes da fronteira. Reli integralmente o relatório no hash final acima. As definições, os números e as interpretações estão corretos. O macro experimental de paginação foi removido da versão final.

O script `reproduce_published.R` passou a ler `data/published_weights.csv` dentro do próprio pacote. Conferi a leitura e as operações do script. O novo arquivo é byte a byte idêntico ao registro de pesos da aplicação anterior. Reconstruí independentemente as cinco etapas da cadeia, verificando 20 valores numéricos com diferença máxima de 2,486900e−14.

Dos 20 arquivos da auditoria anterior, 19 permanecem byte a byte idênticos. A única mudança foi o caminho da fonte em `reproduce_published.R`. Permanecem idênticos o modelo, o código principal, os resultados centrais e todos os resultados de sensibilidade. Por isso a grade não foi repetida. O bloco `finalization_verification` de `independent_audit_results.json` registra a conferência e os hashes atualizados.

**Veredicto final mantido: PASS.** A verificação visual do PDF continua sob responsabilidade do coordenador.
