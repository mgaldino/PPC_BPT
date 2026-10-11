# Elicitação por restrições certificadas para o E3 original

Agente 02, 10 de outubro de 2026. Proposta de procedimento e aplicação documental, sem elicitação humana realizada, sem edição do manuscrito e sem escolha de probabilidades pontuais. Li CLAUDE.md, o contrato documental PASS `8bcda550633f`, a proposta e os pareceres 02/03 da rodada anterior, o texto de FC 2025, seu suplemento e as extrações integrais dos documentos BP 2017, BP 2019 e API 2021. Debati diretamente com 01/fontes, 03/Edmans e a coordenação.

## 1. Resultado

Pedir a especialistas uma probabilidade e uma justificativa verbal não resolve o problema. Proponho mudar o objeto da entrevista: o especialista deve **propor restrições, demonstrar quais possibilidades exclui e apresentar a ponte que atribui massa às possibilidades remanescentes**. A entrevista termina legitimamente com `ND: não delimitado pelas informações disponíveis`. Não se preenche ND com a média das opiniões, com intervalo convencional ou com distribuição uniforme.

O procedimento pode produzir probabilidades justificadas, mas não garante produzi-las. No E3, as fontes disponíveis restringem a descrição do mecanismo e a interpretação de acontecimentos; não identificam uma massa mínima ou máxima não trivial para o pacote observado. Esse resultado é diferente de afirmar que toda elicitação é chute. Um julgamento numérico pode ser defendido e auditado; sua força virá da ponte substantiva, não da presença de uma citação junto ao número.

**Correção de nomenclatura:** SA = *Strategic Accommodation*; CA = *Competitive Advantage*. CA não significa mudança de atitudes nem ausência de interesses econômicos. Ambas as hipóteses descrevem firmas orientadas por interesses, com mecanismos distintos. Esta é a definição verificada em FC 2025, seção 5.

## 2. A ficha do alvo deve permanecer invariável

**Unidade:** pacote de ação agregado de Exxon, ConocoPhillips, Shell e BP, conforme E3 de FC; não uma firma média nem uma declaração sorteada.

**Evento:** E3, que reúne criação/participação no CLC em 2017, proposta de imposto a partir de US$40 por tonelada, deslocamento das regulações federais de fontes estacionárias de carbono, waiver inicial de responsabilidade e contribuições reportadas de US$1 milhão da Exxon e US$2 milhões da ConocoPhillips.

**Hipóteses:** as hipóteses agregadas SA/CA do artigo, com motivação predominante e seu contexto. Ganhos competitivos podem coexistir como benefício secundário no mundo SA; preocupação com custos regulatórios pode coexistir no mundo CA. Excluir essa coexistência faria hipóteses novas.

**Condicionamento da demonstração original:** C = (E0,E1,E2), respeitando o condicionamento sequencial explicitado no apêndice B.1. D é o conjunto original de evidências utilizado na posterior. Adicionar documentos BP/API como nova evidência sobre H e manter mecanicamente a posterior de 71,5% é inválido sem justificar que só informam auxiliares e não H; na dúvida, manter o exercício original e a extensão documental separados.

**Objeto desconhecido:** a = P(E3|SA,C), b = P(E3|CA,C). A probabilidade é de réplica condicional do processo descrito, não da verdade do registro histórico que já sabemos ter ocorrido. A comparação anterior pressupõe uma nova emissão independente da original e de E4 dado H,C e a especificação. Esse auxiliar precisa estar na ficha; não é dado documental.

**Exposição retrospectiva:** os pesquisadores já conhecem E3. Este exercício é reconstrução e análise de sensibilidade; nenhum formulário aplicado agora transforma E3 em holdout cego.

### Decomposição apenas lógica

Defina A = participação conjunta dos atores indicados; B = desenho do imposto a US$40; R = deslocamento das regulações indicado; W = waiver inicial; F = contribuições nos valores reportados. Então E3 = A ∩ B ∩ R ∩ W ∩ F.

