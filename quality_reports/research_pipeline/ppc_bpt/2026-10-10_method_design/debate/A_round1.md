# Rodada 1 — resposta do proponente A

Data: 2026-10-10. Proposta independente preservada em `proposals/A_generative.md`. Esta nota incorpora a leitura posterior de B, C e `coordinator_checks.md`. Não houve implementação, simulação nem modificação do manuscrito.

## Posição de A depois da crítica

Aceito a distinção proposta pelo coordenador, B e C. Num corpus histórico finito, já produzido, com busca e codificação determinísticas, a resposta de um bloco ainda fechado é um fato fixo desconhecido. **O núcleo recomendado é a previsão epistêmica dessa resposta**, condicionada à informação disponível e ao protocolo. Sorteios de sua distribuição representam respostas possíveis à luz dessa informação; não repetem fisicamente a produção do arquivo.

Repetir produção, preservação ou acesso do mesmo documento define um experimento documental hipotético adicional. Esse PPC pode ser formulado, mas exige uma lei de replicação defensável e testa uma pergunta diferente. Nova mensuração por outro codificador pode ser repetível, porém não cria nova história nem uma testemunha substantiva independente. Um jornal copiando a mesma entrevista também não constitui nova oportunidade independente.

Portanto, a expressão de A “replicação epistêmica e observacional” precisa ser desdobrada na síntese: (a) previsão de resposta reservada como núcleo; (b) réplica de mensuração/documentação como extensão explicitamente justificada; (c) novo processo histórico como extensão ainda mais exigente. A normalização de uma tabela não decide qual dessas operações está sendo feita.

## Mínimo compatível entre A e B

Considere uma pergunta documental reservada com categorias `+`, `−`, `0`, `M`: vestígio afirmativo, vestígio contrário explícito, busca concluída inconclusiva e fonte inacessível. Definem-se probabilidades absolutas coerentes `p(Y_B|H,D,A)` para cada hipótese, ou uma classe explícita dessas probabilidades; combinam-se com o posterior das hipóteses. O nome `A` nesta fórmula denota o protocolo, não o agente.

\[
q(y\mid D,A)=\sum_h p(Y_B=y\mid H=h,D,A)\,p(H=h\mid D).
\]

Congelar as previsões, revelar/codificar a resposta e comparar com uma discrepância previamente escolhida constitui uma checagem preditiva holdout. Uma distribuição categórica finita já é um gerador; somar exatamente dispensa Monte Carlo. Não exige elos aleatórios dentro de uma configuração, não requer gerador textual e não identifica automaticamente um elo causal.

Para duas perguntas, especificar a tabela conjunta ou uma fatoração substantivamente defendida. Para perguntas sobre o mesmo evento, compartilhar estados latentes quando usados. Sem dependência conhecida, apresentar verificações marginais e limites, evitando um produto automático de probabilidades.

Esse mínimo permite concluir “o bloco previsto é surpreendente sob a especificação”. A conclusão “o elo X falhou” exige informação adicional. A vantagem da arquitetura A começa quando a separação entre estados históricos e observação introduz restrições verificáveis ou permite uma coleta nova que distingue as causas da discrepância.

## Pressupostos extras do exemplo A

O exemplo A possui 18 parâmetros categóricos livres, mais dois para `B` e três pesos, antes de impor igualdades: 23 números livres estipulados, não estimados com três oportunidades. A dimensão serve para mostrar um gerador completo, não para reivindicar identificação empírica. Nenhum desses números é uma estimativa do Chile.

Além do mínimo, o exemplo assume: posterior conjunto específico sobre `(R,L)`; distribuição de mobilização `B` condicionada a `L`; ausência de informação adicional sobre `B` em `D` depois de condicionar a `L`; independência condicional de três processos documentais após `(R,L,B)`; parâmetros conhecidos de acesso e classificação; e oportunidades definidas sem selecionar o resultado. Essas hipóteses precisariam de âncoras externas ou análise de sensibilidade. A relação `P(B|L)=.8/.1` é associativa no exemplo e não identifica o efeito causal de baixo benefício sobre mobilização.

Uma tabela agregada que marginalize exatamente `B` e os estados de A gera as mesmas previsões, o mesmo ajuste e os mesmos scores. Decompor não melhora matematicamente a previsão por si só. Ganhos precisam vir de elicitação mais disciplinada, compartilhamento de informação, restrições empiricamente úteis, menor custo ou diagnóstico validado. Quando esses ganhos não puderem ser demonstrados, o método deve permanecer como protocolo de desenho e auditoria.

