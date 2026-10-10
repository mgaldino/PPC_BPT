# Participante 05 — Identificação e coerência Bayesiana

**Decisão:** motivos privados não precisam ser identificados pontualmente para uma previsão documental ser informativa. Entretanto, números defensáveis exigem separar informação empiricamente auditável, julgamento substantivo e atualização Bayesiana. A identificação dos motivos permanece limitada mesmo se a previsão funcionar.

## 1. Piloto executável

Recomendo uma empresa, um episódio regulatório e uma pergunta: **no conjunto previamente delimitado de manifestações formais, será encontrado pedido explícito para substituir determinada regulação pela precificação de carbono?** Empresa, regulação, período e corpus dependem do inventário documental; não afirmo que já estejam disponíveis. A unidade é empresa–episódio, não “as petrolíferas” indistintamente.

Definir quatro respostas: pedido encontrado; pedido não encontrado no material acessível; conteúdo conflitante ou insuficiente; material necessário inacessível. Regras devem esclarecer escopo, autoria e o tratamento de apoio genérico. “Não encontrado” descreve a busca, não a história. McCoy, API e investimentos conhecidos pertencem ao desenvolvimento.

Como recomendação de planejamento, utilizar um especialista em política energética, um conhecedor dos arquivos, um facilitador probabilístico e dois codificadores. Produtos: inventário, protocolo, fichas de elicitação, registro de exposição, tabela de probabilidades com justificativas e relatório de verificação. Os agentes atuais desenham esses produtos; não substituem especialistas humanos.

## 2. Onde podem nascer números auditáveis

Separar comportamento $B$, como envio de uma manifestação formal com aquele pedido, de resposta documental $Y$. Para estimar $p(Y\mid B,a,x)$, construir um conjunto de desenvolvimento com manifestações verificadas em registro independente da autoridade e aplicar, às cegas, o procedimento $a$ no corpus corporativo. Registrar denominadores, falsos positivos, documentos inacessíveis e características $x$: empresa, época, obrigação de divulgação e tipo documental. Duplicatas não são novos episódios.

O registro da autoridade precisa permitir verificar o conteúdo, não apenas a existência da manifestação. Auditoria de detecção não resolve omissões compartilhadas pelos dois arquivos. Transportar resultados para o alvo exige justificar semelhança de acesso e registro; sem essa base, usar faixas de sensibilidade. Não se pode estimar recuperação examinando somente documentos recuperados.

Já $p(B\mid C,x)$, comportamento dado motivo, não dispõe automaticamente de casos rotulados verdadeiros. Um discurso público ou uma acusação não certificam intenção. Esse termo exige julgamento, restrições substantivas ou evidência independente; sua decomposição não o transforma em frequência observada.

## 3. Fichas de quatro estados sem tautologia

Definir acomodação estratégica, SA, como contribuição relevante da redução esperada de perdas regulatórias para a decisão de apoiar o preço; vantagem competitiva, CA, como contribuição relevante de ganhos relativos esperados. Delimitar “relevante” e o episódio antes da elicitação. Os estados são $C=(SA,CA)\in\{00,10,01,11\}$; 00 agrega outros motivos ou nenhum dos dois, com heterogeneidade explicitada.

As fichas mantêm contexto econômico e oportunidade documental constantes. Alteram apenas os motivos assumidos. Não podem definir SA como “pedirá substituição” e depois perguntar a chance desse pedido. Tampouco CA implica logicamente investimento em renováveis: vantagens podem envolver gás ou captura de carbono.

