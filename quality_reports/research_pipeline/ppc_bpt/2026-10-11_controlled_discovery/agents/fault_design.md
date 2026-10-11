# Proposta adversarial de falhas e controles

Data: 11/10/2026. Autor: subagente redteam. Proposta anterior à descoberta CLI; não executei gerações nem implementei a análise. O coordenador deve congelar os parâmetros escolhidos e o hash do desenho antes da chamada de descoberta. As probabilidades são artificiais, sem estimação histórica.

## Referência comum e o sentido de “preservar premissas locais”

Considere S~Bernoulli(1/2), independente dos ruídos U1,U2,U3. No modelo nulo, os ruídos são independentes Bernoulli(e), com e=0,2. A cadeia é A=S xor h xor U1; M=A xor U2; P=M xor U3, onde h é o deslocamento binário da hipótese quando o desenho o utilizar. Todos os cálculos e testes precisam integrar a hipótese conforme a regra congelada; o H verdadeiro não deve ser entregue à descoberta ou ao teste se for latente no problema.

Como S é equiprovável, cada nó é marginalmente equiprovável, inclusive condicionado aos ruídos. As distribuições dos pares adjacentes dependem apenas das marginais dos ruídos. Dependências entre ruídos podem, portanto, preservar esses checks enquanto alteram implicações compostas.

É incorreto escrever que as falhas preservam **todas** as premissas: a independência mútua dos ruídos é uma premissa do nulo e será violada. O enunciado correto identifica a família de checks preservada em distribuição. “Em distribuição” não quer dizer que cada amostra finita passará todos os testes.

## F1: dependência moderada entre canais documentais

Mantenha U1 independente. Com probabilidade lambda, sorteie V~Bernoulli(e) e faça U2=U3=V; com probabilidade 1-lambda, sorteie U2,U3 independentemente como no nulo. Sugestão de intensidade principal: lambda=0,5, congelada antes da descoberta. A correlação entre U2 e U3 é lambda. O coordenador pode usar outro lambda previamente fixado, sem escolher sua intensidade após observar as sugestões da IA.

Todas as marginais dos ruídos e todos os pares adjacentes da cadeia são preservados. Porém, P(U2=1,U3=1)=e²+lambda*e(1-e), portanto um check explícito do par residual U2,U3 detecta a falha. **F1 é controle positivo da suite enriquecida**, não uma falha invisível a ela.

Para h=0, P(P≠S)=e+(1-2e)*2e(1-e)*(1-lambda). Com e=0,2, isso é 0,392 no nulo e 0,296 para lambda=0,5. A intensidade moderada também pode ser lambda=0,25, resultando em 0,344; não selecionar entre elas pela potência observada.

Interpretação substantiva limitada: canais documentais podem compartilhar condições de produção, edição ou erro, invalidando sua independência. A construção de inversões binárias correlacionadas não demonstra um mecanismo histórico específico nem representa automaticamente cópia literal de documentos. A interpretação política é uma motivação para o benchmark, não validação empírica da parametrização.

## F2: dependência de terceira ordem nos ruídos

A proposta comunicada pelo coordenador é:

`p_f(u1,u2,u3) = p_0(u1,u2,u3) - 0,03 * (-1)^(u1+u2+u3)`.

Para e=0,2, a perturbação é válida e tem soma zero. As oito probabilidades são: 000=0,482; cada estado com um erro=0,158; cada estado com dois erros=0,002; 111=0,038. A menor probabilidade é 0,002.

Ao somar qualquer coordenada, os sinais cancelam. Logo **todas as marginais e todos os pares dos ruídos são exatamente preservados**. O mesmo vale para as marginais dos nós e os pares adjacentes da cadeia. A independência mútua, porém, não é preservada.

O evento de paridade ímpar tem probabilidade 0,392 no nulo e 0,512 na falha: quatro células ímpares recebem 0,03 cada. Para h=0, corresponde a P(P≠S). Para h=1, a orientação é invertida; integrar H pode reduzir ou cancelar o sinal, especialmente com pesos perfeitamente equilibrados. Portanto, verificar a identificabilidade observável no modelo efetivamente usado, sem ajustar pesos posteriormente para beneficiar a IA.

O nível de replicação de H importa: se h é sorteado independentemente em cada mundo com pesos 1/2, as perturbações de sinais opostos cancelam exatamente na distribuição observável de cada mundo. Se H é global e compartilhado por todo o conjunto de 96 mundos, a distribuição do conjunto é uma mistura de produtos, não o produto das misturas; a orientação desconhecida não implica ausência de poder, pois estatísticas simétricas podem detectá-la. Congelar se H é global ou específico de cada mundo, assim como a regra posterior, antes da implementação.

