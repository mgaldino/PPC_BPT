# Auditoria das implicações propostas em todos os mundos A/B

Data: 11/10/2026. Foram lidos os campos `candidate_implication` e `extra_assumption` de todos os **128 mundos dos braços A/B**, 32 por combinação braço/hipótese. Cada ID foi examinado e atribuído manualmente a uma família temática primária. As 64 entradas do braço C têm ambos os campos vazios e foram excluídas. Nenhuma proposta foi descartada da contagem por ser repetida, vaga ou incorreta. Python foi usado somente para ler o JSON, imprimir os campos e verificar identidade, completude, correspondência dos IDs e contagens da classificação manual. Nenhum script estatístico foi utilizado ou alterado.

Fonte exata: `data/documents.json`, SHA-256 `9642525cc36f054bc8572456a278ba4ac557759e039cdacbf7cc46bdf3b26cd3`. O localizador de cada proposta é seu campo `id`; a enumeração completa está no final deste relatório. Foram preservados os dados, os documentos sintéticos, as sugestões originais e os scripts.

A auditoria das cinco propostas da chamada independente de descoberta permanece válida em seu escopo. A leitura dos 128 mundos permite qualificá-la: há sugestões de ações documentáveis que acrescentam variáveis ao núcleo Q,K,A. Sua utilidade é como orientação condicional de busca, não como consequências já deduzidas, fatos observados ou ganho científico validado. Tampouco a multiplicidade de textos constitui 128 hipóteses originais independentes: há repetição e variações próximas, inclusive dentro de chamadas.

## Critério e classificação exaustiva

O critério de “adicional” foi exigir um comportamento ou objeto documental distinto de repetir a oferta Q, a expectativa K ou a adesão A. O critério de utilidade privilegiou uma ação identificável, documento a procurar, temporalidade possível e uma lacuna empiricamente investigável. A novidade científica forte exigiria também algo não já contido no mecanismo/estado, discriminação relevante entre hipóteses e evidência adequada; isso não foi demonstrado aqui.

As famílias são uma classificação qualitativa primária, não uma descoberta por análise estatística nem uma escala validada. Quando havia sobreposição, priorizei o objeto da previsão: pedido de mudança foi N; recursos/plano foi P; obstáculo explicativo foi O; linguagem, saliência ou justificativa foi M. Assim, a contagem é reproduzível pelo mapa de IDs, embora outra classificação qualitativa possa legitimamente tratar casos de fronteira de outra maneira.

| Família | Quantidade | Avaliação aplicada às propostas da família |
|---|---:|---|
| M: mensagens, saliência e justificativas | 67 | Em geral tornam Q,K,A uma explicação ou um padrão de linguagem, acrescentando fidelidade/candura/saliência como premissa. Algumas sugerem pesquisa sobre comunicação, mas não demonstram o motivo histórico nem novidade forte. A instrução que restringe K na nota pública pode produzir assimetrias artificiais. |
| O: obstáculos, insuficiência e razões da não adesão | 26 | Propõem explicar A quando incentivos parecem favoráveis, frequentemente com coordenação, preocupações ou fatores “mais importantes”. São hipóteses auxiliares sobre um resíduo probabilístico, que não identifica sozinho nenhuma causa particular. Precisam separar hipóteses concorrentes e evidência independente. |
| N: negociação, emendas e preservação de disposições | 21 | Introduzem pedidos, condições ou posições sobre mudanças de desenho. São candidatos adicionais mais concretos, embora dependam da possibilidade de negociação, de incentivos para agir e de registro observável. Não discriminam SA/CA automaticamente. |
| P: planejamento, recursos, implementação e esforço | 14 | Introduzem planos, alocação de recursos, coordenação ou intensidade de esforço. Podem orientar coleta adicional, mas precisam de período, comparador e medida; algumas formulações excedem a própria premissa fornecida. |
| **Total examinado** | **128** | Contagem de propostas textuais, preservadas inclusive as duplicatas. |

As 21 propostas N e 14 P não são automaticamente “35 boas descobertas”. Os temas indicam onde há maior distância entre o novo observável e os três bits originais; a validade de cada ligação continua condicionada a uma hipótese adicional.

## Duas candidatas prioritárias

### B_SA_24: reação a emendas que enfraquecem a substituição

Texto original: “Coalition advocacy may resist amendments that weaken replacement of overlapping carbon rules.” Premissa original: “the coalition monitors amendments and advocates to preserve proposal features supporting its participation.” Estado registrado: Q=1,K=1,A=1.

O comportamento adicional é uma tomada de posição diante de uma alteração específica da proposta. O núcleo somente informa oferta, expectativa e adesão; não contém o processo legislativo, emendas, monitoramento ou ação posterior. Essa distância torna a sugestão mais útil que reconstruir justificativas a partir de A.

