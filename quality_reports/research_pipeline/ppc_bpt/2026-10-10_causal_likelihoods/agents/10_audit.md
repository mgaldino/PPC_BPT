# Revisão independente: likelihoods SA/CA e família de PPCs

Data: 10/10/2026. Revisor distinto do implementador R e do autor de `proposta.md`. Não editei manuscrito, proposta, dados, código ou resultados. Não executei `causal_ppc.R`, que grava arquivos; li seu conteúdo integral e conferi os arquivos produzidos com cálculos independentes e somente leitura em Python e JavaScript. Não realizei auditoria visual do PDF.

## Veredito

**PASS para a reconstrução matemática, fidelidade aos insumos publicados e implementação da família condicional. O PPC pontual empiricamente fundamentado solicitado pelo usuário permanece NÃO RESOLVIDO.**

O relatório atual explicita essa diferença no primeiro parágrafo. Não apresenta o parâmetro livre como estimativa documental, não atribui respostas fictícias a especialistas e não reivindica validação empírica de SA/CA. A família é de PPCs condicionais de uma nova emissão do E3 original, sob auxiliar novo de independência condicional da réplica. Não constitui gerador conjunto de todas as evidências E1–E4.

## Materiais efetivamente examinados

- `proposta.md`, leitura integral, com conferência posterior dos trechos modificados sobre definição de E3, título da seção e elicitação independente antes do limiar.
- Relatórios 02, 06, 07 e 08, lidos integralmente; leituras individuais complementaram a primeira saída conjunta truncada.
- Texto extraído localmente de Fairfield–Charman: definições de SA/CA e prior na p. 9; E3 e sua avaliação nas pp. 12–13; agregação dos pesos na p. 13.
- Suplemento FC: A.3, pp. 3–4, distingue reputação por proposta inviável de acomodação; B.1 explicita atualização sequencial e dependência; trechos quantitativos de B.4 confrontados com os pesos centrais.
- Textos extraídos integrais dos documentos BP 2017, BP Washington e API 2021. Conferi a presença dos PDFs locais, mas a presente revisão não inspecionou seus pixels.
- `published_weights.csv`, `source_ledger.csv`, `provenance.md`, `causal_ppc.R` e todos os CSVs de resultados.

## Conferência de fidelidade e escopo

1. **SA/CA preservadas.** A fonte contrapõe apoio para evitar custos regulatórios maiores e apoio por benefícios competitivos líquidos. O relatório não redefine essas hipóteses como região da sede ou assinatura. A posterior continua no escopo agregado da comparação original, não é atribuída a uma firma específica.
2. **Evento preservado.** Os 12 dB pertencem ao pacote E3 de CLC, empresas participantes, desenho do imposto e contribuições. O texto atual explicita Exxon, ConocoPhillips, Shell, BP, US$40/t e contribuições de US$1 milhão e US$2 milhões. Não transfere esse peso ao email BP ou aos princípios API.
3. **Números publicados corretamente classificados.** Os pesos 6, −4, −3, +12 e −7 são julgamentos publicados. O CSV distingue essa origem; a soma de 4 dB e suas transformações não são apresentadas como frequências observadas.
4. **Contexto e réplica explícitos.** A representação sequencial é sustentada pelo suplemento B.1. O prefixo C=(E0,E1,E2) evita interpretar os 12 dB como uma condicional incondicionada ao contexto. O auxiliar de independência da nova emissão dado H,C,t está declarado como adição do presente trabalho. E3 já entrou em D; não se alega holdout.
5. **Documentos adicionais.** BP informa incentivo defensivo e projeções de custo, não probabilidades de escolha. API admite preempção ou interoperabilidade e complementos, não substituição irrestrita de toda regulação. O relatório é fiel a essas distinções.
6. **Limite diagnóstico.** T(Y)=Y é uma discrepância unilateral para um evento binário composto. A granularidade histórica e a escolha retrospectiva podem produzir raridade sem inadequação causal. O relatório reconhece isso e não interpreta o envelope como validação ou rejeição dos mecanismos.

## Verificação matemática independente

Recalculei diretamente em JavaScript, sem importar resultados R:

| Quantidade | Resultado |
|---|---:|
| BF E3, r=10^(12/10) | 15,848931924611133 |
| Posterior de SA, w=10^0,4/(1+10^0,4) | 0,7152527510491986 |
| Máximo de P(E3\|CA,C), 1/r | 0,06309573444801933 |
| Máximo do PPC, w+(1−w)/r | 0,7332190878538024 |
| Âncora SA na fronteira ilustrativa de 5% | 0,06819244183393323 |

A família `(a,b)=(rt,t)`, com `0<t≤1/r`, normaliza pelas probabilidades dos complementos. Para cada especificação fixa, a escala cancela no Bayes factor observado. Manter os outros likelihood ratios condicionais preserva a posterior publicada. Não há prior sobre t implícito nessa variação entre modelos.

