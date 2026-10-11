# Desenho de comparação justa e atribuição

Data: 11 de outubro de 2026. Parecer independente de desenho, sem implementação. Este arquivo registra a proposta comunicada ao coordenador e discutida com os revisores de identificação e desenho. O objetivo é identificar contribuição da busca e seleção de implicações, mantendo geração, informação e avaliação comparáveis.

**Recomendação:** executar a cadeia com sorteios controlados em R, comparar checks diretos, composição determinística, implicações da IA e distribuição conjunta completa, e calibrar cada procedimento a 5% usando a mesma lei nula. Um ganho contra os checks diretos isoladamente não identifica benefício exclusivo da IA. O comparador determinístico deve calcular consequências das mesmas equações e incluir a relação entre início e fim da cadeia.

## 1. Modelo comum e o que cada participante pode observar

O consenso recebido do coordenador especifica quatro campos binários observáveis: choque `S`, decisão `A`, memorando `M` e anúncio público `P`. A hipótese `H` é comum a todo conjunto de mundos, com pesos 0,6/0,4. Escrevendo `h=0` para SA e `h=1` para CA:

\[
S\sim Bernoulli(0,5),\quad E_1,E_2,E_3\stackrel{iid}{\sim}Bernoulli(0,2),
\]
\[
A=S\oplus h\oplus E_1,\quad M=A\oplus E_2,\quad P=M\oplus E_3.
\]

Todos os braços recebem essas mesmas regras nulas, os mesmos campos disponíveis, o mesmo tamanho do conjunto e a regra de H comum. O gerador de propostas da IA não recebe defeitos, seus resultados, exemplos dos checks procurados ou o codebook dos comparadores. A implementação em R sorteia estados e produz uma representação documental fixa, compartilhada entre braços. As frequências da IA não são usadas como probabilidades do modelo neste teste.

**Ajuste indispensável de mensuração:** `E1` depende de `h`, que não está disponível para classificar uma observação. O primeiro erro observável deve ser definido como `U1=A XOR S=E1 XOR h`. Os demais são `U2=M XOR A=E2` e `U3=P XOR M=E3`. Os indicadores de todos os braços usam somente `S,A,M,P`, ou funções deles. As probabilidades dos indicadores são calculadas sob cada H e integradas com H comum. Não se usa o H verdadeiro de cada conjunto para computar seu indicador ou selecionar o componente mais favorável.

As 16 combinações dos quatro campos permitem uma representação exaustiva e auditável de qualquer indicador observável. Enumerar as probabilidades dos 16 estados sob cada H é simples. Enumerar todos os histogramas de N observações nesses estados pode ser muito caro, portanto a calibração de estatísticas conjuntas pode usar referência Monte Carlo controlada, sem alegar enumeração exata de todos esses histogramas.

## 2. Defeitos e alcance da preservação

O controle com dependência entre E2 e E3 pode preservar seus erros marginais e alterar seu par. Ele testa se o baseline enriquecido realmente verifica a informação direta disponível. Não deve ser apresentado como sucesso exclusivo de uma implicação nova.

O desafio mais forte proposto é:

\[
q_1(e_1,e_2,e_3)=q_0(e_1,e_2,e_3)-0,03(-1)^{e_1+e_2+e_3},
\]

onde `q0` é o produto Bernoulli(0,2). A perturbação soma zero e desaparece ao marginalizar qualquer um dos três erros. Preserva, portanto, cada marginal univariada e cada distribuição bivariada dos erros. É positiva: a menor célula da qual se subtrai 0,03 tem massa 0,032. A probabilidade de paridade ímpar passa de 0,392 para 0,512. Essa é uma consequência da composição dos três estágios, que um algoritmo determinístico também pode deduzir.

É incorreto dizer que esse defeito preserva todas as premissas do modelo. Ele viola a independência mútua dos erros explicitamente postulada. A formulação adequada é **“preserva os checks diretos marginais e bivariados pré-especificados, mas altera uma consequência de ordem superior da composição”**. Preservar integralmente uma distribuição conjunta completamente especificada impediria qualquer ganho de detecção.

Há uma ressalva adicional: preservar a distribuição de **cada check isolado** não preserva necessariamente a distribuição conjunta dos vários checks. A dependência entre suas estatísticas pode mudar. Um máximo ou outro teste global dos checks diretos pode então ter alguma detecção. Para o consenso com calibração global a 5%, deve-se medir o desempenho de T0 e não prometer que ele será cego ao defeito. Se a finalidade fosse garantir um controle negativo global com rejeição de no máximo 5%, testes marginais válidos combinados por Bonferroni forneceriam esse limite sem exigir independência. Essa variante seria potencialmente conservadora e não deve ser confundida com igualdade do tamanho real entre braços.

## 3. Comparadores determinísticos competitivos

