# Auditoria independente das cinco implicações propostas

Data: 11/10/2026. Escopo: validade matemática, unidade, novidade, operacionalização e premissas auxiliares de `raw/discovery/answer.json`. Nenhum resultado do simulador, script R ou resposta original foi alterado. As fontes históricas consultadas já estavam disponíveis: nenhuma é holdout.

O piloto não demonstrou ganho científico novo da IA nesta etapa. I1–I3 reorganizam diretamente coeficientes fornecidos no prompt. I4 tenta uma transformação por Bayes, mas contém erros aritméticos e troca a unidade. I5 sugere uma busca documental possível, condicionada a hipóteses novas ainda não testadas. A utilidade dessas propostas como auxílio à pesquisa é diferente da descoberta de uma implicação adicional validada.

## Artefatos e método

Foram lidos integralmente `design.md`, `design_amendment_01.md`, `prompts/discovery.txt` e `raw/discovery/answer.json`. A emenda registra mudança operacional para `gpt-5.6-sol`, esforço low, após recusas de disponibilidade do modelo inicialmente solicitado; não muda as regras probabilísticas. A auditoria não verificou novamente toda a execução do CLI. O prompt de descoberta contém contexto fictício e números sintéticos, sem evidência histórica fornecida. Isso permite avaliar a resposta sem atribuir suas previsões a uma calibração empírica; não constitui demonstração de ausência de conhecimento prévio no modelo.

Identidades SHA-256 lidas nesta auditoria:

- `design.md`: `a366a878a45c769807a8c9b37e0141d9eb1ad528eb89d4fb710da14f3ffdffef`.
- `design_amendment_01.md`: `9409edbcea15556a02641374daf79058fbbe6c907b33e6e020f9678331d1b26d`.
- `raw/discovery/answer.json`: `06b1bc7814a4c971f4514cb308d9680051cbd51671556f5d28e0cbf5e58dba8b`.

O localizador de cada proposição é `implications[id=I1]` a `implications[id=I5]` nesse JSON, que ocupa uma única linha. O contrato relevante está em `design.md`, linhas 7–11 e 35–37: uma observação é a decisão coletiva da coalizão de quatro firmas em um mundo; nenhum coeficiente foi estimado das fontes; sugestões não entram no PPC desta rodada.

Verificação independente por enumeração em R, executada com sucesso:

```r
d <- expand.grid(Q = 0:1, K = 0:1)
d$SA <- .1 + .6 * d$Q + .1 * d$K
d$CA <- .1 + .1 * d$Q + .6 * d$K
for (h in c("SA", "CA")) {
  pa <- mean(d[[h]])
  pqa <- mean(d$Q * d[[h]])
  pka <- mean(d$K * d[[h]])
  print(c(P_A = pa, P_QA = pqa, P_KA = pka,
          P_Q_given_A = pqa / pa, P_K_given_A = pka / pa))
}
```

| Q | K | P(A=1\|SA,Q,K) | P(A=1\|CA,Q,K) |
|---|---|---:|---:|
| 0 | 0 | 0,1 | 0,1 |
| 1 | 0 | 0,7 | 0,2 |
| 0 | 1 | 0,2 | 0,7 |
| 1 | 1 | 0,8 | 0,8 |

## Veredictos por implicação

| ID | Classificação | Validade e novidade | Uso delimitado |
|---|---|---|---|
| I1 | CORRIGIR | Os valores 0,7 e 0,2 e a diferença 0,5 estão corretos. São substituição direta nas regras. A expressão “among firms” muda indevidamente a unidade. | Reformular como contraste entre mundos/decisões coletivas sob configurações discordantes. Documentos de quatro firmas não fornecem quatro observações da decisão da coalizão. |
| I2 | APROVEITÁVEL, como dedução | A diferença de 0,6 sob SA e 0,1 sob CA está correta nos dois valores de K. É o coeficiente de Q reexpresso, sem nova restrição. | Usar como conferência do modelo ou orientação de busca, preservando o caráter probabilístico. Uma recomendação binária em dois memorandos não mede a diferença de probabilidades. |
| I3 | APROVEITÁVEL, como dedução | A diferença de 0,1 sob SA e 0,6 sob CA está correta nos dois valores de Q. É o coeficiente de K reexpresso, sem nova restrição. | Mesmo limite de I2. “Mudança fraca” de uma decisão binária isolada não operacionaliza uma diferença de risco de 0,1. |
| I4 | REJEITAR na forma gerada | Predição, raciocínio e rival contêm números incompatíveis entre si e com as regras. A composição de firmas numa coalizão não é a composição de mundos aderentes. | Uma proposição corrigida pode servir como consequência algébrica adicional, nunca como confirmação empírica dos números originais. |
| I5 | CORRIGIR | Não decorre do núcleo. Reconhece uma premissa auxiliar, mas frequência/prominência de justificativas continua sem mecanismo documental mensurável. | Aproveitar como candidata a busca futura, depois de definir corpus, unidade de codificação, denominador, temporalidade e relação entre incentivos e escrita. |

