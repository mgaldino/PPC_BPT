# Auditoria independente de semântica e codificação documental

**Parecer de 11 de outubro de 2026: APROVADAS as tabelas e as três implicações selecionadas `discovery_03_C1`, `discovery_03_C2` e `discovery_04_C1`.** As 12 candidatas têm tabelas corretas em 16/16 estados. As três escolhidas são consequências compostas dos fundamentos e particionam somente variáveis observáveis. A seleção respeita a regra informada de aceitar agregações de categorias, excluir partições iguais mesmo com rótulos distintos e selecionar as três primeiras admissíveis. A codificação independente dos 48 conjuntos está em `independent_document_codes.csv`, com 192 campos definidos, nenhum `-1` e dez divergências entre documentos preservadas. Há uma limitação material: 24 conjuntos revelam SA/CA na própria prosa, de modo que este material não assegura cegamento à hipótese.

O escopo de leitura ficou restrito a `foundations.txt`, `data/states.csv`, `data/candidates.json`, `raw/select/answer.json` e `data/blind_documents.json`. Não foram consultados protocolo, scripts, mapas, estados gerados, verdade, resultados ou discussões paralelas. A lista de verificações preexistentes foi tomada tal como declarada pelo seletor, e a regra de seleção foi fornecida na tarefa. Sua correspondência com um protocolo externo não foi auditada. O identificador `model_id=UNKNOWN` não foi usado para atribuir autoria ou capacidade a um modelo.

Defino apenas para esta auditoria `U=S xor A`, `V=A xor M` e `W=M xor P`. São transformações dos quatro campos observáveis. A tabela `states.csv` enumera exatamente as 16 combinações binárias em ordem de `state_id=0,...,15`, sem ausências ou duplicações. Sob SA, a intenção de apoio é S. Sob CA, é 1−S. A probabilidade de A=S é 0,8 sob SA e 0,2 sob CA, portanto 0,56 na mistura reservada. A probabilidade posterior de SA fornecida pelos fundamentos também confere: 0,375/(0,375+0,25)=0,6.

Tabela 1. Auditoria das 12 candidatas, na ordem de apresentação. “Igual” significa igualdade da partição de estados, inclusive sob troca dos nomes das categorias. Todas as funções abaixo usam apenas S,A,M,P, são exaustivas e mutuamente exclusivas, e todas as tabelas fornecidas coincidem com reconstruções independentes.

| Candidata | Conteúdo e caráter composto | Parecer sobre seleção |
|---|---|---|
| discovery_01_C1 | Reconstitui conjuntamente os dois elos de transmissão. Categorias 0,1,2,3 correspondem a (V,W)=(0,0),(1,0),(0,1),(1,1). Correta. | Excluída corretamente por igualdade à partição conjunta (V,W) declarada como preexistente. |
| discovery_01_C2 | U combina a mudança do benefício, o critério de payoff e a reversão da decisão. A relação com H é probabilística, não identifica H em cada episódio. Correta. | Excluída corretamente por igualdade a U. |
| discovery_02_C1 | 2V+W combina os elos A→M e M→P. Correta. | Excluída corretamente por igualdade à partição (V,W), com outra numeração. |
| discovery_02_C2 | U com Pr(U=0)=0,56 integra payoffs, reversão e pesos reservados. Correta. | Excluída corretamente por igualdade a U. |
| discovery_03_C1 | V+W conta divergências adjacentes. Probabilidades das categorias 0,1,2: 0,64, 0,32 e 0,04. Combina os dois elos. | Primeira admissível. A categoria 1 agrega (V,W)=(1,0) e (0,1), logo não é partição igual à conjunta. Selecionada corretamente. |
| discovery_03_C2 | S xor P = U xor V xor W combina a intenção dependente de H e as três reversões. H não entra na codificação. Correta. | Segunda admissível. Selecionada corretamente. |
| discovery_04_C1 | A xor P = V xor W vale 1 exatamente com uma divergência adjacente. Pr=0,2×0,8+0,8×0,2=0,32. | Terceira admissível. Selecionada corretamente, embora seja agregação de discovery_03_C1. |
| discovery_04_C2 | 2S+A distingue os quatro pares (S,A). Pr(A=1 dado S=1)=0,56 e Pr(A=1 dado S=0)=0,44. Combina intenção, reversão e mistura. | Admissível. Não escolhida porque três anteriores preencheram a cota. Não é igual à partição separada de S ou de U. |
| discovery_05_C1 | Mesma função de discovery_01_C1. Derivação, indicador e tabela corretos. “Memorandum-only divergence” deve designar divergência no elo A→M, não M isoladamente divergente de A=P. | Excluída corretamente por igualdade a (V,W). Há pequena ambiguidade de rótulo na prosa, resolvida pela definição explícita. |
| discovery_05_C2 | 2I(A=S)+I(P=A) combina alinhamento da decisão e paridade da transmissão. Pr(A=S)=0,56 e Pr(P=A)=0,68 são independentes dentro de cada episódio. Probabilidades das categorias 0,1,2,3: 0,1408, 0,2992, 0,1792, 0,3808. | Admissível. Não escolhida porque a cota já estava preenchida. |
| discovery_06_C1 | U, com probabilidades 0,56 e 0,44, combina intenção, reversão e mistura. Correta. | Excluída corretamente por igualdade a U. |
| discovery_06_C2 | 2V+W. Duas reversões implicam A=P, embora cada elo divirja. Correta. | Excluída corretamente por igualdade a (V,W). |

