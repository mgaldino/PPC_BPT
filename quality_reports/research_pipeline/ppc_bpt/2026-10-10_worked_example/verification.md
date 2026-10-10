# Verificação final e adjudicação

10/10/2026. Coordenador: agente principal. Revisor independente: `worked_example_audit`.

## Execução e fontes

- O coordenador abriu a cópia do artigo disponibilizada pela autora, o comunicado primário e o PDF primário da carta; conferiu coorte, datas, normalização Statoil/Equinor e lista de seis signatárias.
- A carta integral foi arquivada e extraída por `pdftotext -layout`; os seis nomes da página 3 conferem com `data/signatories.csv`.
- O script R foi executado com sucesso. A primeira tentativa encontrou indisponibilidade do dispositivo PNG/Cairo no ambiente depois de calcular os resultados. A figura passou a ser gerada com o dispositivo PDF de base R; uma nova execução terminou com sucesso. Poppler gerou o PNG.
- Verificações analíticas executadas: duplicidades e ausências; junção e exclusão explícita de BG; 256 vetores e probabilidades somando um; dois extremos; 56 vetores com total cinco, dos quais um extremo; integração independente da enumeração; três priors; modelo regional M1.

## Adjudicação da revisão independente

Os seis resultados classificados pelo revisor como confirmados foram confrontados com o código, os CSVs e o relatório. O coordenador confirma todos: posterior Beta(6,4); uso de um theta comum por réplica; cauda bilateral 0,00600575894694; condicional 1/56; cota 1/128 dentro de M0; M1 pós-hoc com cauda 0,31175015460730. Nenhuma correção numérica foi necessária.

A recomendação de deixar a fronteira causal visível desde a abertura foi conferida e está atendida no segundo parágrafo. O texto distingue propensão documental de probabilidade de hipótese e não atribui a SA/CA as suposições de M0. Alterações finais após a revisão foram de paginação, redução de redundância e registro da carta arquivada e do caráter pré-Paris; não alteraram código ou resultados.

O revisor não reabriu as fontes externas nem fez QA visual; essas etapas foram realizadas pelo coordenador. A revisão não equivale a validação empírica de mecanismos.

## PDF

PDF final compilado por Pandoc/XeLaTeX: seis páginas A4. As seis páginas foram inspecionadas visualmente. Corrigidos: caption duplicada, deslocamento da figura além da seção pertinente, linha de comando excedendo a largura e duas linhas isoladas numa sétima página. Tabelas, fórmulas e figura permanecem legíveis e sem cortes. As imagens de conferência estão em `qa/`; `final-6.png` corresponde à sexta página final.

## Integridade

Hashes SHA-256 dos arquivos canônicos são iguais aos registrados no início do trabalho:

```text
8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f  paper_draft_v1.Rmd
1db03332c15fb3c63657a69eba16536fb1dc0073f038f73508ddad8433dc11ca  paper_draft_v1.pdf
8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a  supplementary_materials.md
236cef6ad7468d0bcc0c7447e19a9a6b5ea467ee690c1256af2b8a910622d39e  references.bib
```

Entregas executadas:

```text
0262be9df1b49d6efce5b5883b8e8fecfe3d0c4c82af4c918783a54baf210075  worked_example.R
461fa58d096755a00efb9539d1b024b4cc309d578be749437568926cd911d5bc  worked_example.md
3b65ed205056e4611427a659848909b05a52bc59d8bdc0ebba78bb003cd3d848  output/pdf/exemplo_numerico_ppc_carbono_2026-10-10.pdf
```

Limites: exemplo escolhido retrospectivamente; um episódio coordenado; convites e oportunidades desconhecidos; nenhuma elicitação humana, calibração, previsão realmente reservada ou identificação dos motivos privados. A robustez ao prior não elimina esses limites.
