# Parecer C — consolidação final

Concordo com os seis itens do coordenador, com os limites abaixo. Arquitetura proposta, ainda sem simulações ou validação empírica.

1. **Previsão reservada: concordo.** Objeto mínimo: resposta desconhecida a perguntas documentais prévias. Para corpus fixo e codificação determinística, não ressorteamos existência, preservação ou conteúdo. Probabilidades representam conhecimento incompleto sobre respostas existentes. Denominar checagem preditiva de bloco reservado; PPC que reutiliza o mesmo bloco é operação distinta.
2. **Enumeração e sorteio: concordo.** Avaliam a mesma distribuição categórica. Enumeração é preferível em espaço pequeno; Monte Carlo é aproximação computacional. Não é necessário gerar prosa.
3. **Processo observacional: concordo.** Registro/detecção/codificação entram quando se pretende interpretar silêncio como ausência ou localizar falha causal. Exigir âncoras ou restrições independentes. Sem elas, faixas e possível inconclusão. Parâmetros não podem ser liberados após cada surpresa até fazer todo modelo passar. Limites de detecção ou garantias institucionais podem bastar; não exigir gerador detalhado de todas as etapas.
4. **Absolutas e conjunta: concordo.** LR determina apoio relativo, não massa de todos os resultados. Exigir distribuição conjunta normalizada para padrões conjuntos, ou declarar que o diagnóstico trata somente marginais/resumos específicos. Não multiplicar marginais sem pressupostos.
5. **Discrepância e diagnóstico: concordo.** Predefinir família de discrepâncias e regra de inspeção; falha aponta para bloco ou conjunto de causas. Uma observação pode desafiar uma previsão, sem demonstrar calibração geral. Revisão transforma o bloco revelado em desenvolvimento, exigindo nova reserva.
6. **Benchmark e aplicações: concordo.** Mesma conjunta e dados produzem mesma previsão em FC, CausalQueries e decomposição. Comparar obtenção das probabilidades, restrições e custos. Chile: piloto público. Petróleo: principal somente após demonstrar inventário e reserva independente.

## Quatro DGPs mínimos

Sistema sintético pequeno com duas variáveis históricas latentes, fontes agrupadas e categorias {+,−,0,M}. Congelar protocolo, discrepâncias e decisão antes das réplicas.

- **DGP 1, correto:** processo substantivo, detecção e dependência correspondem ao modelo. Variar famílias independentes, informando total de documentos. Estimar falsos alarmes/cobertura; equivalência entre representações deve aparecer por construção.
- **DGP 2, mecanismo errado:** dados incluem componente omitido, com observação correta. Introduzir traço que diferencia configurações e situação na qual as distribuições observáveis sejam iguais. Medir detecção e erro de localização; nenhum método distingue a segunda situação com o mesmo alvo.
- **DGP 3, detecção errada:** mecanismo correto, registro seletivo ou detecção entre estados viola a análise ingênua. Comparar diagnóstico sem observação, com parâmetros ancorados e com conjunto de sensibilidade. Medir acusações falsas ao mecanismo e perda de poder dos envelopes.
- **DGP 4, dependência errada:** textos copiam evento/informante; análise ingênua os trata como independentes. Comparar divisão por documento e por famílias, com mesmo orçamento. Medir excesso de confiança, falsos alarmes e melhora aparente por vazamento.

Não executar grade extensa inicialmente. Subjetividade correlacionada e deriva temporal são extensões posteriores. Comparar representações equivalentes como controle; ganhos só podem vir de informação, restrições ou procedimento. Experimento separado de elicitação com dados e tempo iguais é necessário para afirmar superioridade do workflow para pesquisadores reais.

## Limites

Máxima separação entre rivais orienta discriminação, não toda adequação: incluir alvos improváveis sob todos os modelos. Distância mínima zero indica ausência de distinção uniforme entre classes admissíveis; não inutilidade em todos os estados.

A novidade permanece pendente. Nenhuma operação matemática isolada é nova. Demonstrar que o protocolo resolve uma dificuldade de BPT de modo substantivo, acessível e verificável, comparando capacidades existentes sem atribuir ausência de estrutura a FC ou ausência de previsão a CausalQueries.

**BCN:** consulta C, 10/10/2026, abriu [História da Lei 20.028](https://www.bcn.cl/obtienearchivo?id=recursoslegales/10221.3/37346/2/HL20028.pdf), 71 páginas. Retorno expôs pp. 1–14 (14 parcial); pp. 2–3 documentam seleção editorial e índice. Páginas expostas são desenvolvimento contaminado para C. Metadados em C_round1.md. Nenhuma nova pesquisa nesta rodada.
