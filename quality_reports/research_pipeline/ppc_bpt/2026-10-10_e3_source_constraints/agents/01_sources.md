# Auditoria de fontes: quais restrições sobre E3 são justificáveis?

Data: 10 de outubro de 2026. Leitura: CLAUDE.md, contrato de argumento `ppc_bpt:8bcda550633f:round1`, parecer Edmans de 6 de março de 2026 e PDFs/textos arquivados na rodada `2026-10-10_causal_likelihoods/sources`. Nenhuma edição no manuscrito, coleta nova ou elicitação humana foi realizada.

## Resultado principal e correção de hipóteses

**Nenhuma das fontes arquivadas fornece um limite numérico não trivial para a probabilidade absoluta de E3.** Elas restringem descrições de acontecimentos e interpretações de componentes dos mecanismos. Transformar essas restrições em uma massa probabilística exige uma premissa adicional identificável. Apresentar fichas, percentis ou concordância entre especialistas não fornece essa premissa.

Correção necessária da resposta anterior: FC, p. 9, define **SA = Strategic Accommodation**, acomodação estratégica, e **CA = Competitive Advantage**, vantagem competitiva. CA não significa mudança de atitudes; SA não é denominada strategic acceptance no artigo. Sob SA, apoio envolve aceitar custos líquidos menores que os de alternativas políticas relevantes. Sob CA, as políticas trazem vantagens competitivas e oportunidades com benefícios líquidos. Custos diretos positivos não separam as hipóteses: uma política pode prejudicar mais os concorrentes e ainda gerar benefícios líquidos para a empresa.

Alvo: `a = P(E3 | H_SA, C)`, em que `C` é o prefixo original da análise, com E0, E1 e E2. E3 é **o pacote agregado completo** apresentado por FC nas pp. 12–13: iniciativa CLC das quatro empresas, desenho do imposto, compensações e contribuições relatadas. Não é o comportamento isolado da BP, uma escolha de Exxon nem a ocorrência de uma assinatura documental.

## Cartões de fontes

### F1. FC: definição, ocorrência e interpretação de E3

