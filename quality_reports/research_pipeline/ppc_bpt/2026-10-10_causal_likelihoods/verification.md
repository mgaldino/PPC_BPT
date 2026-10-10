# Verificação e adjudicação final

10/10/2026. A coordenação leu a revisão `agents/10_audit.md` e voltou ao texto, às fontes e às saídas. O implementador 09 não fez a revisão independente; o revisor 10 não alterou os artefatos. O coordenador conferiu externamente artigo, apêndice, documentos BP e API e inspecionou visualmente todas as seis páginas do PDF final.

## Resultado técnico e científico

- PASS para matemática, implementação, fidelidade aos pesos e explicitação dos auxiliares da família condicional.
- Nenhum número absoluto causal foi apresentado como empiricamente identificado ou elicitado.
- A aplicação empírica pontual solicitada permanece NÃO RESOLVIDA. O estado BLOCKED em `adjudication.json` refere-se exclusivamente a encaminhar esse claim científico; não é bloqueio do ambiente, necessidade de permissão ou motivo para reter a demonstração entregue.

O contrato original `ppc_bpt:8bcda550633f:round1` foi reutilizado para interpretar o manuscrito, com hash conferido. O artefato desta adjudicação é o relatório curto novo, lido integralmente pelo revisor; ele não modifica o manuscrito nem reaproveita seu contrato como certificação científica.

## Findings

| ID | Questão | Veredito e disposição |
|---|---|---|
| R10-F001 | Família condicional seria apresentada como gerador conjunto E1–E4 | REFUTED como defeito da versão final; seção 3.3 delimita réplica, prefixo e auxiliar |
| R10-F002 | Âncora absoluta para likelihood causal | UNRESOLVED; não preencher com escala conveniente nem chamar o pedido de completamente resolvido |
| R10-F003 | Raridade de E3 seria tratada como inadequação causal | REFUTED como defeito da versão final; seções 3.1/3.3 explicitam granularidade e caráter retrospectivo |

As melhorias de exposição recomendadas durante o trabalho foram aplicadas e reconferidas: E3 nomeia firmas, desenho e contribuições; título não promete fechamento empírico; elicitação começa sem revelar limiar ou conclusão desejada. Não houve alteração numérica posterior à auditoria.

## Cálculos e execução

O implementador executou base R com sucesso e verificou normalização, BF, invariância da posterior em 1.001 especificações positivas, inversão do complemento e fronteira. Zero foi rotulado como limite não admissível após observar E3. Não foram geradas observações sintéticas nem executado Monte Carlo.

O revisor calculou os resultados de forma independente e conferiu as 1.002 linhas por Python, enumerando os quatro estados conjuntos H,Y. A diferença máxima frente ao CSV foi 1,05 × 10^-15. Essa verificação atesta cálculo e correspondência, não validade dos pesos publicados ou dos auxiliares causais.

## PDF

Compilação Pandoc/XeLaTeX, seis páginas A4. Todas renderizadas em PNG e inspecionadas. Tabelas, fórmulas, figura, números de página e textos sem cortes ou sobreposições. Imagens em `qa/`. Não houve alteração após o hash abaixo.

## Integridade

```text
9b7419e7c9434dabefeaaa4b0e0729b46a167255ead86e6ac38a314606b283f2  proposta.md
daf6c99e212754702ccfe8525a5eb1f0b132c510446ca62b33d5ac9716784854  causal_ppc.R
7dcb31bad60975728d5271c86e392e63b8d977796ef96fe76a8faa6ad70782d0  output/pdf/likelihoods_causais_ppc_bpt_2026-10-10.pdf
```

Manuscrito e suplemento conservam os hashes iniciais:

```text
8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f  paper_draft_v1.Rmd
8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a  supplementary_materials.md
```

Nenhum commit, envio a terceiros ou publicação foi realizado. PDFs das fontes foram arquivados com proveniência em `data/provenance.md`. A busca desta rodada foi dirigida aos casos e parâmetros relevantes; não é uma revisão exaustiva da literatura nem uma prova de que nenhuma fonte adicional poderia identificar as probabilidades.