O baseline não deve estar limitado a inserir estados em frases. Com as mesmas equações, um programa pode eliminar variáveis intermediárias, enumerar a lei dos observáveis e produzir implicações compostas.

| Braço | Regra congelada, sem acesso aos defeitos | Papel na atribuição |
|---|---|---|
| T0 | Checks marginais e bivariados de U1, U2 e U3, com probabilidades derivadas da lei nula e mistura por H comum | Verificar o que a leitura direta das premissas já detecta |
| T0 + Tpath | Acrescentar todas as relações de pares de nós observáveis não adjacentes no grafo: `(S,M)`, `(S,P)`, `(A,P)` | Comparador composicional que inclui a consequência entre início e fim |
| T0 + IA | Acrescentar até três implicações admissíveis propostas em contexto novo, congeladas antes da avaliação | Medir a contribuição do conjunto escolhido pela IA |
| Tfull | Teste global da distribuição dos 16 estados observáveis, com as mesmas probabilidades nulas | Comparador forte que usa toda a informação modelada |

Tpath deve ser obtido por uma regra geral sobre o grafo: enumerar todos os pares de nós conectados por caminhos com duas ou mais etapas. Essa regra encontra os três pares acima independentemente do defeito escolhido. Suas probabilidades são computadas por composição ou enumeração exata dos estados, não estimadas por respostas de linguagem. A distribuição completa utilizada por Tfull também provém somente das regras nulas compartilhadas.

O teste global pode ser congelado como surpresa da massa do histograma sob a mistura multinomial, incluindo o coeficiente multinomial. A referência deve sortear H uma vez por conjunto. Alternativamente, uma estatística máxima de discrepâncias de células pode ser escolhida antes de qualquer desempenho. Não se escolhe depois a estatística com maior poder.

A IA poderá propor exatamente um dos pares de Tpath, uma função equivalente ou o próprio estado conjunto. Esses são resultados admissíveis e informativos. A comparação deverá registrar a equivalência, em vez de renomear o mesmo indicador como nova descoberta exclusiva. Tfull não é um limite superior matemático de poder para todos os defeitos: um teste direcionado pode superar um teste global. Ele é um comparador abrangente de informação, cuja escolha de estatística também deve ser congelada.

Se a IA escolher um único indicador direcionado e Tpath usar três, uma diferença pode refletir seleção e penalidade por múltiplos checks. Isso é parte possível da contribuição do procedimento de seleção, mas não prova acesso a consequências indisponíveis para composição determinística. Uma análise adicional de equivalência com o indicador determinístico correspondente pode mostrar esse mecanismo da diferença. Não selecionar retrospectivamente o melhor indicador de Tpath e apresentá-lo como decisão prospectiva.

## 4. Rubrica de novidade e admissibilidade

Cada candidata deve fornecer descrição verbal, premissas necessárias, derivação e uma tabela de verdade com exatamente as 16 combinações de `S,A,M,P`, associadas a categorias observáveis. A tabela define a implementação e evita uma tradução orientada pelo resultado. Categorias podem ser reordenadas sem criar novidade. A precisão das probabilidades é verificada contra a lei nula compartilhada, não contra a autoridade do modelo que as enunciou.

| Rótulo | Critério | Destino |
|---|---|---|
| Válida, direta | Repete um processo local ou check já definido em T0 | Registrar, mas não contar como implicação composta adicional |
| Válida, composta, equivalente | Combina etapas e coincide com um indicador de Tpath ou função já selecionada | Manter como evidência de formulação e registrar equivalência |
| Válida, composta, adicional | Combina premissas e produz um indicador admissível distinto da biblioteca de checks congelada | Elegível, sem atribuir novidade científica ou exclusividade lógica |
| Inválida por observação | Depende de H verdadeiro, erro não recuperável, documento inexistente ou dado externo | Excluir antes da avaliação, preservando motivo |
| Inválida por premissa | Requer hipótese auxiliar ausente, ou a derivação não decorre das regras fornecidas | Excluir antes da avaliação, preservando motivo |
| Redundante | É permutação de rótulos, complemento, transformação invertível ou reformulação de indicador já selecionado | Deduplicar pelo mapa das 16 linhas e pelo alvo do teste |

A seleção segue ordem de primeira ocorrência entre candidatas admissíveis, até três, ou outra regra explicitamente congelada antes das chamadas. Dois revisores podem conferir admissibilidade e equivalência, sem acesso ao desempenho. Discordâncias são adjudicadas por derivação ou tabela de verdade e permanecem documentadas. Zero candidatas válidas é um resultado possível. Não ampliar a seleção depois de conhecer a vantagem de um indicador no benchmark.

