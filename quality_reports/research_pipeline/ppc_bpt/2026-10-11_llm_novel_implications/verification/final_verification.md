# Verificação final

O PDF final tem 9 páginas. Todas foram renderizadas e inspecionadas em `rendered_final`, verificando tabelas, equações, figura, acentos e legibilidade. A compilação final não apresenta avisos. Os limites geométricos do texto foram conferidos com pdfplumber. O hash do PDF inspecionado está em `pdf_qa.json`.

A auditoria matemática independente recompôs 18.000 PPCs, com divergências inferiores a 1e-11. A auditoria cega de 35 pares coincidiu em 105 campos; os três casos inferidos apenas pelo desenho não fazem parte dessa amostra. A referência textual teve 108 campos corretos em 36 pares. L e C+ coincidiram nos 128 estados. O kernel empírico, apesar dessa recuperação correta, não apresentou calibração adequada.

As 40 chamadas concluíram sem chamadas de ferramentas internas. O gerador usou o mesmo texto-base em descoberta e confirmação, sem receber os checks. Os congelamentos e alterações de análise foram preservados. O oráculo e os arquivos originais do manuscrito mantiveram seus hashes.

O pacote distingue execução, verificações matemáticas, julgamento de novidade, adaptação de mensuração e validade histórica. PASS estrutural não constitui validação científica do caso real.