Tabela 2. Reconstrução independente das categorias selecionadas em cada estado observável. N=V+W corresponde a discovery_03_C1. Q=S xor P corresponde a discovery_03_C2. E=A xor P corresponde a discovery_04_C1.

| state_id | S | A | M | P | N | Q | E |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 2 | 0 | 0 | 1 | 0 | 2 | 0 | 0 |
| 3 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 4 | 0 | 1 | 0 | 0 | 1 | 0 | 1 |
| 5 | 0 | 1 | 0 | 1 | 2 | 1 | 0 |
| 6 | 0 | 1 | 1 | 0 | 1 | 0 | 1 |
| 7 | 0 | 1 | 1 | 1 | 0 | 1 | 0 |
| 8 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| 9 | 1 | 0 | 0 | 1 | 1 | 0 | 1 |
| 10 | 1 | 0 | 1 | 0 | 2 | 1 | 0 |
| 11 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
| 12 | 1 | 1 | 0 | 0 | 1 | 1 | 1 |
| 13 | 1 | 1 | 0 | 1 | 2 | 0 | 0 |
| 14 | 1 | 1 | 1 | 0 | 1 | 1 | 1 |
| 15 | 1 | 1 | 1 | 1 | 0 | 0 | 0 |

Para discovery_03_C2, três reversões independentes de probabilidade 0,2 dão probabilidade 0,608 de paridade par. Assim Pr(P=S|SA)=0,608 e Pr(P=S|CA)=0,392. Na mistura reservada, Pr(P=S)=0,6×0,608+0,4×0,392=0,5216. Esses valores foram derivados dos fundamentos, não estimados dos documentos. Como H é compartilhado por todos os episódios de um conjunto, as probabilidades marginais não autorizam tratar os episódios como independentes depois de integrar H.

A redundância entre duas selecionadas é exata: E=I(N=1). Logo, discovery_04_C1 não acrescenta informação ao indicador discovery_03_C1. N e E tampouco discriminam SA de CA, pois dependem somente dos dois elos de transmissão, cujas leis são iguais sob ambas. Isso não torna a escolha irregular sob a regra que aceita agregações de categorias. Limita, porém, qualquer interpretação de que as três selecionadas seriam três descobertas informacionalmente independentes. São consequências válidas e recombinações de observáveis já definidos.

A codificação documental foi manual, após leitura integral. S=0 indica queda do benefício regulatório, S=1 queda do benefício competitivo. A foi extraído exclusivamente da posição efetiva afirmada no registro direto, M da posição registrada no memorando e P da posição anunciada ao público. Apoio, manutenção e endorsement foram codificados 1. Oposição, retirada e ausência de apoio foram codificadas 0. `-1` ficaria reservado a informação ausente ou indeterminada no campo pertinente. H e explicações sobre reversões não foram usados para preencher nenhum campo. Todos os 192 campos têm posição explícita. Por exemplo, B011 declara diretamente A=1 apesar de intenção 0, e B048 declara que a coalizão passou a apoiar. Ambos permitem codificar A sem aceitar a explicação causal oferecida.

