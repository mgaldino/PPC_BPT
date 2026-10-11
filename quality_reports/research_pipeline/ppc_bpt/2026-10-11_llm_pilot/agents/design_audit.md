# Auditoria independente do desenho congelado

Data: 11/10/2026. Revisor: subagente redteam. Objeto lido integralmente: `design.md`. Esta auditoria precede a execução principal; não verifica resultados ainda inexistentes.

**Veredito: desenho tecnicamente apto à execução do piloto didático, com uma ressalva operacional sobre a identificação de invenções textuais.** Não encontrei erro matemático ou incoerência consequente que exija interromper a execução. A aprovação não diz respeito à validade histórica das probabilidades, que o desenho corretamente exclui.

## Verificação independente dos cálculos

Sob SA e Q=1, as probabilidades de adesão são 0,7 e 0,8 conforme K; portanto P(A=1|SA,Q=1)=0,75 e P(Q=1,A=1|SA)=0,375. Sob CA e Q=1, as probabilidades são 0,2 e 0,8; sua média é 0,5 e a probabilidade conjunta é 0,25. O prior equiprovável resulta em posterior SA=0,375/(0,375+0,25)=0,6. Replicando a proposta e a adesão, o PPC unilateral para T=Q+A e T observado=2 é 0,6×0,375+0,4×0,25=0,325. Mantendo Q=1 na réplica, é 0,6×0,75+0,4×0,5=0,65. Todos esses resultados estão corretos.

O segundo PPC integra um novo K da distribuição declarada, condicionalmente à hipótese, em uma nova réplica. Não está reaproveitando implicitamente o K latente do mundo observado; essa distinção deve ser preservada na execução.

## Escopo e fidelidade conceitual

- O desenho declara que simplifica E3 e substitui as likelihoods originais por um modelo causal didático. Logo, o uso dos nomes SA e CA não autoriza apresentar o resultado como reprodução do PPC de Fairfield e Charman.
- Q e K são dimensões de incentivos assumidas independentes neste exercício. As hipóteses diferem em sensibilidades; não representam tipos causais puros. Essa limitação já está declarada, e não é impedimento para o objetivo computacional do piloto.
- A codificação real Q=1,A=1 ancora somente a observação simplificada. Ela não valida as probabilidades escolhidas, as dependências ou o canal documental.
- Comparar frequências simuladas aos alvos é auditoria do gerador. Confrontar a observação real com a distribuição preditiva declarada é um PPC condicional ao modelo, mesmo que Q e A tenham sido parametrizados na geração. O desenho distingue corretamente esses exercícios.
- Compartilhar exatamente os estados entre B e C permite avaliar o efeito da renderização. Blocos e amostra pequena são reconhecidos, evitando uma declaração indevida de calibração ou equivalência.

## Ressalva operacional não impeditiva

Um codificador que recebe apenas documentos pode identificar contradições internas, ambiguidade e alegações adicionais; não pode determinar sozinho se uma alegação extra foi inventada em relação ao roteiro factual oculto. A auditoria deve distinguir: (i) contradição entre os documentos; (ii) divergência Q/K/A detectada ao comparar a codificação ao estado conhecido; (iii) detalhe adicional sem sustentação no estado ou no esquema permitido. O terceiro grupo exige confronto posterior com o roteiro ou inspeção do revisor, já previsto no desenho. Não chamar genericamente toda elaboração narrativa de fabricação factual, pois os documentos inteiros são deliberadamente sintéticos.

Preservar todas as falhas e tentativas é especialmente importante: corrigir a saída e analisar apenas a versão corrigida alteraria o gerador avaliado. O desenho já proíbe substituições silenciosas.

## Critério para a auditoria posterior

Verificar arquivos brutos, estados idênticos de B/C, reconstrução textual, resultados dos controles, cálculo exato e mistura aproximada de A. A aproximação de A e sua posterior empírica devem continuar rotuladas separadamente; a primeira usa o modelo pretendido e a segunda depende das frequências finitas do próprio gerador. Nenhuma dessas saídas mede calibração histórica.

**Conclusão:** prosseguir, mantendo os limites declarados e a distinção operacional acima. A análise de resultados permanece pendente.