P(E3|H,C) = P(A|H,C) P(B|A,H,C) P(R|A,B,H,C) P(W|A,B,R,H,C) P(F|A,B,R,W,H,C).

Esta é a regra da cadeia para uma conjunção. Não impõe independência, não afirma que a ordem escrita é causal ou temporal, nem autoriza reutilizar o BF do pacote para um dos componentes. A fatoração só é útil se reduzir a dificuldade de justificar algum fator. Cinco campos ND não são progresso em relação a um campo ND.

## 3. Regra de admissão: certificado obrigatório por restrição

Cada desigualdade proposta recebe um registro com os seguintes campos:

1. Identificador, fonte, página e passagem localizada.
2. Afirmação observada: o que a fonte de fato registra; distinguir conteúdo do documento de verdade da interpretação causal.
3. Alvo probabilístico: evento, hipótese, contexto, período e unidade exatos.
4. Tipo: restrição lógica de suporte; observação factual; comparação causal de incentivos; estimativa de frequência; julgamento quantitativo; condição de transporte.
5. Ponte completa: necessidade/suficiência, regra de escolha, erro documental, amostragem, independência, transporte ou premissa adicional que liga 2 a 3.
6. Desigualdade e derivação; se não houver derivação quantitativa, registrar ND.
7. Origem da magnitude: contagem auditável, limite institucional verificável, estimação externa ou julgamento explicitamente assumido. Um adjetivo como “plausível” não vira automaticamente 0,5, 0,8 ou 0,9.
8. Testemunho de exclusão: explicar qual possibilidade se torna inadmissível logo além de cada limite. Dizer “parece baixo” é insuficiente para classificá-lo como restrição documental.
9. Revisor: produzir um contraexemplo que satisfaça a fonte e viole a desigualdade. Se conseguir, a desigualdade é retirada ou reclassificada como condicionada a uma nova premissa.
10. Status: admitida como documental; admitida somente sob ponte; julgamento pessoal registrado; recusada; ND.

Não se exige que a magnitude seja logicamente deduzida de fatos em toda elicitação. Exige-se que o relatório não apresente uma magnitude assumida como deduzida. Conjuntos `K_documental` e `K_documental+pontes` são reportados separadamente; perspectivas pessoais podem ser preservadas em cenários distintos, sem média automática.

## 4. Formulário preenchido com as fontes disponíveis

### FC-E3, artigo pp. 12–13

- **Observado:** FC relatam o pacote e o julgam cerca de 12 dB a favor de SA. Citam ameaça de ações legais, possibilidade de substituir regras e oportunidades sob governo republicano.
- **Restrição documental:** registro histórico do evento e identificação da pergunta analisada. O pacote foi observado; não equivale a observações repetidas condicionadas ao mecanismo.
- **Restrição quantitativa admitida condicionalmente:** a/b = 10^1,2, **se aceitarmos o julgamento publicado como insumo**. O valor não é frequência extraída das fontes.
- **Restrição proposta e recusada:** a ≥ 0,5 porque FC dizem que o evento é altamente plausível. Falta regra calibrada para traduzir a expressão; um limite pode ser novo julgamento, não imposição da fonte.
- **Âncora absoluta:** ND.
- **Contraexemplo:** o pacote pode ser mais plausível em SA do que em CA, mas raro em ambos por depender de coalizão, desenho e valores exatos de contribuição. O mesmo BF não exclui esse caso.

### BP-2017, BPA_HCOR_00052952, p. 1

- **Observado:** email atribuído a James Nolan, de 27/1/2017, liga valor do imposto à possibilidade de evitar futura regra sobre emissões de refinarias; registra que o benefício para BP fica diminuído enquanto Trump não promulgar essa regra.
- **Restrição sobre interpretação:** “ausência de um componente defensivo no raciocínio registrado da BP” é incompatível com a passagem, sob autenticidade e interpretação literal. A passagem também não sustenta benefício defensivo constante entre contextos políticos.
- **Possível ponte:** se aceitarmos conteúdo como percepção decisória representativa, identifica a direção de um componente do ganho percebido; não identifica o ganho líquido total nem a decisão coletiva.
- **Restrição proposta e recusada:** a ≥ x, para qualquer x > 0, apenas porque há motivo defensivo. Um motivo pode existir e o pacote fracassar por custo, negociação, financiamento, horizonte, escolhas das outras três firmas ou outro formato de apoio.
- **Outra restrição recusada:** ameaça menor implica menor probabilidade do E3 completo. Monotonicidade da escolha, demais payoffs constantes, horizonte fixo e transporte ao pacote seriam premissas extras; a fonte não as demonstra.
- **Âncora absoluta, frequência de ameaça, custos totais, distribuição de oportunidades e coordenação:** ND.

