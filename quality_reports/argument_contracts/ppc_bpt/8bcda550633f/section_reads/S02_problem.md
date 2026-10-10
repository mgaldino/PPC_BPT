# S02 — The Dominant-Scenario Problem

- `reader_id`: `/root/read_problem`
- Artefato: `paper_draft_v1.Rmd`
- SHA-256 conferido: `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`
- Responsabilidade exclusiva: linhas 50–100, incluindo a subseção “PPC Requires Internal Structure” e a Tabela 1.
- Contexto lido: manuscrito completo, linhas 1–541, e `CLAUDE.md`.
- Modalidade: extração de fidelidade argumentativa; sem julgamento da validade dos claims, sem verificação das fontes externas, sem crítica ou proposta de solução.
- Convenção de localização: todos os números de linha abaixo referem-se ao Rmd identificado pelo hash. “Evidência” significa a base oferecida pelo manuscrito para seu claim, não evidência independentemente validada.

## Tese da seção

A seção identifica uma distância entre a infraestrutura formal já disponível na BPT de Fairfield e Charman e sua operacionalização na prática. O cálculo de cenários dentro de hipóteses é reconhecido explicitamente na Equação 3.11, e a atomização já permite hipóteses mutuamente exclusivas compostas por fatores compartilhados (linha 64). Segundo a seção, a prática de avaliar a evidência sob o cenário dominante mantém essa estrutura implícita; explicitar cenários como elos de mecanismos permitiria integrar incerteza dentro de hipóteses e localizar os componentes responsáveis por discrepâncias preditivas (linhas 66–68, 83–85).

A seção reúne intervenções de Zaks, Soifer, Bennett, Jacobs e Fairfield e Charman para delimitar essa lacuna, e apresenta uma distinção entre a média de previsões entre hipóteses, denominada BMA, e o diagnóstico que integra incerteza em parâmetros dentro de cada hipótese, denominado PPC “in the proper sense” (linhas 73–85). A contribuição anunciada é a operacionalização por decomposição e PPC em dois níveis, desenvolvida na seção seguinte; a seção 2 não executa essa decomposição.

## Claims explícitos e suas bases

