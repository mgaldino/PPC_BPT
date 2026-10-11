# Auditoria independente final do protocolo E3

10 de outubro de 2026. Agente 10, exclusivamente revisor. Não implementei o protocolo, o código ou as entradas. Este arquivo é o único artefato que escrevi.

**Resultado: PASS de coerência documental, matemática e correspondência entre texto e saídas; nenhum achado maior na versão consolidada. A obtenção de uma âncora absoluta empiricamente fundamentada continua não resolvida.** O PASS não significa validação da elicitação, adequação causal, novidade ou prontidão editorial.

## Identidade e cobertura

Li integralmente `protocolo.md`, as contribuições 01–09, `audit_constraints.R`, entradas CSV, README e saídas. Consultei CLAUDE.md e o contrato PASS `ppc_bpt:8bcda550633f:round1`. Conferi diretamente o parecer Edmans histórico, os trechos relevantes do manuscrito atual, FC p. 9 e suplemento B.4, as extrações completas BP2017, BP2019 e API2021 e o capítulo 16 de Humphreys e Jacobs.

Hashes SHA-256 da versão auditada:

- `protocolo.md`: `3d942d655c04487de1dea9242f6a30a63002163088519646a1115c75c7b88365`.
- `audit_constraints.R`: `98e399dd08d75db3c0b44fbcf19931db7200f735e9a672d9bd2c92dd6f4a55ae`.
- `data/source_constraints.csv`: `289b5870041fb9937afa325951a4fc0d3487ec6470f839c32a0307498e6feb95`.
- `results/source_impacts.csv`: `c9f68c8c73a33c362fc1447fafe93b35d47b72081d347eb016ad5816798e9e43`.

Confirmei os hashes canônicos inalterados do manuscrito (`8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`) e suplemento (`8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a`).

## Verificação científica

1. **Hipóteses e unidade preservadas:** protocolo, linhas 29–43. SA é Strategic Accommodation; CA é Competitive Advantage. Custos diretos não excluem benefício competitivo líquido. O evento permanece o pacote agregado E3; nenhuma probabilidade individual de empresa nem assinatura documental recebeu silenciosamente seu BF.

2. **Fontes versus massa:** linhas 49–62 e 88–123. Os cartões BP/API corrigem descrições e componentes de mecanismo, sem fornecer denominador ou massa absoluta. O contraexemplo usa distribuições de réplicas, não apenas uma história possível. A tabela abreviada de cenário BP2017 deve ser lida com essa construção expressa; sozinha, a existência do cenário não refutaria uma probabilidade alta.

3. **Elicitação subjetiva distinguida de consequência documental:** linhas 139–147. A proposta admite julgamento fundamentado sem dedução ou frequência, preserva sua origem e não o certifica como empiricamente correto. A tradução hipotética “E3 mais provável que todo seu complemento” para `a>1/2` é correta e não foi atribuída a um entrevistado inexistente.

4. **Novo condicionamento separado do benchmark:** linha 70 e linhas 163–170. Incorporar fontes S exige reavaliar probabilidades ou justificar invariância. As tabelas com r e w fixos são auditoria condicional, não atualização com documentos adicionais.

5. **PPC delimitado corretamente:** linhas 168–172. A independência da réplica é uma premissa auxiliar declarada; o check é condicional e in-sample. A raridade do pacote retrospectivo não demonstra má especificação. A incerteza dos pesos publicados não foi propagada, limitação expressa.

6. **Edmans confrontado com fonte atual:** linhas 176–203. A crítica de execução permanece, enquanto o endosso histórico à novidade geral foi corrigido. [Humphreys e Jacobs, capítulo 16](https://integrated-inferences.github.io/book/16-evaluating-models.html) apresenta geração preditiva posterior (§16.1.2), aplicação a vinhetas codificadas (§16.2.2) e intervalos/signos (§16.1.4). Não cabe inferir originalidade apenas de PPC ou intervalos. O piloto proposto não foi executado nem transformado em promessa de publicação.

## Verificação numérica independente

Recalculei em JavaScript e, separadamente, em Python a soma dos pesos publicados, a transformação para odds e a enumeração conjunta de H e Y. Obtive `r=15.848931924611133`, `w=0.7152527510491986` e `qmax=0.7332190878538024`. A identidade `q(a)=qmax*a`, a normalização e a razão a/b foram conferidas em coordenadas sintéticas de teste, sem tratá-las como probabilidades históricas.

A leitura independente dos CSVs em Python confirmou seis IDs únicos, magnitudes absolutas e denominadores ausentes (`NA`), ausência de estreitamento numérico documental e concordância dos valores com tolerância relativa de 1e-13. F1 permite zero para uma hipótese rival isolada; F2–F6 excluem zero no benchmark com BF finito positivo e posteriores positivas. O fecho [0,1] não foi confundido com o conjunto efetivo (0,1].

Oito verificações de implementação constam da execução R do agente 09. Não reexecutei seu script nem regenerei suas saídas; a conferência independente usou outra linguagem e leu os resultados preservados. O código registra as conclusões documentais auditadas: não é um algoritmo que extrai automaticamente limites das fontes. Seus testes sintéticos não validam a elicitação empiricamente.

## Limite decisivo para a entrega

O protocolo torna a pergunta operacional e auditável, mas, neste dossiê, cada fonte adicional continua sem estreitar a escala absoluta. O usuário deve receber esse resultado negativo explicitamente. Uma futura sessão humana pode produzir um julgamento defendido; ainda precisará demonstrar utilidade e validade de suas pontes, sem usar consenso, precisão aparente ou rejeição do PPC como critério suficiente de sucesso.