### BP-2019, BPA_HCOR_00278794–95, pp. 1–2

- **Observado:** memo registra oposição à I-1631; despesa de US$13 milhões; redução projetada de RCOP de aproximadamente US$38 milhões em 2020 e US$137 milhões em 2035; promoção concomitante de cap-and-trade em Washington.
- **Restrição sobre modelo:** preferências dependem do instrumento e contexto. CA não implica apoio incondicional a qualquer carbon pricing; custo absoluto tampouco exclui vantagem competitiva relativa.
- **Restrição proposta e recusada:** transformar 13/38, ou normalizar os custos, em probabilidade. Os denominadores não são oportunidades de escolha nem uma distribuição de custos; grandezas financeiras não são probabilidades.
- **Transporte para E3 federal de 2017:** ND. A fonte é posterior, outra jurisdição e outro instrumento. Utilizá-la como nova evidência sobre H exige atualização; usá-la como analogia exige ponte explícita.
- **Restrição quantitativa em a:** nenhuma admitida.

### API-2021, princípios de carbon pricing, p. 1

- **Observado:** admite preempção **ou interoperabilidade** para evitar duplicação e recomenda políticas complementares de inovação.
- **Restrição sobre codificação:** exclui a descrição de que esse documento requer necessariamente eliminar toda regulação. Não é uma observação de E3 em 2017, nem decisão das quatro empresas.
- **Restrição proposta e recusada:** b = 0 porque CA seria incompatível com substituição regulatória. CA é vantagem competitiva; custos e desenho institucional podem importar sob essa hipótese.
- **Transporte:** ND para o pacote original, por entidade e período distintos.
- **Restrição quantitativa em a:** nenhuma admitida.

### FC-supp-A3, pp. 3–4

- **Observado:** distingue a lógica reputacional de apoio a política percebida como inviável da acomodação que busca viabilizar um mal menor.
- **Restrição sobre hipóteses:** não admitir “apoio puramente performático e destinado a não ser aprovado” como implementação automática de SA. Misturas ou HR requerem hipóteses/odds adicionais.
- **Restrição proposta e recusada:** considerar cada mecanismo mencionado um cenário igualmente provável e usar sua contagem para estimar a. O suplemento define possibilidades; não fornece seus pesos.
- **Restrição quantitativa em a:** nenhuma admitida.

**Resultado da ficha aplicada:** fatos, interpretações e comparações de incentivos ficam mais precisos. Condicionalmente ao BF central, o conjunto numérico permanece `a ∈ (0,1]`, `b = a/15,8489`. Sem o julgamento de BF, as fontes examinadas não fornecem o vínculo quantitativo entre a e b.

## 5. Perguntas exatas da entrevista BP-2017

O facilitador não começa por “qual é a sua probabilidade?”. Usa a seguinte sequência, preservando E3 no cabeçalho de cada página.

