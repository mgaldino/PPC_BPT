# Auditoria semântica dos documentos dos braços A e B

Data: 11/10/2026. Revisor: subagente redteam, diferente do executor e do codificador. Escopo: todos os 128 pares A/B em `data/documents.json` (64 mundos por braço; 256 textos), seus estados retornados, `data/code_map.csv`, `agents/blind_audit.csv` e as instruções comuns do gerador. Não foram feitas novas gerações nem alterados documentos.

**Resultado:** identifiquei duas atribuições explicativas adicionais no braço A e nenhuma atribuição explícita equivalente no braço B. As duas preservam os três bits Q/K/A, demonstrando que recuperá-los não é suficiente para auditar toda a semântica causal. No braço B há ressalvas de linguagem modal, mas não encontrei fundamento para classificá-las automaticamente como eventos falsos ou falhas causais graves.

## Método e contagens

Primeiro conferi o alerta do auditor cego, cruzando o identificador D010 com o mapa. Depois fiz uma triagem lexical, seguida de leitura integral de todos os memorandos e notas A/B. A leitura integral encontrou uma construção `, so` não capturada na busca causal inicial; ela foi acrescentada à busca final. Portanto, a classificação não depende exclusivamente de palavras-chave.

Foram examinados somente os campos `memo` e `public_note`. Os campos `candidate_implication` e `extra_assumption` são propostas separadas e não foram contados como afirmações de eventos ocorridos. A unidade das contagens é o mundo: dois documentos com a mesma expressão contam uma vez.

| Categoria | A, 64 mundos | B, 64 mundos | Interpretação |
|---|---:|---:|---|
| Atribuição explicativa episódica adicional confirmada | 2 | 0 | Q/K/A não determinam o motivo afirmado |
| Conectivo de contraste ou concessão | 14 | 11 | Triagem retórica; não é contagem de falhas graves |
| `proposal replaces`, sem `offers`/`would` nessa oração | 4 | 6 | Ambiguidade modal; não prova implementação efetiva |

Busca causal final: palavras/frases `therefore`, `because`, `hence`, `thus`, `consequently`, `due to`, `as a result`, `so that`, `in order to`, `reason`, `motivated`, `driven`, `lead(s) to`, `resulting`, `accordingly`, ou vírgula seguida de `so`. Busca de contraste: `despite`, `nevertheless`, `even so`, `although`, `yet`, `however`, `but`, `even though`. Busca modal: expressão `proposal replaces`. Busca sem diferenciação entre maiúsculas e minúsculas, seguida de adjudicação contextual.

Essas frequências descrevem o material inspecionado. Não estimam taxas gerais de erro do modelo nem substituem uma auditoria humana.

## Achados explicativos confirmados

### 1. D010 corresponde a A_CA_09

Mapa: `data/code_map.csv`, request `code_01`. Estado retornado: Q=1, K=0, A=0. Trecho do memorando em `data/documents.json`, registro `A_CA_09`:

> Our internal assessment anticipates no net competitive gain. The four-firm coalition therefore does not collectively join the proposal.

O `therefore` não altera nenhum bit. Acrescenta, porém, uma ligação explicativa entre a ausência de ganho previsto e a não adesão neste mundo. A regra probabilística de CA estabelece que K altera a propensão a aderir; não estabelece qual foi o motivo determinante de cada não adesão realizada. Mesmo sob Q=1,K=1, o modelo permite não adesão. Não foi fornecido estado de justificativa, relato autêntico do decisor ou mecanismo documental que autorizasse a inferência episódica expressa no memorando.

O achado do auditor cego está, portanto, **CONFIRMADO** como acréscimo explicativo. Não é uma contradição lógica do estado nem prova de que a explicação seja impossível: é uma explicação particular não autorizada pelo roteiro factual.

### 2. D179 corresponde a A_CA_28

Mapa: `data/code_map.csv`, request `code_12`. Estado retornado: Q=1, K=0, A=0. Trecho:

> Our internal assessment anticipates no net competitive gain, so the four-firm coalition will not collectively join it.

Aqui `so` executa a mesma passagem de estado a explicação episódica. A classificação é **CONFIRMADA** pelo mesmo motivo. As duas ocorrências são de mundos distintos do braço A, gerados em chamadas diferentes (`gen_A_CA_2` e `gen_A_CA_4`). Não se deve reclassificar todo o conjunto A como semanticamente falso; o achado delimitado é suficiente para demonstrar uma lacuna do check puramente binário.

## Construções que não justificam um alerta grave

No braço B, `B_SA_06` escreve:

> Although our assessment anticipates no net competitive gain, the four-firm coalition will collectively join the proposal.

