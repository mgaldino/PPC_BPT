# Reflexoes sobre Hipoteses como Configuracoes de Mecanismos

**Data:** 2026-03-06
**Status:** Notas de trabalho — base para rewrite do paper

---

## 1. A critica originaria

Em PPC quantitativo, integra-se sobre o espaco de **parametros** dentro de um modelo fixo:

$$p(y^{rep}|y) = \int p(y^{rep}|\theta) p(\theta|y) d\theta$$

No paper atual (paper_draft_v1.md), a formula qualitativa integra sobre **hipoteses**:

$$P(e^* | \mathbf{e}_{obs}) = \sum_{i=1}^{K} P(e^* | H_i) \times P(H_i | \mathbf{e}_{obs})$$

O problema: hipoteses em BPT sao mais como **modelos** do que como **parametros**. Cada hipotese postula um mecanismo causal distinto — uma historia gerativa diferente. A formula do paper e estruturalmente identica a Bayesian Model Averaging (BMA), nao a PPC dentro de um modelo.

Pergunta: seria possivel extrair "parametros" de dentro de cada hipotese? E o que seriam esses parametros?

## 2. Resposta: mecanismos como elos binarios

Cada hipotese pode ser decomposta em uma **cadeia de elos causais** (mechanism steps). Cada elo e binario: presente (1) ou ausente (0). O "espaco de parametros" de uma hipotese e o conjunto $\{0,1\}^n$ de configuracoes dos seus $n$ elos.

Isso permite:
1. Integrar sobre incerteza nos elos *dentro* de uma hipotese (analogo a PPC quantitativo)
2. Hipoteses diferentes podem **compartilhar elos** (analogo a modelos quantitativos compartilhando variaveis)
3. Diagnosticos mais finos: identificar *qual elo* falha, nao apenas *qual hipotese*

## 3. Decomposicao dos casos

### 3.1 Chile — H_EA (Equity Appeal)

Definicao de FC: "Lagos's equity appeal, in the context of high issue-salience, drove the right to accept the reform via concern that rejection would damage Lavin's candidacy."

Decomposicao em elos:

| Elo | Descricao | Evidencia original que testa |
|-----|-----------|------------------------------|
| $m_1$ | Desigualdade ganha saliencia publica (bispos, campanha) | $E_0$ |
| $m_2$ | Lagos emite desafio publico com frame de equidade | $E_0$ |
| $m_3$ | Lideranca da direita percebe ameaca eleitoral em rejeitar | $E_4$, $E_5$ |
| $m_4$ | Lideranca politica sobrepoe-se a resistencia tecnica/ideologica (ILD) | $E_4$ |
| $m_5$ | Bancada segue a lideranca e vota a favor | $E_5$ (observado) |

Mecanismo completo: $m_1 \wedge m_2 \wedge m_3 \wedge m_4 \wedge m_5$

Espaco de configuracoes: $2^5 = 32$

### 3.2 Chile — H_CC (Core Constituency)

Definicao de FC: "The right accepted the reform because the preferences of its core constituency had changed. The material value of the 57 bis subsidy had declined."

| Elo | Descricao |
|-----|-----------|
| $m'_1$ | Valor material do 57 bis declina ao longo do tempo |
| $m'_2$ | Constituency da direita (investidores ricos) torna-se indiferente ao subsidio |
| $m'_3$ | Partido avalia subsidio como dispensavel *antes* do desafio de Lagos |
| $m'_4$ | Direita vota eliminacao sem pressao externa |

### 3.3 Chile — H_MV (Median Voter)

| Elo | Descricao |
|-----|-----------|
| $m''_1$ | Competicao eleitoral generica gera convergencia |
| $m''_2$ | Ambas coalizoes convergem para interesses do eleitor mediano |
| $m''_3$ | Eliminacao do 57 bis reflete preferencia do eleitor mediano |

### 3.4 Chile — H_composite (Equity Appeal + Low Stakes)

Esta hipotese surge naturalmente da decomposicao e foi identificada pelo PPC do paper atual (Finding 1, "low-stakes confound"):

$$H_{composite} = m_1 \wedge m_2 \wedge m_3 \wedge m_4 \wedge m'_1$$

Compartilha $m_1$--$m_4$ com $H_{EA}$ e $m'_1$ com $H_{CC}$. No framework de FC, isso seria uma "hipotese composicional" problematica. No framework proposto, e uma configuracao legitima no espaco de mecanismos.