### Detalhes necessários

I1–I3 não exigem premissas extras para a álgebra. Sua mensuração histórica exigiria decisões coletivas comparáveis, Q e K medidos antes da decisão e evidência que permita comparar probabilidades, ou um modelo explícito ligando cenários documentais a essas probabilidades. Sob o modelo causal assumido, os contrastes são causais por construção. Aplicá-los causalmente ao caso histórico requer identificação adicional; o prompt não oferece essa identificação. Documentos podem revelar razões e contrastes percebidos sem estimar os coeficientes numéricos.

Em I4, `P(A=1)=0,45` está correto. Sob SA, `P(Q=1,A=1)=0,375`, mas `0,375/0,45=5/6≈0,833333`, não 0,75. Além disso, `0,25(0,2+0,8)=0,25`, não 0,225. Logo `P(K=1|A=1)=0,25/0,45=5/9≈0,555556`, não 0,5625 nem 0,50. Sob CA os resultados são invertidos: 5/9 para Q e 5/6 para K. Mesmo `0,225/0,45=0,50`, exibido no raciocínio, diverge de 0,5625 na predição. O denominador correto é o conjunto de mundos com adesão coletiva, não uma lista de participantes individuais. A conclusão direcional de maior presença de Q sob SA é recuperável; sua magnitude depende também das distribuições Bernoulli e da independência postuladas.

Em I5, coeficientes da probabilidade de adesão não são automaticamente pesos de utilidade subjetiva nem intensidade de linguagem. O canal congelado exige que o memorando explicite Q,K,A; isso não obriga a mencionar Q mais vezes que K. A nota pública omite K como fato público (`design.md`, linha 9), portanto eventual diferença público/privado no texto sintético pode ser produzida pela própria instrução. Um teste documental de I5 teria de especificar uma nova distribuição de textos condicionada aos estados e/ou às hipóteses e distinguir presença, contagem e proeminência de justificativas. A busca histórica precisa ainda tratar a dependência entre documentos sobre a mesma decisão e a seleção do corpus. Essas condições não foram estabelecidas empiricamente.

## Confronto retrospectivo com fontes disponíveis

Foram consultados os arquivos em `../2026-10-10_causal_likelihoods/sources/`:

- **BP 2017**, `bp_2017.txt`, linhas 49–54: registra a possibilidade de evitar regras futuras de refinarias e a redução temporária desse benefício sob Trump. É uma pista de mecanismo regulatório para BP; não constitui o contraste controlado de I2, não identifica K, não revela as probabilidades da coalizão e não fornece contagens representativas de justificativas.
- **BP 2019**, `bp_2019.txt`, linhas 29–40, 49–64 e 75–79: combina objetivos de mudança de narrativa, contenção de políticas prejudiciais e crescimento empresarial em Washington. Oferece contexto para estudar produção estratégica de mensagens; não mede ganho competitivo líquido relativo aos concorrentes nem a decisão federal coletiva de 2017. Referências a crescimento não bastam para classificar K=1.
- **API 2021**, `api_2021.txt`, linhas 15–18 e 65–71: prevê preempção ou interoperabilidade para reduzir duplicação e proteção contra desvantagens competitivas. Evitar desvantagem não equivale a ganho competitivo líquido. O texto é público, de outro ator e período; não fornece a composição exigida por I4 nem o corpus interno anterior à adesão requerido por I5.

Nenhuma dessas fontes identifica as probabilidades numéricas de I1–I4. A presença de linguagem regulatória é compatível com ambas as regras, pois CA também tem efeito positivo de Q. A documentação pode ilustrar a relevância das perguntas sugeridas; não valida a ordenação de frequências de I5 nem discrimina as hipóteses sem as premissas adicionais. Classificação final: duas deduções aproveitáveis, duas propostas que precisam de correção e uma rejeitada como gerada. Não há previsão nova empiricamente validada nesta etapa.