**Decisão recebida do coordenador antes da geração:** H é comum ao conjunto de observações; os pesos 0,6/0,4 são herdados do experimento anterior e fixados antes dos resultados, sem escolha para favorecer potência. Sob h=0/h=1, as probabilidades de discrepância entre extremidades são 0,392/0,608 no nulo e 0,512/0,488 em F2. A igualdade de pesos, caso examinada como sensibilidade, não tornaria automaticamente esses conjuntos observacionalmente equivalentes para n>1 com H compartilhado. O alerta de cancelamento exato não se aplica ao desenho comum-H adotado.

F2 passa em distribuição pela suite de marginais e pares **dos ruídos**, mas altera uma relação composta entre as extremidades. É um teste de estresse estatístico deliberado. Não apresentá-lo como uma patologia política estabelecida ou como evidência de que relações de paridade sejam frequentes em arquivos reais.

Se e ou a distribuição de U1 variar entre hipóteses, recalcular positividade e efeito antes de congelar: delta=0,03 não é automaticamente válido para outros parâmetros.

## F3: controle negativo de equivalência observacional

Se houver espaço para um terceiro cenário, prefiro um controle negativo a outra falha forte. Introduza Z não observado, equiprovável, e distribuições condicionais `p(U|Z)=p_0(U)+s_Z*delta*(-1)^sum(U)`, com s_Z em {-1,+1} e delta=0,005. Ambas são válidas em e=0,2; a mistura cancela exatamente a perturbação e produz a distribuição observável nula.

Há uma organização latente diferente, mas nenhuma diferença observável marginal. Nenhum método pode detectá-la com potência superior ao tamanho usando apenas as observações disponibilizadas. Esse cenário previne a conclusão indevida de que uma narrativa plausível sobre falha equivale à identificação da falha. É um controle de impossibilidade, não uma alternativa com potência desejada. O controle nulo usual já mede tamanho; este acrescenta apenas a interpretação de equivalência observacional.

## Debate: ruídos versus marginais observáveis

`redo_identification` sugeriu uma alternativa com e=0,25 e perturbação diretamente nas 16 células observáveis por um termo proporcional a chi4=(-1)^(S+A+M+P). Essa construção preserva todos os marginais próprios observáveis. Contudo, na cadeia, chi4=(-1)^(h+U1+U3). Assim, ela altera o par residual U1,U3 e é detectável por uma suite enriquecida que examine todos os pares de ruídos.

As duas propriedades não são equivalentes: preservar marginais observáveis de ordem inferior não significa preservar pares de ruídos, pois estes são funções de vários nós. **Para o objetivo declarado de superar checks dos pares de ruídos, recomendo F2 acima**, preservando a alternativa chi4 como proposta não implementada. Não combinar as alegações de ambas em um único cenário.

O roteamento direto para os agentes novos retornou “not found”; enviei essas distinções ao coordenador para encaminhamento. Recebi e considerei as propostas de `redo_identification` e `novel_attribution`.

## Comparação justa e critérios de êxito

- Congelar F1/F2 e eventuais controles antes da descoberta. A IA recebe somente o modelo nulo, o esquema observável e o orçamento de sugestões, sem os dados alternativos, intensidades, nomes ou descrição das falhas.
- Baseline simples: checks locais declarados. Baseline enriquecido: composição determinística das mesmas equações e checks derivados sob o mesmo orçamento. Baseline forte: distribuição conjunta enumerada/omnibus. Não atribuir à IA vantagem obtida ao proibir composição ao comparador.
- Validar cada sugestão por enumeração do nulo antes de olhar potência. Separar estatística derivada das premissas de nova hipótese auxiliar. Uma sugestão inválida não pode ganhar crédito por rejeitar com frequência.
- Calibrar o tamanho global comum por simulação nula ou distribuição exata, incluindo seleção e múltiplas estatísticas do procedimento. Usar os mesmos datasets alternativos para comparar métodos de modo pareado.
- N primário=96 e sensibilidades 24/384, conforme decisão do coordenador. Não trocar o N principal conforme os resultados. Informar incerteza Monte Carlo para tamanho e potência.
- Êxito possível da IA: propor um check válido, não redundante no conjunto básico, e atingir ganho de diagnóstico sob orçamento explicitado. Não pressupor ganho sobre o baseline composicional ou omnibus. Empate ou vantagem determinística são resultados informativos.

**Conclusão:** F1 testa dependência comum facilmente diagnosticável; F2 testa uma lacuna específica entre independência em pares e independência mútua; F3 pode demonstrar o limite da identificação. O desenho compara procedimentos de descoberta e diagnóstico em um benchmark artificial, sem estimar mecanismos históricos do carbono.
