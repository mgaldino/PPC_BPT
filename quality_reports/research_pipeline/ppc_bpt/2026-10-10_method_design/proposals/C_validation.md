# Proposta C — Checagem preditiva condicionada ao protocolo de observação

**Status:** proposta independente, anterior à leitura de A/B; não implementação. Manuscrito e suplemento lidos integralmente; hashes conferidos. Contrato `ppc_bpt:8bcda550633f:round1`, PASS documental, preservado. Nenhum script executado ou texto do artigo alterado.

## 1. Tese e contribuição candidata

O principal obstáculo não é sortear números. É especificar **o que poderia ser observado, por qual procedimento e sob quais condições a ausência seria informativa**. Um gerador Bernoulli depois de atribuir 0,85 apenas automatiza o julgamento que deveria ser examinado. Proponho uma checagem de previsões sobre traços reservados, condicionada a um protocolo documental explícito, com diagnóstico parcial quando as probabilidades absolutas não forem suficientemente ancoradas.

O alvo principal é um vetor de resultados de buscas documentais previamente definidas, não uma reprodução textual do arquivo nem uma repetição literal da história. A afirmação testável é: “sob este mecanismo e este protocolo de observação, este padrão de traços seria surpreendente”. Uma falha inicialmente atinge a combinação **mecanismo + observação + mensuração**; atribuí-la ao mecanismo requer excluir explicações observacionais relevantes.

