# Proposta 06 — uma dupla documental, conjunta explícita e modelos completos

Recomendo começar com **um bloco documental, duas perguntas e quinze fichas probabilísticas**, mantendo dependência dentro do bloco e incerteza entre especificações. A unidade é a família de documentos de um mesmo ator e episódio, com manifesto fechado. Notícias que reproduzem um comunicado pertencem à mesma genealogia; não oferecem oportunidades independentes. Esta proposta operacionaliza os cenários de FC e preserva a distinção do contrato entre configuração, hipótese narrativa e modelo probabilístico.

## Alvo observável e insumos

As perguntas são: **Q1:** “O bloco contém defesa explícita de carbon pricing vinculada a substituir regulações ou evitar duplicação regulatória?” **Q2:** “O bloco contém apoio explícito a alguma política climática complementar especificada no protocolo, como regulação direta de metano?” Registrar qual política e seu âmbito. A coexistência não implica contradição: evitar duplicação em determinado instrumento pode coexistir com regular outra externalidade ou outra fonte de emissões.

Cada resposta assume `1`, `0` ou `U`. `1` significa passagem qualificadora encontrada; `0`, busca concluída em todos os documentos previstos sem passagem qualificadora; `U`, procedimento incapaz de determinar a resposta, por indisponibilidade, ilegibilidade ou ambiguidade não resolvida. `0` não significa ausência histórica de preferência ou ação. Se aparecem afirmação e negação, a pergunta sobre **presença de afirmação** recebe `1`, acompanhada obrigatoriamente do registro da contradição; não passa a representar posição institucional unívoca. Se o objetivo mudar para essa posição, será necessário outro espaço de categorias.

