# Revisão operacional independente — participante 10

Li `protocolo_final.md` e `consensus_draft.md`. Não editei suas fontes. As correções K/O e definição de B já foram identificadas pela coordenação e não constituem achados novos desta revisão.

## Achado 1 — Completar o encaminhamento das rotas no formulário

**Prioridade: P2, correção delimitada do instrumento.** A Ficha 2 oferece quatro rotas (linha 284), mas a Ficha 5 só fornece campos para prior, razões e peso posterior calculado (linhas 345–353); a Ficha 6 pede Brier/log loss sem condição de rota (linha 373). Um participante que selecione “mistura com pesos elicitados” não encontra uma linha identificada para seus quatro pesos e sua procedência; alguém que entregue apenas condicionais por cenário tampouco dispõe de previsão marginal integrada para pontuar como desempenho preditivo do alvo. O texto conceitual distingue corretamente essas situações, mas o formulário não conclui o encaminhamento.

**Correção sugerida:** acrescentar quatro campos de pesos diretamente elicitados, rotulados como tal e usados somente nessa rota; indicar que previsão direta dispensa Ficha 5; e estabelecer que condicionais sem pesos recebem registro, sensibilidade e resolução documental, sem Brier/log apresentados como avaliação de uma marginal integrada. Para as rotas com previsão marginal, indicar explicitamente qual vetor entra na Ficha 6. Não exigir a ponte completa de quem selecionou uma entrega parcial.

## Verificações sem novo achado

UDI é a unidade explícita; cinco categorias distinguem silêncio e irresolução; blocos permanecem dependentes; não há multiplicação automática. O cálculo de 60 horas confere, com disponibilidade e recrutamento não verificados. A carga `35+3n` está correta. A reserva é candidata; treino e julgamentos dos agentes não se apresentam como validação causal. A eficácia futura está separada do piloto. As três horas por especialista são tratadas como hipótese a testar, não garantia de produtividade.
