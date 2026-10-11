# Piloto executado: IA e PPC no caso do carbono

Execução: 11/10/2026. Modelo solicitado nas chamadas válidas: `gpt-5.6-sol`, esforço `low`, Codex CLI 0.144.1, autenticação ChatGPT. Trata-se de um alias, não um snapshot imutável identificado. As probabilidades são sintéticas, a observação reduzida de E3 provém de Fairfield e Charman. Nenhuma likelihood histórica foi estimada.

## Arquivos principais

- `design.md` e `design_amendment_01.md`: regras anteriores à primeira geração válida e alteração operacional de modelo.
- `report.md`: relatório completo em português; PDF em `output/pdf/piloto_ia_ppc_carbono_2026-10-11.pdf` na raiz do projeto.
- `data/bc_states.csv`: estados R pareados de B e C.
- `data/worlds.csv`: 192 mundos, 64 por braço.
- `data/documents.json`: 384 documentos principais e 128 sugestões adicionais.
- `data/blinded_documents.json`, `code_map.csv`, `coded.csv`: codificação cega de 192 mundos e três controles.
- `prompts/`, `raw/`: todas as requisições válidas e respostas, esquemas, erros e logs. Não corrigidos editorialmente.
- `failed_model_attempt/`: 17 recusas do alias inicial antes de qualquer geração; preservadas.
- `agents/`: debate operacional e auditorias independentes de fontes, matemática, código, texto e implicações.
- `results/`, `verification/`: tabelas, figura, conferências e hashes.

## Reproduzir a análise sem novas chamadas de IA

A partir da raiz do repositório:

```sh
Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot/scripts/model.R
Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot/scripts/analyze.R
Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot/scripts/iid_benchmark.R
Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot/scripts/sensitivity.R
python3 quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot/scripts/verify_run.py
```

R base, sem pacotes adicionais, e Python standard library. `model.R` usa seed 20261011; bootstrap usa 2026101101. A reconstrução a partir de respostas preservadas pode ser refeita com `run_pilot.py prepare_coding` e `run_pilot.py collect`, sem chamar modelos. `generate`, `code` e `discover` fazem chamadas reais, usando cota de conta ChatGPT; o script não substitui requisições com status existente. Para uma nova replicação, use outra pasta e preserve esta rodada. Regeneração de textos não é determinística.

As fontes históricas, PDFs e textos extraídos permanecem em `../2026-10-10_causal_likelihoods/sources/`. Relato E3: Fairfield e Charman, pp.12–13. BP2017: email de 27/01, p.1. API2021: p.1. BP2019: pp.1–2. Fontes conhecidas antes do piloto, nunca holdout.

## Compilar o relatório

```sh
pandoc quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot/report.md \
  --pdf-engine=xelatex \
  --resource-path=quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_pilot \
  -o output/pdf/piloto_ia_ppc_carbono_2026-10-11.pdf
```

O texto importa uma figura produzida por R; cálculos permanecem nos scripts. A auditoria visual do PDF é registrada em `verification/`.
