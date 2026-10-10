# Proposta A: replicar o procedimento de observação de uma história

Autor da proposta: agente A, arquitetura gerativa. Data: 2026-10-10. Fonte integral lida: `paper_draft_v1.Rmd`, suplemento e contrato `ppc_bpt:8bcda550633f:round1` (PASS; SHA `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`). Proposta nova, não reconstrução da intenção autoral. Nenhum script, simulação ou coleta foi executado.

## 1. Resposta ao obstáculo central

É possível gerar `y_rep` qualitativo sem gerar documentos: simular **resultados codificados de investigações previamente delimitadas**. A unidade é uma oportunidade de observação: por exemplo, examinar determinado conjunto de atas à procura de uma decisão anterior ou posterior ao desafio presidencial. O objeto replicado é o resultado dessa busca, com alternativas exaustivas; o texto original continua necessário para justificar a codificação.

Isso exige mais que converter a evidência encontrada em 0/1. É preciso definir antes da leitura: universo de fontes, janela temporal, pergunta, regra de busca, resultados possíveis, tratamento de discordância e parada. “Achar mais uma frase favorável” sem denominador não define experimento preditivo. O protocolo pode ser censitário; não exige amostragem aleatória de documentos.

A adaptação recomendada é modesta: modelo probabilístico do encontro de vestígios, condicionado a uma história incerta. Uma simulação completa da política chilena seria uma extensão dispendiosa, não pré-requisito.

## 2. O que permanece fixo e o que se replica

Distingo três objetos:

1. **História latente:** configuração completa `C` e eventos históricos `Z`, fixos na realidade, incertos para o pesquisador.
2. **Produção e transmissão:** registro, sobrevivência, acesso, seleção e codificação, com parâmetros `ψ` e fatores compartilhados `U`.
3. **Resultado observado:** `Y_q`, resposta à oportunidade `q`, sob contexto fixado `X`.

Em cada realização Monte Carlo, sorteia-se uma história possível do posterior **uma única vez**, compartilhada por todas as fontes. Em seguida, sorteiam-se os resultados do protocolo. A replicação é epistêmica e observacional: o que encontraríamos sob o mesmo desenho de investigação, se essa fosse a história. Não se afirma que o Chile poderia repetir literalmente 2005, nem que uma nova fonte tenha de existir materialmente.

\[
p(Y^{rep}\mid D,X,q)=\sum_{C,Z}\int K_q(Y^{rep}\mid C,Z,U,\psi,X)\,p(C,Z,U,\psi\mid D,X)\,dU\,d\psi.
\]