| Claim | Localizador | Evidência oferecida no texto | Scope/hedge |
|---|---|---|---|
| Na aplicação, pesquisadores avaliam likelihoods sob a trajetória causal mais plausível dentro de cada hipótese em vez de integrar trajetórias alternativas. | 52; retomada em 66 e 83 | Afirmação sobre prática; citação de FC sobre manter o processo implícito em 66; referência à aproximação da Eq. 3.12. | O sujeito inicial é “Applied researchers”; 66 explicita “in practice”. A frequência é “frequently” para a resposta “it depends”. Não há levantamento de prevalência apresentado nesta seção. |
| A pergunta pela likelihood pode depender de contingências não modeladas na hipótese. | 52 | Zaks (2022); exemplo de recibos de suspeito e contingências de premeditação e construção de álibi. | Exemplo ilustrativo de condições substantivamente importantes; o texto chama o domínio afetado de “standard framework”, cuja extensão precisa ser lida com 64–68. |
| As estratégias existentes para formar hipóteses compostas não vêm acompanhadas de orientação estrutural para escolher entre elas. | 54 | Citação atribuída a Zaks (2022, p. 307) sobre três estratégias e “no guidance”; interpretação do autor de que não há decomposição em componentes. | Claim sobre construção de compostas; não equivale a dizer que hipóteses compostas são proibidas, como 62 esclarece. |
| Soifer identifica tensão entre exigir em geral um mecanismo e aceitar como informativa qualquer evidência que discrimine hipóteses. | 56 | Soifer (2023, pp. 64–65) e FC (2022, p. 80), com trechos citados. | A resistência à integração é uma previsão atribuída a Soifer acerca de “a certain set” de pesquisadores qualitativos; não se afirma rejeição por toda a área. |
| Hipóteses podem compartilhar componentes e ainda constituir diagnósticos mutuamente exclusivos. | 58 | Bennett (2023, p. 52) e analogia do motor: vela suja, vela suja com linha de combustível obstruída e outras combinações. | O compartilhamento se refere a variáveis, fatores ou mecanismos; a exclusividade se refere ao diagnóstico/configuração integral. O texto diz que Bennett não formaliza a proposta. |
| Jacobs defende estender a formalização à derivação de likelihoods por modelos causais explícitos. | 60 | Jacobs (2023, p. 58), incluindo resposta à objeção de que isso empurra a subjetividade para dentro do modelo. | Claim de posicionamento no debate; não afirma eliminação de subjetividade por formalização. |
| FC permitem mecanismos para tornar hipóteses mais precisas e permitem acrescentar hipóteses de retalhos e relatos compostos. | 62 | FC (2023, pp. 68–70). | Reconhecimento explícito de recursos existentes. Não afirma que toda composição teria sido operacionalizada previamente para PPC. |
| A parcimônia descrita na resposta de FC opera pela atribuição de priors menores a hipóteses complexas. | 62 | Referência à nota 17 de FC (2023, p. 70), com justificativa combinatória de existirem mais teorias complexas. | “Only through prior assignment” é uma caracterização do autor nesta passagem. A seção não deriva critério alternativo de parcimônia. |
| FC já possuem infraestrutura matemática para estrutura interna dentro das hipóteses. | 64 | Eq. 3.11, reproduzida como soma de likelihoods condicionais a cenários ponderadas por suas probabilidades dentro de cada hipótese. | Os cenários são explicitamente mutuamente exclusivos e exaustivos sob cada hipótese. A correspondência com marginal likelihood é descrita como estrutural. |
| A atomização de FC constrói hipóteses mutuamente exclusivas por combinações booleanas de fatores não exclusivos. | 64 | FC (2022, cap. 6, pp. 234–235) e citação de p. 87 distinguindo exclusividade de hipóteses e de seus componentes. | Reconhecimento formal explícito; incompatível com atribuir à seção um claim de inexistência de estrutura interna na teoria de FC. |
| Essa infraestrutura costuma ficar implícita na prática, e atomização é apresentada para construir conjuntos de rivais, não como diagnóstico dentro da hipótese. | 66 | FC (2022, p. 123), menção à Eq. 3.12 e interpretação da função da atomização. | “In practice”; “presented as”. O claim é sobre uso e função apresentados, não impossibilidade matemática de um uso diagnóstico. |
| A lacuna central é a operacionalização de cenários como elos de mecanismos testáveis. | 66–68 | Síntese das distinções anteriores: matemática disponível, cenários implícitos, necessidade de decomposição. | Reconcilia parcialmente os interlocutores: Zaks estaria correta quanto à aplicação; FC quanto ao fundamento bayesiano. |
| PPCs quantitativos integram a distribuição preditiva sobre a posterior dos parâmetros internos ao modelo. | 73–77 | Fórmula integral de `p(y^rep | y)` e menção a Gelman, Meng e Stern (1996). | O texto atribui a essa integração a representação da incerteza posterior, além de valores de melhor ajuste. Não fornece demonstração formal nesta seção. |
| A fórmula preditiva de BPT “as currently practiced” soma as previsões condicionais às hipóteses ponderadas por suas probabilidades posteriores. | 79–83 | Fórmula da linha 81. | Denominada estruturalmente idêntica à Bayesian model averaging. Não é descrita como incapaz de detectar qualquer falha. |
| Ao deixar cenários internos não enumerados, a prática limita a localização de falhas: pode mostrar que uma previsão falha, sem indicar qual parte da hipótese responde pela falha. | 83 | Comparação entre Eq. 3.11, aproximação de Eq. 3.12 e fórmula da linha 81. | O limite explicitado é diagnóstico dentro da hipótese. A seção admite diagnóstico agregado de falha. |
| Para PPCs “in the proper sense”, a proposta exige parâmetros internos sobre os quais integrar; elos de mecanismos forneceriam essa estrutura. | 85 | Conclusão da comparação formal precedente e anúncio da seção seguinte. | “Proper sense” é a convenção conceitual usada pelo texto. A demonstração da proposta é adiada à seção 3. |
| A contribuição se distingue dos trabalhos próximos por combinar decomposição de mecanismos e PPC em dois níveis. | 87–98 | Tabela 1, que compara FC 2017/2019/2022, Befani et al. 2021, Humphreys e Jacobs 2023, Behrens e Rohlfing 2025 e Zaks 2021/2022. | Mapa sintético de contribuição; não revisão sistemática apresentada. As caracterizações das obras são claims do manuscrito, ainda não verificadas por este leitor. |

### Escopo específico da Tabela 1