- **Localização:** artigo principal, p. 9 (definições), pp. 12–13 (E3 e raciocínio); arquivo `fairfield_charman_2025.pdf`. [DOI](https://doi.org/10.1017/psrm.2025.16).
- **Proposição em paráfrase:** Exxon e ConocoPhillips, com Shell e BP, promoveram a iniciativa CLC descrita, com imposto começando em US$40/t, deslocamento de regras federais de fontes estacionárias, waiver de responsabilidade inicial e contribuições financeiras indicadas. Os autores julgam o pacote mais esperado sob SA, considerando compensações, ameaças judiciais e informações diferentes sobre as empresas.
- **Tempo/papel:** é o próprio resultado E3, cuja ocorrência foi usada para atualizar as hipóteses; não é amostra de calibração independente. O enunciado une criação em 2017 e contribuições; datas de cada contribuição precisam ser verificadas em fontes originárias antes de definir janela de observação mais precisa.
- **Mundos que exclui:** aceitando a fidelidade da evidência, elimina descrições factuais em que aquele pacote não ocorreu no episódio histórico. Isso não exclui modelos em que era improvável e ocorreu.
- **Restrição sobre a:** somente `a > 0`, se exigirmos que a especificação atribua probabilidade positiva à observação; nenhum limite positivo afastado de zero. A observação de um evento uma vez não torna sua probabilidade ≥1/2, por exemplo.
- **Premissa-ponte para um limite adicional:** um conjunto de oportunidades comparáveis, com mecanismo/hipótese classificável sem usar E3, seleção documentada e transportabilidade; ou uma distribuição subjetiva justificável de cenários. Nenhuma consta desta fonte.
- **Contraexemplo:** um mecanismo causal pode tornar possível a coalizão, mas a coordenação entre quatro empresas, aliados políticos e desenho exato pode ocorrer raramente ou frequentemente. A mesma realização observada é compatível com ambos.

### F2. FC: razão de verossimilhanças e incerteza publicada

- **Localização:** artigo p. 13; suplemento B.4, p. 10, arquivo `fairfield_charman_2025_supp.pdf`. [Suplemento oficial](https://static.cambridge.org/content/id/urn%3Acambridge.org%3Aid%3Aarticle%3AS2049847025000160/resource/name/S2049847025000160sup001.pdf).
- **Proposição:** julgamento central de 12 dB favorecendo SA para E3; intervalo de julgamentos considerado razoável, de 10 a 15 dB. Os autores descrevem análise independente, discussão e acordo sobre razões e atribuições.
- **Tempo/papel:** julgamento inferencial posterior à observação; não dado de frequência nem validação de especialistas.
- **Restrição efetiva, se adotarmos esse julgamento:** `a/b = 10^1.2` no ponto central; aproximadamente `10 ≤ a/b ≤ 31.62` para o intervalo publicado, com `b=P(E3|H_CA,C)`. Assim, `b≤0.06310` no ponto central decorre de `a≤1`; isso restringe b, mas **não restringe a para além de (0,1]**.
- **Premissa-ponte:** aceitar os juízos de FC e o condicionamento correspondente. Esta é premissa substantiva assumida, não implicação identificada pelas fontes brutas.
- **Contraexemplo:** todos os pares `(a,b)=(ε, ε/15.8489)`, com `0<ε≤1`, satisfazem a mesma razão publicada. Contagem de documentos ou número de autores que concordam não elimina a liberdade de ε.

### F3. BP, correspondência interna de janeiro de 2017

- **Localização:** PDF p. 1, email de James Nolan de 27 de janeiro, encaminhado em 30 de janeiro; Bates BPA_HCOR_00052952. Arquivo `bp_2017.pdf`. [Fonte primária](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00052952.pdf).
- **Proposição:** interlocutores da BP distinguiam remoção das regras existentes de prevenção de regras futuras; consideravam que um imposto poderia evitar futura regulação de emissões de refinarias. A expectativa de que Trump não adotaria tal regra diminuía temporariamente esse benefício.
- **Tempo/papel:** anterior à criação CLC, mas encontrado retrospectivamente; não demonstradamente parte de C. É novo documento sobre um componente causal da decisão de BP. Não representa diretamente as quatro empresas nem a probabilidade do pacote E3.
- **Mundos que exclui, condicionando autenticidade e fidelidade:** descrições desse email em que a BP não reconhecia nenhuma possibilidade de benefício por evitar futuras regras; descrições em que esse benefício permanecia indiferente à expectativa expressa sobre Trump. Não exclui CA: benefícios competitivos podem coexistir com esse componente defensivo.
- **Restrição quantitativa fiel:** para o componente específico de benefício esperado, a mensagem sustenta uma redução ordinal na avaliação expressa sob menor ameaça regulatória. Nem sequer identifica o sinal da utilidade líquida total. **Sobre a: nenhum limite numérico adicional.**
- **Premissas-ponte:** sinceridade/representatividade dos interlocutores; mapeamento da fala para cálculo decisório institucional; demais custos, benefícios, expectativas e distribuição dos estados; articulação das quatro empresas e chance de cada elemento do pacote. Cada uma precisa ser evidenciada ou explicitamente assumida.
- **Contraexemplo decisivo:** mantenha idêntica a expectativa sobre a futura regra de refinarias. Em uma especificação SA, ameaças judiciais e coordenação induzem o pacote com frequência ε; em outra, esses fatores tornam o pacote praticamente certo. O email continua verdadeiro nas duas. Mesmo monotonicidade do apoio em relação à ameaça não fixa o nível absoluto de apoio.

### F4. BP, estratégia em Washington, 2019

- **Localização:** PDF pp. 1–2, Bates BPA_HCOR_00278794–795; arquivo `bp_2019.pdf`. [Fonte primária](https://oversightdemocrats.house.gov/imo/media/doc/a/bp-documents/BPA_HCOR_00278794.pdf).
- **Proposição:** documento relata gasto de cerca de US$13 milhões contra I-1631, perdas projetadas de RCOP em anos especificados se a iniciativa fosse adotada e promoção de um projeto de cap-and-trade, além de outras atividades políticas.
- **Tempo/papel:** posterior a E3, outra jurisdição, outro instrumento e uma empresa. É nova evidência potencial sobre decisões políticas e heterogeneidade; não uma repetição de E3. Não se estabeleceu neste trabalho qual era o projeto de cap-and-trade mencionado.
- **Mundos que exclui:** a leitura de que BP apoiava indistintamente todos os instrumentos de precificação; descrições do documento que ignoram custos empresariais considerados. Custos projetados e gasto de lobbying não estabelecem a totalidade das motivações.
- **Restrição sobre a:** nenhuma. Valores monetários não são frequências; RCOP de anos diferentes não é automaticamente valor presente líquido; o gasto de oposição não informa a distribuição de erro ou de benefícios da coalizão CLC.
- **Premissas-ponte necessárias:** equivalência/transportabilidade de decisões estaduais de 2018–2019 para o pacote federal agregado de 2017, representação da escolha, todos os custos e benefícios, e uma distribuição de incerteza independente. Não verificadas.
- **Contraexemplo:** a mesma oposição à iniciativa estadual pode coexistir com probabilidade quase nula ou alta de coordenar o pacote federal, dependendo de contexto político, outros atores e desenho institucional.

### F5. API, princípios sobre precificação, 2021

- **Localização:** PDF p. 1, abertura e item sobre duplicação/interoperabilidade; arquivo `api_2021.pdf`. [Fonte primária](https://www.api.org/~/media/files/news/2021/03/api-isf-on-carbon-pricing3_20_21).
- **Proposição:** admite minimizar duplicação por preempção ou interoperabilidade e prevê políticas complementares voltadas à inovação.
- **Tempo/papel:** posterior a E3 e declaração de associação. Não pode ser incorporado silenciosamente ao contexto original de 2017 nem substituir o desenho CLC.
- **Mundos que exclui:** descrições do documento API que afirmem exigência inequívoca de extinguir toda regulação ou recusa de qualquer política complementar. Não exclui uma motivação estratégica ou competitiva específica por si só.
- **Restrição sobre a:** nenhuma. Corrige codificação e precisão do mecanismo; não fixa probabilidade do pacote anterior.
- **Premissas-ponte:** estabilidade no tempo, representatividade de associação para as quatro empresas, equivalência de programas e instrumento, interpretação da retórica como regra decisória. Não verificadas.
- **Contraexemplo:** uma API que admite interoperabilidade em 2021 é compatível com diferentes preferências e probabilidades de coalizão em 2017.

### F6. FC, suplemento: reputação, outras hipóteses e dependência

- **Localização:** suplemento A.3, pp. 3–4; B.1, pp. 5–6.
- **Proposição:** HR distingue apoiar uma política percebida como inviável por benefícios reputacionais de apoiar um mal menor cuja adoção se considera possível, sob SA. Hipóteses mistas exigem nova análise. Evidências anteriores informam explicitamente a avaliação das seguintes.
- **Tempo/papel:** especificação teórica e metodologia; não nova observação de E3.
- **Mundos que exclui:** no modelo que adota tais definições, não permite reclassificar a lógica de inviabilidade/reputação como SA sem declarar mudança de hipótese. Isso corrige a taxonomia, não cria probabilidades.
- **Restrição sobre a:** nenhuma nova bound. Mostra por que mecanismos rivais e o contexto devem ser definidos antes da elicitação.
- **Contraexemplo:** mesmo sob SA precisamente definida, existem inúmeras maneiras de aceitar um mal menor que não produzem o pacote CLC exato.

## O que a tabela de restrições deve registrar

Sob suporte Ω de cenários compatíveis com hipótese e contexto, uma fonte pode eliminar cenários ou restringir um componente causal. Entretanto, para um evento A=E3, `a=Σ_{ω∈A}π(ω)` depende dos pesos π. Se permanecem cenários admissíveis com A e sem A e os pesos não têm âncoras, o ínfimo/supremo continuam 0 e 1. A observação de E3 pode excluir o zero estrito, mas não um limite arbitrariamente próximo de zero.

Isso é uma demonstração de não identificação, não defesa de frequencismo exclusivo. Uma probabilidade subjetiva pode ser justificada por argumentos, experiência e comparações. Seu componente subjetivo precisa continuar visível. Contar cenários, documentos ou especialistas como se fossem equiprováveis introduz uma medida sem fundamento.

Cada estreitamento proposto deve vir com um certificado: (i) alvo e unidade; (ii) fonte e proposição; (iii) condição temporal; (iv) implicação lógica; (v) premissa-ponte que fornece massa ou limite; (vi) justificativa dessa premissa; (vii) dois cenários adversários; (viii) conjunto antes/depois. Para F3–F5 acima, a coluna honesta é **nenhum estreitamento numérico de a demonstrado**.

## Condicionamento e dupla utilização

BP2017 é pré-E3 no calendário, mas uma evidência arquivística nova para a análise; BP2019/API2021 são posteriores. Aqui, têm função de auditoria de afirmações e mecanismos. Se incorporados como informação S à elicitação, o alvo passa a `P(E3|H,C,S)`. As razões de verossimilhança e posterior originais não permanecem automaticamente válidas. Deve-se reavaliá-las ou justificar explicitamente sua transportabilidade. Não vale usar S para calibrar a, conservar por conveniência r e w, e chamar S de holdout independente.

## Denominadores e observações que faltam, sem alegar coleta

Uma coleção documental relevante buscaria todas as oportunidades de apoio a pacotes definidos previamente, inclusive oportunidades sem apoio, com registro de quando passaram a ser opções reais. Poderiam contribuir inventários de propostas e alterações da CLC, registros de membership/entrada/saída/contribuições, agendas e minutas internas anteriores às decisões, posicionamentos em propostas federais e estaduais, avaliações contemporâneas de ameaça regulatória, custos e oportunidades de mercado. Lobbying Disclosure Act e agendas legislativas podem ajudar a enumerar oportunidades, mas atividade de lobbying não é amostra aleatória e ausência de registro não equivale a ausência de apoio.

A classificação SA/CA de cada episódio não deve ser definida pelo próprio resultado que se deseja prever. Dados de empresas individuais não oferecem automaticamente denominador para a coalizão agregada E3. Um painel de empresas/propostas exige um modelo de coordenação/seleção e justificativa de transporte; de outro modo, serve apenas para componentes. Uma contagem de um sucesso em um episódio é informação fraca, não uma probabilidade pontual empiricamente identificada.

## Debate e relação com Edmans

Troca com `e3_02_protocol`: desafio sobre fontes pertencerem ao prefixo C; consenso de manter benchmark publicado separado da nova informação S, e de mostrar dois sistemas probabilísticos compatíveis com BP2017. Troca com `e3_03_edmans`: consenso de que o conjunto admissível pode continuar amplo mesmo depois da auditoria documental. O prêmio da formalização pode ser evitar uma conclusão sem apoio, mas isso ainda precisa ser demonstrado como valor metodológico.

Parecer Edmans: a preocupação com precisão espúria continua pertinente. O protocolo acima melhora rastreabilidade e impede bounds sem base, mas ainda não fornece uma aplicação validada nem separa, por si só, model checking de updating. Procurar obrigatoriamente um resultado com p<0,05 seria uma resposta errada ao pedido de diagnóstico não trivial; o piloto precisa ter capacidade de diagnosticar e também de retornar inconclusivo.
