# Agente 06 — Como completar as likelihoods sem esconder uma escolha numérica

10 de outubro de 2026. Missão: verificar o fechamento algébrico das likelihoods e transformar a informação faltante numa pergunta de elicitação concreta. Li `02_identification.md`, seu adendo E3, `03_elicitation.md`, `04_structural.md` e a fonte FC extraída em `sources/fairfield_charman_2025.txt`, especialmente linhas 387–395 e 684–769. Debati diretamente com 04, 05 e 07. Não alterei manuscrito nem implementei R. Os números abaixo foram calculados em JavaScript diretamente das fórmulas registradas.

## Resultado

O Bayes factor do evento observado informa uma razão e deixa uma escala sem identificar. Essa escala pode ser completada por uma probabilidade absoluta, por um limite absoluto suficiente para uma decisão diagnóstica, ou, no caso binário, pelo Bayes factor do complemento exato. Nenhuma dessas quantidades adicionais foi encontrada nas fontes atuais. A contribuição operacional imediata é mostrar a célula faltante e o menor julgamento necessário, sem preencher essa célula com um número escolhido pelo analista.

A recomendação é privilegiar **limites absolutos justificados** sobre `P(E3|SA,C)`. Elicitar um Bayes factor para o complemento do E3 é algebricamente possível, mas substantivamente mais difícil e numericamente sensível. Uma partição com muitos cenários torna a pergunta mais clara, porém seus Bayes factors, sozinhos, não determinam as probabilidades de cada cenário.

## 1. Reconstrução fiel do exemplo

