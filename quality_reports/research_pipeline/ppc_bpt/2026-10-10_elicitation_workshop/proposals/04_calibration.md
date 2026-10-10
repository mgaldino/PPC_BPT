# Proposta independente 04 — Validar previsões sem certificar intenções

**Participante 04; 10 de outubro de 2026.** Recomendo começar com um teste de competência preditiva documental no caso petróleo. Seu resultado poderá justificar confiança graduada nas previsões do painel para tarefas comparáveis. Não validará automaticamente as probabilidades condicionais de evidência sob intenções privadas. Os exemplos do manuscrito já conhecidos ficam no desenvolvimento.

## Objeto, pessoas e controles verificáveis

A pergunta operacional é: “Dado este pacote informacional, que resposta o protocolo encontrará nesta família documental reservada?”. Cada oportunidade precisa de ator, período, documentos, pergunta, categorias exaustivas e regra de encerramento. O resultado verdadeiro para pontuação será a resposta documental adjudicada, não a hipótese causal vencedora.

Como planejamento, proponho quatro a seis especialistas humanos, um facilitador, um custodiante da reserva e dois codificadores que não vejam as previsões. Especialistas devem combinar conhecimento de política climática e documentos empresariais; suas exposições anteriores serão registradas. O custodiante prepara referência, trechos e proveniência; os codificadores aplicam regras independentemente e adjudicam divergências antes da comparação. Acordo entre eles mede consistência, não garante verdade histórica. Produtos: banco de perguntas, registro de exposição, previsões individuais congeladas, decisões de codificação e tabela de desempenho por família.

Os seguintes controles concretos servem ao **treinamento**, pois suas respostas já foram abertas nesta oficina:

| Pergunta | Resposta verificável e utilidade |
|---|---|
| O documento de princípios da API exige substituir toda regulação climática ou admite interoperabilidade? | Admite preempção de programas duplicados **ou** interoperabilidade. Testa se o leitor exagera uma condição regulatória. |
| O mesmo documento recomenda políticas complementares de inovação? | Sim. Testa a leitura de qualificadores incompatíveis com uma dicotomia excessiva. |
| O anúncio da ExxonMobil de julho de 2023 registra aquisição concluída ou acordo sujeito a condições? | Acordo sujeito a aprovações. Testa distinção entre decisão anunciada e execução. |
| O negócio descrito contém somente ativos de captura e armazenamento de carbono? | Também contém operações de petróleo e gás. Testa extrapolação de um investimento para sua motivação exclusiva. |

