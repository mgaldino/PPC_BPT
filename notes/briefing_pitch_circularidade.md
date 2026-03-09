# Briefing: PPCs for BPT — Pitch + Problema da Circularidade

## Elevator Pitch

Bayesian Process Tracing (BPT) importou da estatística bayesiana toda a maquinaria de *atualização* — priors, likelihoods, posteriors — mas não importou a maquinaria de *diagnóstico*. Na estatística quantitativa, depois de estimar um modelo, o pesquisador faz *posterior predictive checks* (PPCs): usa o modelo estimado para gerar dados simulados e compara com os dados observados. Se o modelo não consegue reproduzir padrões básicos dos dados, há evidência de mis-especificação.

Nosso paper propõe o análogo qualitativo: depois de completar uma análise BPT (com posterior sobre as hipóteses), o pesquisador usa a distribuição posterior para *prever* evidência que ainda não foi examinada. Se a previsão é incoerente com o que se sabe do caso por conhecimento de domínio, isso sinaliza problemas na especificação dos likelihoods — o componente mais vulnerável e subjetivo do BPT.

A formalização é uma adaptação direta da fórmula PPC padrão: substituir a integral contínua por uma soma discreta sobre as hipóteses, ponderada pelos posteriors. Operacionalizamos isso como um workflow de 6 passos e demonstramos reanalisando o caso canônico de Fairfield & Charman (2022) sobre a reforma tributária chilena de 2005.

**Contribuição em uma frase:** Primeira rotina formal de diagnóstico de modelo (model checking) para BPT — complementando a análise de sensibilidade de priors (que já existe) com uma verificação dos likelihoods (que não existia).

**Target journals:** Political Analysis, Sociological Methods & Research, Political Science Research and Methods.

---

## O Problema da Circularidade

### O que é

No PPC quantitativo, o diagnóstico funciona porque os *dados replicados* são gerados mecanicamente pelo modelo, sem intervenção do pesquisador. O modelo gera, o pesquisador compara. A separação é limpa.

No PPC qualitativo, essa separação não existe. O pesquisador precisa:

1. **Especificar likelihoods para a nova evidência** — P(e* | H_i) para cada hipótese. Isso é feito pelo mesmo tipo de julgamento subjetivo que gerou os likelihoods originais.
2. **Avaliar a coerência** entre a previsão e o conhecimento de domínio — outra operação subjetiva.

A objeção é devastadoramente simples: se o pesquisador usa o mesmo tipo de julgamento para atribuir likelihoods originais E likelihoods preditivos, e se esses julgamentos carregam os mesmos vieses, o PPC não detecta nada. O check confirma o modelo porque foi construído pela mesma cabeça que construiu o modelo.

### O que o paper atual faz (insuficiente)

A Seção 3.5 cita Gelman & Shalizi (2013) para argumentar que "the check is not circular because the predictions are derived from the model, not from the researcher's direct assessment." Isso é verdade formalmente — as *previsões* saem da fórmula, não do julgamento direto. Mas o argumento é fraco no contexto qualitativo porque os *inputs* da fórmula (os likelihoods preditivos) são julgamento direto.

### O que os reviewers pedem

Cinco reviewers independentes (3 Edmans + 2 pareceristas) convergiram neste ponto como o problema #1 do paper. Especificamente pedem:

1. **Formalizar as condições sob as quais o PPC qualitativo tem poder diagnóstico genuíno.** A intuição é que funciona quando os vieses nos likelihoods originais e nos likelihoods preditivos são *não correlacionados* — o que o critério de "domínio diferente de evidência" ajuda a garantir. Mas isso precisa de argumento formal, não apenas intuitivo.

2. **Propor protocolos concretos de mitigação:**
   - Especificação adversarial (segundo pesquisador atribui likelihoods preditivos sem conhecer o posterior)
   - Pre-registro dos likelihoods preditivos antes de observar a nova evidência
   - Avaliadores externos / adversarial collaboration
   - Elicitação independente por domain expert

3. **Demonstrar empiricamente que a separação funciona** — idealmente com dados primários independentes (não da própria Fairfield) e/ou com um stress test mostrando que o PPC detecta mis-especificação deliberada.

### A tensão de fundo

O problema da circularidade é uma instância de uma tensão mais geral em métodos qualitativos formalizados: a formalização promete disciplina e transparência, mas os inputs permanecem subjetivos. O paper precisa encontrar o ponto de equilíbrio — reconhecer honestamente os limites do diagnóstico qualitativo sem conceder tanto que a contribuição se torne trivial ("é só o que bons pesquisadores já fazem, com mais burocracia").
