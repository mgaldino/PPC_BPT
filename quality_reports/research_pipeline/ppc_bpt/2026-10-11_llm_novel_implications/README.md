# Piloto executado: implicações novas, IA e PPC no carbono

**Resultado:** a IA formulou relações compostas não enumeradas no prompt, mas não demonstrou ganho diagnóstico exclusivo frente a templates igualmente informados. A distribuição empírica das gerações teve falso alarme exato de 12,95% no check primário e 21,37% no secundário. O comparador que verifica a premissa explícita de fidelidade pública detecta a falha documental sem descoberta pela IA. O manuscrito original não foi alterado.

Relatório: `report.md`. PDF final: `../../../../output/pdf/piloto_carbono_implicacoes_novas_2026-10-11.pdf`, relativo a este diretório (a referência absoluta consta em `verification/summary.json`).

## O que foi executado

- 40 chamadas novas ao Codex CLI autenticado no ChatGPT, alias `gpt-5.6-sol`, esforço `low`, sem API externa paga.
- 4 chamadas de descoberta, 16 mundos; 1 seleção; 16 chamadas de confirmação, 128 mundos; 14 codificações; 5 recodificações de mensuração.
- 3 agentes debateram desenho, identificação e validação. Outros agentes auditaram cegamente 35 pares e revisaram atribuição. A equipe preservou discordâncias, especialmente na seleção da implicação pública.
- 3.000 conjuntos de benchmark, 12 mundos/conjunto, além de 36 mundos para auditoria textual. São simulações, não dados do caso histórico.
- Enumeração exata de 455/50.388 histogramas para PPC de 4/8 células. Avaliação Monte Carlo e probabilidades operacionais exatas sob o oráculo.

## Congelamentos e alterações declaradas

`protocol.md` e `data/oracle_rules.json` precedem a descoberta. `data/analysis_freeze.json` congela o único check inicialmente selecionado. `data/secondary_freeze.json` registra inclusão exploratória, após auditoria, do candidato público já presente no corpus. O agente conhecia os tipos de defeito, embora não os resultados. `data/attribution_freeze.json` registra o controle que checa diretamente uma premissa explícita. Nenhum defeito do benchmark foi alterado.

A codificação inicial exigiu declarar tanto o canal alterado quanto a constância do outro. Isso excedeu o indicador e tornou 44 avisos indeterminados. Preservamos `data/coded.csv` e os templates estritos. A correção em `coded_analysis.csv` identifica 41 canais diretamente e outros 3 por exclusão no mundo fechado estipulado. `measurement_audit.csv` distingue ambas as bases. A sensibilidade percorre todas as 8 atribuições dos três canais e sua exclusão. Nenhum PPC havia sido avaliado quando a correção foi feita. Esse histórico impede apresentar o exercício como ensaio confirmatório perfeitamente pré-registrado.

## Reprodução local dos resultados preservados

Execute da raiz do repositório. R 4.4.2 e Python 3 foram usados. A análise usa base R; o oráculo usa `jsonlite`. Pandoc, XeLaTeX e Poppler são necessários para PDF/inspeção.

```sh
Rscript --vanilla quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications/scripts/analyze.R
python3 quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications/scripts/build_report.py
pandoc quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications/report.md --resource-path=quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications --pdf-engine=xelatex -o output/pdf/piloto_carbono_implicacoes_novas_2026-10-11.pdf
python3 quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications/scripts/verify_run.py
```

O PDF pode mudar bytes por metadados de compilação. As tabelas CSV da análise devem reproduzir os valores. O verificador registra hashes de integridade dos arquivos atuais; `--check-manifest` verifica o manifesto já salvo sem regenerá-lo.

Para reproduzir somente o benchmark em outro diretório, sem sobrescrever o congelado:

```sh
Rscript --vanilla quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications/scripts/oracle.R /private/tmp/carbon-oracle-reproduction
```

O CSV e os documentos devem coincidir; o JSON de regras contém data da execução. Para novas chamadas de IA, copie o pacote para um novo diretório experimental antes de rodar as etapas abaixo. Não reutilize respostas e não apague o pacote original. Novas chamadas usam a autenticação/cota do serviço e não garantem respostas idênticas.

```text
run_novel.py discovery
run_novel.py select
[congelar seleção e plano de análise]
run_novel.py confirmation
code_novel.py prepare
code_novel.py code
code_novel.py collect
[auditar mensuração; só aplicar reparo se houver justificativa independente]
repair_measurement.py prepare
repair_measurement.py code
repair_measurement.py collect
```

Os scripts de chamadas não repetem automaticamente uma solicitação concluída. Registram prompt, esquema JSON, resposta, eventos, uso e erro, incluindo respostas não desejáveis.

## Leitura dos resultados

- `results/rejection_rates.csv`: taxas em 1.000 conjuntos por condição e intervalos de Wilson para Monte Carlo, condicionais ao corpus de calibração.
- `results/exact_operating_rates.csv`: probabilidades verdadeiras de rejeição do procedimento aproximado sob o oráculo. Diferem legitimamente das realizações finitas.
- `results/explicit_premise_rates.csv`: controle de atribuição, independente da novidade das implicações.
- `results/textual_ppc.csv` e `joint_kernel.csv`: exemplo completo dos documentos às probabilidades e PPC.
- `results/call_pattern.csv` e `batch_fidelity.csv`: exatamente uma inversão pública em cada chamada de oito mundos. Padrão compatível com quota, sem afirmar conhecer o processo interno da IA.
- `results/measurement_sensitivity.csv`: robustez às três inferências dependentes do desenho.
- `agents/`: debate, revisão de novidade, matemática, codificação cega e atribuição.
- `verification/`: log, adjudicação, manifesto e sumário de verificação.

C0 deixa novos observáveis não especificados. C+ é uma ablação que reutiliza os estados da IA e verifica que a prosa não acrescenta informação à estatística depois da codificação. O baseline que checa premissas explícitas usa as mesmas informações do prompt e limita a atribuição de ganho à IA.

## Limites científicos

Os valores 12/2/6, 5%, 80% e pesos .6/.4 são sintéticos. As fontes históricas motivam o mecanismo, sem identificar esses valores. O PPC condiciona o posterior em uma evidência inicial D e avalia novos registros reservados R. Não representa um PPC histórico completo do caso nem prova que a hipótese SA ou CA seja verdadeira. O corpus é pequeno, há apenas um modelo/alias e a estimação empírica contém zeros. Não se decompõe a contribuição de desvio da IA e erro de estimação finita à descalibração. O ganho incremental de IA na descoberta de checks permanece uma pergunta para comparação com informação e recursos iguais.