Essas respostas estão nos [princípios da API](https://www.api.org/~/media/files/news/2021/03/api-isf-on-carbon-pricing3_20_21) e no [anúncio da ExxonMobil](https://corporate.exxonmobil.com/news/news-releases/2023/0713_exxonmobil-announces-acquisition-of-denbury). Cada documento gera uma família; suas perguntas não são réplicas independentes.

## Treino, calibração e teste

No treino, todos recebem perguntas, respondem individualmente e depois examinam fonte e feedback. Corrigem-se categorias sobrepostas, confusão entre silêncio e negação, e interpretação de probabilidades. Saber um fato público não equivale a conseguir prever uma resposta desconhecida: em cada rodada o participante declara conhecimento prévio, reconhecimento do episódio e consultas realizadas.

A calibração exige **outras famílias**, selecionadas pelo custodiante sem participação de quem prevê. O banco deve repetir o tipo de tarefa: decisões anunciadas versus realizadas, condições regulatórias explícitas, coexistência de investimentos e ressalvas documentais. Datas e formatos informacionais devem reproduzir a dificuldade do alvo. Não basta perguntar datas históricas ou quantidades técnicas fáceis. As famílias precisam ser separadas por episódio e origem; recortes, republicações e atas derivadas permanecem juntos. Não afirmo que esse banco reservado já exista.

Na calibração, cada especialista fornece probabilidades para todas as categorias, fundamentação e exposição prévia. Todos recebem o mesmo pacote e a mesma regra de consulta. Revelam-se respostas somente após congelar a rodada. Eventuais pesos e regras de agregação são escolhidos aqui. Uma família revelada passa definitivamente a desenvolvimento.

O teste final usa famílias adicionais intocadas, com instrumento e agregação congelados. Se o inventário não permitir essas separações, executar apenas piloto e conservar pesos iguais. Para materiais públicos reconhecíveis, a declaração de desconhecimento é evidência limitada; não chamar a reserva de comprovadamente cega. Uma coleta prospectiva pode fortalecer a separação, mas requer especificar previamente oportunidades e resolução. Informação inacessível ou resposta ambígua recebe categoria prevista; não se elimina o caso depois de ver a previsão.

## Pontuação e dependência

Para categoria observada $y$, usar perda de Brier multicategórica $B=\sum_k[p_k-1(y=k)]^2$ e perda logarítmica $L=-\log p_y$; menor é melhor. São regras próprias, úteis para incentivar probabilidades honestas, mas desempenho em poucos itens não demonstra calibração geral ([Gneiting e Raftery, 2007](https://doi.org/10.1198/016214506000001437)). Brier combina aspectos de calibração e resolução: reduzi-lo não isola melhora da calibração. Uma previsão zero para resultado observado implica perda logarítmica infinita; não acrescentar suavização depois da revelação. Eventual regularização pertence à regra predefinida de previsão.

Comparar no mesmo conjunto: distribuição uniforme; frequências do desenvolvimento quando categorias e população documental forem comparáveis; média aritmética dos especialistas; previsão direta e previsão decomposta construídas com informação equivalente. O baseline empírico não pode usar frequências do teste. A comparação principal registra diferenças pareadas, não apenas o melhor score absoluto.

Apresentar primeiro cada família, depois a média de seus itens e a média entre famílias com pesos previamente fixados. Isso evita recompensar a duplicação de perguntas fáceis. A soma de perdas marginais não verifica dependência; uma avaliação conjunta requer probabilidades conjuntas ou condicionais sequenciais explicitamente eliciadas. Não multiplicar marginais por conveniência.

Com poucas famílias, mostrar a mudança de resultados ao retirar cada família e cada especialista. Essas faixas são sensibilidade, não intervalos com cobertura demonstrada. Não tratar questões ou especialistas como amostra independente, nem usar bootstrap de itens para produzir precisão aparente. Dependência entre empresas no mesmo episódio também deve permanecer visível. Se a ordenação mudar com uma família, registrar fragilidade sem decretar vencedor.

## Cooke, pesos e alcance causal

O modelo clássico merece uso cuidadoso: Cooke e Goossens discutem formatos discretos, mas todas as aplicações reportadas nesse artigo usam quantis de quantidades; a calibração compara frequências em intervalos quantílicos e pressupõe condições probabilísticas específicas. Não se transplanta esse cálculo diretamente para vetores categóricos documentais. Os próprios autores exigem relevância das sementes para o alvo e discutem problemas de questões de conhecimento geral ([Cooke e Goossens, 2008](https://rogermcooke.net/rogermcooke_files/RESS3860-TUDdatabase.pdf)).

Pesos por desempenho só entram como candidato quando houver sementes transportáveis, referência independente, diversidade real de famílias, avaliações individuais e validação externa à escolha dos pesos. Exigir comparação com pesos iguais, estabilidade às exclusões e registro da regra de regularização. Não selecionar um vencedor por p-valor convencional ou fabricar número mínimo de acertos. Se essas condições falharem, pesos iguais continuam referência transparente, sem certificado de calibração.

A objeção principal é incontornável: acertar anúncios públicos não demonstra acurácia de $p(e\mid\text{intenção privada})$. Intenções contrafactuais não têm rótulos conhecidos; documentos internos também exigem interpretação. Pode-se pontuar a previsão integrada da resposta observável, mas diferentes probabilidades condicionais podem produzir a mesma previsão integrada. Sua decomposição exige justificativas e sensibilidade próprias.

Outra objeção é que a reserva pequena desperdiça evidência. A resposta é ajustar a reivindicação: um piloto pode detectar leitura ruim e excesso de confiança sem estimar habilidade geral. Continuar quando exposição, resolução e comparação estiverem auditáveis; reparar e repetir com nova reserva quando falharem; conservar caráter exploratório quando faltar material independente. Permanecem desconhecidos o inventário elegível, sua dependência, a exposição dos especialistas e a transportabilidade das sementes. Nenhum limiar numérico substituirá essas verificações.

**Escopo documental:** lidos brief, CLAUDE.md, contrato, seções metodológicas/petróleo do Rmd, suplemento e trechos pertinentes do relatório anterior. Abertos os dois documentos empresariais acima e Cooke–Goossens; verificado o registro e resumo do artigo de escores. Acesso: 10/10/2026. Nenhum script analítico executado; nenhuma proposta de colega lida antes desta entrega.
