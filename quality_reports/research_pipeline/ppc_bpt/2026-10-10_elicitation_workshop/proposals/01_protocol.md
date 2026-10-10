# Proposta 01 — Elicitação humana de probabilidades condicionais

**Decisão:** realizar um piloto inspirado em IDEA, com preparação e treinamento de SHELF, duas rodadas privadas e agregação matemática previamente definida. A equipe de agentes desenha o procedimento; não fornece observações de especialistas humanos. Recomendo começar com uma pergunta documental e poucos cenários completos, sem preencher probabilidades até existir painel humano e corpus elegível.

## Objeto e instrumento

O alvo provisório é uma oportunidade documental sobre apoio de uma petrolífera à precificação de carbono. Para ExxonMobil, proponho o período 2015–2020, sujeito à disponibilidade documental. A pergunta é: **“No bloco identificado no manifesto, como os registros caracterizam a relação entre apoiar a precificação e manter outras regulações climáticas?”** O manifesto deverá enumerar documentos, versão, páginas, regra de inclusão, unidade de análise e encerramento da busca. Não afirmo que esse bloco já exista ou esteja reservado.

Categorias propostas: R, apoio explicitamente condicionado à substituição de regulações; C, apoio explicitamente compatível com manutenção de outras regulações; B, ambas as posições aparecem segundo regras previamente fixadas; U, nenhuma relação explícita é recuperada. U significa ausência de registro pertinente no bloco, não ausência histórica. Fonte inacessível recebe status administrativo separado: não pode ser codificada como U. A codificação exige citações e contexto; um comunicado associativo não representa automaticamente a posição de cada empresa.

Cada ficha fixa um cenário substantivo. Por exemplo: S₁, dirigentes buscam sobretudo limitar custos regulatórios e veem a precificação como alternativa menos onerosa; S₂, dirigentes esperam vantagem em gás/CCS e desejam aprovação de uma política lucrativa; S₃, ambas as motivações coexistem. São propostas de especificação, não configurações já reconciliadas com a notação do manuscrito. É necessário completar condições omitidas e tratar alternativas relevantes antes de atribuir pesos. Nenhum cenário estipula a resposta documental R/C/B/U, pois isso tornaria a previsão tautológica.

Texto da tarefa: “Para esta ficha, aceite S₁ como verdadeiro. Considere o pacote D e o procedimento de observação especificado. Distribua sua crença entre os quatro resultados possíveis da codificação do bloco. Não avalie aqui se S₁ é historicamente plausível.” O objeto é

\[
p_{es}(k)=P_e(Y_B=k\mid S=s,D,\mathcal O).
\]

O peso de cada cenário, P(S=s|D), será obtido separadamente. O especialista deverá explicar, com suas próprias palavras, por que uma evidência pode ser provável sob um cenário em que ele pessoalmente pouco acredita. O facilitador interrompe a ficha se essa distinção não estiver compreendida.

## Pessoas, informação e sequência operacional

**1. Recrutamento.** Sugestão de planejamento: seis humanos, com experiência complementar em política climática empresarial, economia de gás/CCS e investigação documental. O coordenador registra publicações, trabalho empírico, vínculos relevantes, experiência com cada empresa e exposição aos materiais. Reputação não recebe peso numérico automático. Acrescentar um facilitador de elicitação e um responsável pelo registro; dois codificadores do material reservado ficam fora da atribuição das probabilidades. O autor pode esclarecer o modelo, sem conduzir a discussão das respostas.

**2. Preparação comum.** Entregar D com fatos, cronologia, definições de políticas, fontes e divergências documentadas, mas sem as probabilidades atuais do paper, seus posteriores ou conclusões desejadas. Solicitar antes da rodada contribuições bibliográficas, disponibilizadas igualmente a todos e registradas em nova versão. Após o congelamento, toda exposição adicional é anotada. McCoy, API e outros itens já discutidos no projeto são desenvolvimento: ocultar sua identificação não recupera cegamento. Especialistas que conheçam o alvo não geram previsões reservadas dele.

