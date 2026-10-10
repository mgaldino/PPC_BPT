# Agente 07 — auditoria adversarial da solução causal

Data: 2026-10-10. Escopo: testar se a conclusão de não identificação é excessivamente pessimista e se o exemplo E3 de Fairfield–Charman pode entregar um PPC do BPT legítimo. Li integralmente as notas 01–05 (trechos finais de 02 separados após truncamento da leitura conjunta), as definições SA/CA e o E3 no texto integral local de FC. Debati diretamente com 06. Não alterei manuscrito nem executei análise R.

## Veredito

**A família E3 é uma adaptação matematicamente legítima, porém entrega um PPC parcialmente identificado de uma conclusão BPT existente, não likelihoods absolutas extraídas das fontes.** Seu valor é tornar observável a informação que o argumento relativo não determina. Não satisfaz a exigência mais forte de um PPC causal pontual validado empiricamente. O relatório deve dizer isso antes das contas.

A proposta anterior de assinaturas não cumpria o alvo causal. E3 preserva as hipóteses originais SA/CA e o evento composto cujo peso FC realmente julgam. Portanto avança em direção ao alvo correto. A divergência não deve ser escondida com a frase “agora resolvemos completamente”: o intervalo amplo é a resposta matemática à informação disponível, e a probabilidade pontual exigiria uma âncora adicional.

## 1. Correspondência das hipóteses

No texto FC, SA envolve apoiar políticas moderadas para evitar custos regulatórios maiores; CA envolve ganhos competitivos ou novas oportunidades percebidas. A distinção discutida pelos autores é custo líquido versus benefício líquido da política apoiada, dados contexto e alternativas. Uma política pode gerar custo direto e benefício líquido via competidores. Uma motivação reputacional associada à inviabilidade de aprovação não deve ser identificada automaticamente como SA.

E3 é o pacote inteiro de evidência relativo ao CLC em 2017: empresas, desenho do imposto, eliminação de regulação, waiver de responsabilidade e contribuições. O peso de aproximadamente 12 dB é o julgamento publicado de FC para esse pacote. Não se transfere para a frase “há waiver”, para uma única empresa, para o documento API2021 ou para uma categoria geral de “apoio condicional”. As descrições primárias citadas por FC e seu julgamento de 12 dB são camadas distintas.

## 2. O que a normalização resolve

Com r=10^(12/10), a=P(E3|SA,C), b=P(E3|CA,C), a/b=r, a família (a,b)=(rt,t), 0<t≤1/r, é normalizada pelos complementos (1−a,1−b). Logo cada t fixo define duas Bernoulli válidas. A normalização impõe limites, mas não escolhe t. Não existe operação aritmética que transforme só o 12 dB em duas probabilidades únicas.

Se o argumento é sequencial, C fixa o prefixo E0,E1,E2; os demais likelihood ratios precisam ser lidos como condicionais na ordem usada, ou reconstruídos explicitamente como tal. A posterior publicada de 4 dB implica w=P(SA|D)=0,7152527510. Um gerador para uma nova emissão do mesmo evento, independente do E3 original e do E4 original dado H,C,t, produz

q(t)=P(Yrep=1|D,C,t)=[wr+(1−w)]t.

Assim 0<q≤0,7332190879. A amostragem de H da posterior seguida de Yrep da Bernoulli apropriada é legítima. Sortear t uniformemente no intervalo criaria um prior sem suporte documental. Se t for um parâmetro desconhecido em um único modelo Bayesiano, é necessário especificar e atualizar seu prior; “variar t entre modelos completos” é uma análise diferente.

## 3. Pode chamar isso de PPC?

Sim, com rótulo preciso: **família de checagens preditivas posteriores condicionais do evento E3**, indexada por t. O uso de H|D que já incorpora E3 é compatível com PPC ordinário e precisa ser declarado. Não há validação fora da amostra.

São quatro requisitos essenciais:

1. Definir o experimento replicado: uma nova emissão do evento composto sob o contexto fixado, e não uma nova história mundial vagamente semelhante.
2. Acrescentar explicitamente a independência da réplica condicional em H,C,t. Essa é uma hipótese do gerador proposto, não descoberta no texto.
3. Completar coerentemente as distribuições ao longo das histórias não observadas se o objetivo for um gerador do conjunto E1–E4. Para a fórmula marginal E3 condicionada no prefixo, somente o subgerador explicitado é necessário.
4. Reconhecer T(Y)=Y como discrepância unilateral de presença do evento. Não é teste geral de adequação do mecanismo.

**Cuidado adicional:** a probabilidade pequena de uma descrição historicamente muito específica não é, por si só, uma discrepância substantivamente relevante. A granularidade do evento importa. Se dividirmos uma categoria em muitas variantes, cada variante pode ter probabilidade pequena num modelo adequado. Para usar o número como diagnóstico de inadequação, o evento e a direção do check precisam representar uma expectativa substantiva identificável. Uma posterior predictive probability de E3 é calculável; um diagnóstico de má adequação exige justificar por que E3 deveria concentrar massa sob uma explicação adequada.

