# Auditoria independente da codificação

Foram codificados os 35 pares pela prosa explícita. Há cinco pares com decisões interna e pública divergentes e um par sem informação sobre o aviso e a decisão interna. A divergência entre documentos foi preservada, sem transformá-la em ambiguidade.

## Escopo e procedimento

- Fonte exclusiva: `data/independent_audit_input.json`.
- SHA-256 da fonte lida: `77f4739888763e78f8e81a4c053c125efea3ca3117ef493903ab55e4773ddcec`.
- Leitura e codificação independentes, em 11 de outubro de 2026, sem consulta a outros dados, scripts, respostas, mapas, regras locais, relatórios ou fontes externas.
- Todos os 35 pares são expressamente rotulados como sintéticos. Esta auditoria verifica a leitura dos documentos e seus limites, sem validar uma história real.
- `shock=regulatory` significa redução da carga da alternativa regulatória. `shock=competitive` significa redução do benefício competitivo. `unknown` indica que a dimensão reduzida não é recuperável.
- `internal_support` e `public_support`: `1` para manter apoio, `0` para retirar ou encerrar apoio e `-1` quando a decisão correspondente está ausente ou ambígua.
- A codificação das decisões utiliza verbos explícitos de apoio ou retirada. Nem o payoff nem um rótulo de hipótese substituem a decisão registrada.
- Nos 34 tipos conhecidos, a dimensão alterada ou revisada é identificada diretamente na prosa. Nenhum código depende de inferir o canal do aviso pela constância da outra dimensão ou pela regra estrutural de que exatamente uma dimensão caiu. O corpus fornecido não contém um caso em que apenas a constância da outra dimensão permita essa inferência. Caso o contivesse, a codificação estritamente textual seria `unknown`, com eventual inferência condicionada à regra registrada separadamente nas notas.
- Os códigos foram anotados manualmente. O Python foi utilizado apenas para serialização, contagens, hash e verificações estruturais.

## Contagens

| Campo | Código | Número |
|---|---|---:|
| Tipo de aviso | regulatory | 17 |
| Tipo de aviso | competitive | 17 |
| Tipo de aviso | unknown | 1 |
| Decisão interna | 1: mantém apoio | 12 |
| Decisão interna | 0: retira apoio | 22 |
| Decisão interna | -1: desconhecida | 1 |
| Decisão pública | 1: mantém apoio | 16 |
| Decisão pública | 0: retira apoio | 19 |
| Decisão pública | -1: desconhecida | 0 |

| Decisão interna | Decisão pública | Pares |
|---|---|---:|
| Mantém | Mantém | 11 |
| Retira | Retira | 18 |
| Retira | Mantém | 4 |
| Mantém | Retira | 1 |
| Desconhecida | Mantém | 1 |

Das 70 decisões documentais possíveis, 69 têm codificação definida e uma é desconhecida. Há uma classificação desconhecida de tipo de aviso. Ambas as lacunas pertencem a `BLIND_103`. Não foram encontrados outros enunciados indecidíveis de apoio ou retirada.

## Casos que exigem preservação da evidência

1. **Contradição entre documentos:** `BLIND_026`, `BLIND_137`, `BLIND_109` e `BLIND_085` registram retirada no memo e manutenção na nota. `BLIND_110` registra manutenção no memo e retirada na nota. São cinco divergências textuais explícitas. Os documentos não explicam se decorrem de comunicação estratégica, mudança posterior ou erro, portanto a auditoria não adjudica sua causa.
2. **Decisão contrária ao payoff narrado:** `BLIND_099` mantém apoio apesar do payoff negativo. `BLIND_029` retira apoio apesar do payoff positivo. Ambos têm decisão explícita, por isso não receberam `-1`.
3. **Ausência de registro:** `BLIND_103` declara indisponíveis o aviso e a decisão interna. Sua nota pública anuncia apoio. Os códigos são `unknown,-1,1`.
4. **Outra dimensão omitida:** `BLIND_129`, `BLIND_026`, `BLIND_058`, `BLIND_025`, `BLIND_019`, `BLIND_112`, `BLIND_099`, `BLIND_117` e `BLIND_085` identificam a dimensão do aviso, mas não mencionam a outra dimensão. Nesses nove casos, é possível codificar o tipo de aviso. Não é possível confirmar pela prosa que a outra dimensão ficou constante.
5. **Outra dimensão nomeada de modo incompleto:** `BLIND_076` registra que o “other private benefit” ficou inalterado, sem identificá-lo expressamente como ganho competitivo. O tipo regulatório do aviso é explícito.
6. **Documentos abreviados:** `BLIND_033` e `BLIND_109` identificam claramente a dimensão reduzida e a outra dimensão constante. Foram codificados pelo conteúdo da redução. Não mencionam expressamente a chegada de um aviso, os dias ou o caráter privado. A codificação do tipo de choque não certifica essas propriedades ausentes.
7. **Valores incompletos:** `BLIND_095` não informa a magnitude da redução regulatória. `BLIND_130` diz que a carga alternativa não mudou, mas não informa seu valor. Esses limites não tornam ambíguos o tipo de aviso ou as decisões.

## Alegações causais, privacidade e certeza

**Causalidade.** Vários memorandos conectam mudanças de avaliações, cálculos de payoff e decisões com palavras como “therefore”. Trata-se de uma explicação produzida dentro do documento sintético. A auditoria não a transforma em evidência empírica de que o aviso causou a decisão, de que uma motivação é verdadeira ou de que um mecanismo histórico foi identificado. Uma decisão explícita pode ser codificada mesmo quando contraria o cálculo mencionado. As cinco divergências entre memo e nota tampouco identificam, sozinhas, o motivo da divergência.

**Privacidade.** Nas 35 notas públicas fornecidas, não aparecem os valores privados de benefício ou carga regulatória nem os detalhes do aviso. Diversas notas dizem expressamente que informações comerciais ficam confidenciais. Isso sustenta apenas a constatação de ausência desses detalhes no texto observado. Não demonstra que nunca houve divulgação em outro lugar. Os pares não contêm nomes ou dados pessoais identificáveis de pessoas reais. Os textos sintéticos do memo, inclusive aqueles sem declaração explícita de sigilo, continuam sendo documentos fornecidos ao auditor.

**Certeza e cegamento.** Expressões como “reliable notice” e afirmações numéricas são premissas narrativas dos textos, sem evidência externa nesta auditoria. Não podem fundamentar conclusão de confiabilidade real. Há pistas visíveis sobre o racional substantivo em `BLIND_055` (“alternative-burden rationale”) e em `BLIND_005` e `BLIND_117` (“competitive-advantage assessment”). Outros cinco pares apresentam o marcador `[HYPOTHESIS LABEL REDACTED]`. Essas pistas não foram utilizadas para inferir a decisão. O escopo cego observado consiste na ausência de acesso a códigos prévios, mapas e resultados, não na ausência de toda pista substantiva no próprio texto.

## Verificações e limites

A serialização confirmou 35 linhas, identificadores únicos, mesma ordem da entrada, correspondência exata dos identificadores, domínio dos códigos e cinco divergências entre decisões conhecidas. As notas do CSV registram a evidência textual e as lacunas por par. Não foi calculada concordância com qualquer codificação anterior, pois ela não foi acessada. A tabela de pares acima descreve somente a relação entre a decisão interna e a decisão pública desta leitura.
