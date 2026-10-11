# Reprodução da auditoria fonte → restrições

Esta entrega implementa a contabilidade das restrições de `protocolo.md`. **Não houve elicitação humana; nenhuma probabilidade absoluta de E3 foi estimada, e nenhum PPC empírico pontual foi obtido.** SA significa *Strategic Accommodation*; CA, *Competitive Advantage*.

## Executar

Na raiz do repositório, usando R base (sem instalação de pacotes):

```sh
Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-10_e3_source_constraints/audit_constraints.R
```

O script identifica sua própria pasta e também pode ser executado por caminho absoluto de qualquer diretório. Regenera somente `results/source_impacts.csv`, `results/constants.csv`, `results/unit_checks.csv` e `results/sessionInfo.txt`.

## Entradas e proveniência

- `data/source_constraints.csv`: seis cartões documentais F1–F6. As duas colunas de limites absolutos contêm `NA`: ausência de magnitude fornecida, **não zero**. Os localizadores, URLs e papéis de cada fonte acompanham cada linha. Os cartões completos estão em `agents/01_sources.md`.
- `data/published_weights.csv`: julgamentos centrais publicados, reproduzidos da auditoria anterior: prior 6 dB, E1 −4, E2 −3, E3 +12, E4 −7. Não são frequências empíricas. A soma é 4 dB, de onde deriva a posterior central usada no benchmark.
- Fontes arquivadas, consultadas em 10/10/2026: PDFs e extrações na pasta irmã `../2026-10-10_causal_likelihoods/sources/`. O relatório original e seu suplemento correspondem aos cartões F1, F2 e F6; `bp_2017.pdf`, `bp_2019.pdf` e `api_2021.pdf` correspondem a F3–F5. Não houve nova coleta neste script.

## Ler os resultados

`source_impacts.csv` mostra a ausência de estreitamento numérico de **a** após cada cartão. F1 define o evento observado; a normalização permite o fecho [0,1]. A observação, sozinha, não obriga todas as hipóteses rivais a lhe atribuir probabilidade positiva. A partir de F2, o benchmark adota a razão positiva finita e posteriores positivas após E3: o extremo zero é excluído, e o conjunto é (0,1]. A razão impõe `b=a/r`; portanto restringe b mesmo sem estreitar a. A coluna `absolute_a_numeric_narrowing=FALSE` refere-se ao intervalo absoluto de a, não à inexistência de informação em F2.

Os valores de r e w são fixos na auditoria condicional. **As linhas não representam uma atualização bayesiana sucessiva com os novos documentos.** BP2017, BP2019 e API2021 auditam interpretações. Incorporá-los como informação S mudaria o condicionamento para `P(E3|H,C,S)` e exigiria nova análise ou premissa explícita de invariância; não se pode conservar automaticamente r e w.

O coeficiente central `w+(1-w)/r` é aproximadamente 0,733219088. Assim, o PPC condicional tem ínfimo zero não atingido e máximo 0,733219088. Isso depende do julgamento central publicado e do auxiliar de replicação definido no relatório; não mede precisão empírica. A faixa publicada de 10–15 dB para E3 está registrada em `constants.csv`, mas **não foi propagada** nesta auditoria central.

## Escopo das verificações

O script confere IDs, duplicações, proveniência, campos ausentes, ausência de denominadores/frequências independentes, consistência do BF com os pesos e normalização das distribuições. Os testes de `mass_bounds(g,d)` usam valores sintéticos exclusivamente para verificar a função: condições suficientes e impeditivas com massas mínimas justificadas produziriam [g,1−d], e `g+d>1`, valores fora de [0,1] ou ausentes são rejeitados. **Nenhum desses valores foi atribuído a uma fonte ou a E3.**

Os documentos não são tratados como oportunidades independentes, e o número de documentos não é usado como denominador. Os poucos pontos usados nos testes de identidade não são observações, respostas de especialistas nem uma distribuição sobre a.

`results/unit_checks.csv` registra testes de implementação, não validação científica. `results/sessionInfo.txt` registra o ambiente R. Implementação por agente 09; adjudicação científica e revisão independente pertencem a outros agentes. O manuscrito e o protocolo não foram alterados por esta implementação.
