# Revisão matemática independente: restrições de suporte e de massa

10 de outubro de 2026. Li `01_sources.md`, `02_protocol.md` e a proposta da rodada anterior. Escopo: coerência da formalização e dos limites, sem implementar ou auditar código. SA significa *Strategic Accommodation*; CA, *Competitive Advantage*.

## 1. O objeto que a fonte precisaria restringir

Fixe hipótese H, contexto C e protocolo de réplica. Seja Ω_H o espaço de estados ou histórias possíveis **da réplica**, p_H(s) sua massa e A={s:E3 ocorre}. Então

\[
P(E3\mid H,C)=\sum_{s\in A}p_H(s),\qquad p_H(s)\geq0,\qquad\sum_sp_H(s)=1.
\]

Uma fonte pode tornar determinada interpretação inadmissível, impor uma ordem entre componentes de utilidade ou, com uma ponte estrutural, excluir estados. Isso restringe suporte, não determina automaticamente p_H. Dividir pelo número de cenários equivale a assumir equiprobabilidade; subdividir um cenário alteraria a resposta. Contar documentos também não fornece massas de oportunidades independentes.

Importante: fontes que confirmam E3 excluem descrições do **passado observado** sem E3. Elas não excluem ¬E3 do espaço de réplicas. O protocolo de réplica precisa ser declarado; uma representação determinística do passado já conhecido não produz um PPC útil.

## 2. Proposição de vacuidade e razão publicada

Se o suporte admissível contém s+∈A e s−∉A, e nenhuma restrição de massa adicional é justificada, então, para qualquer x∈[0,1], a distribuição

\[
p_H=x\delta_{s+}+(1-x)\delta_{s-}
\]

é normalizada, respeita o suporte e atribui P(A|H,C)=x. Logo, a projeção das distribuições admissíveis sobre P(A|H,C) é [0,1]. Se exigimos probabilidade positiva à evidência observada para atualizar, retiramos zero, mas o ínfimo continua zero. Isso prova não identificação pelos **insumos formalizados**; não prova que nenhuma informação futura possa identificar a quantidade.

Na aplicação, mantenha o julgamento central publicado r=a/b=15,8489319, com a=P(E3|SA,C), b=P(E3|CA,C). Escolher sob SA a mistura com massa a e sob CA a mistura com massa a/r satisfaz simultaneamente suporte, normalização e razão. Portanto,

\[
K=\{(a,b):0<a\leq1,\ b=a/r\}.
\]

A razão identifica uma linha, não um ponto. Sob a posterior publicada fixa w=0,71525275 e o auxiliar de replicação anterior, q(a)=[w+(1−w)/r]a=0,73321909a. Nada nas fichas BP/API verificadas fornece uma desigualdade de massa capaz de encurtar esse segmento. A admissibilidade substantiva dos estados-testemunho deve continuar auditável; não alegamos ter enumerado todas as histórias políticas possíveis.

## 3. Como uma fonte poderia produzir limites

Se G⊆A é uma condição suficiente e B⊆Aᶜ uma condição impeditiva, e há justificativas distintas para as massas P(G|H,C)≥g e P(B|H,C)≥d, então

\[
g\leq P(A\mid H,C)\leq1-d.
\]

São necessários **dois certificados** por limite: a implicação causal/lógica e a magnitude probabilística. Identificar G sem justificar g não fornece limite positivo. Como G e B são disjuntos, g+d>1 denuncia incoerência entre certificados. Se A⊆N e P(N|H,C)≤u, obtemos P(A|H,C)≤u: condições necessárias informam limites superiores, não inferiores.

Com várias condições suficientes G_i, o limite inferior é P(∪G_i), não a soma automática de probabilidades. Sem informação de sobreposição, o limite garantido pelas marginais inferiores é apenas max_i g_i. Analogamente, múltiplas condições impeditivas não podem ter suas massas somadas sem controle de sobreposição.

Se A=∩_{i=1}^k A_i e marginais l_i≤P(A_i)≤u_i forem justificadas, os limites de Fréchet são

\[
\max\{0,\sum_i l_i-(k-1)\}\leq P(A)\leq\min_i u_i.
\]

Se conhecemos somente A⊆∩A_i, o limite inferior permanece zero. A regra da cadeia do protocolo 02 é correta e dispensa independência; cada fator, contudo, é **condicional aos componentes anteriores**, não uma marginal intercambiável. Dependência desconhecida não pode ser eliminada por multiplicação.

Restrições lineares certificadas podem ser propagadas por otimização sobre massas não negativas dos átomos conjuntos. O solver não cria informação; com suporte livre de ambos os tipos, retorna os limites triviais acima.

## 4. Desacordo entre especialistas

Interseção é apropriada quando todas as restrições são aceitas **conjuntamente** como válidas. Ela não é uma regra automática para combinar especialistas que defendem premissas rivais. Se K₁ e K₂ representam análises alternativas, reportar ambos, ou o envelope de K₁∪K₂, preserva o desacordo. Interseção pode criar precisão artificial ou conjunto vazio; média introduz uma regra adicional e pesos. Conjunto vazio exige identificar o subconjunto incompatível e adjudicar suas premissas, não ajustar números até obter concordância.

## 5. Novas fontes mudam o condicionamento

Usar os documentos S apenas para auditar interpretações não equivale a incorporá-los ao modelo. Se entram como informação probabilística, o alvo passa a P(E3|H,C,S), e a posterior passa a P(H|D,S). Em geral, nem r nem w anteriores permanecem constantes. Mesmo que S informe somente auxiliares inicialmente independentes de H, condicionamento em D pode induzir dependência posterior: não é suficiente declarar que S “não fala diretamente sobre H”.

O exercício com r,w fixos é válido como auditoria condicional dos insumos publicados. Uma extensão empírica exige modelo conjunto, novo cálculo ou argumento explícito de invariância. Não se pode usar S para estreitar a, conservar r,w por conveniência e chamar S de validação independente.

## Parecer

O protocolo 02 é matematicamente coerente e explicita corretamente a ausência atual de massa. Recomendo preservar a distinção entre passado observado e réplica; exigir certificados separados de implicação e magnitude; incluir os limites de dependência; e reportar modelos rivais de especialistas separadamente. O procedimento disciplina a elicitação, mas as fontes examinadas ainda não entregam o número procurado.