Operacionalização a desenvolver: identificar uma emenda datada que reduza a substituição oferecida e procurar, antes de sua decisão, carta, comentário formal, instrução interna de advocacy ou posição pública da coalizão contrária a essa alteração. Registrar oportunidade de reação, acesso ao processo, autoria coletiva e eventual resposta a emendas comparáveis que não alterem a substituição. O modal “may” do original é fraco demais para um teste: é necessário definir uma previsão condicional falsificável, sem inventar aqui sua frequência ou magnitude.

Premissas ainda necessárias: a coalizão conhece a emenda, pode reagir, considera a preservação da disposição suficientemente valiosa frente aos custos da intervenção e produz documentação acessível. Outras modificações da emenda podem mudar K ou outras preferências. Uma oposição observada não isola o efeito de Q sem examinar esse conteúdo. A reação também pode ocorrer sob CA, que possui efeito positivo de Q; não é um classificador de SA.

Fonte disponível e lacuna: API2021 (`../2026-10-10_causal_likelihoods/sources/api_2021.txt`, linhas 15–18) expressa preferência por reduzir duplicação mediante preempção **ou** interoperabilidade. Isso torna plausível pesquisar posições sobre desenho, mas não demonstra oposição a emenda alguma nem a atuação da coalizão federal de quatro firmas. BP2019 (`bp_2019.txt`, linhas 75–79) menciona advocacy em Washington, outro ator/unidade e contexto. Falta o vínculo documental entre emenda identificada, mudança em Q e reação coletiva. Trata-se de lacuna de busca, não de confirmação.

### A_CA_11: pedido de cronograma para retirar regras sobrepostas

Texto original: “coalition submissions will request a clear timetable for retiring overlapping rules.” Premissa original: “supporters seeking regulatory replacement state implementation preferences in formal submissions.” Estado registrado: Q=1,K=1,A=1.

O novo observável é um pedido temporal específico em uma manifestação formal. A proposta permite distinguir apoio genérico à substituição de uma demanda verificável sobre sua implementação. Os estados não contêm calendário, procedimento administrativo ou manifestação formal.

Operacionalização a desenvolver: procurar submissões datadas que nomeiem regras ou programas a retirar, definam prazo ou sequência de revogação e vinculem isso à precificação. Distinguir pedido de cronograma, cronograma oficialmente anunciado e retirada efetivamente realizada. A existência de um documento não autoriza afirmar os dois últimos eventos.

A premissa original não basta para a força de “will”: expressar preferências de implementação não implica pedir precisamente um cronograma. Seria necessário que a transição temporal fosse uma preocupação relevante, houvesse regras existentes a retirar e um canal de submissão disponível. A coalizão poderia preferir interoperabilidade, suspensão, preempção de regras futuras ou instruções substantivas sem pedir prazo. O observável acrescenta conteúdo, mas sua direção permanece uma hipótese auxiliar a ser explicitada e testada.

Fonte disponível e lacuna: API2021, linhas 15–18, admite interoperabilidade e não determina um calendário de retirada. BP2017 (`bp_2017.txt`, linhas 49–54) trata de evitar regras futuras sobre refinarias, o que difere de aposentar regras existentes. Nenhuma dessas passagens comprova o pedido previsto. A lacuna é localizar a submissão pertinente ou constatar, em um universo documental definido, a ausência desse pedido; os textos já disponíveis não constituem esse universo completo.

As duas candidatas têm exatamente o mesmo estado Q=1,K=1,A=1 e aparecem com rótulos de hipótese opostos nos IDs. O braço B redige estados sem receber H. Isso reforça que elas são propostas condicionais sobre comportamento e documentos, e não evidência de que o LLM descobriu uma diferença entre SA e CA.

## Problemas específicos encontrados na leitura integral

