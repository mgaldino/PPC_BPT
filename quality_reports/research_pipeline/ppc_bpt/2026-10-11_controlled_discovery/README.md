# Teste executado: IA, templates e falhas de dependência

**Resultado:** a IA formulou uma implicação entre o aviso inicial e o anúncio público, mas não demonstrou melhora na falha principal frente a templates composicionais comparáveis. Na falha principal F2, N=96, a rejeição foi 4,08% na IA e 88,16% no check conjunto. Em N=384, IA=85,74% e templates de paridade=85,90%. A diferença pareada IA menos paridades foi -0,16 ponto percentual, IC95% [-0,39; +0,07]. São resultados sintéticos condicionais a este corpus e a este mecanismo, sem validação histórica.

O relatório completo está em `report.md`. PDF: `output/pdf/piloto_carbono_sorteios_controlados_2026-10-11.pdf`, a partir da raiz do repositório. O manuscrito e o suplemento foram preservados.

## O que foi feito

- Cinco subagentes distintos: identificação, atribuição, desenho adversarial, implementação R e auditoria semântica cega. O implementador não revisou a própria análise.
- 13 chamadas novas de CLI autenticado no ChatGPT: seis descobertas, uma seleção e seis codificações. Alias solicitado `gpt-5.6-sol`, esforço `low`. Autorrelatos UNKNOWN, sem versão imutável demonstrada.
- IA e templates receberam as mesmas regras e uniformes R nos 24 episódios documentais. O PPC usa a mesma lei controlada em todos os braços, sem estimar probabilidades a partir da prosa.
- F2 mantém as marginais e todos os pares dos três erros, mas viola a independência mútua. Cada check direto isolado tem distribuição preservada. Isso não equivale a preservar o agregado nem todas as premissas do modelo.
- 300.000 conjuntos de referência e 60.000 de avaliação. N=96 primário, N=24/384 sensibilidades. H é comum a cada conjunto, integrado fora do produto.
- Auditor independente reconstituiu todos os 360.000 p-valores globais/decisões e recalculou 61.200 discrepâncias. Todas as decisões e tabelas concordaram.

## Congelamentos e limites

`verification/design_freeze.json` antecede as chamadas. `selection_freeze.json` antecede a avaliação. `addendum_freeze.json` acrescenta o comparador de paridades depois de conhecer as escolhas da IA e antes de qualquer resultado. Não se apresenta esse adendo como anterior à descoberta. O comparador primário de caminhos e a seleção original permaneceram intactos.

A IA reportou corretamente os 96 campos de S,A,M,P. A codificação por CLI e a auditoria independente coincidiram com a verdade R em 192/192 campos nos 48 conjuntos IA/templates. Contudo, todos os 24 textos IA expuseram H e narraram reversões internas, impedindo cegamento completo. Os PPCs usaram apenas as tabelas dos observáveis e os estados R. O corpus bruto foi preservado sem reparo silencioso.

As três funções selecionadas não são independentes: `A xor P` é função de `V+W`. A seleção permitia agregações de categorias, excluindo somente partições idênticas. O conjunto 123, escolhido pela regra prospectiva de IA rejeitar enquanto diretos passam, é dirigido por um check invariante sob F2. Não demonstra detecção da falha pela implicação nova. O relatório também mostra integralmente o primeiro conjunto F2, sem seleção pelo resultado.

## Reprodução dos cálculos preservados

Execute da raiz `/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT`. R 4.4.2, `jsonlite`, Python 3, Pandoc, XeLaTeX e Poppler foram usados. Cálculos ficam nos scripts R; o documento somente importa resultados.

```sh
Rscript --vanilla quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/scripts/analyze.R
Rscript --vanilla quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/scripts/worked_example.R
Rscript --vanilla quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/scripts/plot_report.R
python3 quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/scripts/build_report.py
pandoc quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/report.md --resource-path=quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery --pdf-engine=xelatex -o output/pdf/piloto_carbono_sorteios_controlados_2026-10-11.pdf
python3 quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/scripts/verify_run.py
```

Para verificar o manifesto existente sem regenerá-lo:

```sh
python3 quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/scripts/verify_run.py --check-manifest
```

A análise sobrescreve somente resultados derivados desse pacote. Para uma reprodução em separado, copie o pacote a um novo diretório, execute nele os scripts com o ajuste de `root` nos exportadores e preserve o original. Os CSVs estatísticos devem coincidir. PDF pode mudar bytes por metadados. Os RDS de auditoria permitem conferir contagens, caudas e decisões sem repetir chamadas da IA.

## Novas gerações de IA

Não são necessárias para reproduzir os resultados preservados e não garantem respostas idênticas. Para uma nova rodada, copie os scripts a outro diretório e crie novos arquivos de congelamento. Não apague ou reutilize as respostas originais. A sequência executada foi:

```text
prepare.R
[congelar desenho]
discover.py discovery
discover.py select
[congelar selected_checks.json e auditar tabelas]
measurement.py prepare
measurement.py code
measurement.py collect
[congelar adendo anterior à avaliação]
analyze.R
worked_example.R
plot_report.R
build_report.py
[compilar e inspecionar PDF]
verify_run.py
```

`calls.py` preserva prompts, esquema, resposta, eventos, uso e status. Não repete solicitações com status já gravado. As chamadas usam a cota autenticada do serviço, não uma API externa paga. O total de tokens das 13 chamadas foi 243.105 de entrada e 13.993 de saída; esse total não inclui a coordenação por subagentes.

## Arquivos para retomar o trabalho

- `protocol.md`, `protocol_addendum.md`, `foundations.txt`: regras, decisões e alcance.
- `data/candidates.json`, `selected_checks.json`: todas as propostas e seleção congelada.
- `data/error_laws.csv`, `joint_laws.csv`: números experimentais e probabilidades dos observáveis.
- `results/rejection_rates.csv`, `paired_differences.csv`: resultados e incerteza Monte Carlo.
- `results/first_F2_documents.csv`, `first_F2_counts.csv`, `first_F2_endpoint.csv`: exemplo completo.
- `results/example_*`: exemplo selecionado pelo protocolo, com a ressalva de atribuição acima.
- `results/audit_draws_N*.rds`: todas as referências, contagens e decisões.
- `agents/`: debate e revisões independentes.
- `verification/`: hashes, auditoria, manifesto e inspeção do PDF.

O aprendizado metodológico é preservar informação conjunta entre partes do mecanismo e usar IA como proponente de implicações sujeitas a validação. Permanecem em aberto a estimação das probabilidades históricas, a utilidade de observáveis externos ao modelo, o desempenho em outros mecanismos e eventual ganho de tempo para o pesquisador. Nenhum resultado foi incorporado ao manuscrito.
