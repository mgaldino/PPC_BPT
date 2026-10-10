# Participante 09: avaliação adversarial do benefício operacional

A contribuição publicável seria mostrar que um procedimento produz previsões documentais melhores, ou diagnósticos mais úteis com custo justificável, do que uma alternativa competente. A decomposição de uma distribuição já fixada não demonstra isso: distribuições equivalentes produzem previsões equivalentes. Recomendo manter petróleo como aplicação provisória, mas comparar procedimentos humanos de construção das probabilidades antes de afirmar que estas ficaram calibradas. Este documento propõe desenho; não relata experimento executado.

## Objeto e material

A pergunta é: com a mesma informação documental disponível, o procedimento estruturado com decomposição melhora a previsão de respostas codificadas em material reservado? O alvo não será “a empresa realmente desejava aprovar o imposto”. Será, por exemplo: “o conjunto reservado registra apoio explícito ao preço de carbono condicionado à substituição de outra regulação?”. Categorias iniciais: condicionamento registrado; apoio sem condicionamento expresso; posição contrária; nenhuma posição recuperada; registro contraditório/inconclusivo. Um manual resolve sobreposições antes da coleta. Ausência de registro não identifica ausência histórica.

Um curador monta o inventário por empresa, episódio e família documental; dois codificadores, separados dos participantes, resolvem os alvos sem conhecer previsões. Todo documento já usado no manuscrito, suplemento ou desenvolvimento fica registrado como exposição. McCoy, API e cortes de renováveis não se tornam reserva por receberem novas perguntas. O curador registra quais perguntas derivaram de seu conhecimento do material e, preferencialmente, aplica perguntas fixadas a todas as oportunidades elegíveis. Separação entre funções reduz contaminação, mas não transforma seleção retrospectiva em prospectiva.

O pacote D será idêntico entre braços, com narrativas concorrentes, cronologia, documentação e limitações. Todos preverão os mesmos alvos, com o mesmo manual de codificação. O conjunto de alvos deve incluir implicações que possam contrariar ambas as narrativas; escolher somente itens discriminantes favorece comparação relativa sem checar adequação. Não pressuponho que exista reserva suficiente: seu inventário ainda precisa ser demonstrado.

## Comparação executável

Proponho três braços, com participantes sorteados dentro de estratos de experiência temática e probabilística:

1. **Previsão direta:** atribuição de probabilidades às categorias, justificativa documental e revisão livre.
2. **Elicitação estruturada direta:** treinamento sobre probabilidades, consideração de razões contrárias, revisão individual e registro de incerteza, sem exigir decomposição.
3. **Elicitação estruturada com decomposição:** mesmo treinamento e revisão, acrescentando cenários/elos, suas probabilidades condicionais e agregação explícita.

O contraste 3–1 avalia o pacote; 3–2 investiga o acréscimo da decomposição; 2–1 separa parte do efeito do protocolo. O braço direto terá calculadora, categorias completas e tempo de revisão: precisa representar uma alternativa séria. Nenhum braço recebe fontes substantivas extras. Instruções e exemplos devem ser auditados para evitar introduzir premissas favoráveis apenas ao terceiro.

Como planejamento, um piloto pode ter 18–24 participantes, seis a oito por braço, uma sessão de três horas incluindo treinamento e 8–12 oportunidades. Esses números testam viabilidade; não demonstram poder estatístico. O orçamento total por pessoa é igual e inclui aprendizagem do método. Quem termina a elicitação cedo pode revisar no tempo restante. A assistência técnica segue roteiro padronizado, com minutos registrados. Custo de preparar instrumentos e curadoria será contabilizado separadamente.

Não recomendo pedir ao mesmo humano duas previsões sucessivas para o mesmo item como comparação principal. A primeira ancora a segunda; conhecer a decomposição altera futuras previsões diretas. Contrabalançar a ordem não apaga aprendizagem, e uma discussão conjunta torna os julgamentos relacionados. Um exercício pareado desses serve para estudar mudanças de raciocínio e usabilidade. A avaliação principal terá braços paralelos, sessões individuais e nenhuma discussão cruzada antes do congelamento. “Mesmos humanos” significa população elegível e recursos humanos comparáveis, não observar duas versões independentes da mesma pessoa.

