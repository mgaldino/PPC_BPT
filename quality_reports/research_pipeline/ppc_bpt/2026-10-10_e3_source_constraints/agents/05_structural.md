# Rota estrutural: o que seria necessário para obter a probabilidade de E3

Agente 05, 10/10/2026. Li os pareceres 01/fontes e 02/protocolo, o artigo FC pp. 9 e 12–13, BP2017 e BP2019 integrais e a adjudicação Edmans desta rodada. Nenhum número foi elicitado ou estimado. Não alterei o manuscrito. Debate direto com 04/matemática registrado abaixo.

## Resultado

**Um modelo estrutural torna explícitas as pontes; não fornece, sozinho, a massa probabilística que falta.** A rota defensável descreve incentivos, formação da coalizão, escolha do desenho e registro do resultado. As fontes atuais restringem alguns incentivos, mas não identificam a distribuição dos estados, a solução de negociação nem a probabilidade do pacote agregado.

Preservar **SA = Strategic Accommodation** e **CA = Competitive Advantage**. Em FC, ambas são hipóteses sobre interesses econômicos; a distinção é aceitar custo líquido para evitar alternativa pior versus perceber benefício econômico líquido, inclusive vantagem relativa. Não definir CA como ausência de componente defensivo.

## 1. Mapa concreto de documentos para quantidades

Seja i uma das quatro firmas, x o pacote CLC e z o estado político, econômico e de negociação. Uma contabilidade possível da diferença entre apoiar x e sua alternativa relevante inclui: custo do imposto T_i; perdas regulatórias evitadas R_i; responsabilidade judicial evitada J_i; benefício competitivo incremental G_i; custo de apoio/financiamento K_i. Esses termos precisam compartilhar horizonte e unidade; não constituem automaticamente uma equação estimada.

| Fonte | Restrição documental | Quantidade ainda necessária e registro que a preencheria |
|---|---|---|
| BP2017, p. 1, BPA_HCOR_00052952 | O benefício esperado de evitar futura regra de GHG para refinarias diminui sob a expectativa expressa sobre Trump. | Para R_BP: avaliação contemporânea do custo da regra, horizonte, probabilidade interna de adoção e efeito jurídico esperado do imposto sobre essa regra. Buscar anexos de modelagem regulatória e memorandos de decisão sobre CLC. |
| FC, E0 e discussão E3, pp. 12–13 | Expansão relativa do gás e substituição carvão–gás oferecem uma rota para G_i; queda da produção de gás da Conoco torna a interpretação menos direta. | Para G_i: demanda incremental atribuível ao imposto, margens, capacidade, portfólio futuro e resposta de concorrentes. Projeções empresariais contemporâneas com cenário imposto/sem imposto e respectivos pesos; participação do gás isolada não basta. |
| FC, descrição E3 | Waiver, compensações e contribuições efetivamente fizeram parte do pacote relatado. | Para J_i e K_i: avaliações jurídicas contemporâneas por firma, abrangência do waiver, probabilidade de sobrevivência legislativa e contribuições totais, incluindo custos indiretos. A contribuição observada não identifica o ganho total. |
| BP2019, pp. 1–2 | Há custo projetado da I-1631 e gasto para combatê-la, junto de apoio a outro instrumento. | Não preencher T_i de E3 com esses valores. Faltam comparabilidade jurisdicional/temporal, transporte para o imposto federal de 2017 e diferenças de incidência. |

Mesmo com cálculos financeiros, a passagem “gastou K, portanto o benefício esperado é pelo menos K” exigiria otimização, alternativa correta, custos completos e inexistência de benefícios reputacionais omitidos. Seria uma desigualdade de utilidade, não uma probabilidade de E3.

## 2. Regra de decisão e coalizão

Uma regra inicial seria escolher apoio quando a utilidade esperada correspondente supera a melhor alternativa. Entretanto, no caso CLC é necessário representar quem propõe x, quais condições cada firma exige, quem financia e como aliados republicanos influem. SA/CA restringem o mecanismo predominante, não determinam todos esses objetos.

Para completar a regra seria preciso obter minutas sucessivas do pacote, correspondência entre participantes, autorizações de conselho/diretoria, condições explícitas de adesão e registros de negociações fracassadas. Esses documentos podem estabelecer condições necessárias ou suficientes de participação; nem sempre quantificam sua frequência.

Ter quatro firmas individualmente dispostas a apoiar não garante o pacote exato: negociação pode selecionar outro preço, outra cláusula ou outra contribuição. Havendo vários resultados possíveis, uma regra de seleção ou uma distribuição de negociação continua faltando. Inserir um erro logit com escala escolhida apenas esconderia a mesma liberdade.

## 3. Onde nasce a probabilidade

Escreva g_H(z) para o resultado da regra completa sob H e F_H para a distribuição dos estados condicional ao contexto C. Então:

`P(E3 | H,C) = ∫ 1{g_H(z)=E3} dF_H(z|C)`.

A documentação pode restringir g_H e o suporte de z. Para restringir numericamente a integral, precisa também demonstrar massa mínima de estados suficientes ou impeditivos. Os registros indicados acima são pedidos concretos de coleta, não garantia de que contenham essa massa. Previsões contemporâneas seriam crenças documentadas dos decisores, ainda sujeitas a validação; não frequências verdadeiras por definição.

Contraexemplo debatido com 04: dois estados z+ e z− podem respeitar igualmente a redução do benefício de evitar regulação sob Trump; em z+ a negociação gera E3, em z− gera outro pacote. A distribuição `a δ_z+ +(1−a) δ_z−` admite qualquer a sem violar aquele conteúdo documental. Essa construção prova a insuficiência da restrição ordinal; não estima estados históricos.

## 4. Limites que realmente poderiam resultar

Se houver um conjunto G de estados **suficientes** para E3 e um documento/ponte justificar `P(G|H,C)≥g`, então `P(E3|H,C)≥g`. Identificar G sem sua massa não produz o limite. Se quatro condições A_i forem apenas necessárias, `P(E3)≤min_i P(A_i)`; a probabilidade inferior pode continuar zero. Somente se sua conjunção for equivalente a E3 cabem ambos os limites de Fréchet, inclusive `max(0,Σ_i P(A_i)−3)` como inferior. Independência não decorre de firmas distintas.

**Conclusão para o protocolo:** a entrevista estrutural deve cobrar o registro que preenche cada célula e testar contraexemplos, conforme o agente 02. Neste arquivo, nenhum limite numérico não trivial adicional foi demonstrado. Isso responde à crítica Edmans de precisão espúria, mas não entrega uma aplicação validada. Se documentos novos forem incorporados como informação S, o alvo passa a `P(E3|H,C,S)`; o BF e a posterior publicados não podem ser preservados mecanicamente.
