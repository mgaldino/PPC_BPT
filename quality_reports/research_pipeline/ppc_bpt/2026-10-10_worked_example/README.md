# Exemplo executado: das fontes ao PPC no caso do carbono

10/10/2026. Exemplo retrospectivo de um submodelo observacional de adesão à carta de maio de 2015. Não estima probabilidades de motivos privados e não constitui replicação da inferência causal do artigo original. O manuscrito foi preservado.

## Entrega

- Relatório: `worked_example.md`.
- PDF: `output/pdf/exemplo_numerico_ppc_carbono_2026-10-10.pdf`, relativo à raiz do projeto.
- Cálculos separados: `worked_example.R`, somente base R.
- Entradas: `data/cohort.csv`, `data/signatories.csv`.
- Fontes e codificação: `data/provenance.md`.
- Carta primária integral e extração: `sources/letter_to_christiana_figueres_2015.pdf` e `.txt`.
- Revisão independente de outro agente: `review_independent.md`.
- Verificação final e adjudicação: `verification.md`.

## Reprodução

Execute da raiz do projeto. R 4.4.2, Pandoc, XeLaTeX e Poppler foram utilizados. O R não precisa de pacotes adicionais. `LC_ALL` abaixo evita avisos de locale específicos deste Mac; adapte ao sistema quando necessário.

```sh
example_dir=quality_reports/research_pipeline/ppc_bpt/2026-10-10_worked_example
LC_ALL=en_US.UTF-8 Rscript "$example_dir/worked_example.R"
pdftoppm -singlefile -r 180 -png "$example_dir/results/conditional_ppc.pdf" "$example_dir/results/conditional_ppc"
pandoc "$example_dir/worked_example.md" --standalone --number-sections --resource-path="$example_dir" --pdf-engine=xelatex -o output/pdf/exemplo_numerico_ppc_carbono_2026-10-10.pdf
```

O script enumera os 256 vetores, não depende de seed e não executa Monte Carlo. Fornece também uma função de geração de réplicas.

## Resultados principais

| Quantidade | Valor | Origem |
|---|---:|---|
| Empresas na coorte | 8 | Artigo de Vormedal et al. |
| Signatárias dentro da coorte | 5 | Lista completa da carta |
| Ausências da lista dentro da coorte | 3 | Junção dos dois CSVs |
| Média posterior de theta | 0,60 | Modelo Bernoulli comum + prior Beta(1,1) + contagens |
| PPC, discrepância regional absoluta | 0,00600575894694 | Enumeração e integração |
| Checagem condicional a cinco adesões | 1/56 = 0,01785714285714 | Equiprobabilidade dos subconjuntos sob o modelo |
| Cota do PPC sob qualquer posterior de theta em M0 | 1/128 = 0,0078125 | Restrição da distribuição conjunta |
| PPC em M1 com parâmetros regionais | 0,31175015460730 | Revisão pós-hoc ilustrativa, não validada |

`results/` contém `coded_data.csv`, `scope_exclusions.txt`, `results.csv`, `prior_sensitivity.csv`, `conditional_ppc.csv`, `all_predictive_vectors.csv`, `sessionInfo.txt` e a figura em PDF/PNG.

O prior, a distribuição conjunta, a escolha retrospectiva da discrepância e a revisão regional são julgamentos declarados. Igualdade de oportunidade de adesão não foi demonstrada; as oito posições pertencem a uma iniciativa coordenada. A dependência específica por região pode alterar inteiramente o diagnóstico.

Os números não são P(SA), P(CA), P(Y|SA) ou P(Y|CA). Para usá-los em BPT causal, seria necessária uma ligação substantiva adicional entre cada mecanismo e a distribuição das respostas documentais. Nenhuma das hipóteses SA/CA implica automaticamente M0.