## Avaliação e dependência

O resultado primário será a perda de Brier multicategórica, calculada nos mesmos alvos e agregada com pesos previamente fixados por família/episódio; menor perda indica melhor previsão. Regras próprias de pontuação sustentam comparações desse tipo, mas um score realizado não certifica calibração ([Gneiting e Raftery, 2007](https://sites.stat.washington.edu/people/raftery/Research/PDF/Gneiting2007jasa.pdf)). Registrar também itens concluídos, tempo, probabilidades sem justificativa rastreável e discordância de codificação. Prever uma regra comum de preenchimento para itens não concluídos, evitando avaliar apenas os mais fáceis.

A unidade de randomização é o participante; sua perda agregada é o resultado experimental. A inferência por randomização respeitará estratos e atribuições efetivas. Muitas previsões da mesma pessoa sobre poucos episódios não equivalem a muitas replicações históricas. A comparação pode identificar o efeito do protocolo sobre esses participantes nesse corpus fixo; transportar o resultado a outros episódios exige nova evidência. Sensibilidade retirando uma família documental mostra concentração do resultado, mas não cria independência. Com poucas famílias, relatar incerteza e distribuição dos contrastes; não apoiar conclusões em erros-padrão assintóticos por documento.

Uma avaliação posterior, distinta do piloto, exige instrumentos congelados, novos participantes e alvos ainda reservados. Seu tamanho será definido por precisão desejada e menor ganho considerado útil antes da coleta; o piloto informará dispersão e custo, sem converter um efeito inicial favorável em justificativa automática. Um estudo pequeno inconclusivo não demonstra equivalência.

## Claims, objeções e interrupção

Objeção primeira: melhores marginais podem esconder condicionais erradas. Concordo. Pontuar p(Y|D) não calibra p(Y|H) quando H e intenções privadas não têm classificação independente. Probabilidades condicionais permanecerão julgamentos auditáveis; nenhum número de previsões sobre textos substitui mundos repetidos com H conhecido. Diagnósticos de elos precisam de evidência adicional ou de exercícios artificiais explicitamente separados da aplicação histórica.

Objeção segunda: a decomposição consome tempo e multiplica números arbitrários. Isso é um resultado possível, não inconveniente a corrigir após observar os scores. Se o terceiro braço não melhorar previsão, pode ainda aumentar rastreabilidade; esse benefício deve ser medido por avaliadores independentes reconstruindo o cálculo, não por satisfação dos autores. Melhor explicação gráfica tampouco prova localização causal correta.

Não usar o procedimento para claims fortes se faltar reserva auditável, se categorias dependerem de inferir intenção verdadeira, se dependências inviabilizarem o alvo conjunto, ou se probabilidades condicionais precisarem ser inventadas para completar tabelas. Preferir previsão direta quando o custo adicional superar o benefício considerado relevante. Chile pode oferecer um piloto documental mais delimitado, mas um único processo legislativo dificilmente resolve escassez de replicações e de evidência privada. Faltam inventário elegível, orçamento, recrutamento e limiar substantivo de benefício. O produto será protocolo, instrumentos, registros de exposição e dados derivados reproduzíveis, coerentemente com as [diretrizes da Political Analysis](https://www.cambridge.org/core/services/aop-file-manager/file/678f5f7189ee789cdb3a1df2/replication-guidelines-2025-v1.pdf).

Fontes externas abertas em 10/10/2026: os dois PDFs metodológicos acima; não abri novos documentos substantivos do petróleo. Li CLAUDE.md, contrato, proposta anterior, passagens relevantes do manuscrito e suplemento; não li propostas dos demais participantes antes de salvar esta versão.
