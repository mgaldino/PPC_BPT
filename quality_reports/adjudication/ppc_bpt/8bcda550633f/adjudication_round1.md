# Adjudicação das propostas

Artefato e contrato íntegros; identidade e hashes no JSON. Data: 10/10/2026. Cinco findings CONFIRMED e cinco PARTIAL. As limitações reconhecidas não foram tratadas como descobertas. Nenhuma alteração aplicada ao manuscrito.

| ID | Status | Problema | Localização |
|---|---|---|---|
| F01 | CONFIRMED | O workflow não define um objeto replicável geral nem distribuição completa para seus resultados. | paper_draft_v1.Rmd:199-213; supplementary_materials.md:14-105 |
| F02 | CONFIRMED | Configuração fixa e elos variáveis dentro da mesma configuração não estão compatibilizados. | paper_draft_v1.Rmd:107; paper_draft_v1.Rmd:180-188 |
| F03 | CONFIRMED | Parâmetros internos incertos não são requisito matemático para checagem preditiva. | paper_draft_v1.Rmd:44; paper_draft_v1.Rmd:73-85; paper_draft_v1.Rmd:538 |
| F04 | PARTIAL | Pesos e pressupostos dos exemplos não fornecem um pipeline estimado de predição. | paper_draft_v1.Rmd:165-175; paper_draft_v1.Rmd:427-449; paper_draft_v1.Rmd:533 |
| F05 | PARTIAL | O holdout chileno não está delimitado de modo a demonstrar novidade informacional. | paper_draft_v1.Rmd:278-279; paper_draft_v1.Rmd:323; paper_draft_v1.Rmd:391; supplementary_materials.md:28-31 |
| F06 | PARTIAL | Silêncio documental não permite sozinho inferir ausência de mobilização ou baixos interesses. | paper_draft_v1.Rmd:325-331; supplementary_materials.md:33-36 |
| F07 | PARTIAL | Discrepância preditiva não identifica automaticamente qual elo ou likelihood original falhou. | paper_draft_v1.Rmd:175; paper_draft_v1.Rmd:196; paper_draft_v1.Rmd:211; paper_draft_v1.Rmd:465-480 |
| F08 | PARTIAL | A comparação com CausalQueries precisa enfrentar capacidades gerativas existentes. | paper_draft_v1.Rmd:95; paper_draft_v1.Rmd:526; paper_draft_v1.Rmd:533 |
| F09 | CONFIRMED | Probabilidade preditiva exibida para e6/API é incompatível com pesos e probabilidades da tabela. | paper_draft_v1.Rmd:398; paper_draft_v1.Rmd:447 |
| F10 | CONFIRMED | Razões de verossimilhança e posterior agregado não identificam a preditiva absoluta necessária ao método. | paper_draft_v1.Rmd:201-209; paper_draft_v1.Rmd:271-315 |

## F01

Evidência do problema: Passos identificam evidências, elicitam previsões e avaliam coerência; categorias completas, protocolo de aquisição e distribuição conjunta não são definidos.

Nomear e* e fornecer P(e*) não especifica a chance de cada resultado possível nem a relação entre os itens.

Proposta (needs_design): Definir pergunta, suporte, protocolo e distribuição do vetor observado; não exigir corpus textual simulado.

## F02

Evidência do problema: Definição c=(m1,...,mn) fixa os estados; fórmula posterior volta a somar estados m dentro de c.

Se c fixa m, a distribuição condicional desses mesmos m é degenerada; alternativas exigem definições distintas.

Proposta (needs_design): Escolher explicitamente modelo M, configuração C e parâmetros de observação; não imputar a escolha ao texto atual.

## F03

Evidência do problema: Texto exige parâmetros internos para proper PPC; um modelo Bernoulli com p conhecido produz Yrep e permite avaliar uma discrepância.

Uma posterior degenerada preserva a distribuição de observações. Soma discreta entre hipóteses também pode sustentar checagem; decomposição pode aumentar interpretabilidade, não inaugura PPC.

Proposta (safe): Retirar requisito universal; defender ganho operacional específico da decomposição.

## F04

