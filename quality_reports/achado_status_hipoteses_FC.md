# Achado: O Status das Hipóteses no BPT de Fairfield & Charman

**Data**: 2026-03-09
**Contexto**: Análise profunda do livro *Social Inquiry and Bayesian Inference* (FC 2022) para avaliar se nosso paper (PPP-BPT) faz justiça ao framework de FC.

---

## A pergunta

No Bayesianismo quantitativo, hipóteses são sobre o valor de parâmetros dentro de modelos. A análise causal estima parâmetros sem viés. No BPT de FC, não é claro se hipóteses funcionam como **modelos** (especificações estruturais distintas comparadas via BMA) ou como **parâmetros** (quantidades desconhecidas dentro de um modelo). A resposta a essa pergunta determina o que nosso paper pode legitimamente reivindicar como contribuição.

## Achado principal

**FC tratam hipóteses como modelos — mas já reconhecem estrutura interna via "scenarios within worlds" (Appendix 3.A).**

### Evidências textuais

#### 1. Hipótese = modelo (p. 79)
> "hypothesis, theory, and model [are] essentially synonymous"

A estrutura matemática confirma: FC usam Bayes' rule em odds-ratio form comparando hipóteses discretas via likelihood ratios. Não há parâmetros estimados *dentro* de H. É puro model comparison.

#### 2. Scenarios Within Worlds — Appendix 3.A (pp. 122-123)

FC apresentam a **Equação 3.11**:

$$P(E | H_i \mathcal{I}) = \sum_{k=1}^{n} P(S_k | H_i \mathcal{I}) \cdot P(E | S_k H_i \mathcal{I})$$

Onde $S_1 \ldots S_n$ são "scenarios or pathways" — diferentes formas pelas quais E poderia surgir no mundo de $H_i$. Esses cenários devem ser **"mutually exclusive and exhaustive under the hypothesis"** (nota 62).

**Isso é estruturalmente idêntico à marginal likelihood no quant:**

$$P(E | M_i) = \int P(E | \theta, M_i) P(\theta | M_i) d\theta$$

Os cenários ($S_k$) jogam o papel que parâmetros ($\theta$) jogam nos modelos quantitativos. São a "estrutura interna" da hipótese.

#### 3. Footnote 51 (p. 106)
> "'the world of H' defines a *family* of possibilities where H holds, but various contingencies consistent with H may or may not occur."

Confirma que FC reconhecem heterogeneidade interna dentro do "mundo" de uma hipótese.

#### 4. Footnote 52 (p. 107)
> "Strictly speaking, when evaluating the likelihood of some evidentiary outcome in the world of a given hypothesis, we should sum over all possible ways that might lead to the outcome, according to the law of total probability. But in practice, this sum will tend to be dominated by the most plausible pathway(s), so to a first approximation, we tend to focus on these pathways or scenarios."

FC sabem que a marginalização deveria ser feita, mas na prática assumem dominância de um cenário.

#### 5. Prática: marginalização implícita (p. 123)
> "In practice, when there are multiple plausible scenarios to consider, we tend to leave this process implicit."

FC explicitamente reconhecem que deixam a soma sobre cenários **implícita**.

#### 6. Aproximação por cenário dominante — Equações 3.12 e 3.13

$$P(E | H_i \mathcal{I}) \approx P(S_1 | H_i \mathcal{I}) \cdot P(E | S_1 H_i \mathcal{I}) \quad \text{(Eq. 3.12)}$$

Ou com dois cenários:

$$P(E | H_i \mathcal{I}) \approx P(S_1 | H_i \mathcal{I}) \cdot P(E | S_1 H_i \mathcal{I}) + P(S_2 | H_i \mathcal{I}) \cdot P(E | S_2 H_i \mathcal{I}) \quad \text{(Eq. 3.13)}$$

#### 7. Atomização (Ch. 6, pp. 234-235)

FC descrevem a construção de hipóteses MEE a partir de combinações booleanas de fatores não-exclusivos — gerando $2^N - 1$ teorias. Isso é estruturalmente similar ao que nosso paper chama de "mechanism configurations."

#### 8. MEE ≠ exclusividade de mecanismos (p. 87)
> "mutual exclusivity of hypotheses is conceptually distinct from exclusivity of their constituent independent variables, causal factors, or mechanisms"

FC explicitamente defendem que hipóteses MEE podem compartilhar mecanismos.

---

## Mapa conceitual: Quant ↔ BPT-FC ↔ Nosso paper

| Bayesianismo Quantitativo | BPT de FC | Nosso paper (PPP-BPT) |
|---|---|---|
| Modelos ($M_1, M_2...$) comparados via BMA | Hipóteses ($H_1, H_2...$) comparadas via likelihood ratios | Idem FC |
| Parâmetros ($\theta$) *dentro* de cada modelo | Cenários ($S_k$) *dentro* de cada hipótese (Eq. 3.11) | Mechanism links ($m_1...m_k$) *dentro* de cada hipótese |
| Marginal likelihood: $\int P(E|\theta,M) P(\theta|M) d\theta$ | $P(E|H) = \sum P(S_k|H) P(E|S_k H)$ | Idem, mas com cenários = configurações de mecanismos |
| Parâmetros **explícitos** (estimados) | Cenários **implícitos** | Mecanismos **explícitos** (decompostos sistematicamente) |
| PPC é ferramenta padrão | Sem equivalente de PPC | PPC qualitativo |

---

## Implicação para a contribuição do paper

### O que NÃO podemos dizer (injusto com FC):
- Que FC tratam hipóteses como "caixas-pretas monolíticas sem estrutura interna"
- Que FC ignoram a possibilidade de mecanismos compartilhados
- Que FC não têm infraestrutura matemática para estrutura interna

### O que PODEMOS dizer (justo e preciso):
1. FC **já possuem** a infraestrutura matemática para estrutura interna (Eq. 3.11, scenarios within worlds)
2. Mas na prática, FC **deixam essa estrutura implícita** — focam no cenário mais plausível e não enumeram sistematicamente as configurações possíveis
3. Quando precisam de MEE com fatores compartilhados, FC recorrem à **atomização** — que é ad hoc (sem guia para quais fatores decompor ou como organizar o espaço resultante)
4. Sem cenários explícitos, **não há como fazer PPC** — porque PPC requer saber o que cada configuração prediz para gerar predições testáveis

### A contribuição reformulada:
> Nosso paper torna **explícito e sistemático** o que FC deixam **implícito e ad hoc**. Onde FC têm "scenarios" genéricos, nós oferecemos mechanism links binários. Onde FC deixam a marginalização implícita, nós a tornamos computável. Onde FC usam atomização ad hoc, nós oferecemos um procedimento estruturado de decomposição. Essa explicitação viabiliza posterior predictive checks — porque para checar predições, é preciso saber o que cada configuração prediz.

### Implicação para a linguagem:
- Substituir "monolithic" por linguagem que reconheça o que FC já fizeram
- Possível framing: "FC provide the mathematical infrastructure for internal structure within hypotheses (Eq. 3.11), but in practice this structure remains implicit — researchers focus on the most plausible scenario rather than systematically enumerating configurations. We make this implicit structure explicit through mechanism decomposition."

---

## Fontes primárias consultadas
- FC 2022, Chapter 3: pp. 79, 87, 101-123 (full chapter)
- FC 2022, Chapter 6: pp. 224-238
- FC 2022, Appendix 3.A: pp. 122-123
- Bennett 2023 (symposium piece on SIBI)
