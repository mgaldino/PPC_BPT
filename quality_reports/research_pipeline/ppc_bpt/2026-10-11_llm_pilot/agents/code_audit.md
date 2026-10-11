# Auditoria independente dos scripts antes dos resultados

Data: 11/10/2026. Revisor: subagente redteam. Escopo: leitura integral de `scripts/model.R`, `scripts/run_pilot.py` e `scripts/analyze.R`; parse de R e AST de Python, sem executar geradores nem alterar scripts. Os resultados empíricos do piloto ainda não foram auditados.

**Veredito:** cálculos centrais, tratamento de códigos indeterminados, denominadores e pareamento B/C estão corretos. A suspeita de erro no peso do PPC condicional é **PARCIAL: depende de qual condicionamento se pretende**. Existem duas pendências pequenas de rastreabilidade e escopo da auditoria, descritas abaixo; não impedem as gerações.

## 1. Posterior e PPCs: correto no modelo declarado

`model.R` enumera as oito células de cada hipótese. Confirmação independente: P(E|SA)=0,375, P(E|CA)=0,25, posterior SA=0,6 e PPC conjunto=0,325. O PPC com proposta replicada fixada em Q=1 vale 0,65. Os parâmetros são explicitamente didáticos. A fonte histórica entra apenas na codificação simplificada E=(Q=1,A=1).

### Suspeita sobre `ppc_conditional_plugin`: PARCIAL, não um bug incondicional

Em `analyze.R:176–186`, sejam l_h=P_hat(Q=1,A=1|h), q_h=P_hat(Q=1|h) e c_h=l_h/q_h.

- Se preservamos a observação conjunta E=(Q=1,A=1) e somente fixamos Q da nova réplica, o peso atual w_joint=l_SA/(l_SA+l_CA) é correto. O PPC é w_joint*c_SA+(1-w_joint)*c_CA. Esse procedimento coincide com o texto do desenho: a posterior permanece a da evidência observada e muda a replicação.
- Se a análise inteira condiciona Q como desenho fixo, excluindo sua distribuição do aprendizado sobre H, a posterior corresponde a w_cond=c_SA/(c_SA+c_CA), com prior equiprovável no modelo condicional. O PPC será w_cond*c_SA+(1-w_cond)*c_CA.
- Se Q for uma observação probabilística que informa H, a segunda expressão não pode simplesmente manter o prior original: precisa usar P(H|Q), recuperando o peso conjunto.

As expressões coincidem no modelo declarado porque q_SA=q_CA=0,5, mas podem divergir no gerador implícito do LLM ou na amostra finita B/C. Por exemplo, q_SA=0,8, q_CA=0,2, c_SA=0,75 e c_CA=0,5 geram w_joint=6/7 e PPC de replicação condicional=5/7, enquanto o modelo condicional com prior equiprovável produz w_cond=0,6 e PPC=0,65.

**Recomendação:** não substituir silenciosamente a implementação atual. Rotulá-la `ppc_conditional_replication_given_joint_posterior`. Se desejado, acrescentar a versão de modelo condicional com coluna e interpretação próprias. Em `model.R:97–99`, o recálculo da posterior com likelihood condicional é numericamente correto, mas só coincide com a posterior conjunta por causa da igualdade das probabilidades de Q entre hipóteses; um comentário torna essa propriedade transparente.

## 2. Denominadores e códigos -1: PASS

`event_bounds()` preserva todas as linhas. Um componente zero torna uma conjunção impossível; todos os componentes um a confirmam; demais casos permanecem ambíguos. Pontos são NA quando limites diferem. Contradições tornam todo o vetor desconhecido, uma escolha conservadora declarada. Células conjuntas usam o total de mundos no denominador. Seus limites são individuais, não simultaneamente atingíveis; a nota do script explica isso.

`safe_ratio()` evita razões com denominador zero ou indefinido. A análise exige oito mundos em cada um dos 24 blocos e correspondência integral com códigos; portanto falhas de geração/codificação não são silenciosamente excluídas dos denominadores. A análise para até que a falha seja tratada explicitamente. As tabelas de falhas são preservadas.

## 3. Bootstrap e B/C: PASS, condicional à codificação realizada

O script compara estados B/C por chave, hipótese e bloco, e exige identidade exata. No bootstrap, usa as mesmas seleções de blocos para B e C, enquanto A é reamostrado separadamente. A unidade é o bloco de oito mundos, não cada documento. Isso implementa corretamente o pareamento previsto.

A codificação, porém, ocorre em outros blocos misturados de 16 documentos. Reamostrar somente blocos de geração não propaga a incerteza de novas chamadas do codificador nem modela toda a dependência cruzada criada por essas chamadas. Como o intervalo já é exploratório, não é necessário ampliar o piloto; a interpretação deve ser explicitamente condicional à realização única da codificação. Não afirmar cobertura calibrada.

## 4. Estados sintéticos não alimentam A: PASS por inspeção

`generate()` constrói prompts A a partir de COMMON, rótulo H, fórmula e IDs. Não inclui estados de `bc_states.csv`. Os estados carregados do CSV só aparecem na tarefa B; C usa templates dos mesmos estados. Em `prepare_coding()`, A recebe estados da própria saída LLM; B recebe os estados originais do R. Confirmar ausência efetiva de ferramentas continua dependendo dos logs de execução, ainda não auditados aqui.

## 5. Pendências operacionais

**CONFIRMADO, rastreabilidade:** o `design.md` lido na auditoria anterior mencionava `gpt-6-sol`; `run_pilot.py:13` solicita `gpt-5.6-sol`. Os status registram o alias solicitado, de modo que a execução permanece rastreável. O relatório e o registro de desvio devem identificar o modelo efetivamente utilizado e a razão da alteração, sem fingir que o alias anterior foi executado.

**CONFIRMADO, escopo incompleto da checagem de saída:** B preserva o estado original do R em `worlds.csv`, o que é correto. O estado retornado pelo LLM fica em `documents.json` como `returned_state`, mas `analyze.R` não o compara ao roteiro. A fidelidade textual é verificada; uma eventual alteração somente no JSON poderia passar sem destaque. Antes de afirmar que o LLM não alterou estados nem metadados, comparar explicitamente `returned_state` ao estado original. Isso pode ser feito pela auditoria final, sem novas gerações.

**VERIFICAR NOS BRUTOS:** o coletor exige um registro por ID esperado, mas não registra separadamente IDs extras inesperados. Conferir que cada saída contém exatamente os oito IDs previstos antes de afirmar conformidade integral com o esquema da tarefa.

## Versões inspecionadas

- `model.R`: SHA-256 `8fcf15eb49b62aea092b0e6094a2008a002b990d53e31e22d52abcf62983191e`.
- `run_pilot.py`: SHA-256 `77e540588c252858dc63b8bc84e91ecbe98960ac9369c7ef65ec472ccdb15415`.
- `analyze.R`: SHA-256 `0f46eb0be35dc8e8df77573e17f6758e592e9fb1dadcc06e23a7ee032ccfabad`.

Parse de `analyze.R` e AST de `run_pilot.py`: aprovados. Nenhum gerador foi executado nesta revisão. A auditoria final dos dados, logs e interpretações permanece pendente.