O E3 de Fairfield e Charman combina a iniciativa CLC, participantes, desenho da proposta e contribuições. O texto discute esse evento completo sob SA e CA e atribui aproximadamente 12 dB de evidência a favor de SA. Não se pode usar esse valor para apenas um rider, uma empresa, um email BP ou a fala de McCoy. Tampouco se pode reduzir E3 a uma categoria mais ampla e conservar automaticamente seu Bayes factor. Fonte: [Fairfield e Charman, 2025](https://doi.org/10.1017/psrm.2025.16), pp. 12–13.

Adotando os valores centrais publicados como uma especificação condicional ilustrativa:

\[
r=10^{12/10}=15.848931924611133,
\qquad w=\frac{10^{4/10}}{1+10^{4/10}}=0.7152527510491986.
\]

O primeiro número é um julgamento relativo publicado. O segundo incorpora prior e julgamentos de evidência publicados. Nenhum é uma frequência empiricamente estimada.

Se `C` fixa o prefixo informacional anterior a E3, escreva

\[
a=P(E_3\mid SA,C)=rt,
\qquad b=P(E_3\mid CA,C)=t,
\qquad 0<t\leq1/r.
\]

Cada `t` fixo, juntamente com as demais distribuições condicionais necessárias, define um modelo completo diferente. Seus complementos têm probabilidades `1−a` e `1−b`. Os modelos podem preservar a atualização de H do BPT porque o fator comum `t` cancela na razão das likelihoods do evento observado. Se `t` virar parâmetro aleatório, será necessário explicitar prior e atualização; uma média uniforme dos modelos não é autorizada pelas fontes.

Para uma réplica do mesmo evento composto, condicionada a C e gerada de novo dado H, temos

\[
q(t)=P(Y^{rep}=1\mid D,C,t)=wa+(1-w)b
=[wr+1-w]t.
\]

O coeficiente é `wr+1−w = 11.620739409220384`, de modo que

\[
0<q(t)\leq0.7332190878538024.
\]

Equivalentemente, parametrizando pela probabilidade sob SA:

\[
q(a)=\left[w+\frac{1-w}{r}\right]a
=0.7332190878538024\,a,
\qquad0<a\leq1.
\]

Para `Y_obs=1` e discrepância unilateral `T(Y)=Y`, `q` é o valor do PPC correspondente. Esta equivalência binária não transforma q em probabilidade posterior de adequação ou numa avaliação global do mecanismo. E3 participou do ajuste, portanto não é holdout.

## 2. O Bayes factor do complemento: condição necessária, limites e risco

Denote por

\[
r_0=\frac{P(Y=0\mid SA,C)}{P(Y=0\mid CA,C)}
=\frac{1-a}{1-b}.
\]

Se `r=r1>1` e `r0` for especificado, a normalização fornece

\[
b=\frac{1-r_0}{r-r_0},\qquad a=r\frac{1-r_0}{r-r_0}.
\]

As condições de coerência são `0≤r0<1`, admitindo `r0=0` no limite `a=1,b=1/r`. Quando `r0` tende a 1, `a,b` tendem a zero. `r0=1` exatamente produziria `a=b=0`, tornando indefinido o Bayes factor finito do evento observado; não é um preenchimento válido para esse evento observado. Para probabilidades estritamente interiores, `0<r0<1`.

Não supor `r0=1/r`: essa escolha impõe `a=1−b` e `a=r/(r+1)`, simetria que não decorre das fontes. Se `r1=r0=1`, as razões não identificam escala: qualquer `a=b` permanece possível.

O problema substantivo é que “não E3” inclui todas as demais histórias: não formar a coalizão, formá-la com outros participantes, apoiar outro desenho, adotar outro preço, variar contribuições e obter outra documentação. Um especialista que avalia apenas “não apoiar a política” não forneceu o Bayes factor do complemento exato. Os agentes 04 e 05 confirmam que os documentos BP disponíveis não informam os pesos dessas alternativas no episódio agregado E3.

## 3. Por que pedir BFs de todos os cenários ainda não basta

Considere uma partição exaustiva, mutuamente exclusiva, de K resultados observáveis. Escreva `b_j=P(Y=j|CA,C)` e `a_j=r_j b_j`. Conhecer todos os K valores `r_j` deixa duas equações:

\[
\sum_j b_j=1,\qquad\sum_j r_jb_j=1.
\]

Em situação regular com `K>2`, restam `K−2` graus de liberdade. A normalização não cria os pesos faltantes. A coerência exige que 1 pertença ao intervalo entre o menor e o maior BF dos cenários com massa admissível; exigir massa estritamente positiva impõe condições mais fortes nas fronteiras. Se todos os BFs forem iguais a 1, sobra a distribuição categórica inteira; as duas equações coincidem.

Uma elicitação categórica completa pode fornecer o vetor de probabilidades sob CA e os BFs, verificando `sum(r_j b_j)=1`, ou fornecer diretamente os dois vetores de probabilidades. Se a soma não for 1, devolver a inconsistência aos especialistas; renormalizar silenciosamente altera os BFs que afirmaram. Limites exigem resolver o conjunto de desigualdades conjuntamente, sem juntar extremos incompatíveis.

## 4. Pergunta mínima que já pode produzir um resultado diagnóstico

Não é sempre necessário conhecer um ponto central. Para a especificação central acima, os limiares de q são calculáveis:

| Limiar diagnóstico de q | Limiar de b=P(E3\|CA,C) | Limiar de a=P(E3\|SA,C) | BF do complemento na fronteira |
|---:|---:|---:|---:|
| 0,01 | 0,0008605304402631712 | 0,013638488366786647 | 0,9872110367813275 |
| 0,05 | 0,004302652201315856 | 0,06819244183393323 | 0,9358341269323789 |
| 0,10 | 0,008605304402631712 | 0,13638488366786647 | 0,8711112941871847 |

Derivação: para um limiar `alpha`, `b_alpha=alpha/(wr+1−w)`, `a_alpha=r b_alpha` e `r0_alpha=(1−a_alpha)/(1−b_alpha)`. Esses valores são **fronteiras matemáticas**, não probabilidades fornecidas por especialistas nem estimadas dos documentos.

Uma pergunta concreta é: **“Assumindo SA e o prefixo C, com a mesma definição de E3 e o mesmo procedimento de observação, é possível justificar que sua probabilidade excede 6,819244%? Quais fontes e quais premissas sustentam esse limite? Que alternativa plausível o faria falhar?”**

Se um limite `a>0,06819244` for de fato justificado, exclui-se `q<0,05` nesta especificação. Isso não identifica q, não valida o modelo e não prova SA. O limiar de 0,05 é uma convenção diagnóstica escolhida para ilustrar a decisão, não nível de um teste frequentista calibrado. O texto FC chamar E3 de muito plausível não é licença para traduzir a expressão em `a>0,5` ou outro corte numérico.

O complemento ilustra por que a elicitação indireta pode ser ruim: a fronteira de 5% corresponde a apenas `10 log10(r0)=−0,2880112 dB`, uma diferença muito próxima de zero. Uma escala verbal de intensidade de evidência pode não distinguir isso com resolução defensável. Perguntar diretamente um limite absoluto de a tende a ser mais transparente.

## 5. Procedimento completo a executar com fontes e especialistas

1. **Congelar o alvo.** Registrar evento, nível de agregação, prefixo C, acesso às fontes e discrepância. Se a granularidade de E3 não for apropriada para a réplica, construir uma categoria útil e reconhecer que o BF precisa ser reavaliado. Não transportar 12 dB para a categoria nova.
2. **Separar registros.** Uma coluna registra fatos documentais; outra, as definições SA/CA; outra, pesos publicados; outra, probabilidades absolutas ainda ausentes. Valores monetários, número de citações e número de documentos não viram probabilidades causais por divisão.
3. **Procurar âncora empírica.** Exigir oportunidades enumeradas na mesma unidade, ou classe transportável explicitamente defendida, com identificação do mecanismo independente do Y a prever. Registrar dependência, seleção e rótulos incertos. A busca atual não encontrou essa âncora para E3.
4. **Elicitar somente o necessário.** Se não houver âncora, entregar a especialistas o contexto e solicitar primeiro limites justificáveis de a, incluindo a pergunta de 6,819244% quando pertinente. Documentar conhecimento prévio de E3; não descrever retrospectiva como cega. “Em cem situações” é representação de uma crença, não uma amostra de cem casos.
5. **Confrontar o limite.** Outro especialista procura cenários SA compatíveis que reduzam a ocorrência/registro de E3. O primeiro revisa ou sustenta seu intervalo. Preservar dissenso; não contar votos como dados nem reduzir a incerteza pela concordância dos agentes.
6. **Completar coerentemente.** Dado r fixo e um intervalo `[aL,aU]`, obter `b∈[aL/r,aU/r]` com o mesmo a, e `q∈[0,7332191aL;0,7332191aU]`. Se os BFs também variam, preservar seu acoplamento com a posterior w e resolver o envelope sobre especificações completas.
7. **Replicar e reportar.** Para cada especificação admissível, sortear H da posterior e a resposta observável da likelihood de H; ou calcular q exatamente. Não sortear um modelo do conjunto sem prior explícito sobre ele. Reportar fonte, julgamento e transformação para cada número.
8. **Validar fora do ajuste.** Codificação e qualidade de acesso podem ser verificadas separadamente. Probabilidades causais requerem episódios com mecanismos avaliados independentemente, ou novas implicações reservadas com cuidado quanto ao que os escores identificam. Bom desempenho marginal não prova que SA/CA ou suas probabilidades condicionais estão corretas.

## 6. Limitação adicional: evento raro não equivale a falta de ajuste

E3 contém vários detalhes e valores monetários. Um evento histórico descrito com precisão suficiente pode ser raro mesmo sob um bom modelo. Tratar retrospectivamente “exatamente esta narrativa” como `Y=1` e todas as alternativas como `Y=0` pode fabricar uma surpresa sem discrepância substantiva. O agente 07 levantou o mesmo ponto independentemente.

O envelope calculado demonstra rigorosamente que a informação relativa do BPT não determina seu gerador preditivo. Ele não demonstra mau ajuste global. Uma aplicação convincente precisa justificar a classe replicada e escolher uma discrepância relevante ao mecanismo. Qualquer coarsening exige revisar a likelihood correspondente; não basta reutilizar o BF da história detalhada.

## Debate e conclusão

- **04/estrutural:** payoffs BP ainda deixam eficácia, decisão e observação desconhecidos; não oferecem escala para E3. Concordamos que logística arbitrária apenas desloca a invenção.
- **05/empírico:** nenhuma frequência transportável na mesma unidade; as fontes adicionais não preenchem t. Concordamos que uma alternativa conveniente não é o complemento exaustivo.
- **07/adversarial:** família condicional por t é defensável, mas o check de um evento composto retrospectivo não valida adequação global. Concordamos sobre granularidade e sobre não integrar uniformemente t.
- **Coordenação:** informou leitura direta do suplemento FC, com intervalos de WoE e distinção entre justificativa reputacional para política inviável e SA. Essa distinção impede identificar automaticamente fala de McCoy com SA. Nesta missão, não reli esse suplemento; a verificação documental pertence à coordenação.

A conclusão é positiva sobre a implementação e limitada sobre os dados: sabemos exatamente como completar a likelihood e quanto precisamos aprender para certos diagnósticos. Não obtivemos das fontes atuais o limite ou ponto que falta. Apresentar o resultado como “PPC pontual do BPT já identificado empiricamente” continuaria sendo incorreto. Um exemplo completo sem números fabricados pode hoje percorrer a família de likelihoods e seu envelope; um PPC pontual exige a nova informação explicitada acima.
