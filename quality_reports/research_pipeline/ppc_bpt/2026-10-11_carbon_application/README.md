# Aplicação completa: PPC qualitativo no caso do carbono

Data: 11/10/2026. Relatório principal: [PDF](../../../../output/pdf/aplicacao_carbono_ppc_2026-10-11.pdf). Fonte: [report.md](report.md).

## Resultado e escopo

A aplicação principal examina a motivação do apoio da ExxonMobil ao imposto federal sobre carbono na primavera de 2021. São três fontes reais: apoio público em março, entrevista de Keith McCoy em maio publicada em junho e resposta oficial de Darren Woods em julho. O padrão codificado é relato que liga utilidade instrumental do apoio e inviabilidade esperada, seguido de desautorização oficial e reafirmação do apoio.

Os números centrais são julgamentos desta aplicação, propostos pelos agentes de análise e adotados pelo coordenador depois da leitura dos documentos. A tabela de julgamentos identifica autor, argumento, compromisso numérico e alternativas. Não houve elicitação com especialistas humanos. O relatório define o papel das fontes e o julgamento adicional em cada etapa.

| Quantidade | Resultado central |
| :-- | --: |
| Posterior SA na comparação restrita SA/CA | 60,00% |
| PPC do relato na comparação restrita | 13,00% |
| Posterior SA com hipótese reputacional HR | 26,09% |
| Posterior CA com HR | 17,39% |
| Posterior HR | 56,52% |
| PPC do relato com HR | 42,39% |

Mantidas as demais escolhas, HR recebe maioria somente se a probabilidade média do relato sob SA/CA for menor que 16,25%. Essa fronteira, a sensibilidade ao prior e o peso da resposta corporativa delimitam a conclusão. A melhora do PPC é retrospectiva, com o episódio usado também na revisão.

A reprodução do conjunto setorial original de Fairfield e Charman mantém sua posterior de SA em 71,53%. Ela aparece separadamente da inferência local de 2021. O PPC dos quatro pacotes originais acrescenta âncoras absolutas e independência condicional, explicitadas no relatório e em `data/model_spec.json`.

## Arquivos para conferir e modificar

- `sources/`: bytes HTML/PDF, extrações textuais e manifesto das fontes. As três fontes de 2021 foram acessadas em 11/10/2026. Os PDFs de FC e os documentos auxiliares foram copiados das fontes preservadas na investigação anterior.
- `data/evidence_codebook.json`: definições dos códigos, unidade, datas, URLs, localizadores e alternativa de mensuração inconclusiva.
- `data/judgment_ledger.csv`: todos os julgamentos adicionais, autoria e argumentos.
- `data/model_spec.json`: valores usados na aplicação, conjuntos de sensibilidade e hipóteses adicionais do anexo FC.
- `data/published_weights.csv`: pesos publicados usados na reconstrução, copiados sem alteração de bytes do pacote anterior.
- `scripts/exact_bayes.R`: atualização e previsão por enumeração finita.
- `scripts/analyze_application.R`: aplicação, sensibilidade e anexo FC.
- `results/`: contas intermediárias, distribuições completas, resultados e figuras.
- `agents/`: parecer de desenho, revisão das fontes, implementação independente da auditoria matemática e revisão do relatório.
- `verification/`: conferência final dos arquivos, adjudicação após as correções e páginas renderizadas do PDF.

Os PDFs brutos podem ser omitidos por `rg --files` devido às regras de exclusão do repositório. Eles estão fisicamente presentes em `sources/` e são conferidos pelo manifesto.

## Reprodução

Requisitos: R com `jsonlite`, Python 3, Pandoc e XeLaTeX. A execução original usou R 4.4.2. A análise não depende de chamadas a modelos de linguagem, acesso à internet ou sorteios de Monte Carlo. A fonte `Times New Roman` é usada para o PDF e pode ser substituída em `report_template.md` em outro ambiente.

Execute os comandos seguintes **dentro desta pasta**:

```sh
Rscript scripts/reproduce_published.R .
Rscript scripts/analyze_application.R .
Rscript scripts/plot_application.R .
Rscript agents/independent_audit.R .
python3 scripts/build_report.py
pandoc report.md --resource-path=. --pdf-engine=xelatex -o aplicacao_carbono_ppc.pdf
```

A análise enumera exatamente os três estados do episódio local, todas as 16 combinações do anexo FC para cada âncora e 14.400 especificações de sensibilidade. A grade representa escolhas alternativas fixas. Não se interpreta a proporção de suas linhas como probabilidade de uma conclusão.

Para avaliar novos julgamentos, copie o pacote e altere `data/model_spec.json`. Os scripts R geram os novos resultados. Antes de emitir um novo relatório, revise os argumentos de `report_template.md` e a trava de parâmetros centrais em `scripts/build_report.py`, pois a prosa contém as interpretações e exemplos numéricos da especificação original. O formatador interrompe a emissão se detectar parâmetros centrais diferentes.

O arquivo `results/sessionInfo.txt` registra a última sessão de um script de cálculo que o regravou. Após o ajuste do caminho dos pesos publicados, ele corresponde à execução isolada de `reproduce_published.R`. `jsonlite` é necessário para a análise principal e a auditoria.

Os arquivos arquivados já bastam para reproduzir os resultados. `scripts/archive_sources.py` documenta a coleta executada e a origem das cópias. Sua função é preservar/reconstituir o acervo, e não atualizar o corpus para uma nova data de pesquisa.

## Verificações e limites de uso

A auditoria numérica foi feita por um agente distinto do implementador. Seu script usa fórmulas independentes e conferiu 246.087 valores em 115 verificações, com erro máximo de 4,97 × 10⁻¹⁴. A revisão das fontes conferiu as transcrições da publicação originadora e as manifestações oficiais. O vídeo integral não foi codificado separadamente.

O coordenador conferiu as páginas do PDF renderizado e corrigiu a largura das tabelas e o escape das porcentagens nas equações. A correção de proveniência de C acrescentou F2 a F1, sem mudar códigos ou probabilidades. O manuscrito e seu suplemento permaneceram intactos.

O resultado científico é uma inferência condicional aos julgamentos registrados. A fonte permite verificar o relato, o contexto e a reação. A representatividade corporativa e a intensidade das likelihoods são submetidas à sensibilidade. A especificação central oferece uma preferência modesta por HR, que perde a maioria em alternativas explicitamente calculadas.
