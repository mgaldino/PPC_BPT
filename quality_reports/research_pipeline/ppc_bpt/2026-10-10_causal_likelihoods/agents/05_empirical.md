# Agente 05: tentativa empírica de obter likelihoods condicionais aos mecanismos

10 de outubro de 2026. Missão delimitada: contrariar a conclusão de não identificação procurando uma passagem empírica de fontes a probabilidades SA/CA. Li os relatórios 01–03, o arquivo BP2017 local e duas fontes primárias adicionais. Nenhuma alteração do manuscrito. Conversei diretamente com 04 sobre a ponte estrutural e reportei o resultado à coordenação.

## Resultado

Há uma rota empírica concreta que não exige classificar firmas como SA ou CA pela própria evidência a prever: estimar modelos rivais de decisão em episódios anteriores, usando incentivos medidos antes da decisão, e depois prever evidência de um episódio reservado. A fonte fornece variáveis, a teoria impõe restrições distintas aos modelos, e os dados de treinamento estimam a passagem das variáveis para probabilidades. Isso preserva o significado causal de SA e CA somente se as restrições representarem efetivamente as hipóteses e seus determinantes concorrentes forem tratados.

**A rodada não encontrou um denominador legítimo de episódios SA/CA certificados, nem dados suficientes para estimar essa ponte hoje.** Seria incorreto transformar dois documentos BP em duas realizações de SA ou chamar suas frases de duas observações independentes. A proposta abaixo identifica exatamente a coleta necessária; não afirma ter executado um PPC causal numérico.

## 1. O que a pesquisa realmente acrescentou

O documento BP sobre Washington relata oposição à I-1631 e promoção de outro instrumento de cap-and-trade. Identifiquei uma fonte pública independente para estudar o desenho desta família de instrumentos: o relatório legislativo do **SB 5981**, de 25 de março de 2019. O texto descreve um programa de cap-and-trade e cláusulas de preempção de regulações estaduais e locais de GHG. Isso permite construir uma covariável de desenho regulatório a partir do texto do instrumento, separada da manifestação empresarial.