O trecho coloca em contraste dois fatos do roteiro. Sugere uma expectativa retórica, mas não identifica um motivo alternativo, não afirma evento adicional e não contradiz o modelo, que admite adesão com K=0. Classificá-lo como invenção causal grave exageraria a evidência. O mesmo cuidado se aplica a `nevertheless`, `yet` e `but` nos outros registros.

A lista de mundos com contraste é:

- A: SA_01, SA_03, SA_09, SA_13, SA_14, SA_25, CA_03, CA_04, CA_05, CA_08, CA_21, CA_22, CA_30, CA_31.
- B: SA_01, SA_04, SA_06, SA_08, SA_15, SA_17, SA_23, CA_18, CA_20, CA_21, CA_23.

No registro `B_SA_11`, por exemplo, aparece:

> The proposal replaces overlapping command-and-control carbon rules.

Q=1 significa que a proposta **oferece** substituição. `Replaces` pode ser uma maneira abreviada de descrever o conteúdo da proposta, sem afirmar que uma lei já foi implementada. Por isso, o achado é **ambiguidade modal**, e não confirmação de implementação inventada. Uma renderização futura mais estrita deve usar `offers replacement` ou `would replace`.

Os dez mundos com essa ambiguidade lexical são A_CA_17, A_CA_19, A_CA_21, A_CA_22; B_SA_11, B_SA_12, B_SA_14, B_CA_09, B_CA_11 e B_CA_14. Não se alteraram essas saídas após observá-las.

## Compatibilidade com os prompts e utilidade das consequências novas

COMMON exige que os documentos descrevam o mesmo mundo, sem novos atores históricos, números ou eventos adicionais. Exige também que a implicação candidata seja uma previsão, não um fato ocorrido, e permaneça fora dos documentos. Uma atribuição episódica adicional ocupa uma zona que o check Q/K/A não captura: ela adiciona informação explicativa sem necessariamente adicionar um novo evento. O protocolo futuro deve torná-la explícita: não atribuir razões particulares, necessidades ou suficiências causais sem um estado de justificativa correspondente.

Debati esse ponto diretamente com `pilot_novelty_audit`. Concordamos que duas sugestões são operacionalizáveis como propostas condicionais de pesquisa:

- `B_SA_24`: procurar resistência a emendas que enfraqueçam a substituição regulatória, sob a premissa de que a coalizão monitora e defende características favoráveis da proposta.
- `A_CA_11`: procurar pedidos de cronograma claro de retirada das regras sobrepostas, sob a premissa de que apoiadores expressam preferências de implementação.

São ações e documentos adicionais ao vetor Q/K/A. Não são deduções da regra matemática, fatos históricos observados ou implicações já discriminantes de SA e CA. Sua utilidade é indicar rastros a buscar e premissas a testar. A API admitir interoperabilidade, ou a BP mencionar prevenção de regras futuras, não demonstra pedidos de retirada de regras existentes com cronograma. As sugestões devem permanecer no registro de hipóteses auxiliares até que um canal gerativo e evidência adequada sejam acrescentados.

## Critério final para o braço B

O critério binário pode ser aprovado quando o estado recuperado coincide com o estado sorteado. Isso não implica aprovação automática de toda a semântica causal. Nesta amostra, a leitura completa de B não encontrou atribuições episódicas explícitas equivalentes aos dois casos de A; registrou seis ambiguidades modais e onze contrastes retóricos, sem classificá-los como falhas graves.

Assim, B sustenta uma conclusão delimitada: **renderização adequada dos estados Q/K/A neste piloto, com revisão de linguagem modal recomendada**. Não sustenta que quaisquer relatos produzidos pelo LLM sejam mecanisticamente fiéis, nem que consequências auxiliares tenham sido validadas. Se o PPC futuro usar razões alegadas, timing ou acontecimentos além de Q/K/A, esses conteúdos precisarão de estados, regras de emissão e auditoria próprios.

Nenhuma das duas atribuições adicionais de A altera os PPCs já definidos apenas por Q e A. Elas importam para a ambição mais ampla de usar narrativas como evidência causal: um check limitado aos bits pode deixar passar mudanças substantivas no conteúdo explicativo.

## Proveniência

Arquivo central: `data/documents.json`, SHA-256 `9642525cc36f054bc8572456a278ba4ac557759e039cdacbf7cc46bdf3b26cd3`. IDs opacos foram resolvidos por `data/code_map.csv`. O alerta inicial de D010 consta de `agents/blind_audit.csv`. A presente auditoria preserva os documentos originais e não modifica seus códigos.
