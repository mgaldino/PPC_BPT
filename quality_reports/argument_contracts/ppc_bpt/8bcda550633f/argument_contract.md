# Argument contract: PPC em BPT

## 1. Source-bound identity

Contract ID: `ppc_bpt:8bcda550633f:round1`.

Fonte canônica: `paper_draft_v1.Rmd`. SHA-256: `8bcda550633f3d55369a9c4b26d8732d2da73ecb086c506c8d6e53634939446f`.

Suplemento: `supplementary_materials.md`; SHA-256: `8a6e700c259d8a65117bef025d05ff623740c9229c01c0c6146971aec3dda84a`.

## 2. Document profile

Perfil `general`: contribuição metodológica, em inglês, com duas ilustrações históricas. Rmd de 541 linhas e aproximadamente 8.092 palavras contando marcação; PDF preexistente de 33 páginas não tomado como versão sincronizada. Seis seções principais e suplemento de proveniência cobertos por leitores separados. Ver `section_map.md` e os sete registros integrais em `section_reads/`.

## 3. Thesis, question, and contribution

Pergunta: como diagnosticar a plausibilidade da especificação de evidências no BPT, localizando problemas em componentes dos mecanismos?

Tese: explicitar cenários internos como elos e configurações operacionaliza a estrutura já disponível em Fairfield e Charman, permite previsões integradas e diagnósticos mais granulares que o contraste agregado entre hipóteses.

Contribuição reivindicada: decomposição de mecanismos, distribuição preditiva em dois níveis, workflow de evidência reservada e protocolos de elicitação que reduzam circularidade. O contrato registra essas reivindicações; não as valida.

## 4. Core claims

- **C01:** FC já contêm cenários internos e atomização; a lacuna central é operacional (38–42, 64–68, 105).
- **C02:** configurações são vetores binários completos de estados; hipóteses podem compartilhar elos e ser mutuamente exclusivas como configurações (105–117).
- **C03:** o texto também integra sobre estados ativos incertos dentro de configurações e depois faz média entre elas (129, 180–188). Não explicita a compatibilização com C02. Essa coexistência documental é parte do contrato, não um modelo reconciliado atribuído ao autor.
- **C04:** PPC é apresentado como diagnóstico de coerência/adequação e estímulo à revisão, com avaliação qualitativa sem limiar formal (194–213). Nenhum algoritmo geral de geração de corpus ou de `y_rep` é fornecido.
- **C05:** previsões devem anteceder a inspeção de holdout; circularidade é reduzida por protocolos e credibilidade graduada, não eliminada (205–240).
- **C06:** Chile sustenta a sequência reativa de equidade e sugere baixo interesse empresarial como codeterminante; o composto é diagnóstico qualitativo, sem posterior ou comparação formal estimada (319–346).
- **C07:** petróleo sugere problemas em likelihoods originais e heterogeneidade empresarial; o corpo contém “likely miscalibrated”, enquanto abertura e síntese usam linguagem mais forte (25, 46, 465–480, 511).
- **C08:** elicitação converge nos canais standard apresentados para Chile e diverge no petróleo, sobretudo sobre renováveis (349–391, 485–504). Não há comprovação de independência dos erros.
- **C09:** fontes secundárias, ausência de segundo humano cego, posteriores de elos pontuais e poda sem critério formal são limitações reconhecidas (533).
- **C10:** suplemento lista fontes, páginas ainda não localizadas e arquivos indisponíveis; listas de fontes não equivalem a uma nova coleta de holdout independente (suplemento 14–36, 109–111).

## 5. Claim → evidence → scope map

