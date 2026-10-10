# Revisão independente 05 — Matemática e identificação

**Veredito:** concordo com ressalva. Há um achado P2 de condicionamento a resolver antes do PDF. Não encontrei erro aritmético nas fórmulas nem importação indevida dos posteriores antigos. A ressalva não torna as distribuições numericamente incoerentes; afeta sua interpretação como posterior condicionado ao pacote informacional completo.

**Escopo:** leitura integral de protocolo_final.md e consensus_draft.md, nesta rodada. Não editei o relatório nem executei análises, preenchi probabilidades ou verifiquei empiricamente o caso chileno. Aprovação refere-se ao desenho.

## Achado 1 — P2: explicitar onde os metadados informativos entram na atualização

**Trechos:** protocolo, linhas 68 e 98: cada previsão condicionará em “estágio, papel dos atores, número de intervenções e extensão do bloco”; especialistas recebem “metadados do bloco”. Nas linhas 139–147, o vetor é

$$v_{ecj}(y)=P_e(Y_j=y\mid c,K,D,O_j),$$

mas o peso usa somente o prior dado K e as razões de D:

$$w_{ec}=P_e(c\mid K,D).$$

**Problema:** o texto não afirma que os componentes informativos de $O_j$ pertencem a K/D nem que $C\perp O_j\mid K,D$. Número e extensão das intervenções podem informar E/B, mesmo antes de revelar sua categoria. Nesse caso, a preditiva posterior condicionada ao pacote completo utiliza $P_e(c\mid K,D,O)$, com O reunindo os metadados conhecidos dos dois blocos. Usar $P_e(c\mid K,D)$ define uma mistura normalizada, porém descarta essa possível atualização. O suporte positivo e a normalização não resolvem essa diferença.

**Correção mínima proposta:** distinguir regras fixas de observação de metadados substantivos conhecidos. Registrar todos os metadados informativos dos dois candidatos em K antes da elicitação do prior, ou em D como informação a atualizar; deixar $O_j$ representar somente a regra fixa de observação. Alternativamente, escrever os pesos condicionados ao conjunto comum O e documentar seu tratamento. Preservar um mesmo posterior para o episódio UDI e os dois alvos marginais. Não seria necessário criar uma conjunta dos resultados dos blocos.

**Condição de encerramento:** o instrumento exige esse registro, e a interpretação das fórmulas passa a condicionar na mesma informação entregue aos especialistas.

## Verificações sem achados adicionais

- A invariância da mistura sob a perturbação de $p_1,p_0$ nas linhas 54–58 está correta, dentro do suporte admissível.
- As razões sequenciais das linhas 141–149 cancelam o likelihood do estado de referência e produzem o posterior correto. Exigem denominadores de referência positivos e probabilidade positiva de D sob o modelo, como pressupõe a conferência de suporte. Não pressupõem independência dos itens.
- Quatro estados têm três probabilidades livres de prior; cada item de D acrescenta três razões relativas; quatro vetores por alvo acrescentam $4(k-1)$ valores. Portanto, $3+3n+4J(k-1)$ e $35+3n$ estão corretos; $n=2$ produz 41.
- Os escores Brier e log estão corretos. O Brier multicategórico sem divisão por dois tem intervalo [0,2]; zero no resultado observado gera log loss infinita.
- O protocolo diferencia previsão direta, condicionais, mistura com pesos elicitados e posterior calculado. A média de previsões individuais não é apresentada como atualização Bayesiana sobre especialistas.
- A unidade UDI/Senado aparece consistentemente no corpo, nas fichas e na advertência contra importar pesos. Sua validade histórica e a atribuição dos documentos permanecem tarefas empíricas do custodiante.
- E/B não são definidos pela fala-alvo; o cartão B requer facilitação causal além de interesse pequeno. O estado 00 admite outras causas. Fronteiras substantivas pendentes suspendem números, em vez de serem preenchidas por suposição.
- A limitação a marginais e a proibição de produto/cauda conjunta não justificada estão corretas. Nenhuma aprovação nesta revisão valida empiricamente motivações, probabilidades, calibração ou superioridade do método.