Não é lícito coarsenizar E3 para resolver esse problema e conservar automaticamente o mesmo BF de 12 dB. O evento mais amplo teria de receber nova análise de likelihood.

## 4. Informação adicional mínima

Com r e w tratados como fixos, basta uma âncora escalar do MESMO evento e contexto:

- uma probabilidade absoluta a ou b, apoiada em calibração ou elicitação documentada;
- ou uma probabilidade preditiva absoluta sob uma mistura de H com pesos conhecidos;
- ou o BF do complemento exato r0=(1−a)/(1−b).

No último caso, b=(1−r0)/(r−r0), a=rb. Para r>1 e eventos possíveis, a coerência exige 0≤r0<1, com atenção aos limites. R0 não é 1/r por definição. As alternativas contidas no complemento precisam ter pesos; sua mera enumeração não gera esses pesos.

Debate com 06: ele confirmou que não há complemento operacional de E3 ancorado por novas fontes. A negação de uma narrativa composta contém coalizões, instrumentos, valores, apoios e canais documentais heterogêneos. Portanto “elicitar o complemento” é uma pergunta adicional concreta, mas não uma solução empírica já executada.

Um aprimoramento útil é pedir somente a precisão necessária para o diagnóstico. Escrevendo q=0,7332190879a, excluir q<0,05 requer justificar a≥aproximadamente 0,06819244. Esse número é um limiar de sensibilidade derivado, não uma taxa fornecida pela fonte. “Highly plausible” no texto não autoriza assumir a>0,5 nem mesmo a>0,0682 sem esclarecer o evento e o processo de julgamento. O corte 0,05 também é convenção diagnóstica, sem calibração frequentista automática.

## 5. A adaptação produz um método útil agora?

Sim, se o produto for explicitamente **análise de identificação preditiva**:

1. Preservar H, evento e contexto da BPT original.
2. Inventariar exatamente quais razões, probabilidades, intervalos ou restrições as fontes e julgamentos sustentam.
3. Construir o conjunto de distribuições conjuntas compatíveis, incluindo seleção e dependência.
4. Calcular envelopes de checks e identificar a âncora cuja precisão altera o diagnóstico.
5. Solicitar/coletar essa informação, em vez de solicitar dezenas de probabilidades sem finalidade definida.

O resultado E3 é inconclusivo para uma regra usual de cauda pequena, pois o envelope cruza valores próximos de zero e valores ordinários. Não é evidência de adequação de SA, de CA ou da mistura.

Há situações nas quais o limite superior sozinho é informativo. Para r≥1, q≤w+(1−w)/r. Se esse limite for pequeno, toda especificação compatível prevê raramente o evento. Para um corte α, isso exige w<α e r≥(1−w)/(α−w). Trata-se de um resultado algébrico útil sem escolher t. O caso E3 não satisfaz tal condição. R permanece um julgamento ou estimativa cujo suporte e incerteza também devem ser incorporados.

Mesmo múltiplos BFs não resolvem automaticamente a escala: para K resultados mutuamente exclusivos e exaustivos, conhecer r_k=p_SA,k/p_CA,k produz as equações Σp_CA,k=1 e Σr_k p_CA,k=1; em geral restam K−2 graus de liberdade. Normalizar os r_k como se fossem probabilidades impõe silenciosamente uma distribuição basal. O caso binário com ambos os BFs não degenerados é especial.

## 6. Proposta realista de artigo

Não reivindicar novidade para a distinção entre comparação relativa e ajuste absoluto, para PPC ou para probabilidades imprecisas. A contribuição potencial específica é uma metodologia de completamento preditivo para BPT: condições mínimas, informação faltante, envelopes e elicitação direcionada por limiares de diagnóstico. Seu mérito precisa ser demonstrado além da álgebra em um caso onde uma âncora empiricamente defensável estreite o envelope.

O caso atual fornece uma demonstração auditável de insuficiência de uma BPT relativa para PPC e um desenho de coleta/elicitação. Ainda falta uma demonstração empírica de que o procedimento produz diagnóstico substantivo robusto. Afirmar que o procedimento garante publicação na Political Analysis ou que está empiricamente validado seria indevido.

## Classificação adversarial final

- Família Bernoulli (rt,t): CONFIRMADA matematicamente.
- Posterior original preservada por fatores comuns ao longo da trajetória observada: CONFIRMADA sob a representação sequencial condicional explicitada.
- Envelope até 0,733219: CONFIRMADO pela álgebra.
- Interpretação como PPC condicional do evento composto: PARCIAL; legítima após acrescentar protocolo e independência da réplica, não justificados exclusivamente pelas fontes.
- Interpretação como probabilidades SA/CA estimadas dos documentos: REFUTADA.
- Interpretação como diagnóstico validado de inadequação causal no caso: REFUTADA.
- Possibilidade de uma âncora extra produzir PPC pontual ou envelope informativo: CONFIRMADA matematicamente; empiricamente ainda NÃO RESOLVIDA.