| Claims | Apoio no documento | Alcance autorizado |
|---|---|---|
| C01 | Eq. 3.11/3.12, atomização, debate bibliográfico | Extensão construtiva de FC, nunca ausência de estrutura teórica em FC |
| C02–C03 | Definições, duas somas e exemplos numéricos | Formulações literais coexistentes; estrutura matemática pretendida não será inventada |
| C04–C05 | Workflow e protocolos | Proposta metodológica; implementação parcial explicitamente reconhecida |
| C06 | Evidências comparativas, deliberações e silêncio empresarial | Sugestão de composição, não identificação de efeito causal geral nem superioridade quantificada |
| C07–C08 | Exemplo McCoy, tabelas e prompts | Diagnóstico afirmado pelo paper com divergência e gradações textuais; não calibração empiricamente estabelecida |
| C09–C10 | Limitações e suplemento | Estado dos dados declarado pelo documento, não disponibilidade atual verificada |

## 6. Profile-specific contract

Não há estimando causal populacional único, tratamento experimental, jogadores ou equilíbrio de jogo. São inaplicáveis os adaptadores empírico e de teoria dos jogos. A especificação preferida do texto é a decomposição com duas somas; sua inconsistência/indefinição não é resolvida por este contrato. Os exemplos de posteriores dos elos são ilustrativos/aproximados e a limitação de propagação da incerteza é reconhecida.

## 7. What the document does not claim

Não prova verdade causal ao passar PPC; não elimina circularidade; não demonstra independência de LLMs; não apresenta coleta primária independente completa; não calcula posterior do composto chileno; não descarta vantagem competitiva em todas as empresas; não mostra critérios formais gerais de poda; não fornece validação em simulações; não precisa ser interpretado como alegação de déficit matemático em FC. A afirmação específica de que os holdouts do petróleo eliminam contaminação de treinamento (487) permanece claim explícito a verificar, apesar dessas não-afirmações mais gerais.

## 8. Terminology

Preservar diferença entre elo, configuração completa, hipótese narrativa e modelo probabilístico. Usos conflitantes do próprio paper devem ser citados, não harmonizados silenciosamente. PPC, BMA, updating, previsão holdout e validação de calibração não são automaticamente sinônimos. `m4` tem conteúdo distinto nas duas aplicações. Posterior de hipótese, posterior de elo e probabilidade preditiva são quantidades diferentes.

## 9. Reconciliation log

1. **FC não tem estrutura?** Resolvido pelo texto expresso de 64–68: tem; a tese governante é operacional. Formulações amplas locais serão avaliadas como redação/alcance, não desconhecimento global.
2. **Configuração fixa ou variável?** O leitor de S03 confirmou em rodada de esclarecimento que ambos os usos estão explicitamente presentes (107 versus 180–188), sem definição que os concilie. Extração resolvida: registrar as duas afirmações e a ausência, deixando toda solução como proposta nova. Não se resolve intenção autoral por inferência.
3. **Composto chileno demonstrado?** S04 não encontrou comparação formal; “better accounts” expressa diagnóstico qualitativo. Apoio a `m'_1` oscila entre ativo, provável e ambíguo; as gradações fazem parte do claim, não se apagam.
4. **Evidência nova?** O texto chama itens de holdout, mas compartilha episódios entre E4/E5 e e*3; não delimita adicionalidade. Registrar a denominação e a sobreposição observável; não assumir independência.
5. **Má calibração estabelecida?** O paper a afirma com forças diferentes e reconhece divergência de elicitação. O contrato registra o claim e seus qualificadores, sem endossar a inferência.
6. **Objeto replicado?** Seções S03/S05 trazem eventos descritos e probabilidades, mas não um gerador geral de `y_rep`. Ausência documental determinada, sem atribuir ao autor um gerador implícito.

## 10. Gate verdict

**PASS documental**, após término das sete leituras e confirmação do hash. JSON validado com `validate_contract.py --artifact paper_draft_v1.Rmd`. O gate distingue resolução do que está escrito de resolução dos problemas científicos: a fidelidade permite discutir alternativas sem pressupor qual era a intenção autoral. A cobertura é restrita ao desenvolvimento de propostas metodológicas e à adjudicação de claims explicitamente localizados. Não autoriza reescrita e não certifica validade ou prontidão editorial.
