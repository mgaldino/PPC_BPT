# Avaliação das fontes para a aplicação empírica do PPC ao carbono

Data: 11 de outubro de 2026. Agente: `carbon_source_application`. ID exato do modelo: **UNKNOWN**, não disponibilizado ao agente. Papel: interpretação das fontes e revisão substantiva. Nenhum código de análise foi implementado por este agente.

## Decisão recomendada

A extensão empírica mais defensável é examinar **a ExxonMobil em 2021**, comparando seu apoio público ao preço do carbono com o registro de como um diretor de relações governamentais descreveu a utilidade desse apoio. A terceira hipótese, ganhos reputacionais sem custo de adoção, já foi articulada por Fairfield e Charman (FC) no Apêndice A.3. Ela deve entrar com esse nome e conteúdo próprios.

O corpus lido permite operacionalizar um diagnóstico da restrição compartilhada pelas versões de SA e CA que atribuem ao apoio público uma preferência operativa pela adoção. A entrevista, porém, é uma medição falível dessa preferência. A probabilidade de uma fala desse tipo sob SA ou CA não pode ser fixada perto de zero pela mera definição das hipóteses. O relato pode expressar cinismo individual ou baixa expectativa de aprovação mesmo quando o ator preferiria a adoção.

Os 71,5% publicados para SA se referem ao conjunto de empresas e evidências de FC. **Não são uma posterior específica da Exxon na primavera de 2021.** A aplicação deve fazer sua própria inferência nesse alvo, mostrando a conta de FC como ponto de referência histórico e metodológico.

## 1. Hipóteses e evidências publicadas

Fonte local: `quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods/sources/fairfield_charman_2025.txt`, seção 5, páginas 9–14. Suplemento em `fairfield_charman_2025_supp.txt`, Apêndices A.3, B.1 e B.4.

**SA:** desde 2015, as grandes empresas apoiam políticas climáticas moderadas sobretudo quando enfrentam ameaças regulatórias, procurando evitar ou se proteger de alternativas mais radicais e custosas. Sem essas ameaças, apoio é improvável. A política apoiada tem custo econômico líquido, mas é preferível à alternativa saliente.

**CA:** desde 2015, apoiam políticas moderadas sobretudo quando percebem vantagens sobre concorrentes e oportunidades que podem explorar. Sem tais benefícios percebidos, apoio é improvável. A política apoiada oferece benefício econômico líquido, ainda que imponha custos diretos.

**HR, já proposta por FC:** apoio sobretudo quando a política é percebida como politicamente inviável e pode melhorar a reputação sem custo de adoção. FC distinguem explicitamente essa hipótese de SA. Sob SA, as empresas vislumbram adoção efetiva da política preferida para impedir alternativas mais custosas. A observação de reputação, por si só, cabe como benefício secundário em qualquer hipótese. A distinção é a motivação principal e sua ligação com a inviabilidade.

Tabela 1. Reconstrução dos pacotes de evidência de FC. Sinal positivo na última coluna favorece SA sobre CA.

| Pacote | Conteúdo publicado | Empresas e período | Peso central SA:CA |
|---|---|---|---:|
| E1 | Carta à UNFCCC pedindo marcos estáveis e ambiciosos com preço do carbono, relacionando apoio à expansão do gás | BP, Equinor, ENI, Shell, Total, antes da reunião de Paris em 2015 | −4 dB |
| E2 | Pedido para Trump permanecer no Acordo de Paris. Carta da Exxon menciona gás, competitividade e presença na mesa de negociação | Exxon e Chevron, 2017 | −3 dB |
| E3 | Adesão à coalizão CLC, imposto inicial de US$40/t, substituição de regras federais de fontes estacionárias e cláusula inicial de imunidade a litígios climáticos. Inclui financiamento de Exxon e ConocoPhillips | Exxon, ConocoPhillips, Shell, BP. Formação e adesão em 2017, com financiamento posteriormente incorporado ao pacote | +12 dB |
| E4 | Projeções para investidores sobre crescimento do gás e substituição do carvão. FC dão especial importância à associação entre demanda por gás e preço do carbono acima de €30/t na apresentação da Equinor | Exxon 2018, Total 2019, Equinor 2019 | −7 dB |

