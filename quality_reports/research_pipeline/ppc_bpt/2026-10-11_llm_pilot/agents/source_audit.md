# Auditoria independente da codificação observada

Data: 2026-10-11. Escopo: leitura das fontes indicadas, sem acesso a saídas de LLM ou ao script analítico.

**Veredito: CONFIRMADO COM DELIMITAÇÕES.** A redução de E3 para `(Q,A)=(1,1)` e `K=desconhecido` é defensável. Ela representa parte da evidência relatada por Fairfield e Charman (2025, pp. 12–13), sem validar uma reconstrução causal ou o peso inferencial atribuído ao conjunto original.

| Variável | Código | Fundamentação e limite |
|---|---:|---|
| Q: proposta em âmbito federal oferece substituir regulações de carbono | 1 | E3 descreve um imposto americano de carbono, inicialmente de US$ 40 por tonelada, que substituiria as regulações federais de fontes estacionárias de carbono. “Federal” qualifica o âmbito da política. A fonte descreve uma coalizão apoiada por republicanos, sem estabelecer que fosse uma proposta apresentada pelo governo federal. Também não sustenta a substituição de qualquer regulação ambiental, em qualquer esfera. |
| A: coalizão das quatro empresas adere | 1 | E3 identifica Exxon, ConocoPhillips, Shell e BP na criação do Climate Leadership Council, promotor desse imposto. Isso documenta participação e apoio político à proposta. Não documenta aprovação legislativa, implementação, nem dispêndio idêntico das quatro empresas. As contribuições monetárias informadas são de Exxon e ConocoPhillips. |
| K: antecipação de ganho competitivo líquido decisivo para a adesão | desconhecido | E3 não observa diretamente o cálculo líquido e o motivo decisivo de cada empresa ou da coalizão. A possibilidade de benefícios superiores aos custos integra o raciocínio dos autores sob CA. O mesmo trecho questiona a força desses incentivos e assinala informação incompleta sobre ConocoPhillips. Portanto, não autoriza nem K=1 nem K=0. |

Âncoras: `../2026-10-10_causal_likelihoods/sources/fairfield_charman_2025.txt`, linhas 696–724 e 733–747.

As hipóteses originais precisam ser preservadas. SA atribui o apoio prioritariamente às ameaças regulatórias e à prevenção de políticas mais custosas. Os autores a caracterizam como aceitação de custos econômicos líquidos menores que os das alternativas salientes. CA atribui o apoio prioritariamente às vantagens competitivas percebidas e às oportunidades de mercado, com benefícios econômicos líquidos no contexto presente ou antecipado (p. 9, linhas 485–501). As formulações são probabilísticas. SA não se reduz à presença de Q; CA não exige ausência de Q. Os autores consideram compensações regulatórias plausíveis também sob CA, embora menos centrais para o apoio (p. 13, linhas 739–747). K desconhecido não pode ser transformado em ausência de vantagem nem em confirmação de SA.

O par observado é um **coarsening de E3**, não E3 integral. Ele omite o valor inicial do imposto, a isenção de responsabilidade por emissões históricas, o contexto republicano, os valores e a identidade dos financiadores, a diferença entre empresas e sua relação com a trajetória produtiva e as ameaças registradas em E0. A fonte atribui aproximadamente 12 dB ao conjunto E3, com esse contexto. Esse peso não pode ser transferido automaticamente para `(Q,A)` ou considerado uma calibração validada do piloto. As quatro empresas tampouco constituem quatro replicações independentes da mesma observação.

O e-mail BP de 27/01/2017, p. 1, linhas 49–54, documenta interesse em evitar regras futuras sobre refinarias e uma redução temporária desse benefício sob Trump. Ele reforça a plausibilidade do mecanismo regulatório para BP, mas não mede K nem estabelece o motivo das quatro empresas. Os princípios API de 2021, p. 1, linhas 15–18, permitem tanto preempção quanto interoperabilidade para reduzir duplicação regulatória. Sua data, ator e flexibilidade impedem usá-los como observação direta da adesão de 2017 ou como prova de substituição integral.

Conclusão operacional: aceitar a codificação com as definições restritas acima e manter K ausente. Tratar qualquer inferência probabilística posterior como exercício sobre essa representação reduzida, separado da adjudicação empírica de SA versus CA nas fontes.
