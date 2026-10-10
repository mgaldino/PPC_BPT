# Proposta B: checagem preditiva de perguntas e blocos documentais

Data: 2026-10-10. Proposta independente salva antes da leitura de A/C; duas clarificações após debate estão registradas em `../debate/B_round1.md`. Contrato: `ppc_bpt:8bcda550633f:round1`, PASS de fidelidade; manuscrito SHA `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`. Leitura integral do Rmd e suplemento. Nenhum script, simulação ou reescrita do manuscrito executado.

## Tese

Não precisamos simular discursos, documentos ou uma história alternativa completa. Precisamos especificar **uma distribuição normalizada para respostas observáveis a perguntas previamente definidas**, sob um protocolo de busca e codificação. Uma réplica é outro vetor dessas respostas produzido pelo modelo. Para poucos itens, enumerar todas as respostas possíveis substitui Monte Carlo. O custo substantivo permanece: justificar probabilidades absolutas e a ligação entre mecanismo, registro documental e observação.

A contribuição publicável seria um protocolo que torna explícito esse custo, demonstra quando ele pode ser reduzido e distingue diagnóstico de adequação de atualização entre rivais. A decomposição oferece organização e possíveis restrições; não torna a distribuição observacional automaticamente conhecida.

## 1. O que se replica

Defina uma pergunta como uma função pública de uma unidade de evidência: empresa e período, episódio decisório ou conjunto documental com limites explícitos. Exemplo: “Nos documentos do órgão X produzidos entre datas A/B, existe manifestação de defesa organizada do benefício?” As categorias podem ser `defesa`, `ausência explicitamente atestada`, `contradição entre fontes`, `material insuficiente`. Elas são mutuamente exclusivas por regra de adjudicação e exaustivas **como resultados do protocolo**, não como descrição de toda a realidade histórica.

Chame o vetor codificado de \(Y_B\), o protocolo de aquisição/codificação de \(A\), os dados já usados de \(D\), a configuração latente completa de \(C\), e parâmetros de observação de \(\theta\). Uma proposta nova, que resolve explicitamente a coexistência de definições no manuscrito, é:

\[
q_B(y\mid D,A,M)=\sum_c\int p(y\mid c,\theta,D,A,M)\,p(c,\theta\mid D,M)\,d\theta.
\]

\(M\) é o modelo; \(C\) é um estado completo dentro dele. Não se integra novamente sobre os estados dos elos depois de condicioná-los a uma configuração completa. Também não se multiplicam marginais dos elos sem justificar independência. Uma hipótese narrativa pode restringir o suporte de \(C\); isso precisa ser definido, não inferido silenciosamente do texto.

Uma distribuição categórica finita já é um gerador de \(Y^{rep}\). A aplicação só precisa armazenar células e probabilidades. Se apenas uma discrepância \(T\) interessa, pode-se especificar diretamente a distribuição de \(T(Y^{rep})\). Isso verifica somente essa característica; distribuições de várias discrepâncias sobrepostas exigem compatibilidade conjunta. Elicitar “probabilidade de uma falha” após observar a falha não constitui checagem independente.

## 2. Quatro operações diferentes

1. **PPC do bloco observado:** ajustar com \(D=Y\), replicar o mesmo tipo de observação sob o mesmo desenho, comparar \(T(Y)\) com \(T(Y^{rep})\). É PPC convencional; os valores de cauda geralmente não são testes frequentistas calibrados.
2. **Checagem preditiva reservada:** ajustar com \(D\), congelar \(q_B\), depois observar \(Y_B\). É previsão posterior fora da amostra, que pode ser chamada de checagem preditiva holdout, distinguindo-a do PPC que reutiliza dados. Esta é minha recomendação principal.
3. **Atualização/Bayes factor:** comparar \(p(Y_B\mid H_1,D)/p(Y_B\mid H_0,D)\), eventualmente atualizando pesos. Um rival pode ganhar embora ambos prevejam mal; ou ganhar sem nenhuma inadequação absoluta.
4. **Diagnóstico localizado:** mapear quais discrepâncias atingem quais componentes. O mapa delimita candidatos a revisão; não identifica causalmente o componente culpado. Mecanismo, relato, seleção ou codificação podem produzir o mesmo erro preditivo.

