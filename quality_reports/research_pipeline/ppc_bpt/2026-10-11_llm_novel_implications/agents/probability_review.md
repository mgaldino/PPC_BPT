# Auditoria independente do cálculo probabilístico

Data: 2026-10-11. Auditor: redo_identification. Escopo inicial: leitura de `scripts/analyze.R` antes de sua execução, sem consultar os resultados de confirmação, e verificações independentes de funções usando dados artificiais exclusivamente para exercitar o código. Nenhum código ou dado foi alterado. SHA256 da versão auditada: `85b5a80fadcdda609afd90c7d8e195cf0381c7cad7b21bc059220c9690b1b7db`.

## Veredito matemático

As fórmulas de probabilidade multinomial e Dirichlet-multinomial estão corretas. A hipótese H é comum ao conjunto de 12 mundos: o código calcula .6 vezes a massa conjunta sob SA mais .4 vezes a massa conjunta sob CA. A cauda é a probabilidade inclusiva de obter uma massa preditiva menor ou igual à observada, correspondente à discrepância menos log da massa do histograma. As projeções e rótulos de quatro e oito células coincidem.

## Achados adjudicados

1. **CONFIRMADO — mapeamento e projeção.** `analyze.R:10–27` usa ordem público, interno, choque, com público variando mais rapidamente. Agregar pares adjacentes de oito células produz as quatro células choque × interno. Conferência independente em todas as células passou.
2. **CONFIRMADO — enumeração.** `analyze.R:32–36` gera todas as 455 composições de 12 em quatro células e todas as 50.388 em oito células, sem repetição, com soma 12 em cada linha.
3. **CONFIRMADO — multinomial/DM.** `analyze.R:37–48` corresponde às fórmulas padrão. Conferi todas as massas multinomiais contra `dmultinom` e todas as massas DM contra uma implementação independente em produtos gamma para concentrações positivas não inteiras. Diferenças absolutas inferiores a 1e-13. As massas somaram um.
4. **CONFIRMADO — H compartilhado.** `analyze.R:49–55` mistura depois de formar o produto/conjunta sob cada hipótese. Isso preserva a dependência entre mundos por H comum, conforme o protocolo.
5. **CONFIRMADO — cauda.** `analyze.R:56–62` implementa a cauda inclusiva de surpresa do histograma. Comparei 100 pontos por distribuição com soma ingênua das massas menores ou iguais, com diferença abaixo de 1e-12. A tolerância relativa usada para empates é numericamente razoável. As seis distribuições testadas tiveram rejeição própria no máximo .05.
6. **CONFIRMADO — percentuais e intervalos.** `analyze.R:70–91` calcula proporção rejeitada por 1.000 datasets, não por 12.000 mundos. Wilson descreve incerteza Monte Carlo dos datasets condicionada ao kernel fixado; não inclui incerteza do modelo linguístico. O relatório deve manter essa distinção.
7. **CONFIRMADO — preocupação com dados ausentes.** `analyze.R:29–30,52` usa `tabulate`, que ignora NA/células inválidas. Sem uma asserção de codificação completa, isso renormaliza silenciosamente o kernel pelos casos válidos, enquanto `:135–141` usa o total de linhas como denominador da fidelidade. Recomendação: validar explicitamente todos os valores antes de construir o kernel, ou implementar categoria de não mensuração. A existência efetiva de casos inválidos ainda não foi verificada, pois a codificação estava em andamento.
8. **CONFIRMADO — priors não projetivas.** `analyze.R:53` acrescenta .5 por célula tanto em k=4 como em k=8. A projeção da prior de oito células gera concentração 1 por célula em k=4, não .5. Isso não invalida análises separadas, mas a comparação DM primária-secundária muda simultaneamente indicadores e prior. Relatar essa sensibilidade ou acrescentar uma comparação com prior projetivamente coerente.
9. **CONFIRMADO — limite da comparação IA versus template.** O kernel C+ é copiado dos estados de L (`analyze.R:166–171`). Igualdade é consequência esperada dessa ablação e não evidência independente de calibração. C0 não define a nova distribuição; registrar não especificado, sem tratá-lo como previsão de zero.
10. **CONFIRMADO — limitação central de atribuição.** O defeito documental eleva a inversão público/interno de .05 para .80, violando diretamente uma premissa fornecida no prompt. Sua detecção pelo check de oito células não demonstra por si só utilidade de uma implicação nova composta. Um check da taxa de discordância entre memorando e anúncio, derivado diretamente dessa única premissa, já detecta o mesmo defeito. Recomendo incluí-lo como controle de atribuição, mantendo a seleção primária inalterada. Superar o C0 antigo demonstra ampliação de escopo; não basta para mostrar superioridade frente ao uso das premissas explicitamente dadas.
11. **CONFIRMADO — transparência da correção secundária.** `data/secondary_freeze.json` declara a revisão do candidato SA02_02 antes de inspecionar confirmação/benchmark e identifica a análise como exploratória, não como seleção confirmatória autônoma. Essa distinção deve permanecer no resultado: o primário automático selecionou um check; a expansão para dois recebeu intervenção de revisão.

