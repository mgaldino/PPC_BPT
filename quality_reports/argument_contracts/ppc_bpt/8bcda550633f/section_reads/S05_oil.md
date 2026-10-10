# S05 — Oil Majors: leitura de fidelidade

Fonte: `paper_draft_v1.Rmd`, SHA256 fornecido `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`. Responsabilidade: linhas 394–506. Contexto: manuscrito integral e `CLAUDE.md` lidos; suplemento integral consultado, especialmente linhas 40–155. Registro de entendimento, sem crítica, validação externa ou proposta de alteração. Nenhum script executado.

## Tese da seção

A aplicação às petrolíferas pretende mostrar que a decomposição em elos produz diagnóstico mesmo com posterior original moderado, aproximadamente 0,71 para acomodação estratégica. O diagnóstico tem dois objetos: atribuições originais de verossimilhança para manifestações públicas de apoio à precificação de carbono, cuja leitura teria privilegiado vantagem competitiva, e a heterogeneidade entre empresas que uma oposição agregada entre duas hipóteses encobre. A elicitação com prompts distintos acrescenta um diagnóstico da fragilidade interpretativa de parte da evidência. O texto sustenta esse argumento como operacionalização da estrutura bayesiana existente em F&C, conforme o enquadramento do manuscrito e `CLAUDE.md`.

## Afirmações, fundamento textual e escopo

Os fundamentos abaixo são os que o manuscrito apresenta; não significam checagem independente de sua exatidão.

| ID | Afirmação reconstruída | Localizador | Evidência ou fundamento apresentado | Escopo e qualificadores |
|---|---|---|---|---|
| O01 | O BPT original mantém vantagem moderada de acomodação estratégica, dominada pelo prior. | 398; 475 | Prior de 6 dB para `H_SA`, quatro itens com saldo de 2 dB para `H_CA`, posterior de cerca de 4 dB/0,71. | Reanálise de Vormedal et al. atribuída nesta seção a F&C 2025; não é posterior recalculado após os quatro itens holdout. |
| O02 | Acomodação estratégica compreende ameaça regulatória, comparação de custos, apoio condicionado à substituição de regulação, ausência de investimentos sérios dependentes de preço de carbono e posicionamento retórico. Vantagem competitiva compreende benefícios do gás/CCS, investimentos reais e desejo de aprovação da política. | 403–415 | Tabela 8, com cinco elos `m_1…m_5` e quatro `m'_1…m'_4`. | Definições específicas desta aplicação; a numeração dos elos não conserva os significados do caso chileno. |
| O03 | Empresas podem ocupar configurações distintas no mesmo espaço de mecanismos. | 417–425; 467; 479 | ExxonMobil como SA; Equinor como combinação; TotalEnergies mais próxima de CA. A discussão acrescenta ConocoPhillips ao predomínio de SA. Suplemento 109–151 lista fontes usadas para decomposição/configuração. | Tabela diz “plausible configuration”; o texto descreve CA como “more plausible” para Equinor/TotalEnergies. As fontes adicionais são explicitamente distintas dos itens holdout (suplemento 111). |
| O04 | Integrar incerteza sobre elos reduz a previsão da admissão McCoy dentro de SA de 0,80 para aproximadamente 0,41. | 427–437 | Exemplo com probabilidades de admissão 0,85, 0,10 e 0,05 e probabilidades posteriores de `m_4=0,50` e `m_5=0,85`. | Exemplo trabalhado dentro de `H_SA`; o argumento local enfatiza incerteza sobre investimento sério. Limitação geral: posteriores dos elos são estimativas pontuais sem propagação formal de incerteza (533). |
| O05 | Quatro itens posteriores a 2020 permitem confrontar previsões relativamente pouco concentradas. | 442–451; 475–478 | McCoy, condicionalidade API, recuo de investimentos climáticos e investimentos CCS; tabela fornece 0,58, 0,58, 0,56 e 0,52. | Texto diz que os itens sucedem a janela de análise de F&C. São probabilidades dos itens, não probabilidades posteriores revisadas das hipóteses. |
| O06 | A admissão McCoy e a condicionalidade API sustentam SA e ajudam a diagnosticar atribuições originais baixas para apoio público sob SA. | 455–457; 465 | McCoy descreve apoio como instrumento retórico e estratégia do período original; API apoia substituição regulatória; cartas `E_1/E_2` antes favoreciam CA. Suplemento 47–66 documenta as fontes. | “Likely miscalibrated” no corpo da Finding 1; associação de McCoy a `m_4/m_5` é explicitamente para ExxonMobil. A afirmação contrafactual é que revisão favoreceria mais SA, sem posterior revisado numérico. |
| O07 | Na leitura principal, recuos de renováveis apoiam SA, enquanto investimentos CCS apoiam moderadamente CA. | 459–461 | BP/Shell/Equinor e aquisição Denbury/Northern Lights; suplemento 68–105. | Subsídios públicos complicam a interpretação de CCS como investimento dependente de preços de mercado. A leitura de renováveis é posteriormente contestada pelo canal cético. |
| O08 | Posterior não extremo ainda pode sustentar diagnóstico quando a evidência holdout é forte. | 469; 478–480 | Síntese de três itens favoráveis a SA e um a CA; diagnóstico de elos e proposta de revisão das verossimilhanças/configuração. | É conclusão da aplicação e de sua leitura principal. A subseção seguinte registra divergência interpretativa; não há unanimidade de todos os canais quanto ao saldo agregado. |
| O09 | Os prompts preservam o ordenamento de três itens, mas a leitura cética de recuo em renováveis inverte `e*_7` e, segundo o texto, o saldo agregado. | 489–504 | Tabela 10: Claude, três variantes. O cético atribui `e*_7` 0,55 sob CA e 0,25 sob SA porque vantagem competitiva deriva de gás e CCS. Saldos declarados: +16,5, +5,3 e −8,0 dB. | O texto toma divergência como diagnóstico, destacando `e*_5/e*_8` como robustos e `e*_7` como contestado. Tabela desta aplicação cobre um modelo com três prompts. |
| O10 | Nesta aplicação, a cronologia da evidência excluiria contaminação dos dados de treinamento como explicação da convergência. | 487; contexto 391 | Afirmação de que os itens sucedem todos os cortes de treinamento. | Afirmação categórica do manuscrito; o texto local não especifica datas desses cortes. Registro de conteúdo, sem validação nesta leitura. |