O prior publicado favorece SA em 6 dB. A soma publicada é 6 − 4 − 3 + 12 − 7 = 4 dB. A posterior é aproximadamente 71,5% SA, condicionada à comparação SA/CA. Os pesos são julgamentos dos autores. As faixas do suplemento, na orientação CA:SA, são E1 [3,4], E2 [1,4], E3 [−15,−10] e E4 [5,9] dB.

**Precisão cronológica para E3.** A publicação agrupa formação em 2017 e financiamento. Um [relatório oficial da Exxon de 2018](https://lowcarbon.exxonmobil.com/-/media/global/files/sustainability-report/publication/2018-sustainability-report.pdf) informa que a empresa financiou Americans for Carbon Dividends em 2018. A aplicação não deve chamar o financiamento de observação de 2017 nem confundir CLC com seu braço de advocacy. A magnitude US$1 milhão é reproduzida por FC e amplamente noticiada, mas o trecho do relatório corporativo consultado confirma a ação e o ano sem quantificar essa contribuição.

## 2. O que BP2017, BP2019 e API2021 permitem codificar

Tabela 2. Observações efetivamente presentes nos textos primários já preservados no projeto.

| Fonte | Codificação factual admissível | Implicação substantiva | Consequência para probabilidades |
|---|---|---|---|
| BP, email de James Nolan de 27/01/2017, `BPA_HCOR_00052952` | O remetente atribui ao imposto a possibilidade de evitar uma futura regra de gases de efeito estufa para refinarias. Diz que essa vantagem diminuiu temporariamente sob Trump | Evidência direta de raciocínio sobre substituição regulatória no mesmo ator | Sustenta comparar maior probabilidade desse argumento sob SA do que sob CA, permitindo que CA também obtenha benefício regulatório. Não registra uma retirada do apoio |
| BP, estratégia para Washington de 2019, `BPA_HCOR_00278794` | Relata gastos contra I-1631, custos projetados para BP, e promoção de um projeto de cap-and-trade na legislatura de 2019 | A empresa escolhe entre desenhos de política. O documento contém objetivo reputacional, proteção do negócio e oportunidades de crescimento | Não permite tratar oposição a I-1631 como oposição a todo preço de carbono nem como réplica da decisão CLC |
| API, princípios de 2021 | Recomenda preempção **ou interoperabilidade** para minimizar duplicação do custo de carbono | Preferência por desenho regulatório sem duplicação | Não sustenta código de exigência incondicional de abolir toda regulação existente. O sujeito é API, não cada empresa individual |

As fontes estão em `quality_reports/research_pipeline/ppc_bpt/2026-10-10_causal_likelihoods/sources/`. Elas apoiam a distinção entre compensações, instrumentos e contextos. Nenhuma contém o resultado de um experimento em que só a ameaça regulatória ou só o benefício competitivo mudou.

## 3. O par de registros da Exxon em 2021

### D: posição pública antes da entrevista

Fonte: Darren Woods, [Why ExxonMobil supports carbon pricing](https://corporate.exxonmobil.com/news/viewpoints/supports-carbon-pricing), **29/03/2021**. Consulta em 11/10/2026.

Woods pede ao Congresso que adote o preço do carbono. A mesma manifestação liga o instrumento à comercialização de tecnologias, especialmente captura e armazenamento, e à substituição de regras que a empresa considera menos eficientes. Portanto, o registro contém simultaneamente argumentos próximos de CA e SA.

Código sugerido: `public_support = 1`. Os dois argumentos podem ser atributos do mesmo documento. Não devem entrar como duas manifestações independentes de apoio.

### Q: explicação instrumental e inviabilidade na entrevista

Fonte originadora: Unearthed, [Inside Exxon's playbook](https://unearthed.greenpeace.org/2021/06/30/exxon-climate-change-undercover/), publicada em **30/06/2021**, descrevendo entrevista por Zoom realizada em **maio de 2021**. Consulta em 11/10/2026.

O entrevistado é Keith McCoy, então diretor sênior da equipe de relações governamentais em Washington. A equipe jornalística apresentou-se como recrutadora. McCoy descreve o apoio ao imposto como recurso de comunicação, considera a aprovação inviável e ressalta a utilidade de a Exxon poder dizer qual proposta apoia. A pergunta do repórter contribui para a formulação explícita sobre inviabilidade.

Código observado: `instrumental_infeasibility_report = 1`. O sujeito desse código é **o relato de McCoy**, não a intenção verdadeira da Exxon. As expressões “talking point” e “advocacy tool” podem ser mantidas como citações curtas.

A referência retrospectiva é à continuidade do apoio público por mais de uma década. Ela não identifica desde quando a inviabilidade constituía seu motivo principal.

### C: contraditório corporativo

Fonte: Darren Woods, [Our position on climate policy and carbon pricing](https://corporate.exxonmobil.com/news/news-releases/statements/our-position-on-climate-policy-and-carbon-pricing), **02/07/2021**. Consulta em 11/10/2026.

Woods afirma que os comentários gravados eram inexatos e incompatíveis com a posição da empresa. Reafirma o apoio ao preço do carbono e descreve investimentos em tecnologias de baixo carbono. Código observado: `official_disavowal = 1`.

A desautorização deve afetar a avaliação de quão representativa é a fala de McCoy. Ela é uma reação ao episódio e não uma observação independente de Q. As falas e o contraditório não demonstram diretamente qual motivação corporativa prevaleceu.

## 4. Unidade, desenho do diagnóstico e julgamentos necessários

**Alvo recomendado:** motivo principal do apoio público da Exxon ao imposto federal sobre carbono na primavera de 2021. SA, CA e HR são mantidas com seus conteúdos causais. A especialização para uma empresa e uma janela temporal é uma escolha desta aplicação.

**Objeto replicado mínimo:** a categoria de explicação de um representante de relações governamentais, obtida sob o procedimento de entrevista e seleção de material disponível. Condiciona-se em apoio público documentado. Uma partição útil é:

1. apoio à adoção como proteção de alternativas regulatórias
2. apoio à adoção por benefício competitivo
3. utilidade instrumental do apoio ligada à inviabilidade
4. relato misto ou insuficiente para essas classificações

Q ocupa a terceira categoria, com sensibilidade de recodificação para a quarta. A afirmação probabilística relevante é a chance desse **relato selecionado** sob cada hipótese, e não a chance de qualquer notícia mencionar palavras sobre reputação.

É preciso declarar quatro julgamentos: (a) o quanto uma motivação principal admite benefícios secundários, (b) o quanto McCoy conhece e representa a posição da empresa, (c) o quanto a situação de entrevista pode incentivar uma exposição cínica e (d) o quanto a seleção jornalística privilegia esse tipo de declaração. O contraditório informa sobretudo (b). A situação da entrevista informa (c) e (d).

### Referência numérica oferecida por este agente, caso seja usada

Para um modelo direto do relato, condicionado no procedimento acima e no apoio público, proponho como referência **julgamental**, não como frequência extraída:

| Probabilidade do relato Q | Valor de referência | Faixa para debate de sensibilidade | Justificativa substantiva |
|---|---:|---:|---|
| `P(Q | SA, apoio público, procedimento)` | 0,15 | 0,05–0,40 | Um representante pode reconhecer a utilidade reputacional e o pessimismo político mesmo quando o objetivo principal é obter uma alternativa regulatória preferível |
| `P(Q | CA, apoio público, procedimento)` | 0,10 | 0,05–0,40 | O interesse econômico na aprovação torna a explicação exclusivamente instrumental menos central, mas não impede pessimismo ou discurso cínico |
| `P(Q | HR, apoio público, procedimento)` | 0,65 | 0,40–0,80 | O relato liga diretamente utilidade comunicativa e inviabilidade, mecanismo descrito por HR. Falas mistas ou defesa pública impedem prever esse relato com certeza |

**Autoria dos números:** este agente, em 11/10/2026, como uma proposta inicial para execução e crítica pelo coordenador. Não são números de FC, de BP, de especialistas humanos ou de uma calibração empírica. As faixas são propostas de sensibilidade, não distribuições uniformes. Em particular, as fontes não justificam excluir 0,20 ou 0,30 sob SA/CA. Se o coordenador usar outros valores, deve assumir expressamente a autoria e apresentar o efeito dessa mudança.

Com esses valores centrais, o relato não seria extremamente raro em uma comparação apenas SA/CA. A utilidade da aplicação seria mostrar o que uma conclusão binária deixa de considerar e como o resultado muda ao admitir HR. A evidência lida não autoriza prometer de antemão um PPC abaixo de 5%.

Separar um estado latente de preferência da emissão do relato é possível, mas acrescenta probabilidades. Se adotado, o produto final deve mostrar essas probabilidades condicionais, incluindo a possibilidade de Q apesar de preferência real pela adoção. Evitar tratar o relato como observação sem erro do estado latente.

## 5. Verificação de um documento contemporâneo à trajetória do CLC

Busquei documentos do inquérito congressional que permitissem testar a trajetória de 2017–2019 no mesmo ator. O registro mais relevante encontrado foi o email de Robert Stout, BP, de **03/09/2019**, [BPA_HCOR_00170216](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00170216.pdf), página 2. Consulta em 11/10/2026.

O email relata que o CLC retiraria a referência à imunidade por responsabilidade climática e, simultaneamente, tornaria explícita a preempção de regras atuais e futuras de carbono para fontes estacionárias. Stout entende que a mudança fortalece esse segundo componente. Relata aceitação aparente e provisória da Exxon, mas dúvida sobre entusiasmo para uma grande campanha pública no evento da ONU.

Essa fonte discrimina uma versão estreita em que **a imunidade isoladamente seria indispensável**. Ela não descreve uma retirada limpa de toda compensação regulatória. A permanência da Exxon continua compatível com SA de FC. O remetente também é BP, relatando o comportamento da Exxon, o que exige cuidado com a medição.

Os documentos [BPA_HCOR_00170209](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00170209.pdf) e [BPA_HCOR_00170225](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00170225.pdf) integram a mesma cadeia de comunicação. Não constituem observações independentes adicionais.

Não encontrei, na busca delimitada realizada, um documento interno da Exxon de 2016–2018 que estabeleça diretamente o motivo de inviabilidade para o imposto. O relatório congressional de 2024 remete a McCoy para essa alegação específica. Ele apresenta documentos da Exxon sobre Paris, CCS e metas, mas esses outros objetos não devem substituir automaticamente a preferência por um imposto federal.

## 6. Adjudicação das notas locais

| Afirmação em `evidence/oil_majors_evidence_*` | Classificação | Motivo |
|---|---|---|
| A fala de McCoy confirma diretamente SA de FC | **REFUTED** | Apêndice A.3 distingue esse mecanismo como HR e atribui a SA interesse em adoção efetiva |
| API2021 exige abolir todas as normas em troca do preço de carbono | **REFUTED** | O primário oferece preempção ou interoperabilidade para limitar duplicação |
| Cortes em renováveis equivalem a abandono do apoio ao preço do carbono | **REFUTED** | Investimento e preferência por política são objetos distintos. As próprias notas reconhecem persistência do apoio ao preço em alguns casos |
| Repetições de McCoy, suspensão no CLC e notícias podem ter pesos de evidência somados como independentes | **UNRESOLVED/INADEQUADO PARA USO** | Parte é reprodução ou consequência do mesmo episódio. É necessária fatorização condicional |
| Priors FC são 4 dB | **REFUTED** | O prior é 6 dB. 4 dB é a posterior da comparação SA/CA após E1–E4 |
| Notas secundárias de 2026 oferecem novas likelihoods validadas | **REFUTED** | Números propostos nas notas não foram calibrados e vários mapeamentos hipótese–evidência falham na leitura primária |

## 7. Entrega ao coordenador

A aplicação deve fornecer duas contas claramente separadas: reprodução da posterior agregada de FC e reanálise local da Exxon2021. Para a segunda, recomendo uma tabela pequena de likelihoods da posição pública e do relato, seguida de PPC do relato sob SA/CA e posterior recalculada com HR. A principal sensibilidade deve alterar a probabilidade do relato sob motivos orientados à adoção, a massa inicial de HR e a classificação da entrevista. O modelo deve representar as dependências do mesmo episódio.

Assim o leitor verá exatamente quais fontes fixam os códigos, quais argumentos ordenam as probabilidades e quais valores numéricos sustentam a mudança na conclusão. A robustez ou a fragilidade desse resultado será um resultado da aplicação.
