# Proveniência e escolhas de codificação

Acesso e conferência pelo coordenador em 10/10/2026. Um subagente localizou as fontes; o coordenador abriu e conferiu os trechos listados. O exemplo é retrospectivo e foi escolhido depois de conhecer o padrão regional. Não é um holdout ou uma nova descoberta histórica.

## Coorte de oito empresas

Fonte: Vormedal, Gulbrandsen e Skjærseth (2020), Big Oil and Climate Regulation: Business as Usual or a Changing Business?, DOI 10.1162/glep_a_00565. Cópia disponibilizada pela autora:
https://www.researchgate.net/publication/344002092_Big_Oil_and_Climate_Regulation_Business_as_Usual_or_a_Changing_Business

Conferidos: introdução e seção Data and Methodology, que identificam oito empresas. A classificação Europa/EUA segue a distinção do próprio artigo; Europa inclui Reino Unido e Noruega, não significa União Europeia. A seção Support for Carbon Pricing identifica Equinor como então Statoil.

## Lista de signatárias

Fonte primária: carta a Christiana Figueres e Laurent Fabius, datada de 29/05/2015, p. 3, lista integral de signatárias:
https://totalenergies.com/sites/g/files/nytnzq111/files/atoms/files/letter_to_christiana_figueres.pdf

Anúncio da iniciativa em 01/06/2015, corroborando lista e data de divulgação:
https://totalenergies.com/newsroom/oil-and-gas-majors-call-carbon-pricing/?lang=eng

Transcrição dos nomes empresariais para CSV normaliza sufixos jurídicos e Royal Dutch Shell→Shell; Statoil é ligado a Equinor pelo campo company_2015. BG consta na lista mas não na coorte do artigo. Não é silenciosamente perdida: o script imprime e salva sua exclusão por escopo.

Carta integral preservada em `sources/letter_to_christiana_figueres_2015.pdf`, acompanhada do texto extraído por `pdftotext -layout`. O PDF foi baixado da URL primária em 10/10/2026 e sua página de assinaturas foi conferida contra o CSV. A carta antecede o Acordo de Paris; este exercício não replica automaticamente a análise pós-Paris do artigo.

## Regra

Uma linha por empresa da coorte × esta carta. signed=1 se o nome correspondente consta da lista completa; signed=0 se não consta. Não presença na lista NÃO é oposição ao carbon pricing, ausência de lobbying, recusa de convite nem ausência do mecanismo. As oportunidades de convite/adesão não foram verificadas e não serão presumidas empiricamente iguais.

São oito entradas em UM episódio coordenado. Independência condicional e propensão comum pertencem ao modelo M0 a ser checado. O prior Beta(1,1), o uso de um modelo por regiões como revisão ilustrativa e a escolha da discrepância são decisões do analista. Nenhuma probabilidade de motivo privado foi elicitada.

O pedido atual de exemplo numérico completo autoriza os cálculos ilustrativos correspondentes. O script R permanece separado do documento; nenhuma seção do manuscrito foi alterada.