## Não-afirmações e limites que precisam ser preservados

- A seção não conclui que todas as petrolíferas são casos puros de SA nem que CA é descartada: heterogeneidade empresarial e apoio de CCS a CA integram a tese.
- O posterior de 0,71 pertence à análise original. Não representa a crença após agregar os quatro itens posteriores nem uma estimativa posterior de cada empresa.
- A seção distingue diagnóstico da especificação original de mera atualização com nova evidência (465; princípio geral em 196).
- A divergência dos prompts é um resultado reconhecido. Não se pode reconstruir a tese como convergência uniforme de todas as leituras ou como apoio consensual de `e*_7` a SA.
- A discussão geral define o check como julgamento qualitativo de coerência, sem p-valor ou limiar formal (209), e registra uso de fontes secundárias, implementação parcial dos protocolos e ausência de segundo analista humano cego (533).

## Ambiguidades de leitura mantidas abertas

- O exemplo interno de `e*_5` (0,41, linhas 427–435) e a tabela agregada (0,80 sob SA; 0,58 preditivo, linha 446) aparecem em camadas distintas; a seção não declara explicitamente se a tabela substitui ou apenas compara o exemplo de integração.
- “Companies”/“oil majors” pode designar a população agregada ou uma empresa específica; no exemplo McCoy a observação refere-se a ExxonMobil, enquanto os pesos dos elos são descritos pela ambiguidade da evidência original sobre petrolíferas.
- Os elos “dependente de precificação de carbono”, investimento em “transição” e investimento em renováveis aparecem em níveis diferentes. O texto preserva essa distinção ao relatar a objeção cética sobre gás/CCS e a qualificação sobre subsídios.
- Configurações aparecem como atribuições empresariais plausíveis e também como contexto para incerteza sobre ativação de elos. A leitura registra ambos os usos sem lhes acrescentar uma solução formal.

## Objeto predito, termos e perguntas de compreensão

`e*_5` recebe valor substantivo explícito no exemplo: “cynical admission” (429). Os demais `e*` são descritos como proposições/eventos observáveis: condicionalidade API, recuos acompanhados de manutenção retórica, e investimentos CCS. A seção não utiliza a notação `y_rep`, não apresenta conjunto replicado simulado e não explicita se a replicação conceitual concerne à conduta empresarial, à declaração registrada ou ao processo de encontrar essa declaração. Essa distinção permanece uma pergunta de compreensão para a fase posterior, sem julgamento nesta leitura.

`H_SA` = Strategic Accommodation; `H_CA` = Competitive Advantage; CCS = captura e armazenamento de carbono no uso substantivo da seção; WoE = peso da evidência, expresso em dB. `E_1/E_2` são evidências originais (cartas); `e*_5…e*_8` são os itens holdout. A pergunta central de leitura é como o mesmo espaço de mecanismos articula o diagnóstico histórico do apoio público e a heterogeneidade entre empresas e períodos.
