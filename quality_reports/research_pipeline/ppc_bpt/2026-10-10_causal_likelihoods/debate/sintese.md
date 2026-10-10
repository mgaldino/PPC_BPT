# Dez contribuições e decisões do debate

As tarefas foram lançadas como dez subagentes distintos nesta rodada, em ondas que respeitaram o limite de três ativos além do coordenador. Foram trocadas mensagens diretamente entre proponentes, e seus relatórios foram disponibilizados aos participantes seguintes. Implementação (09) e revisão independente (10) ficaram separadas. Não foi um painel de especialistas humanos e a concordância dos agentes não é calibração.

| Agente | Mandato | Resultado que mudou ou restringiu a proposta |
|---|---|---|
| 01 — fontes | Procurar informação causal e numérica primária | Localizou emails BP2017 e estratégia BP2019; corrigiu leitura API; nenhum denominador SA/CA certificado |
| 02 — identificação | Formalizar o problema mantendo mecanismos | Demonstrou escala livre dado BF; completou família E3 e envelope |
| 03 — elicitação | Construir instrumento sem simular especialistas | Separou fato, julgamento e campos ausentes; negou que consenso meça taxas causais |
| 04 — estrutura | Tentar derivar probabilidades de payoffs | Demonstrou necessidade de payoffs completos e regra/erro de decisão; valores monetários não bastam |
| 05 — empiria | Tentar construir calibração por episódios | Propôs painel firma–política–decisão, encontrou fonte legislativa mas não comprovou ligação ao memo; não juntou dados indevidamente |
| 06 — completamento | Identificar informação adicional mínima | Âncora absoluta ou BF do complemento; limite necessário de 6,82% no exemplo; generalização para categorias |
| 07 — adversarial | Desafiar identificação e utilidade do PPC | Confirmou álgebra; restringiu claim a família condicional; advertiu raridade por granularidade e ausência de diagnóstico global |
| 08 — literatura | Verificar precedentes e contribuição | Localizou PPC/PT e justificação de modelos em Humphreys–Jacobs; recomendou intervalo inicial cego ao limiar |
| 09 — implementação | Executar cálculo reprodutível em R | Resultados exatos, grid de especificações sem prior oculto, figura e fronteira |
| 10 — auditoria | Revisar fontes, texto e matemática independentemente | Conferência independente e escopo documentados em agents/10_audit.md |

## Rodadas e contestação

**01–03:** o grupo recusou transformar McCoy/API em frequências condicionais sem denominadores ou canal de comunicação. Houve contestação explícita da suposta ordem lógica P(admissão|SA)≥P(admissão|CA). A ocorrência de uma fala não fixa sua probabilidade nos dois mundos.

**04–06:** a rota de payoffs foi testada como alternativa à elicitação direta. Mesmo um payoff conhecido precisa de regra de decisão; os documentos ainda não dão o payoff completo. A rota empírica evita rótulos definidos por Y, mas não encontrou dados elegíveis suficientes. O grupo preferiu uma âncora absoluta ao BF do complemento heterogêneo.

**06–08:** a proposta de E3 foi aceita apenas como demonstração de completude preditiva. O evento é retrospectivo e detalhado; sua raridade não implica erro de mecanismo. Discutiu-se risco de o limiar induzir julgamentos convenientes. A solução adotada pede o intervalo primeiro, com analista cego à conclusão, e só depois discute a precisão necessária.

**Coordenação e fontes originais:** a leitura do apêndice FC revelou HR como explicação distinta de SA e confirmou condicionamento sequencial. A síntese incorporou ambos. Os pesos centrais foram mantidos como julgamentos publicados, e não rebatizados como estimativas empíricas.

**09–10:** implementador entregou código e resultados; revisor usou cálculos independentes e conferiu arquivos. O coordenador verificou fontes externas e layout. Nenhuma dessas verificações substitui elicitação humana ou validação causal.

## Decisões finais

1. Rejeitar a substituição do BPT por modelo de assinaturas.
2. Rejeitar números pontuais sem origem, rótulos de mecanismo derivados de Y e priors ocultos sobre o grid.
3. Entregar o exemplo causal E3 como família de distribuições e checks, com gerador auxiliar explícito.
4. Recomendar coleta/elicitação de âncora absoluta e propagação por conjunto, evitando uma falsa precisão central.
5. Declarar a lacuna remanescente: não há exemplo empírico pontual completo sob SA/CA produzido pelas fontes atuais. A hipótese de publicação exige evidência adicional de utilidade.