O cálculo `q=wa+(1−w)b` é a soma das probabilidades dos dois estados conjuntos `(H=SA,Y=1)` e `(H=CA,Y=1)`. O envelope aberto em zero, fechado no máximo, está correto. Zero é somente limite: não permite condicionar na evidência observada dentro de uma especificação que lhe atribua probabilidade exatamente nula.

Também conferi a inversão pelo BF do complemento: `b=(1−r0)/(r−r0)`, `a=rb`. Para r>1 e evento observado possível, `0≤r0<1`. Não assumir `r0=1/r`; isso imporia uma simetria adicional. Se ambos os BFs forem 1, a escala não é identificada, corretamente tratada pelo código como não disponível.

## Verificação independente dos outputs

Executei Python em modo de somente leitura: `csv.DictReader` leu os CSVs e operações de ponto flutuante recalcularam as identidades, sem carregar funções do script R. A posterior foi reconstruída por atualizações sucessivas das probabilidades, usando os quatro BFs de evidência, em vez de copiar a fórmula final da implementação.

Em cada uma das 1.002 linhas de `family.csv`, enumerei os quatro estados conjuntos `(SA,1)`, `(SA,0)`, `(CA,1)`, `(CA,0)` e conferi:

- normalização das duas likelihoods e da distribuição conjunta;
- mistura preditiva e seu complemento;
- BF do evento e posterior constante nas 1.001 especificações admissíveis;
- inversão pelo BF do complemento;
- marcação de zero como limite, com posterior e BF do evento `NA` nessa linha;
- correspondência da fronteira, máximo e posterior com `results.csv`;
- cadeia acumulada de decibéis `[6,2,−1,11,4]` e probabilidades em `posterior_chain.csv`.

Saída efetiva: `INDEPENDENT PASS: 1002 rows; 1001 admissible specifications, joint H/Y enumeration, normalization, q, BF, posterior chain, inverse complement and frontier.` A maior diferença absoluta no PPC entre cálculo independente e CSV foi `1,0547118733938987e−15`.

O código R fornece `drawrep()` sem a executar e registra a curva como espaço de especificações. A ausência de Monte Carlo não deixa o PPC incompleto numericamente: a enumeração binária calcula a distribuição preditiva exata para cada especificação. O que falta é fundamento para escolher uma escala absoluta, não mais simulações.

## Sugestões e adjudicação

As duas sugestões de exposição encaminhadas à coordenação foram atendidas: especificar os componentes do E3 e substituir o título isolado “exemplo completo” por “Exemplo E3: da fonte à família de PPCs”. Não encontrei defeito matemático ou de implementação confirmado na versão revista.

- **CONFIRMED:** fidelidade dos pesos e da álgebra; implementação do envelope e do limiar; insuficiência de um BF único para identificar as probabilidades absolutas.
- **PARTIAL:** interpretação como PPC do BPT é válida para o subgerador condicional explicitado, não para uma validação completa do mecanismo nem para o conjunto inteiro de evidências.
- **REFUTED:** alegação de que estas fontes já forneceram probabilidades absolutas estimadas ou um diagnóstico causal empiricamente validado. O relatório atual não faz essa alegação.
- **UNRESOLVED:** âncora empírica ou elicitação humana que feche as likelihoods, granularidade substantivamente adequada de uma nova aplicação e validação preditiva externa.

Essas limitações não se corrigem atribuindo uma escala conveniente ou chamando concordância entre agentes de elicitação empírica. O resultado entregue é uma demonstração auditável da informação que falta e de como ela alteraria o PPC.

## SHA-256 da versão auditada

| Arquivo | SHA-256 |
|---|---|
| proposta.md | `9b7419e7c9434dabefeaaa4b0e0729b46a167255ead86e6ac38a314606b283f2` |
| causal_ppc.R | `daf6c99e212754702ccfe8525a5eb1f0b132c510446ca62b33d5ac9716784854` |
| data/published_weights.csv | `721af49e3a1467de9ffc2e95724ca2c07c954b326c6b24d3e24a299f6eda0d5f` |
| data/source_ledger.csv | `8de64fa44b714c823c16775b8dee17f5e0ec2cdce26ff1f024bfea14e5ec8336` |
| results/results.csv | `4d9dd087be4d4d2862e7448091bb58acc41775a87ff33412eb90fd1f3e67baea` |
| results/family.csv | `756423e2813bdcbb71ef7fdf7320a178620c0b61729e71685e8960a65af4a3c7` |
| results/frontier.csv | `a99f323a15ca89c5c7e90f06111e303b99fdc183fa5209be3e082f92a73f7c9d` |
| results/posterior_chain.csv | `37dd361c8d403a92cd2a50cfe0a2c949f253264edf3f882a9adcd0403a1a5abc` |