- [Relatório oficial SB 5981, 25/03/2019](https://lawfilesext.leg.wa.gov/biennium/2019-20/Htm/Bill%20Reports/Senate/5981%20SBA%20ENET%2019.htm), consultado nesta rodada.
- [Documento BP BPA_HCOR_00278794](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00278794.pdf), pp. 1–2, consultado integralmente nesta rodada.

**Não foi estabelecido que o instrumento não nomeado no documento BP seja especificamente SB 5981.** Para juntar as duas fontes como uma única linha de dados é necessário obter identificação inequívoca do projeto em registro contemporâneo BP, depoimento ou arquivo de lobbying. Fazer a junção agora seria inventar um vínculo. Também não se pode equiparar preempção jurídica a benefício econômico conhecido: quais regras seriam substituídas, sua probabilidade de adoção e sua incidência sobre BP continuam necessários.

A Public Disclosure Commission possui registro público de campanhas e seu relatório confirma a existência da campanha contra I-1631. Esta fonte pode verificar a ação independentemente do memorando motivacional, mas a consulta delimitada não recuperou um registro primário BP que reconcilie exatamente os US$ 13 milhões informados no memorando. Logo, não uso a fonte para certificar uma soma BP própria nem uma classificação de mecanismo.

- [PDC, relatórios anuais](https://www.pdc.wa.gov/about-pdc/strategic-plan-projects/annual-reports), consultado nesta rodada.

## 2. Livro de dados que pode ser preenchido honestamente agora

| Episódio candidato | Fonte para incentivos | Resultado observável separado | É uma observação certificada SA/CA? |
|---|---|---|---|
| BP, discussão federal de imposto, janeiro de 2017 | Email informa que evitar regra futura de refinarias seria benefício, diminuído com Trump | A rodada não identificou uma decisão posterior precisamente vinculada à proposta discutida | Não: há raciocínio compatível com SA, mas faltam motivo dominante, payoff completo e Y separado |
| BP, I-1631, 2018 | Documento posterior informa custo próprio previsto e oposição | Campanha existe em registro público; contribuição BP precisa ser reconciliada em registro específico | Não: custo próprio negativo não revela vantagem relativa versus concorrentes nem alternativa regulatória |
| BP, cap-and-trade de Washington, 2019 | Mesmo documento informa promoção de projeto não nomeado | SB 5981 é um instrumento público da família, mas junção específica não comprovada | Não: nem identidade da proposta está fechada |

A única contagem legítima desta tabela é **três episódios candidatos para investigação**, dos quais **zero satisfazem atualmente o protocolo completo de calibração SA/CA**. Isso não é `n_SA=0, n_CA=0` numa amostra populacional: é o resultado de uma auditoria de elegibilidade em fontes selecionadas. Não estimar probabilidade com esses números.

## 3. Desenho mínimo fechado para coleta: episódios, fontes e ocultamento

### Unidade e denominador

Unidade: **firma × instrumento legal identificado × versão do instrumento × ocasião decisória**. Um email repetido na cadeia, uma notícia que reproduz o email e um depoimento que cita a notícia não são episódios adicionais. Revisões de um mesmo projeto precisam ter mudanças materiais pré-especificadas para serem ocasiões distintas; ainda assim permanecem no mesmo bloco de dependência.

Um piloto executável seria enumerar, nos arquivos oficiais de Washington, todos os instrumentos estaduais de precificação de carbono submetidos a votação ou audiência legislativa entre 2015 e 2021, incluindo iniciativas e projetos identificados. A janela e o critério são escolhas de desenho; ainda não há inventário completo. Escolher BP por disponibilidade documental é seleção da firma e limita transporte. Para cada ocasião, a firma está no denominador se o instrumento atinge atividade identificada e existe oportunidade institucional de posicionamento. Não condicionar inclusão à existência de fala reveladora ou de apoio/oposição público.

**Ausência de resposta observada não vira oposição.** Registrar separadamente `apoio`, `oposição`, `posição condicional/mista`, `nenhuma posição recuperada` e `cobertura insuficiente`. O último código impede tratar arquivo incompleto como silêncio verdadeiro. Um projeto não abordado em documento interno continua no inventário; a sua falta de covariáveis é uma lacuna, não justificativa para apagá-lo.

### Separação das fontes

- Equipe de incentivos vê apenas texto da política, exposições da firma e concorrentes, projeções internas anteriores à decisão e alternativas regulatórias. Não vê a posição posterior que será prevista.
- Equipe de resposta vê o instrumento identificado e o registro institucional de manifestação/contribuição/ação, sem as codificações de mecanismo.
- A coordenação une as duas tabelas por identificadores após congelar regras e decisões de codificação.
- Escolher holdout por episódio completo, idealmente temporal, antes da inspeção do resultado. Documentos do mesmo episódio ficam no mesmo bloco. A seleção retrospectiva das fontes desta rodada impede chamá-las de holdout genuinamente cego; podem servir à construção do método, seguida por validação em material ainda não usado.

### Incentivos necessários

1. Benefício de acomodação: diferença esperada entre custo da alternativa regulatória e custo do instrumento, incluindo risco subjetivo contemporâneo da alternativa e eficácia da substituição.
2. Vantagem competitiva: ganho da firma **relativo aos concorrentes relevantes** sob o instrumento, considerando portfólio, preços, demanda e incidência. Custo próprio negativo não implica desvantagem relativa.
3. Custos e benefícios comuns: custos políticos de posição, custo de lobbying, incentivos reputacionais e divergências entre unidades organizacionais.
4. Canal documental: autoria, autoridade, destinatário, momento, cobertura do arquivo e possibilidade de comunicação estratégica.

Fontes podem fornecer ponto, intervalo, sinal ou ausência para cada campo. Deve ser preservado esse tipo; não converter sinal em um valor monetário nem descrição como “provável” em 0,7 sem elicitação declarada.

## 4. Duas rotas para obter números que preservem H

### A. Modelos de decisão rivais estimados, sem rótulo certo de motivo

Seja `x_S` o incentivo de acomodação e `x_C` a vantagem competitiva. SA e CA devem impor restrições diferentes, derivadas das definições do manuscrito, à distribuição de decisões e rastros. Os parâmetros livres são estimados com episódios de treinamento. Não basta trocar o nome de duas regressões idênticas.

Uma família candidata, ainda não especificação final, é uma escolha com utilidade latente dependente de `x_S`, `x_C` e controles comuns. Sob uma versão pura de SA, o componente competitivo não explica o apoio; sob uma versão pura de CA, o componente competitivo precisa explicar positivamente a decisão nas condições definidas. Mas o relatório 04 observa que SA/CA originais tratam benefício líquido e motivo principal: portanto coeficiente zero automático pode distorcer a teoria. Antes de usar qualquer restrição, deve-se demonstrar sua correspondência às hipóteses. Incluir versões mistas se a teoria as admite.

Dado um modelo causal já especificado, a probabilidade estimada é

`P(Y*=y | H,D_train,x*) = integral P(Y*=y | H,eta,x*) p(eta | H,D_train) d eta`.

Os números vêm da likelihood das decisões de treinamento e dos incentivos medidos. Priors, forma funcional, erro de escolha, transporte e observação continuam hipóteses explícitas. Isso é probabilização baseada em dados e julgamento, não uma extração automática de números do texto. O modelo é BPT apenas se `Y` representa rastros do mecanismo e as restrições causais foram justificadas; prever apoio genérico sem essa ponte repetiria o erro das assinaturas.

O arquivo atual tem covariáveis incompletas para no máximo três candidatos e nenhuma amostra adequada para ajustar esta família. Ajustar um logit e obter probabilidades finitas com um prior escolhido apenas para permitir cálculo esconderia a falta de informação.

### B. Contagens condicionais com motivos aferidos independentemente

Se houver episódios com atribuição de mecanismo apoiada em evidência interna independente de `Y`, contar `k_H` respostas em `n_H` oportunidades comparáveis. A expressão Beta(a+k_H,b+n_H−k_H) é legítima somente após justificar rótulos, denominador, dependência e transporte.

“Duas pessoas concordaram que o motivo era SA” não é calibração do rótulo. Para erro de classificação, precisamos de auditoria com evidência mais forte e independente, ou limites explícitos de falsos positivos e negativos. Sem isso, `P(Y | rótulo SA)` é identificável em dados suficientemente numerosos, mas `P(Y | SA verdadeiro)` continua podendo diferir. Um modelo de classes latentes também precisa de restrições identificadoras; multiplicar fontes correlacionadas do mesmo episódio não fornece essa identificação.

É necessário permitir `SA e CA`, `nenhum` e `indeterminado`, além de não ocultar rivais relevantes como ganhos reputacionais sem custo (HR) e nivelamento competitivo (HL). Reclassificar todo episódio não-SA como CA cria um contraste espúrio. A classificação deve ser local à decisão e ao desenho; não rotular BP permanentemente.

## 5. Da estimação ao PPC sem mudar o objeto

Depois de preencher e estimar os componentes:

1. Atualizar `p(H,eta | D_train)` com evidência de treinamento pertinente ao episódio e ao escopo do H. Não copiar a posterior agregada do manuscrito para BP.
2. Sortear `H` e parâmetros uma vez por configuração/episódio apropriado.
3. Gerar decisões e estados intermediários impostos pelo mecanismo, preservando dependência entre atores e instrumentos.
4. Gerar rastros conforme o modelo de produção, preservação, acesso e codificação da fonte. Pode-se gerar categorias codificadas, não prosa.
5. Comparar a réplica ao vestígio reservado com discrepância substantiva congelada: por exemplo, persistência de apoio quando o benefício regulatório cai, desde que se mantenham constantes ou modelem os incentivos competitivos e os demais fatores.
6. Avaliar também escores preditivos fora da amostra e o envelope resultante da incerteza de incentivos, rótulos e acesso. Um bom escore de apoio não prova o mecanismo causal; a distinção entre adequação absoluta e comparação relativa permanece.

A posterior e as likelihoods devem pertencer ao mesmo modelo e à mesma unidade. Reservar material exige apresentação como previsão de nova evidência; reutilizá-lo admite PPC, mas não validação fora da amostra. Seleção de discrepância após ver o resultado é exploração.

## 6. Debate e conclusão

O agente 04 confirmou que o email BP2017 informa a direção do benefício regulatório, mas omite o payoff completo, probabilidades e custos. Ele rejeitou transformar menção a substituição em classe SA observável; concordo. Propôs desigualdades de decisão robustas a intervalos como alternativa parcial, com alcance diferente de atribuição causal.

Minha tentativa empírica acrescentou uma fonte institucional para os desenhos de política e um protocolo de ligação de arquivos, mas **não superou a não identificação das fontes atuais**. O progresso que recomendo é produzir o inventário de episódios e os dados de incentivos, começando pela verificação da identidade do cap-and-trade mencionado por BP. Se esse levantamento mostrar que quase todos os campos causais permanecem ausentes, a conclusão correta será limitar a ambição do caso, não preencher a tabela de likelihoods com números plausíveis.

Não há, nesta rodada, exemplo numérico causal completo honesto a relatar. Há uma sequência operacional que pode gerar tal exemplo após coleta; o custo empírico e os julgamentos restantes estão especificados.

## Atualização após a conferência do apêndice original e debate com 06

Abri o [apêndice original Fairfield–Charman](https://static.cambridge.org/content/id/urn%3Acambridge.org%3Aid%3Aarticle%3AS2049847025000160/resource/name/S2049847025000160sup001.pdf). A seção A3, pp. 3–4, distingue apoio a uma proposta percebida como inviável para obter reputação (HR) do apoio a uma proposta percebida como adotável para bloquear alternativa pior (SA). Isso reforça a necessidade de medir viabilidade contemporânea e impede usar McCoy como rótulo automático SA. HL também distingue eliminar desvantagem preexistente de ganhar nova vantagem sob CA.

Ao agente 06 respondi que não encontrei uma frequência transportável à unidade e ao evento E3 original. Elicitar um Bayes factor para o complemento exato pode completar duas células algebricamente, mas acrescenta julgamento substantivo. Para evidência narrativa composta, o complemento abrange todas as maneiras de a evidência não ocorrer; ele não equivale a uma única narrativa invertida. O registro de fonte e a ausência de evidência precisam estar no mesmo espaço de resultados antes dessa elicitação. Portanto essa rota não deve ser descrita como taxa empírica derivada dos arquivos atuais.