**3. Formação e ensaio.** Reservar duas horas de preparação e uma hora síncrona como orçamento inicial, não requisito empiricamente estabelecido para este caso. A documentação oficial de [treinamento SHELF](https://shelf.sites.sheffield.ac.uk/e-learning-course) prevê familiarização prévia com julgamentos probabilísticos. Nosso ensaio usará uma pergunta documental externa ao caso: identificar categorias, distribuir massa que some um e distinguir julgamento condicional de plausibilidade do cenário. A devolutiva explica erros de compreensão; um ensaio isolado não seleciona “bons previsores”.

**4. Primeira rodada privada.** Para cada cenário, a pessoa enumera primeiro razões pelas quais R e C poderiam ocorrer, identifica lacunas sobre seleção e registro e oferece dois vetores alternativos completos que considere defensáveis. Depois registra seu vetor central. Cada vetor deve somar um; valores zero ou um exigem justificativa lógica. A interface devolve frases simples sobre categorias e uniões de categorias para confirmar a interpretação. A pessoa pode responder “informação insuficiente”; o analista não substitui isso por números.

**5. Discussão.** Apresentar vetores anonimizados e justificativas, sem um número agregado em destaque. Reservar aproximadamente noventa minutos para comparar os argumentos mais divergentes. O facilitador pergunta se a diferença provém do cenário, da publicidade das fontes, da relação entre associação e empresa ou de expectativas sobre registro. Toda alteração de definição é versionada e obriga nova resposta de todos à ficha afetada. A discussão termina com uma lista de desacordos; não com obrigação de convergir.

**6. Segunda rodada privada.** Cada humano confirma ou revisa os vetores e explica mudanças, informação nova e dissensos preservados. A sequência privada–discussão–privada e a finalidade de esclarecer argumentos, sem exigir consenso, seguem [Hemming et al., guia IDEA, §2](https://doi.org/10.1111/2041-210X.12857). O registro final contém pessoa, ficha, cenário, versão de D, três vetores, justificativas, fontes, exposição e duração.

## Probabilidade, imprecisão e agregação

A resposta histórica fixa já existe; o vetor expressa incerteza do especialista sobre sua codificação. “Distribuir cem pontos” é apenas representação da crença, não frequência de cem empresas ou histórias intercambiáveis. Não inventamos uma população para tornar a pergunta mais intuitiva.

Os vetores alternativos representam sensibilidade do julgamento a razões explicitadas. Não são quantis de uma distribuição latente da “verdadeira probabilidade”. IDEA distingue seu formato para eventos singulares justamente para evitar exigir confiança em outra confiança (§3.4 do guia). Portanto, não ajustaremos Beta/Dirichlet a extremos marginais, nem chamaremos dispersão entre pessoas de erro padrão. Uma distribuição de segunda ordem exigiria definir o parâmetro e elicitar conjuntamente sua incerteza em outra etapa.

Pré-especificar média aritmética dos vetores centrais da rodada dois entre humanos elegíveis para a ficha; conservar cada vetor e todos os alternativos para sensibilidade. A média é uma regra de combinação de julgamentos, não estimação por seis testemunhos independentes. Se poucos humanos puderem responder, reportar a limitação, sem preencher lugares com agentes. Sem perguntas de desempenho comparáveis e resultados verificáveis, não usar pesos de reputação ou autoconfiança.

SHELF propõe distribuição coletiva sob a perspectiva de um observador racional imparcial, após discussão ([Oakley, 2021, slides 3–5](https://www.ispor.org/docs/default-source/euro2021/europe21oakley.pdf?sfvrsn=c258f04f_0)). Prefiro o pool como principal porque este caso envolve pressupostos contestáveis sobre comunicação e intenções. Um julgamento coletivo adicional pode ser registrado como sensibilidade, com justificativa própria; não substitui dissensos nem certifica verdade.

## Objeções, produtos e lacunas

**Objeção 1:** especialistas podem reconhecer os documentos e reproduzir o resultado. Resposta: auditoria de exposição por alvo, separação efetiva da reserva e rotulagem retrospectiva quando necessária. **Objeção 2:** todos podem compartilhar uma leitura equivocada da empresa. Resposta: diversidade substantiva, fontes divergentes e posterior avaliação em alvos realmente desconhecidos; concordância não valida calibração.

Produtos: manifesto, fichas, pacote D, histórico de exposições, respostas brutas, registro da discussão, pool e análises de sensibilidade. As verificações imediatas cobrem compreensão, coerência e rastreabilidade. Desempenho empírico requer revelar alvos e comparar previsões com codificação auditável; poucos resultados não demonstram calibração geral. Faltam corpus enumerado, critérios finais das categorias, cenários completos, humanos recrutados e alvos desconhecidos.

**Escopo verificado em 10/10/2026:** li CLAUDE.md, contrato, relatório anterior, workflow e aplicação petróleo do manuscrito e suplemento. Abri o guia IDEA, a página oficial de formação e os dez slides de Oakley. Não abri novas fontes empíricas de petróleo nem consultei propostas dos pares. Esta é uma adaptação proposta; nenhuma elicitação humana foi executada.
