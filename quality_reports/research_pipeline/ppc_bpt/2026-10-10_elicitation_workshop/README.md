# Oficina de elicitação e validação — 10/10/2026

Entrega: **protocolo preparado, sem probabilidades preenchidas ou aplicação empírica executada**. Dez participantes metodológicos produziram propostas independentes, realizaram crítica cruzada direta e ratificaram o desenho com condições operacionais. Revisores distintos do implementador conferiram matemática e execução; os achados foram corrigidos e rechecados.

- [Relatório e fichas, fonte editável](protocolo_final.md).
- [PDF final, 14 páginas](../../../../output/pdf/protocolo_elicitacao_ppc_bpt_2026-10-10.pdf).
- [Síntese submetida a ratificação](consensus_draft.md), com explicitação posterior da definição temporal de B.
- [Adjudicação e verificações](adjudication.md).
- [Escopo e preflight](preflight.md).

## Participantes e trilha de debate

| Participante | Proposta independente | Crítica cruzada | Ratificação |
|---|---|---|---|
| 01 — protocolo | [Proposta](proposals/01_protocol.md) | [Debate](debate/01_round1.md) | [Ratificação](debate/01_ratificacao.md) |
| 02 — fontes de petróleo | [Proposta](proposals/02_oil_sources.md) | [Debate](debate/02_round1.md) | [Ratificação](debate/02_ratificacao.md) |
| 03 — Chile e comparação | [Proposta](proposals/03_chile_comparison.md) | [Debate](debate/03_round1.md) | [Ratificação](debate/03_ratificacao.md) |
| 04 — calibração | [Proposta](proposals/04_calibration.md) | [Debate](debate/04_round1.md) | [Ratificação](debate/04_ratificacao.md) |
| 05 — identificação | [Proposta](proposals/05_identification.md) | [Debate](debate/05_round1.md) | [Ratificação](debate/05_ratificacao.md) |
| 06 — dependência | [Proposta](proposals/06_dependence.md) | [Debate](debate/06_round1.md) | [Ratificação](debate/06_ratificacao.md) |
| 07 — custódia | [Proposta](proposals/07_blinding.md) | [Debate](debate/07_round1.md) | [Ratificação](debate/07_ratificacao.md) |
| 08 — instrumento | [Proposta](proposals/08_instrument.md) | [Debate](debate/08_round1.md) | [Ratificação](debate/08_ratificacao.md) |
| 09 — avaliação adversarial | [Proposta](proposals/09_adversarial_validation.md) | [Debate](debate/09_round1.md) | [Ratificação](debate/09_ratificacao.md) |
| 10 — viabilidade | [Proposta](proposals/10_feasibility.md) | [Debate](debate/10_round1.md) | [Ratificação](debate/10_ratificacao.md) |

Os instrumentos em `instruments/08_*` são protótipos históricos, preservados para rastrear revisões. **A versão de uso recomendada é a seção 9 do relatório final**, com UDI como unidade, B definido temporalmente e as quatro rotas explicitadas.

## Reprodução documental

A partir da raiz do projeto, com Pandoc e XeLaTeX disponíveis:

```sh
pandoc quality_reports/research_pipeline/ppc_bpt/2026-10-10_elicitation_workshop/protocolo_final.md --standalone --number-sections --pdf-engine=xelatex -o output/pdf/protocolo_elicitacao_ppc_bpt_2026-10-10.pdf
```

A compilação e a inspeção visual do PDF foram executadas. Não foram executados scripts de análise, simulações ou procedimentos de estimação. Os campos vazios são intencionais e não representam zeros. Os hashes das dez propostas independentes foram reconferidos e continuam idênticos aos registrados antes do debate.

## Fontes e exposição

Links primários estão junto às afirmações no relatório e nos pareceres. Acesso em 10/10/2026. A verificação do coordenador da BCN incluiu índice e retorno inicial até a página 14; candidatos do Senado não foram abertos para resolver respostas. Isso não certifica a ausência de exposição anterior do autor ou de futuros participantes. A auditoria empírica deve ser feita por pessoa e alvo.

As referências a IDEA, SHELF, EFSA, Morgan, Cooke/Goossens e Gneiting/Raftery fundamentam elementos da proposta, não comprovam sua eficácia neste caso. A aplicação humana, o inventário completo, a reserva elegível e a avaliação comparativa continuam por executar.