Para novas fontes predeterminadas, `q=q*`, trata-se de checagem preditiva em holdout. Para replicar oportunidades já usadas, mantém-se o desenho original e aplica-se a mesma discrepância ao observado e ao replicado. A [documentação oficial do Stan](https://mc-stan.org/docs/stan-users-guide/posterior-predictive-checks.html) explicita essa correspondência e distingue níveis de replicação; a escolha do nível altera o diagnóstico.

Uma réplica histórica propriamente dita exigiria sortear novos eventos de um processo estrutural, com condições iniciais e regras de transição. Isso responde a outra pergunta e demanda invariâncias que um caso frequentemente não sustenta.

**Ontologia proposta:** `C` é um vetor completo; não se sorteiam novamente seus componentes dentro de `C`. Incerteza remanescente corresponde a fatos adicionais, mensuração ou modelos. O manuscrito contém tanto essa definição completa (107) quanto a soma sobre elos incertos dentro de configurações (180–188); esta solução escolhe explicitamente uma alternativa nova. PPC também existe com hipótese pontual: posterior degenerado não impede replicação. Estrutura interna aumenta possibilidades de diagnóstico, mas não cria a possibilidade matemática de checagem.

## 3. Exemplo chileno inteiramente sintético

Fixam-se o desafio de Lagos e o voto final como contexto. Definem-se `R=1` como decisão reativa com superação de resistência pela liderança, agregando `m3–m4`; `L=1` como forte redução material previamente definida. Para o exemplo, forte redução significa queda de pelo menos 50% no benefício real anual de uma carteira de beneficiários definida antes da consulta, entre 1990 e 2004. Esse limiar ilustrativo não operacionaliza automaticamente todo o conceito substantivo de “baixo interesse empresarial”.

Tabela 1. Posterior didático sobre a configuração `C=(R,L)`. Pesos estipulados; não são os posteriores do paper.

| C | Interpretação limitada | Peso |
|---|---|---:|
| (1,0) | Resposta reativa, sem forte redução material | 0,65 |
| (1,1) | Resposta reativa e forte redução | 0,20 |
| (0,1) | Sem resposta reativa, com forte redução | 0,10 |
| (0,0) | Nenhuma dessas condições | 0,05 |

Acrescenta-se `B`, mobilização empresarial organizada efetivamente ocorrida. Para simplificar, o conjunto `D` não contém evidência adicional sobre `B` condicionada a `L`. Estipula-se `P(B=1|L=0,D)=0,80` e `P(B=1|L=1,D)=0,10`. A existência de lobby e sua documentação são coisas distintas.

Três oportunidades prospectivas, cuja viabilidade arquivística teria de ser verificada:

- `q1`: conjunto definido de atas internas partidárias, entre o desafio e a votação; pergunta sobre superação reativa de resistência. `+` exige relato explícito; `−` exige incompatibilidade explícita, como decisão definitiva anterior; caso misto é `0`.
- `q2`: conjunto definido de registros CPC/SOFOFA no mesmo período; `+` documenta ação coordenada para defender 57 bis; `−` documenta decisão explícita de não mobilizar; `0` significa busca concluída sem resultado discriminante, inclusive material conflitante.
- `q3`: dossiê tributário predeterminado que permita reconstruir os valores da carteira; `+` satisfaz o limiar, `−` fica abaixo; `0` indica material acessível insuficiente para calcular.

Em todas, `M` significa que o conjunto necessário ficou inacessível. A seleção ocorre por metadados, antes de conhecer a resposta. Se nenhuma lista defensável de fontes puder ser formada, a oportunidade não entra como teste confirmatório.

Tabela 2. Distribuições categóricas sintéticas. Cada linha soma 1; probabilidades incluem registro, acesso e codificação.

| Oportunidade e estado | + | − | 0 | M |
|---|---:|---:|---:|---:|
| q1, R=1 | 0,68 | 0,04 | 0,08 | 0,20 |
| q1, R=0 | 0,08 | 0,56 | 0,16 | 0,20 |
| q2, B=1 | 0,60 | 0,04 | 0,16 | 0,20 |
| q2, B=0 | 0,04 | 0,48 | 0,28 | 0,20 |
| q3, L=1 | 0,63 | 0,045 | 0,225 | 0,10 |
| q3, L=0 | 0,045 | 0,63 | 0,225 | 0,10 |

Por exemplo, `q2` tem acesso 0,80 e, dado acesso, sensibilidade 0,75 e falso positivo 0,05. A igualdade de acesso entre estados é uma hipótese sintética, não propriedade dos arquivos.

O espaço amostral é `{+,−,0,M}³`, com 64 respostas conjuntas. Assumindo independência condicional das três fontes dado `(R,L,B)`, a distribuição completa é determinada. As fontes permanecem dependentes marginalmente pelos estados históricos compartilhados. Os cálculos analíticos dão `P(Y1=+|D)=0,590`, `P(Y2=+|D)=0,3704` e `P(Y3=+|D)=0,2205`.

Marginalizando `B`, a probabilidade de silêncio inconclusivo em `q2` é 0,184 sob `L=0` e 0,268 sob `L=1`. Inacessibilidade tem probabilidade 0,20 nos dois estados e, neste modelo, não os discrimina. Assim, “não encontrei lobby” precisa informar qual categoria ocorreu.

Algoritmo, a implementar somente depois de autorizado:

1. Congelar `D`, metadados das oportunidades, regras de codificação e discrepâncias; obter o posterior conjunto.
2. Sortear `(R,L)` da Tabela 1; sortear `B` condicionado a `L`; manter os três estados para todas as fontes dessa realização.
3. Sortear `Y1,Y2,Y3` das linhas pertinentes da Tabela 2. Não produzir prosa.
4. Repetir ou enumerar as 64 respostas; computar as discrepâncias previamente fixadas, por exemplo número de contradições explícitas de `R` e padrão conjunto de vestígios materiais e empresariais.
5. Codificar as fontes reais às cegas para a previsão; comparar padrão observado e distribuição. Uma resposta conjunta rara isoladamente não basta para declarar inadequação: muitos resultados particulares são raros.

O quadro é um gerador completo didático, não uma análise empírica. O suplemento declara atas internas indisponíveis e arquivos empresariais não sistemáticos. Os atuais `e*3` ainda reutilizam episódios de `E4–E5` (296–297, 323); não se pode apresentá-los como novo teste independente.

## 4. O custo que a simulação não elimina

**Probabilidades absolutas.** Razões de verossimilhança bastam para atualizar hipóteses, mas não determinam a distribuição de observações replicadas. Com priors iguais, `P(e|H1),P(e|H2)=(0,8;0,2)` e `(0,04;0,01)` produzem o mesmo posterior 0,8 de `H1`. Para nova oportunidade condicionalmente independente, predizem respectivamente 0,68 e 0,034. É necessário justificar a escala absoluta e as alternativas à evidência observada.

**Elicitação praticável.** Começar com 2–3 blocos históricos e 3–5 oportunidades, sem declarar esse número suficiente. A tabela requer 18 parâmetros livres, mais dois de mobilização e três pesos; pode ser reduzida compartilhando acesso e taxas de classificação quando defensável. Elicitar primeiro disponibilidade e capacidade de registro com arquivistas; depois vestígios esperados com especialistas substantivos. Pedir intervalos e casos âncora, revisar coerência das somas e reservar testemunhos de verificação. Concordância entre LLMs não estima sensibilidade nem acesso. Para um único caso, intervalos de sensibilidade são frequentemente mais honestos que muitos parâmetros aprendidos artificialmente.

**Dependência e seleção.** Notícia que copia entrevista não acrescenta testemunha. Agrupar por evento e cadeia de transmissão; compartilhar seus estados latentes. O mesmo documento usado em duas perguntas gera resposta conjunta, não duas observações independentes. Se o corpus é selecionado por conteúdo favorável, modelar a seleção ou limitar o diagnóstico àquela seleção; documentar um protocolo posteriormente não desfaz a seleção anterior.

**Localização.** Com observação positiva de probabilidade `f+(s−f)r`, mudança na ocorrência `r` e mudança na detecção `s` podem ser indistinguíveis. Uma discrepância em lobbying não identifica automaticamente `m'1`: pode resultar de acesso, registro ou outro determinante de mobilização. `q3` procura informação material adicional; ainda assim, o elo que transforma baixo benefício em indiferença exige evidência própria. No exemplo, `R` agrega `m3–m4`: separar esses elos requer outra oportunidade com previsões distintas.

## 5. Versão mais simples, limites e contribuição

Se só uma previsão binária bem definida for defensável, elicitar `P(Yq=1|H,D,q)` e seu complemento já permite uma Bernoulli preditiva e checagem pontual. Se a dependência entre várias oportunidades for desconhecida, apresentar marginais e limites para padrões conjuntos; não multiplicá-las. Se nem probabilidades absolutas forem sustentáveis, usar intervalos preditivos e relatar robustez apenas quando a discrepância persistir em toda a classe admissível. Simular não acrescenta informação que não foi especificada.

A proposta falha como diagnóstico causal quando todas as discrepâncias podem ser absorvidas por parâmetros de registro livres, quando o pesquisador já conhece todos os resultados, quando a codificação exclui justamente as surpresas relevantes, ou quando mecanismos diferentes induzem a mesma distribuição observacional. Nesses casos, a conclusão correta é uma checagem limitada ou inconclusiva. A raridade de um caso histórico não impede matemática bayesiana; impede certas justificações empíricas para os números.

FC já oferece marginalização de cenários, como reconhecem 64–68. A contribuição não é inventar essa soma. Tampouco basta alegar que CausalQueries não gera predições: sua documentação fornece [geração de dados com draws posteriores e desenhos de observação](https://integrated-inferences.github.io/CausalQueries/reference/data_helpers.html) e [probabilidades de eventos](https://integrated-inferences.github.io/CausalQueries/reference/get_event_probabilities.html). Pode ser infraestrutura da proposta.

O ganho publicável potencial é especificar **a unidade observacional e a semântica da replicação documental**, demonstrar o problema das escalas absolutas e as condições para localizar falhas, e oferecer protocolo com análise de sensibilidade do processo de fontes. Para sustentar a contribuição na Political Analysis, seria necessário comparar esse protocolo com predição agregada e um modelo implementado em CausalQueries, sob falhas de mecanismo, detecção e dependência, além de uma aplicação prospectiva ou documentalmente cega. Essa é uma exigência científica proposta, não afirmação de ineditismo nem certificação editorial.