### 3.5 Oil Majors — H_SA (Strategic Accommodation)

Definicao de FC: "Oil majors support moderate carbon pricing to hedge against or preclude more radical regulation — a defensive strategy."

| Elo | Descricao |
|-----|-----------|
| $m_1$ | Majors percebem ameaca regulatoria crescente |
| $m_2$ | Calculam que apoiar carbon price moderado e menos custoso que regulacao severa |
| $m_3$ | Apoio e condicional: carbon price *substituindo* regulacao, nao complementando |
| $m_4$ | Nao investem seriamente em negocios que dependem de carbon pricing existir |
| $m_5$ | Posicionamento publico ("responsible corporate citizen") como ferramenta retorica |

### 3.6 Oil Majors — H_CA (Competitive Advantage)

Definicao de FC: "Oil majors support carbon pricing because it creates competitive advantages — notably for natural gas over coal and for CCS — an offensive strategy."

| Elo | Descricao |
|-----|-----------|
| $m'_1$ | Gas natural tem vantagem carbonica sobre carvao; carbon pricing amplia essa vantagem |
| $m'_2$ | CCS cria mercados onde majors tem expertise geologica |
| $m'_3$ | Empresas fazem investimentos reais predicated on carbon pricing |
| $m'_4$ | Empresas genuinamente querem que carbon pricing seja aprovado |

### 3.7 Oil Majors — Heterogeneidade entre empresas

O Finding 2 do paper atual (company heterogeneity) torna-se natural:

- **ExxonMobil:** configuracao {$m_1, m_2, m_3, m_4, m_5$} — puro $H_{SA}$. McCoy confirma $m_4$ e $m_5$.
- **Equinor:** configuracao {$m_1, m_2, m'_2, m'_3$} — mix com elos de $H_{CA}$. Northern Lights confirma $m'_2$ e $m'_3$.
- **TotalEnergies:** possivelmente {$m_1, m'_1, m'_2, m'_3, m'_4$} — mais proximo de $H_{CA}$ puro.

No framework atual, essa heterogeneidade e uma observacao ad hoc. No framework proposto, sao configuracoes diferentes no mesmo espaco de mecanismos, cada uma com sua posterior.

## 4. PPC integrando sobre elos de mecanismo

### 4.1 Exemplo: Chile, $e^*_3$ (deliberacoes internas reativas)

Fixando $H_{EA}$, os "parametros" sao $(m_1, m_2, m_3, m_4, m_5) \in \{0,1\}^5$.

Posteriors sobre cada elo apos observar evidencia original:

- $P(m_1 | \mathbf{e}_{obs}) \approx 1.0$ (documentado: bispos + campanha)
- $P(m_2 | \mathbf{e}_{obs}) \approx 1.0$ (documentado: discurso Lagos)
- $P(m_3 | \mathbf{e}_{obs}) \approx 0.95$ ($E_4$: "perderemos votos"; $E_5$: "armadilha de 99")
- $P(m_4 | \mathbf{e}_{obs}) \approx 0.90$ ($E_4$: ILD overruled, mas evidencia indireta)
- $P(m_5 | \mathbf{e}_{obs}) \approx 1.0$ (votacao observada)

A predicao para $e^*_3$ depende crucialmente de $m_3$ e $m_4$:

- Se $m_3 = 1$ e $m_4 = 1$: $P(e^*_3 = \text{reativo}) = 0.95$
- Se $m_3 = 1$ e $m_4 = 0$: $P(e^*_3 = \text{reativo}) = 0.60$ (percepcao existiu, mas resistencia nao foi overruled — deliberacoes ambiguas)
- Se $m_3 = 0$: $P(e^*_3 = \text{reativo}) = 0.10$ (sem percepcao de ameaca, nao ha deliberacao reativa)

Integrando (assumindo independencia condicional entre elos):

$$P(e^*_3 = \text{reativo}) \approx 0.95 \times 0.95 \times 0.90 + 0.60 \times 0.95 \times 0.10 + 0.10 \times 0.05 = 0.812 + 0.057 + 0.005 = 0.874$$

Compare com o paper atual, que atribui $P(e^*_3 | H_{EA}) = 0.90$ diretamente. Numeros similares, mas a estrutura e diferente: aqui sabemos que a predicao e sensivel a $m_4$ (override), o que gera diagnostico mais fino.

### 4.2 Exemplo: Oil Majors, $e^*_5$ (admissao McCoy) dentro de $H_{SA}$

