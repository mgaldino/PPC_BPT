# Síntese da entrevista — 2026-02-22

**Pergunta de pesquisa**: Como verificar se a especificação de likelihoods em Bayesian Process Tracing é empiricamente plausível?

**Argumento central**: Adaptar posterior predictive checks ao BPT. O pesquisador lista evidências não observadas, deriva predições do modelo, e confronta com dados. Erros de likelihood invisíveis in-sample se tornam visíveis quando o modelo precisa predizer fora da amostra. Posteriors extremos geram as predições mais testáveis — e são exatamente os casos onde o pesquisador mais precisa do PPC, porque são os que mais criam a ilusão de "caso encerrado."

**Estratégia empírica**: Um caso único (Fairfield & Charman 2017, reforma tributária chilena) com verificação empírica real de 5 predições do PPC, todas baseadas em dados públicos:
1. Atas de comissões legislativas (congressional hearings)
2. Votação nominal (roll-call votes)
3. Análise de cobertura de mídia (El Mercurio, La Tercera)
4. Evidência comparativa das reformas de 2001 e 2003
5. Reações da Bolsa de Santiago

**Contribuição para a literatura**: Primeira rotina formal de validação de likelihood para BPT, demonstrada empiricamente — não apenas proposta como framework teórico. Responde à crítica de Zaks (2021) sobre falta de guardrails. Alinha BPT com o Bayesian Workflow.

**Decisão-chave desta sessão**: O caso da Amazônia (Brandao/Befani 2023) sai do paper. Um caso com verificação empírica real é mais convincente do que dois casos hipotéticos.

**Principais desafios a resolver**:
- Coletar as 5 evidências (dados públicos chilenos)
- A evidência comparativa (e*₁₁) é a mais incerta — precisa de pesquisa sobre como as reformas de 2001/2003 foram enquadradas
- Resolver os TODOs da Seção 3 à luz dessa nova arquitetura
- Reescrever a Seção 4 incorporando dados reais em vez de predições hipotéticas

**Próximos passos sugeridos**:
1. Pesquisar e coletar as 5 evidências (atas BCN, votação nominal, jornais, dados de bolsa, reformas anteriores)
2. Revisar a Seção 3 com o argumento sobre posteriors extremos
3. Reescrever a Seção 4 com dados reais
4. Redigir Seções 1, 2, 6, 7
5. Atualizar o plano do paper para refletir a nova arquitetura (1 caso, sem Amazônia)