- Linha 91: atribui a FC (2017) análise de sensibilidade dos priors e caracteriza os limites como ausência de checagem de likelihoods e de estrutura interna.
- Linha 92: atribui a FC (2019) atualização iterativa com nova evidência e caracteriza os limites como pressupor modelo bem especificado e não oferecer diagnósticos.
- Linha 93: reconhece em FC (2022) cenários e atomização; os limites são cenários implícitos **na prática**, ausência de PPC e atomização denominada “ad hoc”.
- Linha 94: atribui a Befani et al. (2021) simulação de probabilidades por modelos baseados em agentes, com escopo de avaliação de programas e sem decomposição de mecanismos.
- Linha 95: atribui a Humphreys e Jacobs (2023) modelos por DAG/CausalQueries; distingue o formalismo e afirma que não se trata de distribuição posterior preditiva.
- Linha 96: atribui a Behrens e Rohlfing (2025) amostragem posterior preditiva para seleção de casos, com PPC vindo do componente quantitativo.
- Linha 97: atribui a Zaks o diagnóstico dos problemas estruturais, sem solução formal.
- Linha 98: identifica a combinação específica reivindicada por este paper. Não estabelece prioridade histórica exaustiva além do conjunto de trabalhos listado.

## Não-afirmações e limites reconhecidos

1. **Não afirma ausência de estrutura interna na teoria de FC.** A infraestrutura matemática é reconhecida na linha 64, e a linha 66 diz expressamente que o elemento ausente é a operacionalização, não a fundação matemática.
2. **Não afirma que hipóteses compostas sejam inadmissíveis em FC.** A possibilidade de adicionar relatos compostos está registrada na linha 62; a atomização está registrada na linha 64.
3. **Não afirma que fatores compartilhados eliminem necessariamente a exclusividade de hipóteses.** As linhas 58 e 64 distinguem esses níveis.
4. **Não afirma que a previsão agregada seja incapaz de detectar falha.** A linha 83 admite que ela pode informar que uma previsão falha; o déficit reivindicado é localizar a parte responsável.
5. **Não propõe abandonar a inferência bayesiana.** A linha 68 apresenta a fundação de FC como base da resposta e sustenta que a solução deve ser bayesiana.
6. **Não afirma que a formalização remova subjetividade.** A linha 60 apresenta a resposta de Jacobs como extensão da explicitude analítica; não encontrei promessa de eliminar julgamento subjetivo na seção.
7. **Não estabelece aqui que todo estudo publicado usa um único cenário.** O texto emprega uma descrição geral da prática; não encontrei universo, amostra ou medição da frequência de uso nessa seção.
8. **Não apresenta nesta seção um modelo causal novo, estimando empírico, efeito estimado ou teste aplicado.** A função da seção é delimitar o problema metodológico e sua base literária; os casos e cálculos estão em outras seções.
9. **Não afirma nesta seção que PPC comprove verdade causal.** Não encontrei tal claim aqui; a distinção explícita entre coerência interna e teste de verdade aparece no contexto da seção 3, no parágrafo “What PPC is — and is not”.

## Ambiguidades textuais a preservar sem convertê-las em crítica

| Ambiguidade | Localizador | Leituras possíveis e limite da resolução local |
|---|---|---|
| Referente de “standard framework” e de ausência de representação formal/decomposição. | 52, 54 versus 64–68 | Isoladamente, as primeiras formulações podem designar a teoria ou sua prática usual. As linhas 64–68 oferecem delimitação explícita de prática/operacionalização e reconhecem infraestrutura formal. A leitura da seção completa favorece essa delimitação; o macro deve registrá-la e preservar o fato de que a linguagem inicial é mais abrangente. |
| Extensão de “only through prior assignment, not through any structural feature”. | 62 versus 64 | A frase pode se referir especificamente ao tratamento de parcimônia na resposta de FC (2023) ou caracterizar todo o framework. O contexto imediato ancora a discussão na nota 17; a subsequente descrição de estrutura formal não define expressamente a extensão dessa frase. |
| Qualificador “no internal structure” na linha sobre FC (2017). | 91 versus 64–66 | A tabela separa obras por ano. O qualificador pode ser restrito à contribuição de 2017, mas não declara explicitamente se descreve seu formalismo, sua aplicação ou a função da análise de sensibilidade. Não autoriza generalizar ausência de estrutura para FC (2022). |
| Conteúdo de “atomization ad hoc”. | 93, com contexto em 54 e 66 | O corpo distingue construir rivais e diagnosticar dentro de hipóteses, mas não define nessa seção qual dimensão da atomização recebe o predicado “ad hoc”. Não encontrei definição operacional local. |
| Estatuto da expressão PPC “in the proper sense”. | 73–85 | A seção usa o rótulo para a integração de parâmetros internos e chama a soma entre hipóteses de BMA. Não explicita se a expressão é uma definição estipulada para sua proposta, uma convenção disciplinar universal ou ambas. O macro deve reproduzir a distinção reivindicada sem transformá-la silenciosamente em consenso externo. |
| Relação entre cenário, hipótese, configuração e parâmetro. | 64, 83–85; contexto em 105–107 e na subseção “PPC as a Consequence of Mechanism Decomposition” | Nesta seção, cenários variam dentro de hipóteses e mecanismos são anunciados como seus parâmetros. Na seção 3, hipóteses são chamadas de configurações e também se integra incerteza de elos dentro de configurações. A seção 2 não decide sozinha como esses níveis ontológicos se relacionam; a síntese macro depende da seção 3. |
| Força da afirmação “cannot tell us which part”. | 83 | A formulação local caracteriza a capacidade da fórmula agregada com cenários não enumerados. Não especifica se inclui qualquer diagnóstico qualitativo informal feito por um analista além dessa fórmula. O mecanismo do argumento local é a falta de representação explícita no cálculo. |