Posteriors sobre elos:

- $P(m_4 | \mathbf{e}_{obs}) = 0.50$ (evidencia original ambigua sobre se investem seriamente ou nao)
- $P(m_5 | \mathbf{e}_{obs}) = 0.85$ (advocacy publica observada)

Predicao para $e^*_5$:

- Se $m_4 = 1$ (nao investem seriamente) e $m_5 = 1$ (retorica): $P(e^*_5 = \text{admissao cinica}) = 0.85$
- Se $m_4 = 0$ (investem seriamente): $P(e^*_5 = \text{admissao cinica}) = 0.10$
- Se $m_5 = 0$ (sem posicionamento retorico): $P(e^*_5) = 0.05$

Integrando:

$$P(e^*_5) \approx 0.85 \times 0.50 \times 0.85 + 0.10 \times 0.50 \times 0.85 + 0.05 \times 0.15 = 0.361 + 0.043 + 0.008 = 0.41$$

**Muito diferente** do paper atual, que atribui $P(e^*_5 | H_{SA}) = 0.80$. A diferenca vem de $P(m_4) = 0.50$: a evidencia original era ambigua sobre esse elo. O paper trata $H_{SA}$ como monolitica e esconde a incerteza interna.

### 4.3 Exemplo: Oil Majors, $e^*_8$ (investimentos CCS) dentro de $H_{SA}$

- Se $m_4 = 1$ (nao investem seriamente): $P(e^*_8 = \text{investimento bilionario CCS}) = 0.10$
- Se $m_4 = 0$ (investem — versao "fraca" de $H_{SA}$): $P(e^*_8) = 0.60$

$$P(e^*_8 | H_{SA}) \approx 0.10 \times 0.50 + 0.60 \times 0.50 = 0.35$$

Paper atual atribui 0.40. Parecido, mas agora sabemos *por que* e intermediario: e a incerteza sobre $m_4$.

## 5. Analogia com modelos quantitativos: hipoteses compartilhando mecanismos

### 5.1 O paralelo

Em regressao Bayesiana:

- $M_1: y = \beta_0 + \beta_1 x_1 + \varepsilon$
- $M_2: y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \varepsilon$
- $M_3: y = \beta_0 + \beta_2 x_2 + \varepsilon$

Os modelos compartilham variaveis ($x_1$ em $M_1$ e $M_2$; $x_2$ em $M_2$ e $M_3$). Isso nunca impediu ninguem de calcular $P(M_k | \text{data})$, fazer BMA, ou fazer PPC dentro de cada modelo.

Traduzido para BPT:

- Os **mecanismos** (elos) sao as "variaveis"
- As **hipoteses** (configuracoes de mecanismos) sao os "modelos"
- Hipoteses diferentes podem compartilhar mecanismos
- A exigencia de mutual exclusivity aplica-se as **configuracoes**, nao aos **elos**

### 5.2 O problema composicional resolvido

FC argumentam que hipoteses composicionais ("A e B causaram") sao irrefutaveis. A decomposicao em mecanismos resolve isso:

1. Uma hipotese composicional nao e "A + B" de forma vaga. E uma *configuracao especifica* de elos: {$m_1, m_2, m_3, m_4, m'_1$}. Cada elo e testavel individualmente.

2. Mutual exclusivity esta preservada ao nivel das **configuracoes**. {$m_1, m_2, m_3, m_4$} e {$m_1, m_2, m_3, m_4, m'_1$} sao hipoteses distintas e mutuamente exclusivas.

3. Ninguem diria que $M_2: y = \beta_0 + \beta_1 x_1 + \beta_2 x_2$ e "irrefutavel" so porque inclui mais variaveis que $M_1$. A mesma logica aplica-se.

### 5.3 Exemplo concreto: Chile

No caso Chile, o PPC do paper atual ja identificou (Finding 1) que uma hipotese composta provavelmente explica melhor:

$$H_{composite} = m_1 \wedge m_2 \wedge m_3 \wedge m_4 \wedge m'_1$$

(equity appeal + declinio do valor material do subsidio)

Evidencia:
- $e^*_2$ (reformas comparativas): equity framing + high stakes → falha; equity framing + low stakes → sucesso. Sugere que $m'_1$ (declinio do valor) e parte da cadeia causal.
- $e^*_4$ (lobbying silence): business nao mobilizou porque subsidio era pessoal, nao corporativo — consistente com $m'_1$.

No framework de FC, isso e um achado ad hoc que sugere "considerar hipotese composta." No framework proposto, $H_{composite}$ e uma configuracao formal no espaco de mecanismos, com sua propria prior e posterior.

## 6. O que se preserva e o que muda em relacao a FC

### Preservado (core de FC):
- Bayes como logica para evidencia qualitativa
- Likelihoods explicitas (dB)
- Transparencia e auditabilidade
- Updating sequencial
- Weight of evidence como metrica

### Modificado:
- Unidade de inferencia: de "hipoteses monoliticas" para "configuracoes de mecanismos"
- Mecanismos podem ser compartilhados entre hipoteses
- Composicionalidade e formalizada (nao proibida)
- PPC opera em dois niveis: (a) sobre configuracoes (BMA), (b) dentro de configuracoes (sobre elos)

### Tabela comparativa

| | BPT atual (FC) | Paper atual (PPC v1) | Framework proposto |
|---|---|---|---|
| Unidade de analise | Hipoteses (monoliticas) | Hipoteses (monoliticas) | Configuracoes de mecanismos |
| "Parametros" | Nao ha | Nao ha | Elos binarios ($m_i \in \{0,1\}$) |
| Integracao | Sobre hipoteses | Sobre hipoteses (= BMA) | Sobre elos *dentro* de cada config + sobre configs |
| Compartilhamento | Proibido (rivais) | Proibido | Natural (como modelos compartilham variaveis) |
| Diagnostico | Nenhum | Qual hipotese falha | Qual *elo* do mecanismo falha |
| Composicionalidade | Rejeitada | Encontrada como achado empirico | Formalizada como configuracao |

## 7. Posicionamento estrategico do paper

### Framing escolhido: Opcao B (Reformulacao com PPC como consequencia)

"Propomos reformular BPT em termos de configuracoes de mecanismos. Isso torna hipoteses mais testaveis, permite composicionalidade controlada, e — crucialmente — permite PPC no sentido proprio."

### Relacao com criticas existentes

- **Zaks (2021):** "sem guardrails" — certa que algo faltava. Mas a solucao nao e abandonar BPT; e decompor mecanismos e usar PPC.
- **FC (2022, 2023):** certos que a solucao e bayesiana. Mas hipoteses monoliticas nao tem espaco de parametros para diagnostico.
- **Posicao do paper:** o debate era produtivo, mas ambos os lados nao foram longe o bastante. Preservamos o core de FC e resolvemos o problema de Zaks.

### Resistencia esperada de FC

Pontos de atrito:
1. Relaxamento da exigencia de hipoteses nao-composicionais
2. Critica implicita de que a construcao de hipoteses em FC e coarse demais
3. Uso dos proprios casos de FC para mostrar a limitacao

Defesas:
1. Configuracoes **sao** mutuamente exclusivas — a exigencia esta preservada ao nivel correto
2. A analogia quantitativa (modelos compartilhando variaveis) e inatacavel
3. A decomposicao e uma extensao natural, nao uma rejeicao
4. FC proprios reconhecem que hipoteses compostas podem ser adicionadas (FC 2022: 87) — apenas nao formalizam como

### Contra-argumento mais forte de FC

"Na pratica, pesquisadores vao criar configuracoes composicionais ad hoc que absorvem qualquer evidencia."

Resposta: e para isso que serve a PPC — ela diagnostica se os elos adicionais sao empiricamente sustentados ou se estao inflando o modelo.

## 8. Questoes abertas

1. **Parcimonia via priors** — argumento de que configuracoes mais complexas devem receber priors menores. [A desenvolver — autor pediu esclarecimento.]

2. **Explosao combinatoria** — com $n$ elos, ha $2^n$ configuracoes. Precisa de criterios de poda. Nem toda configuracao e substantivamente significativa.

3. **Especificacao de priors sobre configuracoes** — mais complexo que priors sobre 3 hipoteses. Pode ser simplificado assumindo independencia condicional entre elos?

4. **Relacao com CausalQueries (Humphreys & Jacobs 2023)** — ha proximidade com DAGs, mas decidimos nao enquadrar como "ponte" para CausalQueries. O framework e proprio.

5. **Escopo do rewrite** — o paper atual tem ~14,100 palavras. O rewrite e substancial: Secao 3 inteira precisa ser reformulada; Secoes 4 e 5 precisam re-demonstrar com o novo framework.