1. “A passagem descreve a preferência de quem, com que autoridade e em qual data? Que documentação mostra que essa percepção governou a decisão da BP sobre o CLC?” Resposta atual: autoria e data conhecidas; ponte para decisão agregada não estabelecida.
2. “Qual regra concreta poderia ser evitada, em qual horizonte, com que custo para BP? Há cálculo contemporâneo comparando imposto, ausência de política e regulação alternativa?” Resposta atual: futura Refinery GHG rule identificada; magnitude e comparativo completo ND.
3. “O texto afirma que a ameaça desapareceu em todos os horizontes ou apenas que o benefício diminuiu temporariamente? Qual fonte limita a probabilidade de retorno da ameaça?” Resposta atual: diminuição temporária afirmada; probabilidade e horizonte ND.
4. “Onde estão os efeitos sobre concorrentes, substituição carvão–gás, custos do imposto e valor de evitar litigância, para a mesma decisão?” Resposta atual: existem razões gerais em E0; cálculo líquido completo, condicional às hipóteses, ND.
5. “Mesmo que o ganho defensivo seja positivo, que condições ainda são necessárias para BP integrar o pacote exato? Qual documento permite excluir falha em cada uma?” Resposta atual: coordenação, desenho, financiamento e condições das demais firmas não certificados.
6. “Que evidência transporta a conclusão sobre BP para Exxon, ConocoPhillips e Shell conjuntamente? As decisões são dependentes?” Resposta atual: nenhum transporte/independência validado.
7. “Considere um modelo em que os mesmos motivos e o mesmo texto existam, mas quase todas as oportunidades terminem em apoio com outra contribuição ou outro desenho. Qual passagem torna esse modelo inadmissível?” Resposta atual: nenhuma passagem examinada impõe massa mínima ao pacote exato.
8. “Se propõe a ≥ L, de onde vem L? Mostre o denominador, a desigualdade institucional ou o julgamento assumido. Qual cenário que soma mais de 1−L seria incompatível com a evidência?” Resposta atual: ND; não escolher L pelo limiar do PPC.

Essa entrevista produz uma lista verificável de tarefas de coleta, em vez de transformar conhecimento verbal em quantis por pressão do formulário.

## 6. Como cenários poderiam gerar limites sem multiplicar parâmetros gratuitos

É legítimo usar os cenários internos já contemplados por FC. Seja Ω_H um conjunto de possibilidades mutuamente exclusivas e exaustivas, dado H,C; inclua um resíduo “não enumerado” quando necessário. Para ω em Ω_H, a estrutura define se E3 ocorre. Então:

`a = Σω∈E3 π_SA(ω)`; `π_H(ω) ≥ 0`; `Σω π_H(ω) = 1`.

Uma fonte pode remover cenários incompatíveis. Contudo, enquanto existir ao menos um cenário E3 e um ¬E3 e nenhuma restrição de massa, toda alocação entre eles permanece matematicamente possível. Contar cenários, alocar fichas ou assumir máxima entropia acrescenta uma distribuição; não a extrai da fonte. A escolha da granulação altera contagens, outra razão para rejeitar frequência de cenários inventariados como probabilidade.

Uma forma útil de certificado é identificar G ⊆ E3, cenários suficientes, e B ⊆ ¬E3, cenários impeditivos. Se uma fonte **e sua ponte** permitem justificar `P(G|SA,C) ≥ g` e `P(B|SA,C) ≥ d`, segue `g ≤ a ≤ 1−d`. A identificação de G ou B sem g ou d não estreita numericamente a. A relação não depende de independência entre componentes.

As implicações G⇒E3 e B⇒¬E3 também requerem certificado próprio, separado do certificado da massa. Chamar G de “suficiente” não o torna suficiente: verificar se contém todos os componentes do pacote e se os auxiliares institucionais, comunicacionais e de registro necessários estão presentes. Se a implicação for apenas assumida, rotular o limite como condicionado a essa premissa, e não empiricamente validado.

Com várias restrições lineares certificadas, extremos de `Σω∈E3 π_H(ω)` podem ser obtidos por programação linear. Essa ferramenta apenas propaga os insumos: se só houver suporte e normalização, retornará [0,1]. Não executei um solver nem criei massas para esta nota; os extremos decorrem analiticamente da presença de cenários dos dois tipos.

### Testemunhos de indeterminação, não estimativas históricas

Sob SA, um cenário compatível contém os motivos defensivos e êxito no pacote; outro mantém os motivos, mas termina em proposta de desenho ou contribuição diferente. Sob CA, há cenários com e sem E3, pois a hipótese não determina univocamente todos os detalhes do pacote. O registro histórico permanece E3=1; os cenários alternativos pertencem à réplica hipotética, não negam a documentação do passado.

