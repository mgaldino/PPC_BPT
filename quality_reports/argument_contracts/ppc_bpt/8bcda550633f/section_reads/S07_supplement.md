# S07 — Leitura fiel do material suplementar

- **reader_id:** `/root/read_supplement`.
- **Fonte exclusiva:** `supplementary_materials.md`, linhas 1–155, lida integralmente.
- **SHA-256 conferido:** `8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a`.
- **Contexto:** `CLAUDE.md` e `paper_draft_v1.Rmd`. Registro interpretativo, sem crítica, execução de scripts ou verificação externa das fontes citadas.

## Tese e função

O suplemento documenta as fontes associadas aos oito itens chamados de *holdout evidence* nas aplicações chilena e petrolífera e separa delas um conjunto adicional de materiais que informou a decomposição dos mecanismos e a análise por empresa. Não apresenta tese metodológica independente, cálculos preditivos ou simulação. Seu título anuncia documentação de fontes (linha 1); o material adicional declara expressamente sua função e sua condição de não-holdout (109–111). A compilação é datada de março de 2026 (155).

## Claims, evidência e limites

| Claim explícito | Localizador no suplemento | Evidência apresentada | Escopo/hedge |
|---|---|---|---|
| O caso chileno parte das análises de Fairfield e Charman (2022, cap. 10) e Fairfield (2015a). | 7–12 | Referências bibliográficas. | Referencia análises existentes; não descreve coleta primária nova. |
| `e*₁` corresponde a registros de comissões com debate dominado pela equidade. | 14–20 | *Historia de la Ley 20.028*; Fairfield (2015a, cap. 6) sobre o enquadramento de Lagos e do Ministério da Fazenda. | O URL primário permanece pendente; o identificador BCN 5607 remete a outra lei. |
| `e*₂` reúne reformas comparativas: Mining Royalty I rejeitada sob enquadramento de soberania; reformas de 2001 usaram equidade, mas exigiram concessões ou compensação. | 22–26 | Fairfield (2015a, caps. 4–5). | São descrições de três reformas; não há esquema quantitativo de codificação. |
| `e*₃` corresponde a deliberações internas interpretadas como decisão reativa após o desafio de Lagos. | 28–31 | Oposição de assessor do ILD e enquadramento da “armadilha de 1999”, remetidos a Fairfield (2015a, cap. 6) e Fairfield e Charman (2022, cap. 10). | Atas internas de UDI/RN, denominadas teste definitivo de `m₄`, não estavam publicamente disponíveis em março de 2026. |
| `e*₄` corresponde ao silêncio de lobbying, descrito como ausência de mobilização empresarial organizada. | 33–36 | Fairfield (2015a) documentaria oposição ativa de CPC/SOFOFA a outras reformas e apenas reclamações empresariais sobre 57 bis. | Arquivos e registros de lobbying, denominados evidência definitiva, não estavam sistematicamente disponíveis em março de 2026. |
| `e*₅` consiste na admissão de Keith McCoy, em vídeo de junho de 2021, de uso do apoio ao imposto de carbono como instrumento de advocacy. | 47–55 | Fonte primária Greenpeace/Unearthed e quatro reportagens listadas. | Afirmação atribuída a McCoy; não apresenta transcrição integral nem regra de transformação em variável. |
| `e*₆` reúne apoio condicionado da API à precificação e participação inferior a 0,4% do lobbying petrolífero direcionada à legislação de precificação. | 57–66 | Notícias, InfluenceMap e investigação congressional de 2021; relatório do Senado de 2024. | A caracterização política é vinculada ao framework de março de 2021; não explicita aqui o denominador operacional do percentual. |
| `e*₇` descreve cortes em investimentos renováveis de BP, Shell e Equinor com manutenção do apoio à precificação. | 68–87 | Reportagens e análises por empresa e do setor, de 2023–2025. | Unidade descritiva composta: várias empresas, decisões e anos. |
| `e*₈` reúne aquisição da Denbury por US$ 4,9 bilhões e investimento em CCS no Northern Lights de US$ 3,4 bilhões. | 89–105 | Comunicados da ExxonMobil e Equinor; página sobre Northern Lights e anúncio da fase 2 de março de 2025. | O bloco também registra dependência de subsídios, com referência a documento interno da BP citado pelo Senado. |
| Fontes adicionais informaram mecanismos e configurações por empresa, mas não constituem itens holdout. | 109–151 | Páginas empresariais, investigações, análises independentes, litígios e comparações entre empresas. | Distinção expressa em 111; não são novos `e*` numerados. |

## O que a fonte fornece sobre `y_rep`

O suplemento fornece conteúdo substantivo e referências para eventos ou padrões chamados `e*₁`–`e*₈`. Não encontrei nele a notação `y_rep`, definição de espaço amostral, valores exaustivos possíveis de cada item, distribuição conjunta, algoritmo de sorteio ou amostras replicadas. Essa ausência é apenas um registro da cobertura do suplemento.

No contexto do manuscrito, a fórmula quantitativa usa `y^{rep}` (Rmd, 73–75), enquanto a operacionalização usa `e*` e probabilidades integradas sobre estados dos links e configurações (180–188). O suplemento documenta as observações substantivas às quais esses itens remetem; não declara equivalência formal entre todo o material documental e uma realização de `y_rep`.

## Não-afirmações e ambiguidades

- **Não-afirmação explícita:** materiais das linhas 109–151 não são itens holdout (111).
- **Limitação explícita:** não declara concluído o acesso aos registros primários chilenos indicados como pendentes (17, 31, 36).
- **Ambiguidade de rótulo:** o título de `e*₂` anuncia enquadramento de equidade fraco em reformas fracassadas; as descrições subsequentes incluem duas reformas nas quais a equidade foi usada e exigiu concessões/compensação (22–26). O suplemento não define operacionalmente “fraco” ou “fracassado”.
- **Delimitação documental:** vários `e*` agregam diferentes observações e fontes; o suplemento não esclarece se constituem um único evento codificado ou um conjunto de resultados (57–105).
- **Terminologia a preservar:** *holdout*, material de apoio, mecanismo `m₄`, deliberação reativa, mobilização organizada e CCS; ausência de documentação definitiva não é formulada como ausência comprovada do mecanismo.

## Fontes pendentes e questões ao macro

Pendências expressas: página correta da BCN para a Lei 20.028 (17); atas internas UDI/RN (31); arquivos CPC/SOFOFA e registros de lobbying (36). Os demais links estão listados, mas sua consulta e adequação factual não foram verificadas nesta leitura.

Para a síntese macro: preservar a distinção entre nomear itens empíricos e definir uma variável replicável; situar qualquer especificação de `y_rep` no texto que efetivamente a fornece. A documentação de fontes, isoladamente, não determina essa especificação.
