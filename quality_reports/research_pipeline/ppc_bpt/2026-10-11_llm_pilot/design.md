# Desenho congelado antes das gerações

Data: 11/10/2026. Piloto exploratório autorizado pelo usuário. Fontes reais já examinadas; nenhuma é holdout. Nenhuma probabilidade a seguir foi estimada dessas fontes.

## Modelo e unidade

Uma réplica é um mundo com uma proposta federal de precificação e uma decisão coletiva de uma coalizão de quatro firmas de energia. Não são quatro observações independentes. SA significa Strategic Accommodation; CA, Competitive Advantage. Este é um novo modelo didático que simplifica E3, não a reprodução da likelihood de Fairfield e Charman. Q indica oferta de substituição de regras regulatórias; K indica oportunidade de ganho competitivo líquido previsto; A indica adesão coletiva. As duas hipóteses diferem na sensibilidade da decisão aos incentivos. Não são tipos determinísticos puros e não esgotam as explicações históricas.

Q e K são Bernoulli(0,5), independentes. P(A=1|SA,Q,K)=0,1+0,6Q+0,1K; P(A=1|CA,Q,K)=0,1+0,1Q+0,6K. Prior P(SA)=0,5. Parâmetros fixos por escolha didática; só H é atualizado. Cada mundo produz memorando interno e nota pública, ambos sintéticos, no máximo 45 palavras cada. Memorando explicita Q,K,A; nota pública explicita Q,A e não deve apresentar K como fato público. O canal assume documentação completa e fiel. Não há arquivo perdido nem seleção neste piloto. Essa simplificação delimita sua validade.

Q,K são possibilidades abstratas para auditar o simulador, não inferências de que existiram oportunidades equiprováveis no caso histórico. Modelo causal probabilístico: H,Q,K -> A; Q,K,A -> documentos -> codificação. A estrutura causal é assumida, não identificada pela distribuição observacional.

## Três braços e chamadas

A: LLM recebe distribuição e amostra 32 mundos por hipótese, em quatro chamadas novas de oito mundos, sem ferramentas/RNG externo. Não impor quotas; documentar dependência potencial dentro da chamada. B: R sorteia 32 mundos por hipótese com seed 20261011; LLM apenas redige, sem rótulo H ou probabilidades. C: os exatos mesmos estados de B são redigidos por templates determinísticos. A e B usam o mesmo modelo e configuração. Nenhuma tentativa inválida será apagada nem substituída silenciosamente.

CLI codex 0.144.1, modelo solicitado gpt-6-sol (alias, snapshot interno não fornecido), esforço low, autenticação ChatGPT. Chamadas novas sem histórico de conversa, diretório temporário vazio, instrução de não usar ferramentas. Logs auditados para uso de ferramentas. Não há seed de amostragem do LLM ou temperature configurável neste fluxo; preservar saídas brutas. O ambiente CLI pode incluir instruções sistêmicas não controladas. R gera os estados de B/C e referências exatas, jamais estados de A.

## Auditoria congelada

Comparar marginais Q,K,A, conjuntas Q*A e K*A e oito células Q,K,A aos valores analíticos. Relatar erros e TV (distância de variação total). N pequeno e quatro blocos por hipótese: frequências descritivas, intervalos por bootstrap de chamadas exploratórios, sem certificar equivalência ou usar n=32 como independência garantida do LLM. Referência multinomial iid serve somente como benchmark condicionado à independência, não como prova.

Codificador separado em chamadas novas recebe somente documentos com IDs embaralhados, sem braço/H/estado. Recupera Q,K,A (0,1 ou -1 indeterminado) e registra contradições/invenções. Codificação com mesmo modelo não equivale a validação humana independente. Controle: duas contradições deliberadas e um caso ambíguo fora da amostra principal. Auditoria adicional de subagente verifica amostra e exemplos de falha.

Critério técnico provisório para renderização: nenhum bit invertido/indeterminado e nenhuma contradição grave observada; relatar falhas, sem pós-seleção. Não estimar limite binomial de erro com mundos do mesmo bloco como iid. Mesmo êxito não prova fidelidade fora desses estados/textos curtos. Controle determinístico adicional A: quatro mundos com Q=1,K=0,A=1, probabilidades 0/1.

## PPC

E observado coarsened=(Q=1,A=1), codificado do relato de E3 em FC pp.12–13: pacote de substituição regulatória e adesão da coalizão. K é desconhecido. O E3 original também contém preço, compensações jurídicas e financiamento; essas partes não estão representadas. Likelihoods exatas P(E|SA)=0,375, P(E|CA)=0,25. Posterior P(SA|E)=0,6. Não reutilizar BF12dB nem posterior71,5% do modelo original.

Principal: replicar Q,K,A e calcular discrepância unilateral T=Q+A. Tobs=2. P(Trep>=2|E)=0,325. É um PPC finito exato sob o modelo declarado; não é probabilidade de a hipótese ser verdadeira. Mostrar versões por hipótese e reconstrução a partir dos documentos dos três braços. Os pesos0,6/0,4 aplicados ao braço A são teste da aproximação do gerador pretendido. Se divergir, não chamar a mistura de PPC exato do simulador implícito. Mostrar separadamente posterior/PPC plug-in recalculados com likelihoods empíricas de A, enfatizando incerteza e reutilização Monte Carlo.

Secundário: condicionando a mesma proposta Q=1, replicar somente K,A. Posterior ainda0,6; P(Arep=1|E,Qrep=1)=0,65. Objeto diferente, não seleção de resultado. Sensibilidade dos pesos da regra de decisão é analítica, não ajuste aos resultados do LLM. Um caso não oferece poder para certificar adequação.

## Implicações novas

Chamada independente de descoberta recebe mecanismo e contexto genérico, sem documentos históricos nem números dos resultados. Solicitar cinco implicações observáveis adicionais, premissas necessárias, rival e fonte a buscar; não fabricar citações. Separar consequências dedutíveis do modelo, sugestões auxiliares e redundâncias. Avaliadores examinam se são operacionalizáveis, novas em relação aos inputs e sustentadas por fontes já disponíveis. Confronto retrospectivo é ilustração, nunca validação em holdout. Não adicionar sugestões ao PPC confirmatório desta rodada. Promessas históricas ou quantitativas adicionais sem sustentação serão recusadas.

## Debate e entregas

Arquitetura, validação e redteam debateram definição do terceiro braço, unidade, compatibilidade posterior/gerador e condicionamento em Q. Decisão: templates como C, coarsening explícito, PPC conjunto principal e condicional secundário, sem calibração histórica. Entrega: dados brutos, prompts, script R separado, scripts Python de execução/codificação, relatório PDF, auditoria independente. Nenhuma edição no manuscrito.
