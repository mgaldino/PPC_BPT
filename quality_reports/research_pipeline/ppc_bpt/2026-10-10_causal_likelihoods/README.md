# Likelihoods causais e PPC de BPT

10/10/2026. Resposta à correção do usuário: o exemplo de assinaturas não era PPC do BPT causal. Esta rodada preserva SA/CA e o E3 original de Fairfield–Charman; não preenche probabilidades absolutas sem fonte.

## Resultado

Fonte → pesos relativos publicados → posterior original → família normalizada de likelihoods SA/CA → réplica condicional → envelope exato do PPC. O resultado é uma demonstração de informação faltante. **Não foi obtido um PPC causal pontual empiricamente fundamentado**, nem uma elicitação humana. O envelope não valida ou refuta os mecanismos.

- Síntese: `proposta.md`.
- PDF: `output/pdf/likelihoods_causais_ppc_bpt_2026-10-10.pdf`, relativo à raiz do projeto.
- Código separado: `causal_ppc.R`.
- Entradas: `data/published_weights.csv`, `data/source_ledger.csv`, `data/provenance.md`.
- Fontes: `sources/`, PDFs integrais e extrações textuais.
- Dez contribuições: `agents/01_sources.md` até `agents/10_audit.md`.
- Síntese do debate: `debate/sintese.md`.
- Adjudicação e integridade: `verification.md` e `adjudication.json`.

## Reprodução

Da raiz do projeto, com R, Poppler, Pandoc e XeLaTeX disponíveis:

```sh
example_dir=quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods
LC_ALL=en_US.UTF-8 Rscript "$example_dir/causal_ppc.R"
pdftoppm -singlefile -r 180 -png "$example_dir/results/ppc_family.pdf" "$example_dir/results/ppc_family"
pandoc "$example_dir/proposta.md" --standalone --number-sections --resource-path="$example_dir" --pdf-engine=xelatex -o output/pdf/likelihoods_causais_ppc_bpt_2026-10-10.pdf
```

O locale acima foi usado neste Mac; adapte se necessário. O R usa apenas base R. Não há seed porque o cálculo é exato e `drawrep()` não é executado. A função foi fornecida para mostrar o gerador, exigindo que o usuário forneça uma escala; ela não escolhe uma.

## Números e origem

| Quantidade | Valor | Estatuto |
|---|---:|---|
| Prior e pesos SA/CA | 6, −4, −3, 12, −7 dB | Julgamentos publicados de FC, não frequências |
| Posterior SA | 0,715252751049199 | Reconstrução aritmética, escopo agregado |
| BF de E3 | 15,8489319246111 | Transformação dos 12 dB |
| P(E3 dado SA), a | Não identificado | Nenhum ponto escolhido |
| P(E3 dado CA) | a/BF | Restrição da família que preserva o BF |
| PPC(a) | 0,733219087853802 × a | Check condicional com auxiliar de réplica explícito |
| Fecho do envelope | [0; 0,733219087853802] | Zero é limite; o evento observado exclui a=0 |
| Fronteira para PPC=0,05 | a=0,0681924418339332 | Exigência matemática, não limite empiricamente sustentado |

`family.csv` contém 1001 especificações positivas e o limite zero. São coordenadas do espaço de modelos, nunca observações, elicitações ou draws de um prior. `frontier.csv`, `posterior_chain.csv`, `results.csv` e `sessionInfo.txt` preservam cálculos e ambiente.

As dez contribuições encontraram fontes mecanísticas melhores, mas nenhuma âncora absoluta demonstrada para o E3. A proposta operacional é obter uma âncora ou intervalo, primeiro de modo independente do diagnóstico desejado, e reportar o conjunto de PPCs permitido. O evento composto foi preservado; coarsenizá-lo requer nova likelihood. A comparação entre SA e CA tampouco absorve silenciosamente HR, hipótese reputacional explicitada no apêndice original.