“Adicional à biblioteca” é relativo a uma lista finita de testes. Qualquer função dos quatro campos pode ser expressa a partir da distribuição conjunta completa. Portanto, nenhum resultado neste espaço finito prova uma capacidade lógica exclusiva da IA. A pergunta é se a IA encontra, escolhe ou operacionaliza um diagnóstico útil com melhor desempenho ou menor esforço que os comparadores definidos.

## 5. Sensibilidade, especificidade e execução da avaliação

O tamanho primário proposto pelo coordenador é N=96 mundos por conjunto, com N=24 e N=384 como sensibilidades. A escolha de N não deve ser revista após os resultados. Usar as mesmas realizações do benchmark para todos os braços permite comparar decisões de forma pareada.

1. Congelar fundamentos, comparadores, estatísticas, regra de seleção, tratamento de candidatas inválidas e métricas. Separar dados nulos de calibração dos conjuntos finais de avaliação. O gerador de candidatas vê somente os fundamentos nulos.
2. Gerar propostas, adjudicar admissibilidade e congelar suas tabelas de verdade. Só então compilar suas distribuições de referência a partir do mesmo simulador controlado usado pelos baselines. Nenhum braço recebe uma lei probabilística inferida das frequências da IA.
3. Calibrar cada teste global a 5% sob a mesma referência nula. Em testes discretos, registrar tamanho realizado/exato ou usar regra de randomização de fronteira previamente definida para igualdade de tamanho. Se a calibração for Monte Carlo, registrar seu erro e não chamar as taxas de exatas. Não ajustar limiares aos defeitos.
4. Avaliar sensibilidade em cada defeito e especificidade no nulo. Não agregar defeitos diferentes numa única taxa de acurácia sem apresentar cada condição. Relatar diferenças pareadas de rejeição entre T0+IA, T0+Tpath e Tfull, acompanhadas de incerteza. Usar tamanho real, além do limiar nominal, na interpretação do poder.
5. Nas sensibilidades N=24/384, manter candidatas e regras selecionadas. Recalcular somente a referência correspondente a N e aplicar a mesma política de calibração. Não escolher N com base no contraste mais favorável à IA.
6. Repetir a descoberta em contextos independentes se o objetivo incluir confiabilidade da seleção. Muitos conjuntos de teste para um único conjunto de checks estimam seu desempenho condicional, não a taxa de sucesso de novas descobertas pela IA. Custos, tempo, intervenções de revisão e número de candidatas excluídas devem ser registrados por execução.

É útil registrar também uma curva de poder em intensidades predefinidas do defeito de ordem superior, sem substituir a intensidade primária de 0,03. Isso evita basear uma conclusão de superioridade apenas em uma perturbação extrema. A possibilidade de a IA e Tpath terem resultados iguais é um desfecho substantivo, que demonstra composição reproduzível sem ganho exclusivo.

## 6. Conclusões autorizadas e limites

O novo teste pode mostrar que um check composto detecta uma perturbação que preserva os checks locais isolados e que a IA foi capaz de formular esse check. Se Tpath também o detectar, a contribuição demonstrada é de formulação ou seleção assistida, com equivalência a uma composição determinística. Se T0+IA apresentar maior sensibilidade a tamanho controlado que T0+Tpath e Tfull, o resultado será uma vantagem do conjunto de indicadores escolhido neste benchmark, sujeita à repetição da descoberta e a mecanismos novos.

Não seria autorizado concluir que o defeito preserva todas as premissas, que a IA descobre lógica indisponível para algoritmos determinísticos, que o resultado vale para probabilidades históricas, ou que recursos foram igualados sem medir e especificar os orçamentos. O teste atual iguala a informação e o gerador probabilístico. Uma comparação de eficiência exige ainda uma definição explícita de recursos comparáveis.

Os projetistas conhecem a família de defeitos, mesmo que as chamadas novas estejam cegas. Este piloto pode ter geração de propostas cega e avaliação congelada, mas a generalização para uma classe ampla de problemas requer mecanismos e defeitos não usados para construir o desenho. Esse limite deve permanecer no relatório.

**Decisão proposta para congelamento:** avançar com T0, T0+Tpath, T0+IA e Tfull, corrigindo E1 para o observável U1 e restringindo a alegação de preservação aos checks isolados. A calibração comum e os comparadores composicionais evitam atribuir à IA uma vantagem criada por templates deliberadamente restritos. Este parecer não implementa o desenho, não executa chamadas e não altera artefatos de outro experimento.

## Adendo: sensibilidade TpathXOR antes da avaliação

O coordenador informou, após a geração e seleção cegas e **antes de qualquer simulação de avaliação**, que as candidatas selecionadas foram `C03_1 = V+W` (três categorias), `C03_2 = S XOR P` (duas categorias) e `C04_1 = A XOR P` (duas categorias), com `V=M XOR A` e `W=P XOR M`. Também informou que o protocolo já permitia coarsenings e deduplicava somente partições idênticas. Esta avaliação usa essas informações e o modelo acima. Não consultou resultados de desempenho, não reviu a seleção e não editou o protocolo.

