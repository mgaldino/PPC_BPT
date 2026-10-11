# Revisão da correspondência entre fontes, códigos e julgamentos

Revisor: `carbon_source_application`. Data: 11/10/2026. ID exato do modelo: **UNKNOWN**.

Escopo: conferir o conteúdo substantivo de `data/evidence_codebook.json` e `data/judgment_ledger.csv` nas fontes arquivadas. Não foram revisados cálculos, scripts ou resultados numéricos. O revisor propôs originalmente os valores de referência de Q, portanto esta revisão **não constitui validação independente desses números**. A revisão independente aqui é da tradução feita pelo coordenador entre documentos e códigos, das atribuições e das afirmações de proveniência. Nenhum dos dois arquivos foi editado pelo revisor.

Identidade dos artefatos revisados:

- `evidence_codebook.json`: SHA-256 `7372f6ff9fd98da0152aea8c5d8996ebbbb19f6ad42052fc836412565b8d0762`
- `judgment_ledger.csv`: SHA-256 `66b09806550cd6c63144f657be65d6c1fc9536493ec8c9b0e6dd0471ba4214a9`

Veredicto: **READY_FOR_IMPLEMENTATION**, limitado à pequena correção de proveniência SL1. Há um defeito confirmado de metadados e nenhum defeito substantivo confirmado no mapeamento dos fatos para Q e V. Os números permanecem julgamentos da aplicação. Não há demonstração independente de sua calibração.

## SL1 — Fonte incompleta para a condição C

**Status: CONFIRMED.** Tipo: artifact/provenance. Severidade: baixa. Correção proposta: safe.

Localizador: `evidence_codebook.json`, linhas 5–10.

A definição de C inclui apoio público anterior à entrevista **e** contexto de entrevista e seleção jornalística. O campo `source_id` aponta apenas para F1. F1 documenta o apoio público, mas o contexto de entrevista provém de F2.

Evidência do defeito: `sources/exxon_2021_03_29.txt`, linhas 147–170, é o texto público de Woods. `sources/unearthed_2021_06_30.txt`, linhas 43–50, contém a função de McCoy, a entrevista por Zoom em maio e a apresentação dos jornalistas como recrutadores. O próprio código já dá a F2 o papel de informar produção e seleção do relato nas linhas 17–18 e 35.

Correção segura: tornar a referência de C uma lista F1/F2, ou separar apoio público e procedimento de observação em dois componentes com suas respectivas fontes. Não alterar o valor de C nem qualquer probabilidade por causa dessa correção.

## SL2 — Q confundiria fala individual com motivação corporativa comprovada

**Status: REFUTED.** Tipo: mensuração. Correção: not_provided.

Localizador: `evidence_codebook.json`, linhas 4 e 14–21. A definição é de um **registro de um diretor**, e o texto declara explicitamente que não é observação direta da intenção corporativa. A alternativa de Q inconclusivo é preservada.

Contraprova textual: F2, `unearthed_2021_06_30.txt`, seção *Taxing carbon*, linhas 87–96, combina a utilidade comunicativa do apoio com a declaração de inviabilidade. Essa ligação é suficiente para Q=1 segundo a regra escolhida. Ela não obriga a concluir que a empresa realmente prefere a não adoção.

O contexto eleva a importância da sensibilidade à representatividade: as linhas 49–50 apresentam os jornalistas como recrutadores e esclarecem que os interlocutores não necessariamente buscavam emprego. A linha 90 contém pergunta explícita do repórter sobre inviabilidade. A linha 121 registra a posição corporativa de que os entrevistados não desenvolveram as políticas da empresa. J3, J4 e J10 deixam espaço probabilístico para divergência entre relato e estratégia.

## SL3 — V não teria suporte nas fontes ou seria contado como independente

**Status: REFUTED.** Tipo: mensuração/dependência. Correção: not_provided.

Localizadores: `evidence_codebook.json`, linhas 24–30, e `judgment_ledger.csv`, J6–J9.

`sources/exxon_2021_07_02.txt`, linhas 147–161, registra a data e a desautorização pública, seguida da reafirmação do preço do carbono. V=1 está sustentado.

A manifestação de Woods responde ao conjunto de comentários gravados, abrangendo outros assuntos. A codificação é defensável como desautorização do episódio acompanhada de reafirmação da posição pública. Uma descrição futura de V como uma resposta **exclusivamente** à frase sobre carbon tax seria mais estreita do que a fonte permite. O código atual não faz essa alegação.