## Cálculos independentes adicionais

Usando somente o oráculo matemático, sem dados de confirmação, o teste de surpresa em quatro células tem tamanho exato 0.04938013 e poder 0.04938013 contra a troca dos pesos SA/CA. Em oito células, tamanho 0.04796721 e poder 0.05185969. Esses resultados respeitam o teto 1.5 × alfa demonstrado na auditoria de identificação. Eventual rejeição muito maior contra a troca sob o kernel IA precisa ser lida à luz da taxa de falso alarme sob o null.

Para o controle de premissa explícita, K é o número de desacordos entre anúncio público e decisão interna em 12 mundos. Sob o null, K ~ Binomial(12,.05). Aplicando a mesma ordenação por surpresa da massa, o limiar .05 rejeita K >= 3, com tamanho exato 0.01956826. Sob inversão .80, o poder exato é 0.9999955. Portanto, a falha documental não é um desafio que requeira IA ou novas implicações para ser detectado.

## Pendências de execução

Após a execução: conferir validade/denominadores da codificação, resultados reais da fidelidade e distribuição conjunta, igualdade L/C+, PPCs dos exemplos e eventuais alterações deste script. A auditoria atual confirma a matemática do código, mas não certifica resultados que ainda não existiam.

## Reavaliação das correções antes da execução

Conferi a versão subsequente de analyze.R, SHA256 `8e975d97e13a1848005ab572f8a7c404e0c6708dd7df6e18036d5cf7fedc40de`.

- **Achado 7 tratado:** linhas 9–15 registram missingness.csv e interrompem a análise se houver categorias desconhecidas/negativas, evitando a renormalização silenciosa identificada. Ainda será necessário conferir os valores efetivamente produzidos.
- **Achado 8 mantido como limitação declarada:** as duas priors Dirichlet(.5 por célula) continuam diferentes; o responsável confirmou que não atribuirá diferenças entre essas análises exclusivamente aos novos indicadores.
- **Achado 10 tratado no desenho:** `data/attribution_freeze.json` registra o comparador da premissa explícita antes da avaliação; analyze.R:115–127 calcula K e a cauda binomial superior. Para n=12 e p=.05, as massas decrescem com K, de modo que essa cauda coincide também com a cauda ordenada por surpresa usada no cálculo independente acima. O controle preserva todas as análises originais. Sua finalidade é avaliar atribuição, não provar que a IA jamais possa ajudar em outros problemas.

## Auditoria independente dos resultados executados

Os resultados finais foram conferidos sem executar novamente o script de produção nem modificar suas saídas. Uma implementação independente enumerou histogramas por posições de separadores (`combn`, em vez da recursão do script), calculou massas multinomiais por `dmultinom`, massas DM pela fórmula gamma e caudas por soma direta. Os 18.000 PPCs dos 3.000 datasets × duas projeções × três métodos concordaram, com erro inferior a 1e-11. Também conferi os 18 exemplos selecionados, a soma .6 massa_SA + .4 massa_CA, as 36 codificações do corpus-oráculo, os 128 estados L/C+ e o comparador binomial. Tudo passou.

### Mensuração

O arquivo estrito foi preservado: 44 de 128 choques estavam desconhecidos, sem desconhecidos nos dois indicadores de apoio. A recodificação alterou 41 pela identificação textual direta do canal e três por inferência sob a regra estipulada de exatamente um choque. Isso é uma correção legítima do excesso de exigência de declarar também a dimensão constante; as três inferências devem permanecer identificadas como dependentes do desenho fechado. Elas não são observação histórica direta nem demonstração de que o gerador respeitou a premissa usada para inferir o canal.