Para qualquer a em (0,1], pode-se atribuir massa a aos cenários E3 sob SA e a/r aos cenários E3 sob CA, preservando r. Duas famílias-testemunho, a=ε e a=1−ε, mostram o problema: quase toda a massa pode ficar fora ou dentro do pacote sem modificar o conteúdo dos documentos citado como justificativa dos motivos. ε não é estimado e essas famílias não são propostas substantivas; são contraexemplos à alegação de que as fontes, sozinhas, impõem um limite numérico.

## 7. O que seria uma ponte capaz de fornecer magnitude

Três rotas legítimas, nenhuma disponível integralmente neste dossiê:

- **Frequências com transporte:** universo enumerado de oportunidades suficientemente comparáveis, mecanismo avaliado por dados independentes de E3, resultados não selecionados por presença do vestígio e justificativa de transporte para a decisão coletiva. Rótulos falíveis e seleção entram na incerteza. Repetir documentos de uma decisão não aumenta o denominador.
- **Limites institucionais ou estruturais:** fonte verifica condições suficientes/impeditivas e a massa dessas condições deriva de informação externa identificada. Uma regra contratual pode tornar um componente necessário/determinístico; isso não determina todos os demais. Payoffs observados requerem modelo e incerteza para virar probabilidade; supor logit com escala gratuita não resolve.
- **Julgamento quantitativo assumido:** especialistas defendem uma magnitude após confronto com alternativas e fontes, aceitando responsabilidade por uma premissa que não é dedutível do arquivo. Isso pode ser uma elicitação séria, mas o resultado é `K_documental+J`, e sua robustez à retirada de J deve ser mostrada. Consenso não converte J em dado empírico.

Uma pergunta de valor relativo sobre o complemento de E3 também requer uma dessas pontes. Pedir o BF do complemento apenas muda o parâmetro elicitado; não é solução para ausência de informação.

## 8. Entrevista, debate e validação replicáveis

**Preparação:** dois pesquisadores fixam ficha do alvo, inventário documental, papel de cada fonte (contexto original, nova evidência, analogia ou informação sobre mensuração) e lacunas. Identificadores permanecem nos formulários. Registram a exposição prévia ao desfecho.

**Agenda planejada, não pilotada:** preparação documental sem duração fixa; encontro individual de 90 minutos por especialista (15 para alvo/hipóteses/contexto, 30 para os cartões, 25 para cenários e pontes, 20 para certificados e ND); encontro de contraditório de 60 minutos com pelo menos um proponente e um revisor independente; revisão individual de 20 minutos; fechamento técnico posterior da matriz de restrições e do envelope. Os tempos são uma proposta organizacional e não evidência de viabilidade ou qualidade. Encerrar com ND se faltar informação; não pressionar por valores para cumprir a agenda.

**Rodada individual sem números:** cada especialista lista cenários suficientes/impeditivos, aponta as passagens e preenche pontes. Um cenário residual evita falsa exaustividade. O facilitador separa argumentos sobre SA de argumentos sobre CA.

**Rodada de certificados:** especialistas propõem somente os limites que conseguem defender. O formulário admite ND. Para cada L/U, devem justificar a magnitude e a atribuição ao pacote agregado. Primeiro o intervalo é proposto sem revelar o limiar do PPC; o valor 6,82% não é âncora inicial.

**Debate adversarial:** outro especialista constrói um mundo que respeita as fontes e viola o limite. O proponente o exclui com evidência/premissa identificada ou retira o limite. Discordâncias finais são preservadas como conjuntos alternativos; votação e média não resolvem validade.

**Validação de coerência:** conferir normalização, compatibilidade entre desigualdades, implicações conjuntas e dependência. Retirar um documento por vez mostra qual fonte ou ponte sustenta cada redução. Se o conjunto for vazio, localizar a combinação incompatível; não “corrigir” números silenciosamente.

