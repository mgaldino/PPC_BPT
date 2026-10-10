# Debate 06 — redução do piloto e preservação dos pacotes probabilísticos

Li as propostas 05 e 10 após concluir minha proposta independente. **Aceito Chile/2005 como primeiro piloto e retiro a exigência de uma distribuição conjunta entre seus dois alvos.** A proposta 10 oferece melhor delimitação operacional. Dois blocos distintos não precisam receber uma dependência inventada para viabilizar previsões marginais.

## Troca com identificação, participante 05

Enviei uma objeção: a reconstrução de quatro estados exige prior, avaliações de desenvolvimento e previsões; seu orçamento não pode terminar nas fichas preditivas. O participante aceitou e explicitou, para `n` itens de desenvolvimento e `J` alvos de `k` categorias, `3+3n+4J(k−1)` quantidades livres por especialista, antes de justificativas e intervalos, usando razões relativamente a um estado de referência. Essa carga torna indispensável selecionar a rota antes da sessão.

Concedi que, sem pesos sustentáveis, se entreguem previsões condicionais por cenário ou uma previsão direta. Nenhuma deve ser chamada de posterior BPT calculado. O participante 05 objetou corretamente que meu sorteio de especialista com pesos fixos produz um pool de previsões, não um posterior Bayesiano entre especialistas. Aceitei: calcular primeiro o posterior de estados dentro de cada especificação, quando houver insumos, e agregar depois. Atualizar pesos entre especialistas como modelos exigiria evidências marginais adicionais; razões internas aos estados não bastam.

## Troca com viabilidade, participante 10

Enviei uma objeção concreta: 64 entradas e 48 graus livres para condicionais omitem pesos dos cenários. Duas fichas adicionais, com quatro pesos cada, elevam a carga a 72 entradas e 54 graus livres, ainda sem reconstrução da atualização. Pesos diretamente elicitados devem conservar esse rótulo. A rota direta reduz muito mais a carga: dois vetores de quatro categorias por especialista, totalizando quatro vetores e doze graus livres entre duas pessoas.

Minha concessão foi adotar suas duas previsões marginais e adiar a conjunta. A tabela 3×3 original permanece opção para duas perguntas binárias com indeterminação **dentro de um mesmo bloco**. Não deve ser transportada automaticamente para suas perguntas chilenas de quatro categorias, cujo significado é distinto.

## Regra operacional revista

O instrumento terá seleção explícita de rota: direta; condicional por cenário; integrada com pesos elicitados; ou BPT reconstruído. Na última, acrescentar os campos de prior e razões sequenciais. O orçamento correspondente deve aparecer antes do preenchimento.

Para cada especialista `e`, guardar juntos pesos `w_ec` e distribuições marginais `v_ecj(y)` de cada bloco `j`. Calcular:

\[
q_{ej}(y)=\sum_c w_{ec}v_{ecj}(y),\qquad
q_{\alpha j}(y)=\sum_e\alpha_e q_{ej}(y).
\]

Manter o mesmo pacote e os mesmos pesos de pool nos dois blocos. Não multiplicar médias separadas de pesos e condicionais. Na rota direta, agregar diretamente os vetores individuais.

Esse pacote está completo para as consultas marginais prometidas; permanece incompleto para a conjunta dos blocos. Portanto, não produzir sorteio do vetor inteiro, produto de likelihoods, contagem probabilística de acertos simultâneos ou cauda conjunta. A mistura de pacotes preserva escolhas dos especialistas sem acrescentar independência. Faixas de sensibilidade variam pacotes admissíveis completos para essas consultas; extremos de células diferentes continuam sem formar uma distribuição.

A passagem ao modelo conjunto dependerá de necessidade substantiva e nova informação. Para o piloto, verificar clareza das categorias, procedência dos julgamentos e custo efetivo oferece resultado útil mesmo quando o alvo empírico permanece inconclusivo. A proposta original foi preservada; nenhuma análise foi executada.