Insumos: manifesto, genealogia das fontes, regras com exemplos de desenvolvimento, informação já conhecida `D_A` e descrições causais comuns. O comunicado da API de 25/03/2021 contém tanto prevenção de duplicação quanto regulação direta de metano; serve de treinamento, nunca de reserva. Abri integralmente sua página HTML. Uma busca também expôs títulos e trechos de outros comunicados e relatórios API; esses resultados devem constar do registro de exposição, sem alegar cegamento posterior. Não examinei novos arquivos internos nem identifiquei um bloco reservado elegível. Fonte primária: [API, lançamento do Climate Action Framework](https://www.api.org/news-policy-and-issues/news/2021/03/24/climate-action-framework), consultada em 10/10/2026.

## Como preencher a conjunta

Para respostas determináveis, solicitar três julgamentos: `p1=P(Q1=1)`, `p2=P(Q2=1)` e `r=P(11)`, todos sob o mesmo cenário e informação. A ficha converte-os em:

\[
(P_{11},P_{10},P_{01},P_{00})=(r,p_1-r,p_2-r,1-p_1-p_2+r),
\]

com `max(0,p1+p2−1) ≤ r ≤ min(p1,p2)`. Esses limites de Fréchet são restrições de coerência, não evidência para escolher `r`. Perguntar: “O que torna encontrar ambas mais ou menos provável que encontrar apenas uma? Que processo documental pode produzir isso?” A igualdade `r=p1p2` exige justificativa própria.

O núcleo efetivo usa uma tabela **3×3**, com nove células para `(Q1,Q2)∈{0,1,U}²`, somando um. São oito probabilidades livres por cenário. As três perguntas anteriores funcionam como apoio cognitivo para a parte determinável, condicionada a ambas serem determináveis; não podem ser inseridas como marginais incondicionais numa tabela que reserva massa a `U`. O facilitador mostra as marginais implicadas e confirma que representam o julgamento. Não assumir independência entre missingness e conteúdo, nem redistribuir silenciosamente a massa de `U` pelas quatro respostas binárias.

Se não houver base para preencher essa tabela, conservar os limites conjuntos disponíveis e aceitar uma previsão pouco informativa. Uma tabela normalizada não torna os números defensáveis: cada escolha exige justificativa, fonte comparável ou declaração explícita de ignorância.

## Orçamento humano e cenários

Proponho seis pessoas: três elicitadores substantivos, dois responsáveis por documentação/codificação e um facilitador quantitativo. Duas sessões de duas horas são orçamento de planejamento, a testar. Na primeira, resolver o instrumento e preencher individualmente; na segunda, conferir implicações, divergências e intervalos sem revelar a reserva.

Para tornar o orçamento verificável, adoto quatro cenários sobre **dois fatores causais relevantes**: acomodação defensiva ativa/inativa e busca de vantagem competitiva ativa/inativa. Incluem ambos e nenhum. São configurações completas apenas nesse espaço reduzido; os demais componentes são integrados na distribuição observacional, não reapresentados como sorteios dos mesmos dois estados. São hipóteses de trabalho, não rótulos verdadeiros deduzidos das falas empresariais.

Cada elicitador preenche quatro fichas 3×3, uma por cenário, e uma ficha com os quatro pesos condicionais a `D_A`: **cinco fichas por pessoa, quinze no total**. Isso representa 35 probabilidades livres por elicitador, carga ainda apreciável. Intervalos e justificativas ficam nas próprias fichas; não exigir três vetores completos para cada pergunta. Os pesos elicitados são julgamentos condicionais, não posteriores numericamente reconstruídos da análise publicada. Se o projeto quiser chamá-los de posterior BPT calculado, terá de fornecer priors e likelihoods compatíveis; o 0,71 anterior não resolve essa etapa.

## Composição, incerteza e gerador

Um modelo completo do especialista `e` contém pesos `w_ec` e tabelas `v_ec(y)`. A previsão é:

\[
q_e(y)=\sum_{c=1}^{4}w_{ec}v_{ec}(y),\qquad
q_\alpha(y)=\sum_e\alpha_e q_e(y).
\]

O gerador sorteia **uma vez** o especialista/modelo, depois uma configuração, depois o par inteiro da tabela. Não sorteia configuração diferente para Q1 e Q2. Agrupar fontes não autoriza independência entre blocos: um segundo bloco relacionado exige conjunta entre blocos, fatoração defendida ou apenas checagens separadas, sem calcular caudas agregadas.

Usar pesos iguais entre especialistas como convenção inicial explícita e mostrar também cada previsão individual. São três julgamentos possivelmente correlacionados; concordância não triplica informação. Fazer média separadamente de `w` e `v`, multiplicando depois, cria combinações cruzadas que nenhum especialista sustentou. Pode ser outra especificação coerente matematicamente, mas não é a mistura dos modelos originais e exige nova defesa.

Para pesos e células incertos, definir antes da reserva um conjunto `Γ` de modelos completos que satisfaz normalização, limites elicitados e relações justificadas. Reportar `inf_{γ∈Γ}qγ(B)` e `sup_{γ∈Γ}qγ(B)` para eventos previamente definidos. Esses extremos não constituem juntos uma nova distribuição. São faixas de sensibilidade; não intervalos de credibilidade sem distribuição sobre `Γ`. Não ajustar `Γ`, pesos dos especialistas ou restrições para acomodar o resultado reservado.

## Objeções, entrega e limites

**“Trinta e cinco julgamentos continuam excessivos.”** Concordo: quinze fichas são teto do piloto, não autorização para replicá-las por doze blocos. Se a primeira sessão mostrar inviabilidade, iniciar com uma previsão conjunta direta por elicitador, sem prometer diagnóstico por mecanismo. A decomposição vira extensão comparada pelo custo informacional.

**“A previsão pode falhar por codificação ou acesso.”** Correto. Os codificadores produzem passagens e razões de `U`; o diagnóstico confronta esses processos antes de atribuir falha causal. Não se identifica um elo errado apenas pela surpresa conjunta.

Entregar quinze fichas versionadas, três modelos individuais, mistura declarada, conjunto de sensibilidade e registro de exposição. Continuam faltando bloco realmente reservado, participantes, âncoras transportáveis e descrições operacionais dos quatro cenários. Nenhum número probabilístico foi inventado, nenhum script executado e nenhuma calibração empírica foi demonstrada.