Tabela 3. Divergências preservadas entre documentos. Não foram tratadas como erro de extração nem corrigidas pela posição de outro documento.

| IDs | S,A,M,P | Divergência |
|---|---|---|
| B003, B028, B035, B043 | 1,1,0,0 | Memorando difere da decisão, anúncio mantém a posição do memorando. |
| B008, B021 | 1,0,0,1 | Anúncio difere do memorando e da decisão. |
| B014, B031, B042, B046 | 1,1,1,0 | Anúncio difere do memorando e da decisão. |

Nos outros 38 conjuntos, A=M=P. Não há conjunto com divergência em ambos os elos. Isso descreve exclusivamente os textos disponíveis, sem comparação com os estados gerados ou avaliação da distribuição de geração.

O cegamento ao arquivo de verdade foi mantido, mas o conteúdo documental não é cego a H. Os seguintes 24 conjuntos contêm explicitamente “under SA”, “under CA”, “under strategic accommodation” ou “under competitive advantage”: B001, B003, B004, B006, B007, B011, B013, B020, B021, B023, B026, B029, B030, B032, B034, B035, B036, B037, B039, B041, B042, B044, B046 e B048. Isso contraria a condição dos fundamentos de que H não é observável ao analista. Por exemplo, B003 começa seu registro decisório com “Under SA”, e B004 inclui “Under CA” já no aviso privado. É uma revelação do rótulo aplicado na narrativa, sem verificação contra a hipótese efetivamente usada pelo gerador.

As revelações sobre reversões foram contadas separadamente: 24/48 registros diretos afirmam expressamente ocorrência ou ausência de “decision reversal”, exatamente nos mesmos 24 IDs acima. B011 e B048 afirmam ocorrência e os outros 22 afirmam ausência. Além disso, 21/48 memorandos afirmam expressamente reversão ou ausência de reversão do memorando, e 14/48 anúncios afirmam expressamente reversão ou ausência de reversão pública. A contagem do memorando inclui “memorandum reverses” e exclui B048, cuja expressão “reversed actual decision” se refere à decisão anterior. A contagem pública inclui B042 (“This reverses the position recorded in the staff memorandum”). Não há exposição de valores numéricos dos uniformes. As reversões dos elos M e P já podem ser inferidas das respectivas divergências observáveis, de modo que essas narrativas não têm o mesmo conteúdo informacional que revelar H ou a reversão da decisão. Ainda assim, identificam explicitamente o mecanismo estipulado e devem ser distinguidas de documentos que apenas registram posições.

Não observei valores privados de payoff nos anúncios públicos, pessoas históricas nomeadas ou citações históricas atribuídas. Essas verificações são semânticas e locais. Não verificam se o gerador respeitou os uniformes fornecidos, se os textos correspondem aos estados de referência ou se houve detecção de falhas. Os documentos são sintéticos. A aprovação das tabelas autoriza seu uso como funções dos observáveis, mas não valida historicamente as hipóteses nem elimina a revelação de H na prosa. Nenhum arquivo de análise, documento de entrada ou modelo foi alterado.

Foram executadas verificações da enumeração completa dos 16 estados, reconstrução das 12 tabelas, equivalência das partições, domínio binário dos 192 códigos, 48 IDs únicos em ordem e preservação das dez divergências. O CSV foi preparado sem acesso à verdade. Os hashes abaixo identificam os únicos cinco arquivos de entrada consultados.

Tabela 4. SHA-256 dos arquivos de entrada.

| Arquivo | SHA-256 |
|---|---|
| `foundations.txt` | `ededcec40cc59d674475fb544ded856518e43d1255b6746c2b80fbb514b10c7b` |
| `data/states.csv` | `494205b4404e671da118ddb1101838870e6100537db06b48fd59f7c580825834` |
| `data/candidates.json` | `102283fdc60b88b1b8c5d85b581a07bf7fc9508c12cb997ea3ff6b448f9c0845` |
| `raw/select/answer.json` | `1b55eaeff1063a035106b05e392d22733db44a8b5917edf4a96e59763a14cc83` |
| `data/blind_documents.json` | `f0df29167a2993db80347ca97653bded23b934b130c30f4cf52637c7c2d3ffdd` |