Para cada ficha, pedir primeiro consequências alternativas e razões para o pedido ocorrer ou não. Depois solicitar distribuição completa entre respostas, justificativa por célula e limites plausíveis. Analogias precisam registrar quais diferenças mudariam o número. Elicitar individualmente antes da discussão; preservar divergências como especificações alternativas. O [SHELF](https://shelf.sites.sheffield.ac.uk/) oferece instrumentos de elicitação de distribuições; sua aplicação não valida as intenções latentes.

## 4. Três rotas com alcances distintos

**Direta absoluta.** Elicitar $q(Y\mid D,a)$, conhecendo o dossiê de desenvolvimento $D$, ou $q(Y\mid C,D,a)$ para cada ficha. Não é necessário estimar separadamente todo o processo de registro. A primeira opção produz uma previsão condicional auditável. Ter visto $D$ não transforma opinião agregada em posterior calculado. A segunda ainda precisa de pesos para produzir uma previsão integrada.

**Condicionais e pesos.** Documentar conhecimento inicial $K$, prior $\pi_c=p(C=c\mid K)$ e likelihoods $L_c=p(D\mid C=c,K)$. Calcular

$$
w_c(D)=\frac{\pi_cL_c}{\sum_h\pi_hL_h},\qquad
q(Y\mid D,a)=\sum_c q(Y\mid c,D,a)w_c(D).
$$

Para obter pesos, bastam razões de likelihood documentadas; probabilidades preditivas de $Y$ precisam ser absolutas. Se $D$ contém itens sucessivos, eliciar suas razões condicionadas aos anteriores; não multiplicar razões marginais supondo independência. As respostas dos especialistas especificam o modelo: não são dados independentes cujas likelihoods devam ser multiplicadas.

**Robustez.** Conservar um conjunto de especificações completas: priors, likelihoods, previsões e dependências compatíveis. Recalcular pesos e previsão para cada uma. Relatar envelopes e decisões estáveis. Limites de sensibilidade não são intervalos de credibilidade; mínimos de células diferentes não formam uma nova distribuição. Se os envelopes permitem quase qualquer resposta, a checagem é pouco informativa.

## 5. A ponte mínima para o BPT

Expandir dois rivais para quatro estados exige novos priors e novas avaliações de $D$. O 0,71 publicado não determina os quatro pesos, nem $p(SA=1\mid D)$ nesse modelo. Reparti-lo entre estados seria uma suposição adicional, não atualização. Também não se devem multiplicar posteriores marginais de SA e CA para obter a conjunta.

Uma ponte menor preserva as hipóteses e a unidade original, reproduz seus pesos a partir do prior e das razões documentadas e acrescenta probabilidades absolutas para uma pergunta reservada. Isso permite checar o BPT restrito original, sem produzir inferência sobre coexistência. A rota de quatro estados exige refazer a atualização; se faltarem seus insumos, entregar previsões condicionais por cenário, declarando a lacuna.

Recortar Exxon em 2015–2019 impede importar o 0,71 agregado. O formulário deve registrar: prior dos quatro estados; lista de $D$, incluindo evidências originais pertinentes e complementos vistos; razões sequenciais condicionais; previsões absolutas; justificativas. Congelar antes da revelação do alvo. Não dispomos desses números sem o painel; o procedimento para obtê-los está especificado, sujeito à defensabilidade das respostas.

## 6. Informação duplicada e dependências

Inventariar o que cada especialista conhece. Se uma evidência já fundamentou o prior, reutilizá-la integralmente em $D$ conta informação duas vezes. O mesmo vale para opiniões derivadas de fontes compartilhadas. Ocultar o ranking posterior reduz ancoragem, mas não apaga memória. Quando a separação entre $K$ e $D$ for impossível, registrar reconstrução retrospectiva e testar especificações alternativas; não alegar cegamento.

Para uma pergunta, a distribuição categórica basta. Para várias, marginais permitem checagens marginais, não a probabilidade de “três sinais juntos”. Uma conjunta exige elicitação por blocos ou fatoração substantivamente justificada. Na geração conjunta, compartilhar o mesmo estado histórico entre documentos relacionados. A dupla soma não permite sortear novamente elos já fixados pela configuração.

## 7. Critério de entrega e objeções

O mínimo para uma checagem preditiva posterior vinculada ao BPT é: alvo codificável, prior/likelihoods rastreáveis, pesos atualizados, distribuição preditiva absoluta coerente e comparação com resposta observada. A reserva acrescenta proteção prospectiva; uma análise retrospectiva conserva essa limitação. A avaliação de adequação depende de uma distribuição de referência, como em [Gelman, Meng e Stern](https://www3.stat.sinica.edu.tw/statistica/j6n4/j6n41/j6n41.htm). Apenas fichas com previsões condicionais fornecem cenários; apenas um pool de $q(Y\mid D)$ fornece previsão elicitada.

Objeção: “o procedimento só disciplina opinião”. Correto para a relação motivo–comportamento; auditorias e previsões repetidas podem avaliar desempenho observável, sem conferir rótulos verdadeiros aos motivos. Objeção: “um erro identifica SA ou CA como falso”. Não: pode decorrer do registro, contexto, pesos ou previsões; localização requer checagens que discriminem essas possibilidades.

Faltam corpus delimitado, referência independente de comportamento, reconstrução de $D$, especialistas e condições de transporte. Li CLAUDE.md, contrato, trechos metodológicos/petróleo do manuscrito, suplemento e relatório anterior. Verifiquei as duas páginas metodológicas citadas em 10/10/2026; a abertura do DOI de Fairfield–Charman falhou. Não abri fontes empíricas novas nem li propostas de pares; não executei análises.
