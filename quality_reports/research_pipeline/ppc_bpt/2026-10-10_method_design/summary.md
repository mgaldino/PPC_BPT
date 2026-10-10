# Entrega: método preditivo para process tracing Bayesiano

Data: 10 de outubro de 2026. Status: proposta consolidada e revisão documental concluídas; implementação e validação científica pendentes.

## Resultado

O núcleo recomendado prevê respostas a perguntas documentais delimitadas, usando categorias completas e distribuições probabilísticas justificadas. Para um bloco ainda não examinado, a previsão é epistêmica; uma réplica da produção, preservação ou mensuração documental é uma extensão distinta que requer um modelo próprio. Espaços pequenos podem ser enumerados exatamente. A contribuição candidata é tornar a especificação e o diagnóstico praticáveis, explicitando dependência, observabilidade, sensibilidade e limites de localização.

- [Relatório final em PDF, 11 páginas](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/output/pdf/proposta_metodo_ppc_bpt_2026-10-10.pdf).
- [Fonte editável do relatório](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposta_final.md).
- [Revisão independente do relatório](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/final_audit.md).
- [Fontes primárias consultadas e escopo da pesquisa](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/sources.md).

O relatório responde à dificuldade de construir y-rep, desenvolve dois exemplos numéricos sintéticos e especifica a futura implementação em R, as aplicações possíveis e o estudo de validação. Nenhuma implementação analítica ou simulação de desempenho foi executada.

## Coordenação e debate

A leitura inicial foi separada da proposição de mudanças. Sete leituras de seções e suplemento alimentaram um contrato de fidelidade. Depois, três agentes prepararam propostas independentes, leram os colegas e trocaram objeções e respostas diretamente. Os registros distinguem críticas, concessões e limites persistentes. Um quarto agente revisou o relatório consolidado sem editá-lo.

| Proponente | Proposta | Debate e decisão final |
|---|---|---|
| A: modelo gerador e observação | [Original](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposals/A_generative.md) | [Rodada cruzada](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/debate/A_round1.md); [posição final](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/debate/A_final.md) |
| B: previsão mínima e avaliação | [Original](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposals/B_predictive.md); [esclarecida](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposals/B_predictive_round1_clarified.md) | [Rodada cruzada](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/debate/B_round1.md); [posição final](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/debate/B_final.md) |
| C: identificação e validação | [Original](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposals/C_validation.md); [esclarecida](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposals/C_validation_round1_clarified.md) | [Rodada cruzada](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/debate/C_round1.md); [posição final](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/debate/C_final.md) |

As versões originais A/B/C correspondem exatamente aos hashes registrados na adjudicação. As correções B/C foram preservadas separadamente; suas trilhas constam das respectivas rodadas. Consenso entre agentes não foi tratado como validação empírica.

## Verificação documental

- [Contrato de fidelidade](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/argument_contracts/ppc_bpt/8bcda550633f/argument_contract.md) e seu JSON passaram no validador contra a fonte canônica.
- [Adjudicação](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/adjudication/ppc_bpt/8bcda550633f/adjudication_round1.md) e seu JSON passaram no validador contra fonte e contrato. Dez problemas: cinco confirmados, cinco parciais.
- [Conferências do coordenador](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/coordinator_checks.md) e revisão independente verificaram as contas apresentadas e os limites de interpretação. Não foram testes empíricos.
- Manuscrito Rmd, PDF preexistente, suplemento e bibliografia mantêm exatamente os hashes do [preflight](/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT/quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/preflight.md). O estado Git mudou por checkpoint externo durante a tarefa; nenhuma edição ou commit nesses arquivos foi realizado pela equipe.
- O PDF foi compilado por Pandoc/XeLaTeX. Todas as páginas foram inspecionadas em imagens; tabelas e fórmulas foram conferidas. Uma legenda separada da tabela e uma página final com duas linhas foram corrigidas antes da entrega.
- Após a revisão independente, ocorreram somente correção de “eliciação”, ajuste de paginação e condensação do último parágrafo, sem mudança das recomendações ou resultados.
- Não houve reescrita do paper, execução de análise do projeto, nova codificação empírica sistemática, publicação, envio a terceiros ou serviço externo pago.

O status de adjudicação READY_FOR_IMPLEMENTATION significa que os problemas documentados estão verificados para orientar trabalho futuro. Não significa validação do método, autorização de reescrita nem prontidão para submissão.

## Reprodução do PDF

Executar na raiz do projeto, com Pandoc e XeLaTeX disponíveis:

```sh
pandoc quality_reports/research_pipeline/ppc_bpt/2026-10-10_method_design/proposta_final.md --standalone --number-sections --pdf-engine=xelatex -o output/pdf/proposta_metodo_ppc_bpt_2026-10-10.pdf
```

A fonte Markdown inclui os parâmetros tipográficos e todas as tabelas/fórmulas; não há análise embutida. O pacote opcional microtype não está instalado neste ambiente e foi retirado do cabeçalho. A geração final terminou com código de saída 0.

Verificações estruturais executadas:

```sh
python3 /Users/manoelgaldino/.codex/skills/argument-fidelity-gate/scripts/validate_contract.py quality_reports/argument_contracts/ppc_bpt/8bcda550633f/argument_contract.json --artifact paper_draft_v1.Rmd
python3 /Users/manoelgaldino/.codex/skills/adjudicate-review/scripts/validate_adjudication.py quality_reports/adjudication/ppc_bpt/8bcda550633f/adjudication_round1.json --artifact paper_draft_v1.Rmd --contract-file quality_reports/argument_contracts/ppc_bpt/8bcda550633f/argument_contract.json
```

## Próximas fases previstas, não executadas

1. Delimitar originalidade e escolher poucas oportunidades com probabilidades defensáveis.
2. Implementar enumeração em R e comparar versões equivalentes sob a mesma informação.
3. Executar estudo de desempenho incluindo falhas de mecanismo, observação e dependência e casos de equivalência.
4. Auditar a reserva empírica antes da aplicação; material já visto é desenvolvimento.
5. Reescrever o paper a partir dos resultados, preservando a extensão construtiva de Fairfield e Charman.

A proposta não elimina a necessidade de obter probabilidades absolutas justificadas. Se os modelos admissíveis forem muito amplos ou observacionalmente equivalentes, a conclusão adequada é limitada ou inconclusiva.