FC já permitem marginalização de cenários. CausalQueries já especifica modelos causais binários completos, atualiza parâmetros e calcula probabilidades. A novidade candidata deve estar no protocolo que torna evidência qualitativa preditivamente auditável, nas condições de impossibilidade e na coleta orientada por discriminação robusta. Não reivindico prioridade dessas peças isoladas. A [documentação de CausalQueries](https://integrated-inferences.github.io/CausalQueries/) sustenta usá-lo como implementação concorrente ou infraestrutura.

## 2. O que seria `y_rep`

Definir previamente oportunidades observacionais (d_j=(ator,episódio,intervalo,fonte,consulta,regra\ de\ inclusão)). Para cada uma, registrar disponibilidade e resultado: evidência favorável, contrária, ambígua ou nenhuma evidência pertinente. “Arquivo inacessível” nunca equivale a “o mecanismo não ocorreu”. Evidência favorável/contrária refere-se a um traço definido, não ao veredicto do codificador sobre a hipótese inteira.

Separar (M), estrutura causal; (Z), configuração realizada; (W_j), traço ou ação historicamente relevante; (R_j), registro/preservação/recuperação; (Y_j), codificação observada. Parâmetros (	heta) governam o processo substantivo; (phi), observação e mensuração. Um núcleo possível é

\[
p(Y^{rep}\mid D,d)=\sum_{M,Z}\int p(Y^{rep}\mid Z,M,\theta,\phi,d)
p(Z,M,\theta,\phi\mid D)\,d\theta d\phi,
\]

\[
p(Y\mid Z,\theta,\phi,d)=\sum_{W,R}p(Y\mid W,R,\phi,d)
p(R\mid W,\phi,d)p(W\mid Z,\theta,d).
\]

O segundo produto não autoriza independência entre documentos: um mesmo evento, informante ou comunicado pode gerar muitos registros. Introduzir ancestrais compartilhados e dependência por episódio; replicar esses grupos conjuntamente. O protocolo de seleção deve ser fixado antes dos resultados ou incluído no modelo.

É preciso escolher o nível de replicação. Repetir mensuração do mesmo evento mantém seu estado histórico latente e varia registro/codificação. Prever um traço ainda não observado em outra oportunidade requer uma relação substantiva entre oportunidades. Simular outro processo histórico inteiro exige hipóteses adicionais de transporte, dispensáveis para o primeiro objetivo. Marginalizar nossa incerteza sobre o mesmo (Z) não significa que a história muda em cada réplica. Essa distinção acompanha os níveis de replicação tratados na [documentação oficial de Stan](https://mc-stan.org/docs/stan-users-guide/posterior-predictive-checks.html).

Uma alternativa legítima é modelar diretamente um resumo (S(Y)), como ordem temporal ou número de episódios com contradição. Nesse caso, a adequação examinada se restringe ao resumo; não se inventa um gerador textual. O mesmo resumo deve ser aplicável ao observado e ao replicado.

## 3. Probabilidades absolutas e informação nova

Elicitar razões de verossimilhança não determina uma distribuição preditiva normalizada. São necessárias probabilidades para todas as categorias, inclusive as que não ocorreram, e relações entre os itens. Prioridades para ancoragem: registros comparáveis com cobertura conhecida; validação independente de recuperação/codificação; e elicitação prospectiva explícita, com intervalos e análise de sensibilidade. Uma probabilidade subjetiva coerente é admissível, mas não ganha validação empírica por ser simulada.

Não ajustar cada probabilidade exclusivamente ao traço que deveria testar. Parâmetros observacionais devem ser compartilhados entre oportunidades justificadamente semelhantes ou informados por material de calibração distinto. Caso contrário, cada surpresa pode ser absorvida por uma nova taxa de detecção e a checagem perde conteúdo. Concordância entre codificadores mede consistência, não demonstra sua acurácia; esta requer referência independente quando disponível.

Quando as âncoras sustentam apenas um conjunto (Gamma) de modelos, apresentar intervalos preditivos e sensibilidade. Para discrepância previamente escolhida,

\[
\overline p_T=\sup_{\gamma\in\Gamma}
P_\gamma\{T(Y^{rep})\geq T(Y_{test})\mid D,d\}.
\]

Um valor pequeno em todo o conjunto desafia a classe especificada; um conjunto amplo pode tornar a checagem inconclusiva. Isso não cria automaticamente um teste frequentista de nível conhecido. Discrepâncias, dependência e seleção devem ser examinadas em simulação; “passar” não valida a causa.

## 4. Resultados formais elementares úteis

**R1 — Invariância do posterior não implica invariância preditiva.** Para (H_1,H_0), tome (P(E\mid H_1)=rt), (P(E\mid H_0)=t), com (0<t<\min(1,1/r)). Após observar (E), o posterior depende de (r), não de (t). Para uma nova oportunidade condicionalmente independente da mesma classe,

\[
P(E^{rep}\mid E)=t\{rP(H_1\mid E)+P(H_0\mid E)\}.
\]

Logo, o mesmo resultado BPT admite previsões absolutas arbitrariamente próximas de zero ou substancialmente maiores. A prova é substituição em Bayes. Isso estabelece informação adicional necessária para a proposta, não uma deficiência exclusiva de FC.

**R2 — Não observação não identifica não ocorrência.** Sem falsos positivos, se a ocorrência tem probabilidade (a) e a detecção condicional probabilidade (ho), a probabilidade de encontrar o traço é (q=a\rho). Observações desse tipo identificam no máximo o produto; ocorrência rara e detecção baixa são indistinguíveis. Mais documentos da mesma fonte não resolvem a ambiguidade sem restrições ou âncoras novas.

**R3 — Limite de localização.** Se dois mecanismos e valores admissíveis de seus parâmetros induzem a mesma distribuição conjunta em todos os alvos do protocolo, nenhum diagnóstico baseado nesses alvos os distingue. A prova decorre da igualdade das probabilidades de qualquer região de decisão. Diferenças nas distribuições são necessárias, mas não suficientes para diagnóstico confiável em amostra pequena.

**Corolário de desenho.** Selecionar novas oportunidades para aumentar a menor divergência entre previsões rivais, minimizando também sobre parâmetros observacionais plausíveis. Divergência mínima zero sinaliza necessidade de outra fonte/traço ou resultado inconclusivo. A seleção usa previsões congeladas e metadados, nunca o resultado ainda reservado. Acrescentar elos sem alterar a distribuição observável não melhora testabilidade nem recebe penalização automática de PPC.

## 5. Estudo empírico viável

Separar equipe de especificação, custódia documental e codificação. Congelar o modelo, o universo documental, o protocolo de recuperação e os alvos antes de abrir o material reservado. A custódia registra IDs, hashes, datas de criação/publicação/acesso e genealogia das fontes. Reservar famílias completas de episódios/informantes/documentos derivados, não páginas aleatórias. Dois textos sobre o mesmo depoimento constituem uma família.

Registrar conhecimento prévio e exposição ao conteúdo; o material já usado para formular a proposta é desenvolvimento. Uma nova publicação sobre um fato conhecido não vira holdout automaticamente. Material histórico público permite cegamento prospectivo de novos analistas, mas não apaga conhecimento anterior. LLMs ficam fora da validação independente principal; anonimização e prompts distintos não demonstram ausência de memorização. Revisões feitas após falha precisam de uma segunda reserva ou de novo período prospectivo.

**Chile como piloto observacional.** Localizei o [PDF oficial correto da História da Lei 20.028](https://www.bcn.cl/obtienearchivo?id=recursoslegales/10221.3/37346/2/HL20028.pdf): 71 páginas, relatórios de comissões e debates das duas Casas. A página 2 informa omissão editorial de documentos de mera tramitação. Esse corpus fornece um universo inicial definido, não um arquivo completo. A existência e a estrutura foram verificadas; não realizei nova codificação substantiva.

Usar uma parte para construir categorias e outra família documental ainda não examinada para prever, por exemplo, distribuição de justificativas por partido e etapa. Isso examina expressão pública do mecanismo; não identifica percepção privada ou liderança sobrepondo resistência. As passagens ILD/Lavín já usadas em (E_4/E_5) não servem novamente como reserva. Para o elo privado, reservar novas atas ou entrevistas com protocolo fixo; sem acesso, registrar “não testável com estes dados”.

A hipótese de baixos interesses empresariais demanda âncora própria: incidência tributária e valor econômico, além de busca simétrica de mobilização em fontes que normalmente a registrariam. Não inferir baixos interesses apenas do silêncio. Reformas comparativas precisam de regra de inclusão anterior aos resultados e condições de comparabilidade explícitas; seus contrastes não estabelecem necessidade/suficiência causal por si sós.

**Petróleo como aplicação principal.** Construir painel de oportunidades empresa × episódio de política × período, incluindo posições públicas, decisões de investimento e documentos internos. A [comissão do Senado confirmou a divulgação de documentos em 2024](https://www.budget.senate.gov/chairman/newsroom/press/new-joint-bicameral-staff-report-reveals-big-oils-campaign-of-climate-denial-disinformation-and-doublespeak/); não verifiquei aqui integralidade ou acessibilidade de todos os anexos. Auditar o inventário antes de assumir uma reserva utilizável.

Preferir documentos criados durante a janela original, mas não usados na especificação, para separar erro original de mudança posterior. Codificar separadamente data do comportamento e data de divulgação. Amostrar do inventário completo acessível mediante metadados predefinidos; admitir explicitamente que divulgação por investigação é selecionada. Previsões podem condicionar-se ao acervo divulgado, sem generalizar sua frequência ao universo de documentos corporativos.

Para 2021 em diante, especificar transições por empresa e contexto regulatório: (Z_{it}\sim p(Z_{it}\mid Z_{i,t-1},X_{it})). Subsídios e carbon pricing são componentes distintos de (X). Investimentos em CCS não devem ser igualados automaticamente a investimentos dependentes de preço de carbono. Previsões prospectivas testarão a combinação de mecanismo e transição; reversões posteriores, isoladamente, não diagnosticam a verossimilhança de uma posição anterior. McCoy, replicações jornalísticas e material já citado ficam no desenvolvimento.

## 6. Validação e comparação necessárias

Proponho simulações, sem executá-las nesta fase, cruzando: posterior extremo/moderado; mecanismo omitido; taxas de detecção; seleção favorável; dependência entre fontes; erro correlacionado de elicitação; deriva temporal; pouca separação entre mecanismos; quantidade de famílias independentes. Incluir DGPs em que a classificação causal é impossível, não apenas modelos favoráveis ao método.

Comparar: BPT com cenários explícitos de FC; modelo implementado em CausalQueries; previsão direta de especialistas com o mesmo orçamento informacional; modelo proposto; versão ingênua sem observação/dependência; oráculo que conhece o processo documental. Usar os mesmos alvos e reservas. Essa comparação pode revelar que a contribuição está no desenho, sem ganho de um novo algoritmo.

Medir frequência de alarmes sob modelos corretos, detecção de falhas relevantes, erro de atribuição ao elo, cobertura das faixas preditivas, escores próprios fora da amostra e custo de elicitação/coleta. Separar validação computacional de calibração empírica; oito itens históricos não sustentam uma alegação geral de calibração. Simulações devem também mostrar o custo da robustez: envelopes maiores podem proteger contra falsos diagnósticos e perder poder.

Para um artigo metodológico competitivo: provas curtas verificadas, implementação reproduzível, benchmark informacional justo, aplicação com reserva auditável e resultados negativos explícitos. A [política de transparência de Political Analysis](https://www.cambridge.org/core/journals/political-analysis/information/journal-policies/research-transparency) sustenta documentação e replicabilidade; esta arquitetura científica é recomendação minha, não requisito universal da revista nem promessa de aceitação.

**Critério de continuidade:** se nenhuma reserva documental e nenhuma âncora absoluta viável sobreviverem à auditoria, entregar um método de limites/checagem parcial e uma ilustração exploratória. Não apresentar probabilidades inventadas, recuperação de documentos ou expansão da configuração como validação empírica já obtida.
