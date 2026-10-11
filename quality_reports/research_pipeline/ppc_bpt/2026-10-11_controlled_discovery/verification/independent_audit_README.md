# Reprodução da auditoria independente

`independent_audit.R` preserva o corpo exato do script executado por heredoc R na auditoria independente final. `independent_audit.log` preserva a saída capturada daquela execução, incluindo os avisos de locale. A gravação dos arquivos não executou novamente a análise nem modificou seus cálculos.

A partir de `/Users/manoelgaldino/Documents/DCP/Papers/PPC_BPT`, execute:

```sh
Rscript --vanilla quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery/verification/independent_audit.R > /private/tmp/ppc_controlled_independent_audit_rerun.log 2>&1
```

A auditoria usa apenas R base e lê os RDS, tabelas de resultados e leis congeladas. Ela não gera novas amostras, não chama IA e não grava resultados. Confere 61.200 discrepâncias brutas, todos os 360.000 p-valores globais e decisões, as tabelas integrais de taxas e diferenças pareadas e as invariâncias diretas. A saída de uma nova execução pode variar nos avisos de locale e na última casa de arredondamento de diferenças de ponto flutuante, sem alterar as tolerâncias dos checks.
