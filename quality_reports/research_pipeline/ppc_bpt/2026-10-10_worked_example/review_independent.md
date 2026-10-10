# Revisão independente do exemplo numérico

Revisor: subagente `worked_example_audit`. Data: 10/10/2026.

**Resultado: PASS para a matemática, implementação examinada, correspondência entre arquivos de dados e resultados, e delimitação interpretativa do relatório. Nenhuma correção bloqueante identificada.** Esta revisão não certifica os mecanismos SA/CA nem a verdade de um modelo histórico. O revisor não implementou nem alterou o código, os dados ou o relatório.

## Escopo e evidência examinada

Foram lidos integralmente `worked_example.R`, `worked_example.md`, `data/cohort.csv`, `data/signatories.csv`, `data/provenance.md` e os CSVs resumidos em `results/`. O CSV dos 256 vetores foi conferido por uma rotina independente e somente de leitura em R. A proveniência externa foi examinada como documentação preparada pelo coordenador: esta revisão não reabriu as fontes primárias. A apresentação visual do PDF não faz parte desta auditoria.

Antes de examinar o código, o revisor calculou independentemente as probabilidades pela função beta. Depois verificou os arquivos de resultados e uma fórmula fechada adicional para M1. Não se limitou a repetir a execução do script implementado.

Versões examinadas (SHA-256): `worked_example.R`: `0262be9df1b49d6efce5b5883b8e8fecfe3d0c4c82af4c918783a54baf210075`; `worked_example.md`: `d583f022097f55222a208ecc81f4a88363318ab960e990ae6f1696b9478df1e3`.

## Seis pontos adjudicados

1. **CONFIRMADO — coorte e codificação.** As entradas contêm oito empresas da coorte e seis signatárias da carta. A correspondência por nome em 2015 produz cinco assinaturas europeias e três ausências americanas. Statoil é ligado a Equinor; BG é explicitamente registrada como fora da coorte. O relatório distingue ausência na lista de oposição, recusa de convite e ausência de mecanismo. A proveniência informa que se trata de um episódio coordenado, sem comprovação de oportunidades iguais de adesão.

2. **CONFIRMADO — posterior e geração conjunta.** Cinco sucessos e três ausências, sob o modelo Bernoulli de parâmetro comum e prior Beta(1,1), produzem Beta(6,4) e média 0,60. O gerador sorteia um parâmetro por vetor de oito respostas; não sorteia oito parâmetros independentes. A enumeração calcula probabilidades de vetores rotulados sem coeficiente binomial e soma um. Esse ponto está corretamente explicado no texto.

3. **CONFIRMADO — PPC bilateral.** Para a discrepância absoluta entre médias regionais, existem dois vetores com valor máximo um. A probabilidade é `[B(11,7)+B(9,9)]/B(6,4) = 0,00600575894693543`. A enumeração e a integração independente implementada concordam. A verificação externa do revisor também concordou.

4. **CONFIRMADO — condicionamento no total.** Fixando o total replicado em cinco, restam 56 vetores equiprováveis e apenas um extremo. O resultado é 1/56 = 0,0178571428571429. O vetor inverso tem três assinaturas e não pertence a esse condicionamento. O relatório explicita o cancelamento do prior/posterior e a equivalência com uma referência exata de permutação, sem reivindicar inovação especificamente bayesiana.

5. **CONFIRMADO — robustez dentro do modelo e sua fronteira.** A transformação `u=theta*(1-theta)` fornece `u^3*(1-2*u)`, crescente em `[0,1/4]`, cuja cota é 1/128. Portanto a cota vale para qualquer posterior sobre theta sob M0. O texto separa essa robustez da fragilidade das suposições sobre a distribuição conjunta; seu exemplo de dependência regional preserva marginais iguais e produz discrepância máxima em todas as réplicas.

6. **CONFIRMADO — M1 e alcance causal.** A referência regional M1 produz a probabilidade exata `24/77 + 1/16170 = 0,311750154607297`, igual à saída do script. O relatório caracteriza M1 como revisão pós-hoc ajustada aos mesmos dados e não a trata como validação independente. Desde a abertura, delimita o exemplo como PPC observacional; não atribui M0 a SA, CA, Fairfield e Charman ou Vormedal e colegas. Reconhece que os números causais condicionais permanecem não identificados pelas contagens disponíveis.

## Verificações executadas pelo revisor

- Cálculo independente das razões de funções beta para as duas caudas e para o resultado condicional.
- Leitura do CSV vetorial: 256 linhas, soma das probabilidades igual a um dentro de tolerância `1e-12`, dois vetores extremos, 56 vetores com total cinco e um vetor extremo nesse subconjunto.
- Comparação do resultado M1 armazenado com a fórmula fechada `24/77 + 1/16170`, com tolerância `1e-12`.
- Leitura integral do relatório para conferir que o caráter retrospectivo, a seleção da discrepância, a distinção entre probabilidade de resposta e probabilidade de hipótese e o limite causal estão visíveis.

O R emitiu avisos locais sobre categorias de locale durante a execução independente; todos os cálculos e verificações terminaram com código zero. Não foram feitos testes novos de dados históricos, elicitação humana, calibração ou identificação causal.