Evidência do problema: Posteriores marginais de elos aparecem sem derivação e produtos pressupõem estrutura conjunta; resultado .41 não alimenta tabela que mantém .80.

Evidência que limita a crítica: Texto chama cálculos de exemplos e reconhece estimativas pontuais sem propagação formal.

Não é descoberta de limitação ignorada; é necessidade de passar de ilustração a especificação computável. Aritmética dos exemplos está correta sob seus pesos implícitos.

Proposta (needs_design): Rotular exemplos como sintéticos ou derivar pesos conjuntos, normalização e tabelas de um modelo reproduzível.

## F05

Evidência do problema: ILD e 1999 trap aparecem em E4/E5 e novamente na descrição de e*3; suplemento remete ao mesmo capítulo original.

Evidência que limita a crítica: Protocolo geral exige previsão antes da inspeção; limitações admitem implementação parcial.

A sobreposição textual é verificável; não se afirma que nenhuma observação nova possa existir, mas sua adicionalidade não foi demonstrada.

Proposta (needs_design): Auditar famílias de eventos/fontes e tratar material conhecido como desenvolvimento.

## F06

Evidência do problema: A ausência documentada contribui para declarar m'_1 ativo sem taxas de registro/recuperação ou fonte material independente.

Evidência que limita a crítica: A avaliação de e*4 já diz que o item é ambíguo e compatível com mais de uma hipótese.

O defeito é o fortalecimento posterior e a falta de modelo observacional, não o simples uso cauteloso de ausência.

Proposta (needs_design): Separar ausência explícita, busca inconclusiva e inacessibilidade; ancorar detecção e interesse material.

## F07

Evidência do problema: Diagnósticos mais fortes atribuem falha a m4/m5 e a likelihoods E1/E2 sem excluir mecanismos de observação, heterogeneidade ou mudança temporal.

Evidência que limita a crítica: Exemplo usa likely source, workflow may localize, seção de limites não promete teste de verdade.

Há linguagem cautelosa que deve ser preservada. Ganho relativo de um rival não estabelece inadequação absoluta; modelos observacionalmente equivalentes não são distinguíveis.

Proposta (needs_design): Relatar conjunto de componentes compatíveis com a discrepância e condições para diagnóstico mais fino.

## F08

Evidência do problema: Documentação atual consultada inclui make_data(param_type='posterior_draw'), probabilidades de observação, condicionamento given e probabilidades de eventos.

Evidência que limita a crítica: Paper reconhece formalismo distinto e integração futura; documentação atual não determina automaticamente capacidades exatas da edição de 2023.

Não se conclui que CausalQueries já contém todo o protocolo proposto, nem se projeta versão atual no passado. Inviável sustentar novidade por ausência geral de predição no concorrente.

Proposta (needs_design): Comparar mesmos alvos, dados e restrições; reconhecer infraestrutura existente e isolar contribuição operacional.

## F09

Evidência do problema: 0.75×0.71 + 0.15×0.29 = 0.5325, enquanto a célula mostra 0.58.

Arredondamento do posterior 4 dB não explica a diferença. Substituição conferida pelo coordenador e por C; nenhuma simulação necessária.

Proposta (safe): Corrigir na futura revisão e gerar todos os valores de uma fonte computacional única.

## F10

Evidência do problema: O workflow parte do BPT original e pede probabilidades adicionais sem uma ponte geral; pares (.8,.2) e (.08,.02) têm BF 4 e previsões distintas.

Resultado de insuficiência não é falha de Bayes ou de FC; delimita a informação adicional que a operacionalização deve fornecer.

Proposta (needs_design): Apresentar resultado elementar e tabela de ancoragem/normalização para probabilidades novas.

## Disposição

`READY_FOR_IMPLEMENTATION` refere-se apenas à disponibilidade de diagnósticos localizados para preparar mudanças futuras. Não autoriza reescrita, não significa método validado e não é decisão editorial. O manuscrito atual exige revisão substantiva. As escolhas de arquitetura são propostas do debate, não reconstruções da intenção autoral. A novidade exaustiva e a viabilidade de uma reserva independente permanecem tarefas científicas a verificar na próxima fase.