**Validação empírica prospectiva:** antes de consultar resultados novos, fixar dossiê, regras e previsões para episódios inteiros reservados, preservar mecanismos latentes e seleção, avaliar escores/calibração. Bons escores agregados não identificam automaticamente P(Y|SA) e P(Y|CA). Treino em perguntas factuais melhora familiaridade com probabilidades, mas não certifica calibração dos contrafactuais causais de E3.

**Critério de sucesso do piloto:** alguma restrição quantitativa sobrevive ao contraditório e altera um diagnóstico ou uma decisão de coleta. Se nenhuma sobreviver, o protocolo detectou uma condição de inviabilidade; não demonstrou uma aplicação PPC concluída.

## 9. Propagação ao PPC: o que muda com cada fonte

Sob o BF e a posterior centrais publicados já reconstruídos, `r=15,8489319`, `w=0,71525275`, o PPC condicional de E3 da rodada anterior é `q(a)=[w+(1−w)/r]a=0,73321909a`.

| Etapa | Restrição em a que foi certificada | PPC admissível |
|---|---|---|
| Normalização + BF publicado aceito | 0 < a ≤ 1 | 0 < q ≤ 0,73321909 |
| Acrescentar leitura BP-2017 como auditoria de mecanismo, sem nova atualização | Nenhuma magnitude; contexto e ponte mais explícitos | Mesmo conjunto |
| Acrescentar BP-2019 como exame de transporte | Nenhuma magnitude; transporte ND | Mesmo conjunto |
| Acrescentar API-2021 como correção interpretativa | Nenhuma magnitude sobre E3; corrigida alegação de exclusividade | Mesmo conjunto |
| Acrescentar FC-supp-A3 | Nenhuma magnitude; preservada separação de HR | Mesmo conjunto |
| Futuro certificado válido a∈[L,U] | L,U documentados ou explicitamente julgados | q∈[0,73321909L; 0,73321909U] |

As linhas não significam que nova evidência relevante sobre H possa ser adicionada sem atualizar w. São a auditoria das alegadas justificativas de números do exercício original. Incorporar tais documentos como nova evidência causal gera outra análise, que deve atualizar H e auxiliares conjuntamente.

## 10. Debate e relação com o parecer Edmans

01/fontes concordou que fontes restringem possibilidades, não automaticamente massas, e propôs um certificado para todo estreitamento. Questionei diretamente a classificação temporal dos documentos: API2021 e BP2019 não pertencem automaticamente a C; BP2017 precede o evento, mas seu uso como informação nova exige distinguir calendário histórico de disponibilidade analítica.

01 respondeu que BP2017 é nova evidência arquivística retrospectiva, sem prova de integrar o prefixo publicado; confirmou como uso atual defensável a auditoria de afirmações e compatibilidade, mantendo o benchmark numérico separado. Adicionar S ao condicionamento muda o alvo para P(E3|H,C,S), exigindo reavaliar r e w ou declarar e defender seu transporte. Concordamos que BP2017 é a fonte mais diretamente ligada ao mecanismo, mas fixa apenas a direção de um componente do benefício: tanto coordenação rara quanto frequente do pacote são compatíveis com ela.

03/Edmans avaliou que protocolo e diagnóstico de identificação melhoram a contribuição conceitual, mas não resolvem execução, calibração ou utilidade. Concordamos em recomendar um piloto com meta neutra: investigar se fontes e pontes admissíveis estreitam o conjunto e informam alguma decisão, sem escolher um caso apenas para obter um check favorável. Se o piloto fracassar, mudar de aplicação ou restringir a contribuição às condições de viabilidade será decisão substantiva do autor.

**Recomendação final à coordenação:** mostrar esta ficha preenchida antes de qualquer formulário de quantis. Ela responde à cobrança do usuário com um procedimento falsificável de admissão e retirada de limites. Também mostra honestamente que, neste E3 e com este arquivo, não há base para anunciar probabilidades absolutas obtidas sem julgamento quantitativo adicional. Só se poderá dizer que o problema foi operacionalmente resolvido quando uma ponte concreta produzir limites que resistam ao contraditório e sejam úteis no PPC.