J9 explicita a dependência da resposta em Q. O estado sem Q é tratado como uma projeção em que essa resposta não é avaliada. Isso é uma escolha do objeto replicado, não uma afirmação histórica de que empresas nunca emitiriam desautorizações por outros motivos.

## SL4 — Os valores de J1–J8 seriam atribuídos indevidamente às fontes

**Status: REFUTED.** Tipo: proveniência dos julgamentos. Correção: not_provided.

Localizador: `judgment_ledger.csv`, linhas 2–9.

O registro identifica o coordenador como autor de π, ρ e das probabilidades de V. Identifica os valores de Q como proposta deste agente adotada pelo coordenador. Os números de 15, 10 e 65 em 100 são explicitamente repetições imaginadas, não observações ou elicitação com especialistas humanos.

F1 sustenta a presença de raciocínios sobre tecnologia e substituição regulatória, mas a igualdade inicial SA/CA é declarada julgamento adicional. F5 sustenta a existência substantiva de HR, mas a massa 0,20 é assumida pelo coordenador. J4 identifica a diferença entre SA e CA como revisável. A estrutura dos campos distingue corretamente o argumento substantivo e o número escolhido.

Esta classificação refuta atribuição indevida. Ela não verifica a correção das probabilidades, tarefa para a qual essas fontes não oferecem uma amostra de calibração.

## SL5 — HR seria invenção posterior ou alteração disfarçada de SA

**Status: REFUTED.** Tipo: fidelidade teórica. Correção: not_provided.

Localizadores: `evidence_codebook.json`, F5, e `judgment_ledger.csv`, J2 e J5. Contraprova: `sources/fairfield_charman_2025_supp.txt`, Apêndice A.3, linhas 92–111.

FC já apresentam HR como ganho reputacional associado à percepção de inviabilidade. Distinguem-na de SA, que envolve a possibilidade de adoção efetiva para impedir alternativas custosas. O ledger usa essa hipótese sob identidade própria e autoria correta. A aplicação à Exxon2021 é nova, mas o conteúdo da hipótese está ancorado no suplemento.

## SL6 — A posterior setorial de FC seria transportada para Exxon2021 como fato

**Status: REFUTED.** Tipo: escopo. Correção: not_provided.

Localizador: `evidence_codebook.json`, linha 2, e `judgment_ledger.csv`, J1 e J12.

O alvo principal é Exxon2021. O valor 0,715252751 aparece em J1 como empréstimo setorial explicitamente adicional para sensibilidade, enquanto o central é 0,50. J12 declara a independência condicional e as âncoras absolutas como julgamentos acrescentados à reconstrução de FC. Não há alegação de que FC tenham publicado essas likelihoods absolutas.

## SL7 — As likelihoods de Q teriam sido elicitadas antes do conhecimento de V

**Status: REFUTED, para o texto atual.** Tipo: proveniência temporal. Correção: not_provided.

Localizador: `judgment_ledger.csv`, J11.

J11 afirma que todas as fontes eram conhecidas e define os valores como elicitação retrospectiva de uma probabilidade que pretende representar o contexto anterior à resposta. Isso distingue corretamente o momento real da escolha dos números e a condição probabilística que se deseja representar.

Há uma ressalva substantiva para o relatório: a proposta original deste agente foi feita após leitura inclusive do contraditório. Portanto, não se deve dizer que Q foi calibrado ou estimado independentemente de V. A revisão atual do ledger trata a interpretação anterior a V como uma especificação retrospectiva assumida pelo coordenador, não como resultado de um experimento de elicitação temporalmente separado.

Além disso, o próprio F2 já contém manifestações corporativas de contestação em junho. O conjunto numérico deve ser descrito como anterior ao uso de **qualquer contraditório na atualização**, e não como se 02/07 fosse a primeira ocasião histórica em que a Exxon respondeu. O ledger atual não afirma que foi a primeira.

## Verificações realizadas

Foram lidos integralmente os dois arquivos revisados. As passagens relevantes dos três textos de 2021 e do suplemento FC foram reabertas nas versões locais. Conferi a existência dos PDFs F4 e F5, apesar de eles não aparecerem em `rg --files` por regras de exclusão. As datas, autores e URLs coincidem com as fontes consultadas anteriormente na web. Não foi feita inspeção audiovisual do vídeo integral. A fonte para a fala é a publicação originadora com transcrições e ligações ao material gravado.

Contagem: **1 CONFIRMED, 0 PARTIAL, 6 REFUTED, 0 UNRESOLVED**. O único encaminhamento para implementação é SL1. As observações sobre linguagem futura e elicitação retrospectiva delimitam as afirmações admissíveis, sem exigir alteração dos números.