Avaliei todas as oito atribuições possíveis aos três canais inferidos, mantendo os outros valores. A taxa EXATA de rejeição sob o verdadeiro null continuou em 12.4111%–12.9485% na análise primária empírica e 19.9373%–21.3651% na secundária empírica. A descalibração não depende da solução adotada para esses três textos. Essa sensibilidade é diagnóstica e não transforma observações ausentes em dados históricos.

### Resultados e interpretação

Os números de rejeições nas 1.000 réplicas de cada condição foram confirmados:

| Análise | Kernel | Nulo | Troca SA/CA | Falha documental |
|---|---|---:|---:|---:|
| Primária | IA empírico | 126 | 174 | 136 |
| Primária | Dirichlet | 28 | 47 | 46 |
| Secundária auditada | IA empírico | 201 | 320 | 1000 |
| Secundária auditada | Dirichlet | 5 | 24 | 991 |
| Premissa explícita | Binomial(.05) | 25 | 19 | 1000 |

Rejeitar 20.1% dos datasets nulos ao limiar de 5% impede chamar o kernel empírico secundário de diagnóstico calibrado. A rejeição de todos os defeitos documentais não compensa esse problema. A Dirichlet amplia incerteza e reduz alarmes, mas sua hipótese de observações multinomiais independentes não foi validada para as chamadas do LLM, e priors diferentes por projeção continuam sendo uma sensibilidade, não validação histórica.

Calculei adicionalmente as taxas populacionais EXATAS, integrando a região de rejeição de cada kernel sob o oráculo verdadeiro. Isso separa a descalibração do ruído dos 1.000 datasets:

| Análise | Kernel | Alarme exato sob null | Rejeição exata sob troca SA/CA |
|---|---|---:|---:|
| Primária | IA empírico | 0.1294852 | 0.1762988 |
| Primária | Dirichlet | 0.03881634 | 0.05308592 |
| Primária | Oráculo | 0.04938013 | 0.04938013 |
| Secundária | IA empírico | 0.2136511 | 0.2965357 |
| Secundária | Dirichlet | 0.01704742 | 0.02469307 |
| Secundária | Oráculo | 0.04796721 | 0.05185969 |

A realização de cinco falsos alarmes em 1.000 datasets da Dirichlet secundária não é seu tamanho populacional de 0.5%; este é 1.7047% no oráculo. Todos os poderes exatos sob troca SA/CA respeitam o teto de 1.5 vezes a respectiva taxa real de alarme. O aparente 320/201 observado não contradiz o teto, porque ambas são contagens Monte Carlo.

### Padrão de chamadas

Cada uma das 16 chamadas de confirmação contém exatamente uma inversão entre memorando e nota pública: 16/128 = 12.5%, diante de 5% estipulados. A ocorrência independe das três inferências de canal. Sob a amostragem iid especificada no prompt, a probabilidade do padrão de uma inversão em cada chamada é `[dbinom(1,8,.05)]^16 = 1.374054e-9`; a cauda binomial para pelo menos 16 inversões em 128 mundos é 0.000686677. A primeira é uma probabilidade diagnóstica de um padrão percebido após observar os resultados, não um teste confirmatório preregistrado de mecanismo interno.

O padrão é compatível com produção por quotas e incompatível com tratar ingenuamente essas 128 saídas como evidência de amostragem independente bem calibrada. Não prova como o LLM decidiu internamente. O bootstrap por chamadas produz intervalo degenerado [.125,.125] porque todas têm a mesma taxa observada; isso não estabelece certeza sobre futuras chamadas/modelos nem corrige o desvio em relação à probabilidade alvo.

**Conclusão da auditoria:** o cálculo foi executado corretamente, preservou os resultados negativos e demonstrou consequências compostas e falhas operacionais. Não demonstrou melhora calibrada e exclusiva da IA sobre templates que utilizem as mesmas premissas. O comparador de premissa explícita detectou todos os defeitos documentais do benchmark com 25 falsos alarmes, contra 201 do kernel IA empírico secundário.
