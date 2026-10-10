# Debate de B, rodada 1

Data: 2026-10-10. Propostas A/B/C independentes salvas antes da leitura cruzada. Registro de discussão, sem unanimidade presumida. Nenhum script executado. B leu integralmente A e C e trocou objeções diretamente com ambos.

**Trilha de versão:** B aplicou as clarificações B1/B2 ao arquivo inicial antes de receber a instrução do coordenador para preservar seu hash. A versão esclarecida foi salva em `../proposals/B_predictive_round1_clarified.md` e `../proposals/B_findings_round1_clarified.json`; o texto independente foi então restaurado, revertendo exatamente as três passagens e os dois campos alterados. Hash restaurado de `B_predictive.md`: `8468b0c47918b5a98dfabb97f42648f5872eb03101a71b8239e4c1243c8d74e6`. Hash restaurado de `B_findings.json`: `a4bf384e36ed82ccca79400fb4805082d51b2edd1e294fd1e8682fddb5954beb`. As correções abaixo prevalecem para a síntese; o arquivo inicial preserva o registro independente, inclusive sua formulação incompleta sobre registro perfeito.

## B → A: duas objeções e uma concessão

**A1 — Objeto da réplica.** Em um corpus finito já produzido, textos e disponibilidade são fatos históricos fixos. Sortear novamente produção/acesso do mesmo arquivo exige um processo documental hipotético adicional. Uma distribuição de respostas ainda não reveladas é previsão epistêmica; não se torna automaticamente réplica de uma história ou de um arquivo. B propôs checagem holdout como núcleo e PPC de repetição apenas quando o processo de observação repetido for substantivamente definido.

**Resposta de A:** aceita. Em busca determinística num corpus existente, o núcleo é prever a resposta reservada. Ressortear produção/acesso é outro alvo e requer justificativa. A manteve sua arquitetura geradora como extensão opcional.

**A2 — Modelo calculável não é modelo identificado.** O exemplo A estipula 18 parâmetros categóricos livres, dois para mobilização e três pesos, antes das igualdades/restrições; três oportunidades não permitem estimar essa estrutura. B exigiu âncoras externas ou conclusão explícita de falha preditiva do bloco sem localização causal.

**Resposta de A:** aceita. O exemplo é gerador didático completo, não estimável naquelas três observações. Diagnóstico causal só entra quando âncoras permitem distinguir ocorrência, interesse material e detecção. Na ausência delas, relata-se falha do bloco, sem identificação do elo.

**Concessão de B:** a separação em A entre mobilização real `B`, redução material `L` e resultado documental, com categorias `+`, `−`, `0`, `M`, melhora o desenho da aplicação. Será uma extensão prioritária à previsão direta de respostas.

## B → C: duas objeções e uma concessão

**C1 — Discriminação não coincide com adequação.** Maximizar a menor divergência entre hipóteses escolhe alvos de discriminação/localização. Pode excluir uma observação que todos os modelos consideram muito improvável, justamente útil para adequação absoluta. B propôs duas classes de alvos: checagens de implicações compartilhadas e checagens que separam elos/modelos.

**Resposta de C:** aceita integralmente. O maximin pertence ao desenho para discriminação; adequação também precisa de alvos comuns e possíveis surpresas sob todos os rivais. Essa correção altera o uso do corolário, não os resultados de não identificação.

**C2 — Escopo da validação.** A grade inicial com muitos fatores e seis comparadores poderia deslocar esforço das âncoras e da reserva documental. FC/CausalQueries com a mesma distribuição conjunta são equivalentes para essa previsão; não pode haver ganho algorítmico por renomeação. B propôs núcleo de quatro classes de DGP: modelo correto, mecanismo errado, detecção errada e dependência errada, com equivalência informacional e ablações.

**Resposta de C:** aceita reduzir o núcleo inicial e ampliar conforme falhas concretas. O ganho pode ser auditabilidade e desenho, não melhor desempenho de um algoritmo novo.

**Concessão de B:** os resultados R2/R3 de C e os casos negativos são indispensáveis. A localização do corpus oficial chileno torna viável auditar o acesso, embora o corpus público não dê observação direta de percepção privada.

## A/C → B: objeções confirmadas e correções

**B1 — Completude documental não garante que a ação foi registrada.** Ambos observaram que a versão original do toy falava em pacote completo e codificação perfeita, mas usava `L=0` como ausência real de defesa. Faltava pressupor registro perfeito ou redefinir o alvo como conteúdo documental.

**Resposta/correção de B:** confirmada. O exemplo passou a declarar registro, recuperação e codificação perfeitos e a se identificar como caso-limite didático. Sua função é demonstrar BF favorável sem surpresa absoluta. Uma aplicação real adotará categorias de não documentação, contradição e indisponibilidade ou limitará a inferência ao conteúdo disponível. `Não achei` nunca será convertido automaticamente em ausência histórica.

