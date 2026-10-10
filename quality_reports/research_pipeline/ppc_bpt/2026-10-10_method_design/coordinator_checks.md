# Verificações analíticas do coordenador

Artefato: `paper_draft_v1.Rmd`, hash registrado no preflight. Nenhum script de análise ou experimento foi executado. Abaixo, substituições aritméticas e comparações textuais inspecionadas, abertas à verificação independente dos proponentes.

## Cálculos existentes

- Chile, linha 173: `0.95*0.95*0.90 + 0.60*0.95*0.10 + 0.10*0.05 = 0.81225 + 0.057 + 0.005 = 0.87425`. A aritmética coincide com o arredondamento; origem dos pesos e distribuição conjunta não são demonstradas.
- Petróleo, linha 435: `0.85*0.50*0.85 + 0.10*0.50*0.85 + 0.05*0.15 = 0.36125 + 0.0425 + 0.0075 = 0.41125`. A aritmética coincide, mas as condições verbais se sobrepõem no estado m4=m5=0; a soma implicitamente atribui prioridade a m5=0.
- Tabela de petróleo, linha 447, usando o posterior arredondado de 0,71: `0.75*0.71 + 0.15*0.29 = 0.5325`, não 0,58. O exemplo decomposto 0,41125 para e5 tampouco alimenta a tabela, que conserva 0,80 sob H_SA. A identidade entre pipeline e resultados precisa ser especificada.

## Resultado elementar para o desenho

Suponha H em {0,1}, prior 1/2 e uma evidência E=1. Os pares de probabilidades condicionais (0,9; 0,1) e (0,09; 0,01) dão o mesmo Bayes factor 9 e posterior P(H=1|E)=0,9. Para uma nova observação da mesma classe, condicionalmente independente dada H, as preditivas são 0,82 e 0,082. Portanto, razões de verossimilhança para os valores realizados não identificam uma distribuição preditiva absoluta. Não se afirma novidade matemática desse resultado; seu uso é explicitar o requisito adicional para PPC no BPT.

Uma história causal fixa não passa a repetir-se aleatoriamente porque se sorteia um vetor. É preciso separar: incerteza epistêmica sobre o estado histórico; possíveis respostas de uma consulta documental reservada; replicação hipotética do processo de registro/observação; e um novo caso histórico. São alvos distintos.

## Verificações ainda necessárias

Adjudicar propostas recebidas contra a fonte. Solicitar crítica cruzada dos exemplos e dos pressupostos de replicação. Não tratar concordância dos agentes, cálculo correto ou validação de JSON como validação empírica do método.