**Recomendação: aprovar e congelar agora T0+TpathXOR como análise de sensibilidade secundária.** O braço primário T0+Tpath, a seleção da IA e os demais comparadores devem permanecer. A nova análise aplica a mesma transformação aos três pares não adjacentes já definidos:

\[
TpathXOR=\{S\oplus M,\ S\oplus P,\ A\oplus P\}.
\]

Cada indicador tem duas categorias. Sua lei vem das mesmas equações nulas, por composição determinística. O braço usa o mesmo T0, a mesma regra de agregação de checks, a mesma calibração a 5% e os mesmos conjuntos de avaliação dos braços existentes. A regra deve ser registrada antes da avaliação com seus três indicadores completos, em vez de acrescentar apenas o XOR que posteriormente mostrar maior detecção.

### Justificativa de fairness

O contraste original compara pares de quatro categorias em Tpath com representações mais comprimidas selecionadas pela IA. A informação usada por cada XOR já está contida no respectivo par. Porém, um teste de uma partição mais simples pode ter desempenho diferente de um teste da tabela completa, por direcionar a estatística a outra propriedade da distribuição e reduzir suas categorias. Essa diferença não demonstra acesso a uma consequência que um algoritmo determinístico não consegue construir.

Aplicar XOR simetricamente aos três pares é uma transformação simples, geral e executável a partir do modelo. Portanto, TpathXOR é um controle relevante para essa explicação do desempenho. A motivação surgiu **depois de observar os indicadores escolhidos pela IA**, mas **antes de observar seus resultados de avaliação**. Essa cronologia permite uma sensibilidade transparente, congelada antes de medir desempenho. Não permite apresentá-la como comparador primário originalmente registrado ou como verificação independente de todas as decisões de desenho.

### O que o novo comparador controla e o que permanece diferente

Dois indicadores da IA aparecem literalmente em TpathXOR: `S XOR P` e `A XOR P`. O terceiro indicador difere: a IA tem `V+W`, enquanto TpathXOR tem `S XOR M`. Assim, a sensibilidade não iguala integralmente as coleções de estatísticas dos dois braços.

Além disso,

\[
A\oplus P=V\oplus W=(V+W)\bmod 2.
\]

Logo, `C04_1` é uma função de `C03_1`. `V+W` também é um coarsening do par direto `(V,W)` disponível a T0: distingue zero, uma ou duas inversões, mas não qual das duas etapas inverteu quando a soma é um. Essas relações não exigem descartar as candidatas sob a regra informada de deduplicação apenas de partições idênticas. Elas exigem evitar contar os três indicadores como três dimensões independentes de informação.

A calibração conjunta deve incorporar a dependência entre todos os checks, incluindo esse aninhamento. Mesmo que T0 contenha a informação do par `(V,W)`, acrescentar seu coarsening pode alterar o teste global, pois informação equivalente ou contida não implica equivalência de estatísticas e regiões de rejeição.

Se TpathXOR alcançar o desempenho de T0+IA, isso enfraquece uma atribuição de vantagem à formulação exclusiva da IA e sustenta a explicação por composição e compressão determinísticas simples. Se T0+IA permanecer melhor, a diferença ainda pode decorrer da inclusão de `V+W`, da seleção de estatísticas, de seu aninhamento ou da agregação. Não poderá ser atribuída automaticamente a novidade exclusiva. Uma análise adicional que reproduza os mapas exatos escolhidos pela IA verifica a equivalência posterior à seleção, mas não se transforma em uma descoberta determinística independente.

### Restrições para congelamento e relato

1. Registrar o novo braço como secundário, motivado pelas representações escolhidas na descoberta, sem acesso a taxas de rejeição. Preservar integralmente o protocolo e os resultados dos braços originais.
2. Aplicar os três XORs a todas as condições e tamanhos de amostra já previstos. Não selecionar transformações, limiares ou condições depois de conhecer o poder.
3. Utilizar a mesma política de calibração sob a lei nula. Compartilhar a referência e os conjuntos de avaliação quando compatível com o desenho. Relatar o tamanho obtido, além do limiar nominal.
4. Reportar T0+Tpath e T0+TpathXOR lado a lado. O novo braço explica uma diferença de representação, não substitui o comparador primário por aquele que vencer.
5. Se forem feitos testes formais de diferenças entre braços, declarar a família de comparações. A inclusão do novo braço não autoriza escolher apenas o contraste favorável à IA ou aos templates.

**Decisão:** recomendação favorável ao adendo proposto, com a classificação secundária e as limitações acima. Nenhuma taxa de sensibilidade ou especificidade foi consultada ou antecipada neste parecer. O único arquivo alterado foi `agents/fairness_design.md`.
