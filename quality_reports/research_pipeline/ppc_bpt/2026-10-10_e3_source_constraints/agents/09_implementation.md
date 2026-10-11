# Implementação do registro de restrições

10 de outubro de 2026. Escopo exclusivo: implementação e verificação de funcionamento; não revisão científica independente. Li `protocolo.md`, `01_sources.md`, `04_math.md`, `CLAUDE.md` e os pesos usados na rodada anterior. Não alterei o manuscrito nem o protocolo.

## Arquivos entregues

- `audit_constraints.R`: execução em R base, com leitura de entradas, verificações e escrita de resultados.
- `data/source_constraints.csv`: cartões F1–F6 com URL, localizador, papel, efeito documentado, origem dos números e restrições absolutas ausentes (`NA`). Não fornece likelihood empírica.
- `data/published_weights.csv`: cópia dos julgamentos centrais publicados e localizadores usados no benchmark anterior.
- `results/source_impacts.csv`: fecho e inclusão dos extremos da projeção sobre a; fecho de b e envelope do PPC no benchmark central.
- `results/constants.csv`, `results/unit_checks.csv`, `results/sessionInfo.txt`: valores calculados, verificações de implementação e ambiente.
- `README.md`: comando de reprodução, significado das entradas/saídas e limites.

## Execução realizada

Comando: `Rscript quality_reports/research_pipeline/ppc_bpt/2026-10-10_e3_source_constraints/audit_constraints.R`.

Resultado: exit code 0. O R emitiu advertências de inicialização de locale (LC_CTYPE, LC_COLLATE, LC_TIME, LC_MESSAGES, LC_MONETARY) e utilizou `C`. As entradas analíticas têm nomes/campos ASCII, e os cálculos foram concluídos sem erro. O ambiente efetivo está em `results/sessionInfo.txt`.

Resultados centrais calculados: r = 15,84893192461113287; w = 0,71525275104919861; coeficiente e máximo do PPC = 0,73321908785380241. Ínfimo zero, não atingido no benchmark com BF positivo finito e posteriores positivas após E3. A linha F1 registra apenas definição do evento e fecho normalizado: não infere positividade sob toda hipótese rival a partir da ocorrência isolada.

F3–F6 não acrescentam limites numéricos de a na auditoria documental. Isso não significa ausência de valor causal ou conceitual das fontes. A faixa de julgamento 10–15 dB foi registrada, mas a implementação não a propagou: o resultado é condicional aos valores centrais.

## Verificações de funcionamento

Oito verificações registradas em CSV: limites sem massa adicional [0,1], propagação de massas sintéticas, rejeição de certificados incompatíveis, rejeição de magnitude ausente, rejeição de valores fora de [0,1], normalização e identidades de BF/PPC, ausência de estreitamento artificial nas linhas documentais e preservação de NA. Valores sintéticos só aparecem em testes unitários explicitamente identificados; não se tornam observações, elicitações ou probabilidades atribuídas a E3.

Também são conferidos IDs, duplicações, proveniência dos pesos, ausência de denominadores e de observações independentes de frequência, BF central consistente e posterior acumulada de 4 dB. Não se multiplicam fontes como se fossem novas observações independentes, e as linhas de documentos não atualizam r ou w.

Não houve coleta nova, solver, amostragem Monte Carlo, elicitação humana ou estimativa da âncora absoluta. A validação empírica e o PPC pontual permanecem ausentes. O agente 10 é responsável pela revisão independente; este registro não certifica validade científica por autoavaliação.
