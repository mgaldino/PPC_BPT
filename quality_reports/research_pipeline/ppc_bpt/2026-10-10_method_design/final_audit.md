# Revisão independente do relatório final

Data: 10 de outubro de 2026. Escopo: leitura integral de `proposta_final.md`, `CLAUDE.md`, posições finais A/B/C e trechos pertinentes de `paper_draft_v1.Rmd`. Revisão delimitada à coerência estatística, fidelidade dessas fontes, contas dos exemplos e distinção entre proposta e validação. Não houve implementação, execução de scripts analíticos ou nova revisão de literatura. O revisor não editou o relatório nem o manuscrito.

**Resultado: nenhum erro material identificado no escopo inspecionado.** O relatório está apto à entrega como proposta metodológica com validação pendente. Este parecer não constitui aprovação científica do método nem avaliação da probabilidade de publicação.

## Verificações

1. **Objeto preditivo e ontologia.** As linhas 29–35, 90–104 e 119–123 distinguem a incerteza sobre a resposta documental já existente de uma repetição hipotética da produção, preservação ou observação de registros. A configuração histórica compartilhada é sorteada uma vez por vetor; o texto não recomenda ressorteios independentes de um mesmo fato por fonte. O condicionamento residual em informação de desenvolvimento é preservado. A posição corresponde às ressalvas finais de A, B e C.

2. **Probabilidades e limites do diagnóstico.** As linhas 131–140 exigem recomputação coerente dos pesos quando muda o modelo e distinguem sensibilidade de intervalo de credibilidade. As linhas 144–156 separam ocorrência de detecção, explicitam o problema de identificação e evitam atribuir automaticamente uma falha a um elo. O texto também distingue alvos que discriminam rivais de alvos capazes de revelar falhas compartilhadas.

3. **Tabela 3, linhas 110–119.** Ambas as colunas condicionais normalizam. As misturas com pesos 0,8/0,2 são, respectivamente, 0,60; 0,14; 0,16; 0,10, somando 1. Enumeração e sorteio categórico representam a mesma distribuição; nenhuma qualidade empírica é inferida dessas contas.

4. **Tabela 4, linhas 162–173.** As colunas normalizam. As quatro misturas são 0,536; 0,364; 0,044; 0,056. Para (1,0), o Bayes factor é 3,28 e o posterior dos baixos interesses é 0,164/0,364 = 0,450549…, compatível com 0,451. A surpresa preditiva e a atualização relativa são corretamente separadas. O indicador raro é previamente especificado e recebe interpretação limitada.

5. **Demais contas e bounds.** As preditivas 0,82 e 0,082 das linhas 64–69 estão corretas sob a independência condicional declarada. Os limites de Fréchet [0,5; 0,7] da linha 152 estão corretos. Na linha 181, os extremos são 0,7×0,04 + 0,3×0,01 = 0,031 e 0,9×0,06 + 0,1×0,03 = 0,057. Na linha 266, as expressões originais produzem 0,87425 e 0,41125; a célula API deveria produzir 0,5325 com os pesos declarados, confirmando o erro apontado no manuscrito.

6. **Fidelidade e limites da entrega.** A incompatibilidade entre configuração completa e integração pelos mesmos elos é sustentada pelas linhas 107 e 180–188 do manuscrito. A reutilização de ILD/“1999 trap” é sustentada pelas linhas 278–279 e 323. A discussão de FC preserva sua estrutura teórica e formula o problema como operacionalização. Os exemplos, futuras simulações, implementação e aplicação aparecem como tais; não se apresentam como resultados executados. A competitividade para *Political Analysis* depende explicitamente da execução e da originalidade ainda pendente.

## Limites desta revisão

Não foram reavaliadas todas as fontes externas, a proveniência integral dos registros de trabalho nem a evidência empírica dos casos. A inspeção do PDF e a confirmação da compilação cabem ao coordenador. Não há correção material solicitada ao relatório neste parecer.