- **A_CA_16:** prevê ausência de pacote de advocacy conjunto quando A=0, mas a premissa apenas afirma que adesão ordinariamente produz tal pacote. Mesmo se a premissa fosse determinística, A→pacote não implica não A→não pacote. Pode haver preparação conjunta antes da decisão final. Rejeitar a conclusão como implicação sustentada pela premissa fornecida.
- **B_SA_08:** chama a redução de sobreposição de “sufficient to support collective participation”. Q=1,K=0,A=1 em um mundo não demonstra suficiência causal. A probabilidade de adesão nesse estado é 0,7 sob SA e 0,2 sob CA. Uma justificativa documental que empregasse esse termo exigiria sua própria evidência e não alteraria esses parâmetros.
- **B_SA_30:** infere ausência de qualquer argumento favorável de competitividade a partir de K=0 e A=0. Ausência de ganho líquido não exclui componentes competitivos favoráveis compensados por perdas. Arquivo completo, premissa declarada, não resolve essa diferença lógica.
- **B_CA_11:** prevê desvantagens competitivas não ligadas à sobreposição. K=0 não distingue perda líquida de neutralidade, nem sua decomposição causal. **B_CA_14** também exige informação adicional para localizar preocupações competitivas “after accounting for regulatory replacement”.
- **A_CA_05, A_CA_30 e B_SA_19:** elegem barreiras organizacionais/coordenação para explicar não adesão apesar de ganho esperado. O modelo probabilístico admite esses estados sem identificar essa explicação. A premissa pode propor um novo mecanismo, mas não é um resultado inferido de Q,K,A.
- **B_SA_25:** introduz “policy certainty” como rationale público, conceito não especificado pelos três estados. Pode ser nova hipótese de mecanismo, mas requer definição e evidência; não é uma consequência estabelecida da substituição regulatória.
- **A_SA_18, A_SA_20 e A_SA_21:** repetem literalmente uma previsão de maior atenção a obstáculos internamente do que publicamente. A premissa postula franqueza interna e omissão pública. Isso é uma candidata à pesquisa de comunicação, não observação independente do mecanismo original.
- **B_SA_09 a B_SA_16:** alternam somente enfatizar ou evitar linguagem de simplificação conforme a proposta. Embora sejam oito registros válidos da geração, não representam oito ideias distintas. Exibem a necessidade de não confundir quantidade de saídas com diversidade científica.

## Debate independente e limite de fidelidade

As duas candidatas prioritárias foram enviadas ao agente `llm_ppc_redteam`. A resposta concordou que a defesa contra emendas e o pedido de cronograma acrescentam ações auditáveis sob premissas extras, mas não decorrem do núcleo nem distinguem SA/CA de forma validada. O ponto de convergência foi manter as candidatas nos campos separados, acompanhadas de premissas, e nunca transferi-las para o memorando ou a nota pública como se já tivessem ocorrido. O redteam relatou separadamente problemas de atribuição causal nos documentos A; essa verificação pertence à auditoria semântica dele, não foi contada aqui como validação das sugestões.

Nenhuma fonte consultada é holdout. Nenhuma das 128 propostas foi adicionada ao PPC ou convertida em evento histórico. Há duas candidatas concretas para uma próxima etapa de busca documental, com lacunas identificadas. O ganho aqui é de formulação de perguntas observáveis; sua originalidade substantiva, validade e capacidade discriminante permanecem não demonstradas.

## Mapa completo da classificação manual

Cada ID abaixo recebeu a avaliação de sua família na tabela e os reparos específicos descritos quando aplicáveis. A lista particiona exatamente os 128 IDs A/B, sem omissões ou duplicações.

- **M, 67:** A_SA_01, A_SA_05, A_SA_07, A_SA_09, A_SA_11, A_SA_14, A_SA_17, A_SA_19, A_SA_22, A_SA_23, A_SA_24, A_SA_25, A_SA_27, A_SA_31, A_SA_32, A_CA_01, A_CA_02, A_CA_04, A_CA_08, A_CA_09, A_CA_13, A_CA_14, A_CA_18, A_CA_19, A_CA_21, A_CA_23, A_CA_24, A_CA_26, A_CA_29, A_CA_31, A_CA_32, B_SA_03, B_SA_06, B_SA_07, B_SA_08, B_SA_09, B_SA_10, B_SA_11, B_SA_12, B_SA_13, B_SA_14, B_SA_15, B_SA_16, B_SA_18, B_SA_23, B_SA_25, B_SA_26, B_SA_27, B_SA_29, B_SA_30, B_SA_31, B_CA_01, B_CA_05, B_CA_07, B_CA_09, B_CA_13, B_CA_17, B_CA_19, B_CA_23, B_CA_24, B_CA_25, B_CA_26, B_CA_27, B_CA_28, B_CA_30, B_CA_31, B_CA_32.
- **O, 26:** A_SA_03, A_SA_10, A_SA_13, A_SA_18, A_SA_20, A_SA_21, A_SA_26, A_SA_28, A_CA_05, A_CA_15, A_CA_20, A_CA_22, A_CA_30, B_SA_04, B_SA_19, B_SA_21, B_SA_28, B_SA_32, B_CA_03, B_CA_11, B_CA_14, B_CA_18, B_CA_20, B_CA_21, B_CA_22, B_CA_29.
- **N, 21:** A_SA_04, A_SA_16, A_SA_29, A_CA_03, A_CA_11, A_CA_17, A_CA_25, A_CA_28, B_SA_01, B_SA_02, B_SA_05, B_SA_17, B_SA_20, B_SA_22, B_SA_24, B_CA_02, B_CA_04, B_CA_08, B_CA_10, B_CA_12, B_CA_15.
- **P, 14:** A_SA_02, A_SA_06, A_SA_08, A_SA_12, A_SA_15, A_SA_30, A_CA_06, A_CA_07, A_CA_10, A_CA_12, A_CA_16, A_CA_27, B_CA_06, B_CA_16.