Os princípios de replicação e discrepância vêm de [Gelman, Meng e Stern (1996)](https://stat.columbia.edu/~gelman/research/published/A6n41.pdf) e da [documentação Stan](https://mc-stan.org/docs/2_39/stan-users-guide/posterior-predictive-checks.html). Meu desdobramento para perguntas documentais é uma proposta metodológica. Parâmetros incertos não são condição necessária: a integral pode degenerar em uma distribuição pontual e ainda existir uma distribuição preditiva verificável.

## 3. Obter probabilidades sem apenas deslocar arbitrariedade

Não há transformação algébrica que extraia probabilidades absolutas de razões de verossimilhança isoladas. LR=4 é compatível com \((.8,.2)\) ou \((.08,.02)\). Para pesos posteriores \((.8,.2)\), a previsão do evento seria .68 ou .068. A mesma informação relativa permite diagnósticos absolutos diferentes. Esse é um resultado negativo central para o artigo.

Para construir probabilidades, o pesquisador deve apresentar uma tabela de procedência: restrição lógica/causal, frequência externa comparável, auditoria de produção/recuperação de fontes ou elicitação. Dados externos podem informar parâmetros de detecção e erro, desde que a transportabilidade seja defendida. Especialistas podem responder sobre todas as categorias, antes da revelação; perguntas-semente verificáveis podem avaliar seu desempenho fora do alvo. Normalização, cegamento e documentação eliminam algumas incoerências, mas não demonstram calibração.

Quando a base é fraca, substitua números exatos por um conjunto \(\mathcal P\) de modelos coerentes. Propague cada modelo inteiro por Bayes e pela previsão; não combine extremos marginais incompatíveis. Apresente:

\[
\underline q(B)=\inf_{P\in\mathcal P}P(B\mid D,A),\qquad
\overline q(B)=\sup_{P\in\mathcal P}P(B\mid D,A).
\]

Uma falha que desaparece dentro de alternativas razoáveis é sensível à elicitação. A discordância entre humanos/LLMs pode sugerir ampliar \(\mathcal P\), mas não cria frequências de amostragem nem pesos probabilísticos entre especialistas. Se \(\mathcal P\) permitir praticamente qualquer previsão, a conclusão correta é ausência de um teste informativo. Nenhum rearranjo formal remove a insuficiência de conhecimento.

## 4. Dependência, ausência e seleção

Reservar frases aleatórias do mesmo depoimento não separa evidência. Reserve blocos com origem comum: arquivo, entrevista, organização, episódio. Notícias que reproduzem a mesma declaração pertencem ao mesmo bloco. Uma tabela conjunta para cada bloco ou uma fatoração sequencial explícita evita a multiplicação automática de itens correlacionados. Mesmo blocos distintos podem compartilhar causas; uma variável contextual ou análise de sensibilidade deve representar essa dependência.

Ausência documental não equivale à ausência do mecanismo. Se \(X\) indica lobby real, \(Z\) um registro recuperado, \(d\) a detecção e \(f\) o falso positivo:

\[
P(Z=1\mid H,A)=d_A P(X=1\mid H)+f_A[1-P(X=1\mid H)].
\]

Com \(f=0\), propensões de lobby .7 e .1 sob dois rivais e \(d\in[.2,.9]\), ausência de registro tem probabilidades .86–.37 e .98–.91. O BF favorável ao rival de pouco lobby varia de aproximadamente 1.14 a 2.46; tratá-la como ausência real produziria BF=3. Sem limite inferior de detecção, o BF pode ser 1. A incerteza sobre preservação, acesso e busca muda a força diagnóstica.

Selecionar um documento porque ele contém uma confissão e depois prever a probabilidade de obter uma confissão vicia o alvo. É necessário modelar a seleção ou condicionar num desenho que não selecione pelo conteúdo previsto. Condicionar em “documento disponível” permite uma checagem limitada ao conteúdo dos documentos disponíveis; não avalia a ausência de documentos.

## 5. Exemplo completo, estritamente sintético: Chile

Este exemplo não estima nem valida o caso histórico. Dois modelos compactos: \(H_E\), equidade com interesses empresariais ainda elevados; \(H_C\), equidade com baixos interesses. Prior .5 para cada. Uma evidência de treinamento \(D=1\) tem probabilidades .8 e .2; os complementos são .2 e .8. Logo \(P(H_E\mid D)=.8\), \(P(H_C\mid D)=.2\).

Antes de abrir um pacote documental reservado e idealizado como completo, codificam-se duas perguntas binárias: \(R\), sequência decisória reativa ao desafio; \(L\), defesa empresarial organizada. Este é um caso-limite didático: pressupõe **registro, recuperação e codificação perfeitos**, além de independência de \(D\) e do pacote condicional a \(H\). Completude do arquivo, sozinha, não garante registro perfeito. Uma aplicação precisaria das categorias de ambiguidade/indisponibilidade e do modelo observacional das seções anteriores. As probabilidades **conjuntas**, especificadas antes da revelação, são:

| Resposta \((R,L)\) | \(H_E\) | \(H_C\) | Preditiva .8/.2 |
|---|---:|---:|---:|
| (1,1) | .65 | .08 | .536 |
| (1,0) | .25 | .82 | .364 |
| (0,1) | .05 | .02 | .044 |
| (0,0) | .05 | .08 | .056 |
| Soma | 1 | 1 | 1 |

Suponha revelação \((1,0)\). O BF do composto é \(.82/.25=3.28\), e seu posterior passa de .2 para \(.164/.364\simeq.451\). Isso favorece relativamente o composto, mas o resultado tinha probabilidade preditiva .364: nenhuma grande surpresa. Portanto, esse resultado não demonstra que as likelihoods originais eram incorretas.

Já uma discrepância previamente definida \(T=1\{R=0,L=1\}\), que reúne decisão não reativa e defesa organizada, tem distribuição preditiva Bernoulli(.044). A justificativa substantiva é procurar decisão não reativa apesar da persistência de defesa empresarial, contrariando as duas narrativas do exemplo. Caso esse padrão fosse observado, sua cauda seria .044: tensão absoluta nessa direção predefinida. O teste não detecta outras falhas, como (0,0). **Massa pontual pequena, isoladamente, não estabelece inadequação**; escolher a menor célula após a abertura seria outro procedimento. Se forem examinadas várias discrepâncias, a família, a seleção e a regra de alarme devem ser registradas e avaliadas conjuntamente. A localização inclui sequência decisória, interesses e observação; não seleciona automaticamente um elo culpado.

Mesmo aqui, a conclusão depende da elicitação. Se \(w_E\in[.7,.9]\), \(P(T=1\mid H_E)\in[.04,.06]\), \(P(T=1\mid H_C)\in[.01,.03]\), admitindo conjuntamente essas escolhas e completando as demais células coerentemente, a cauda varia entre .031 e .057. Um corte .05 não sustentaria rejeição robusta. As probabilidades deste exercício são hipóteses didáticas, não conhecimento adquirido. No Chile disponível, sobreposição com E4/E5 e arquivos faltantes impedem chamar automaticamente o pacote existente de holdout independente.

## 6. Algoritmo executável pelo pesquisador

1. Fixar unidade, período, mecanismos e informação disponível; registrar quais evidências já foram inspecionadas.
2. Definir perguntas, categorias, regras de codificação, busca, fontes e critério de encerramento; reservar blocos inteiros.
3. Escrever uma distribuição conjunta normalizada para treinamento e alvo, ou explicar a ponte entre o BPT anterior e o novo módulo preditivo. Marcar probabilidades sem fundamento independente.
4. Calcular pesos posteriores e a tabela preditiva, por soma exata quando possível. Reservar pelo menos uma discrepância substantiva; registrar também todas as previsões marginais.
5. Congelar tabela, versões e alternativas de sensibilidade antes da leitura. Um segundo codificador recebe categorias, sem a previsão alvo.
6. Revelar/codificar o bloco, incluindo insuficiência documental. Publicar respostas e referência exata às fontes.
7. Comparar observado e distribuição: probabilidade do padrão, discrepâncias e, para previsões repetidas, Brier/log score. Scores próprios incentivam previsões honestas em expectativa, mas um score isolado não mede calibração; ver [Gneiting e Raftery (2007)](https://sites.stat.washington.edu/people/raftery/Research/PDF/Gneiting2007jasa.pdf).
8. Registrar diagnóstico antes de atualizar ou revisar. Revisão usa bloco já revelado como treinamento; avaliação seguinte requer novo bloco. Na versão prequential, prever, observar, pontuar e atualizar sequencialmente, com política e ordem registradas; ver [Dawid (1984)](https://academic.oup.com/jrsssa/article/147/2/278/7106293). Releitura de material já conhecido não recupera cegamento.

## 7. Escopo e posição no debate

Recomendo à Political Analysis uma contribuição focal: condições mínimas para checagem preditiva no BPT, impossibilidade com LR apenas, gerador categórico mínimo, protocolo de observação e comparação entre atualização e inadequação. A técnica de somar distribuições não é novidade. A operacionalização e seus limites precisam demonstrar ganho sobre FC e CausalQueries, reconhecendo Eq. 3.11 como fundamento.

Com três a cinco itens, pode-se detectar uma contradição forte previamente prevista; não estimar calibração geral, validar todas as likelihoods, identificar mecanismos ou reivindicar superioridade de um protocolo. Sem probabilidades absolutas defensáveis, mantenha previsões ordinais e análise de sensibilidade, denominadas checagem qualitativa estruturada. Não as renomeie PPC.

Minha divergência antecipada com uma proposta geradora extensa: um modelo do corpus inteiro imporia mais suposições do que muitos estudos podem defender e reduziria adoção. Minha concessão: gerar apenas perguntas não elimina o problema, apenas o delimita. Minha divergência com uma proposta apenas verbal: sem espaço amostral e massa preditiva absoluta, não é possível separar surpresa sob todos os modelos de apoio relativo a um rival.