## Terminologia a manter consistente

| Termo | Sentido autorizado nesta seção | Localizador |
|---|---|---|
| BPT aplicada / dominante na prática | Avaliação que mantém cenários implícitos e concentra a likelihood em uma trajetória dominante. Não sinônimo de toda a teoria formal de FC. | 52, 66, 79–83 |
| Hipótese (`H_i`) | Unidade rival de explicação; contém formalmente cenários possíveis. | 64, 81–83 |
| Cenário (`S_k`) | Possibilidade interna à hipótese, em uma partição mutuamente exclusiva e exaustiva na Eq. 3.11. | 64 |
| Cenário dominante / Eq. 3.12 | Aproximação prática da integração sobre cenários por uma trajetória predominante. | 66, 83 |
| Atomização | Construção de hipóteses mutuamente exclusivas por combinações booleanas de fatores não exclusivos; reconhecida como disponível em FC. | 64–66 |
| Exclusividade mútua | Propriedade das hipóteses/diagnósticos integrais, conceitualmente distinta de exclusividade de seus componentes. | 58, 64 |
| Estrutura interna | Representação explícita das possibilidades/contingências dentro da hipótese que permite a integração e o diagnóstico. Há infraestrutura formal anterior; o paper reivindica sua operacionalização. | 64–68, 83–85 |
| Elo de mecanismo | Componente causal testável anunciado como forma de operacionalizar cenários; a definição binária detalhada pertence à seção 3. | 66, 85 |
| BMA | Média preditiva entre hipóteses ponderada por suas probabilidades posteriores. | 81–83 |
| PPC “in the proper sense” | Expressão empregada pelo manuscrito para o diagnóstico que integra incerteza em parâmetros internos a uma hipótese/modelo. | 73–85 |
| Diagnóstico dentro da hipótese | Localização do componente responsável por uma discrepância, para além da constatação de falha da previsão agregada. | 83 |
| Operacionalização | Procedimento sistemático para explicitar cenários como elos testáveis; contribuição reivindicada além da fundação matemática existente. | 66–68 |

## Perguntas ao agente macro

1. A síntese macro preservará a delimitação explícita das linhas 64–68 de que o problema é prático/operacional, inclusive ao representar claims mais abrangentes do abstract, introdução ou conclusão? A seção 2 oferece base localizada para essa restrição; não autoriza atribuir ao paper desconhecimento da Eq. 3.11 ou da atomização.
2. Como a seção 3 define a relação entre hipótese, configuração fixa, cenário e estados de elos incertos? O leitor desta seção pode confirmar apenas a relação cenários-dentro-de-hipóteses de 64/83 e o anúncio de parâmetros por elos em 85.
3. Há em outra seção definição explícita do alcance de “proper PPC”, de forma a resolver se o termo pretende uma condição geral de PPC ou uma definição operacional da contribuição? A linha 83 reconhece capacidade de detectar falha na soma agregada.
4. Há definição localizada em outra parte do manuscrito para “atomization ad hoc” da Tabela 1 e para o escopo do “only” relativo à parcimônia em 62? Não encontrei resolução local precisa.
5. No contrato final, as comparações da Tabela 1 serão registradas como caracterizações literárias reivindicadas pelo manuscrito, separadas de afirmações já verificadas nas fontes? Este relatório não verificou a literatura externa.

## Registro de conclusão

Leitura concluída para as linhas 50–100, com contexto do manuscrito completo. Todas as interpretações acima têm localizador no artefato; ausências e ambiguidades foram mantidas como tais. Nenhum script foi executado, nenhuma fonte externa foi consultada, e o manuscrito não foi modificado. Este registro não atribui `PASS` ao gate global e não certifica validade científica.