**B2 — Uma célula rara não constitui diagnóstico omnibus.** Ambos pediram justificativa de `T=1{R=0,L=1}`, aviso de que outras falhas escapam e tratamento explícito da família de verificações.

**Resposta/correção de B:** confirmada. T é uma direção substantiva predefinida: decisão não reativa apesar da persistência de defesa empresarial, que tensiona as duas narrativas do toy. Não detecta (0,0). Massa pontual pequena sozinha não demonstra inadequação. Se várias discrepâncias forem investigadas, registrar a família, a seleção e a regra conjunta e avaliar falsos alarmes do procedimento completo. Não se propôs uma correção universal mecânica de multiplicidade. A distribuição completa já era exibida; a limitação foi acrescentada ao texto.

A e C confirmaram os cálculos B: tabela preditiva (.536,.364,.044,.056), BF 3.28, posterior composto .164/.364 ≈ .45055, envelope [.031,.057]. A considerou suas objeções resolvidas; C aceitou o esclarecimento em mensagem subsequente quando disponível. Não houve validação empírica.

## Respostas adicionais ao coordenador

**História fixa não proíbe previsão bayesiana.** Não é necessária uma repetição física de 2005. É necessário distinguir objetos. A resposta reservada `Y_B` é um fato ainda desconhecido, com distribuição condicional em D. Depois de observada integralmente, `P(Y_B|D,Y_B)` é degenerada para essa mesma resposta; `Y_rep` precisa ser outra variável definida pelo modelo, como uma realização hipotética de registro ou mensuração. Não se deve renomear a incerteza sobre o mesmo dado já conhecido como nova observação. Um modelo de cópia observacional pode sustentar PPC genuíno sem repetibilidade física, mas sua semântica precisa ser explicitada. A previsão holdout evita impor esse modelo de cópia como requisito de entrada.

**Somente marginais não bastam para adequação conjunta.** Podem-se avaliar previsões individuais e calcular a esperança de discrepância aditiva por linearidade. A distribuição da soma, sua cauda, a probabilidade do vetor e a atribuição de falhas dependem da conjunta. Por exemplo, marginais .8 e .7 implicam interseção entre .5 e .7 por limites de Fréchet, não .56 sem independência. Alternativas: elicitar uma pequena tabela conjunta; modelar dependência compartilhada; apresentar limites; ou limitar honestamente a conclusão a marginais. Várias marginais plausíveis podem coexistir com uma conjunta inadequada.

**Probabilidade de um padrão não é, por si, discrepância.** Uma célula fica pequena automaticamente quando o espaço amostral aumenta. Avaliação absoluta precisa de uma característica ou ordenação de discrepância definida e aplicada igualmente a observado e previsto. O exemplo B funciona porque sua T binária e estreita é explícita, não porque qualquer vetor de massa .044 seria necessariamente surpreendente.

## Conferência independente do exemplo A por inspeção

Todas as seis linhas categóricas somam 1; pesos das quatro configurações somam 1. Da tabela de configurações, `P(R=1)=.85`, `P(L=1)=.30`; logo `P(B=1)=.70×.80+.30×.10=.59`.

- `P(Y1=+)=.85×.68+.15×.08=.590`.
- `P(Y2=+)=.59×.60+.41×.04=.3704`.
- `P(Y3=+)=.30×.63+.70×.045=.2205`.
- Silêncio em q2 sob L=0: `.80×.16+.20×.28=.184`.
- Silêncio em q2 sob L=1: `.10×.16+.90×.28=.268`.

As contas e a enumeração de 4³=64 respostas estão corretas. Conferir aritmética não valida probabilidades, independência condicional ou viabilidade dos arquivos.

## Mínimo comum implementável e diferenças remanescentes

Mínimo acordado: uma pergunta documental reservada, categorias exaustivas, protocolo fixo, probabilidades absolutas por hipótese ou conjunto coerente, posterior obtido com informação anterior, soma para formar q, revelação e diagnóstico limitado ao alvo. Para duas perguntas, usar conjunta ou limites; para ocorrência causal, acrescentar âncoras observacionais. LR sozinho não fornece q. PPC do mesmo material e simulação de história inteira são extensões distintas.

A diferença de ênfase permanece: **B** prioriza baixo custo, previsão reservada direta e resultados de insuficiência; **A** desenvolve o núcleo de observação e estados compartilhados para tornar uma extensão causal defensável; **C** exige demonstrações comparativas e negativas para sustentar uma contribuição metodológica além do workflow. O acordo não demonstra que probabilidades absolutas confiáveis ou uma reserva empírica adequada já existem. Essa auditoria determina se o projeto avançará como checagem pontual, método de limites ou aplicação exploratória.