## Crítica a B, concessão e resposta recebida

**Objeção B1.** No exemplo B, pacote documental completo e codificação perfeita não implicam registro perfeito das ações históricas. Para `L=0` significar ausência real de mobilização, falta assumir cobertura/detecção histórica perfeita, ou redefinir `L` como resposta documental. Esse é um pressuposto substantivo do gerador, não detalhe de implementação.

**Resposta B:** aceitou a objeção e informou que explicitaria registro, recuperação e codificação perfeitos no exemplo didático. Tratará esse caso como limite que isola apoio relativo versus surpresa; a aplicação real usaria as categorias `+/−/0/M` e separaria não mobilização documentada de não documentação. Objeção resolvida para a finalidade do exemplo, condicionada a esse esclarecimento.

**Objeção B2.** A discrepância `T=1{R=0,L=1}` avalia uma célula estreita. Precisa de justificativa substantiva anterior à abertura; não detecta, por exemplo, `(0,0)`. Uma massa pontual pequena em espaço amplo não basta, e escolher a célula mais rara depois de ver tabela/resultados mudaria a avaliação.

**Resposta B:** esclareceu que o alvo predefinido é decisão não reativa apesar de defesa empresarial persistente, que confronta as duas narrativas do exemplo. Aceitou declarar que `(0,0)` não está incluído e que uma bateria exigiria regra conjunta validada. A tabela completa já é exibida. Objeção resolvida como delimitação do alvo, sem reivindicar teste geral.

**Concessão A:** o exemplo B separa corretamente mudança relativa e inadequação absoluta: o resultado `(1,0)` tem probabilidade preditiva `.364`, enquanto o BF em favor do composto é `3.28`; seu posterior sobe de `.2` a `.164/.364≈.45055`. Não há evidência aritmética de discrepância forte apenas porque um rival ganhou apoio.

## Crítica a C, concessão e resposta solicitada

**Objeção C1.** Divergência mínima zero entre classes de mecanismos e parâmetros de observação impede distinção uniforme. Isso não torna todo o desenho inútil para previsões particulares ou regiões de parâmetros bem ancoradas. Uma classe de nuisance demasiado ampla pode tornar qualquer oportunidade minimax equivalente. Solicitei separar garantia robusta, utilidade preditiva esperada e condições que tornam o conjunto de modelos substantivamente defensável.

**Objeção C2.** FC com cenários explícitos e o mesmo kernel do modelo de A é um gerador equivalente por marginalização. Não deve ser um concorrente que o método pretende superar em ajuste. Solicitei prova de equivalência e comparação de workflows de especificação/elicitação, com dados e tempo iguais, incluindo benefícios e custos da coleta guiada pelo modelo documental.

**Concessão A:** os resultados R2/R3 de C e a métrica de localização errada são indispensáveis. Acerto de uma hipótese ou menor erro preditivo não bastam para validar atribuição da discrepância a um elo. A sobreposição observacional entre mecanismo e detecção deve aparecer entre os resultados negativos do estudo.

**Resposta C1:** C aceitou que a divergência mínima zero impede distinção uniforme, preservando utilidade em estados ou subconjuntos bem ancorados. `Gamma` deve ser fixado por conhecimento ou validação externa antes do holdout. Se o maximin for trivial, relatar separação condicional em subconjuntos transparentes, sem estreitar a classe apenas para obter resultado. Objeção resolvida com essa restrição.

**Resposta C2:** C aceitou prova de equivalência dos geradores com mesma distribuição conjunta e benchmark de workflows de elicitação, restrições e coleta, com dados e tempo iguais. Reduziu a grade inicial a quatro DGPs: correto, mecanismo errado, detecção errada e dependência errada; extensões dependem do aprendizado dessa primeira comparação. Objeção resolvida; os resultados do benchmark permanecem trabalho futuro.

## Verificações e limites

Os três proponentes conferiram por inspeção as marginais sintéticas de A: `.590`, `.3704`, `.2205`, silêncio `.184/.268`, e exemplo de escalas absolutas `.68/.034`. A conferência é aritmética, não calibração das probabilidades. B foi verificado analiticamente nesta rodada. `A_findings.json` foi validado por parse JSON em orquestração de ferramentas; oito candidatos presentes. A referência ao quadro CausalQueries foi corrigida de linha 96 para linha 95. Nenhum teste empírico foi executado.
