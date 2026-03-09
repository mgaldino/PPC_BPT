# PPP_BPT Project Instructions

## Paper
- **Title**: Mechanism Configurations and Posterior Predictive Checks for Bayesian Process Tracing
- **Framing**: Constructive extension of FC (2022), NOT critique. FC's Eq. 3.11 (scenarios within worlds) provides the mathematical foundation; we operationalize it via mechanism links + PPC.
- **Key constraint**: Never describe FC's framework as lacking internal structure. FC have Eq. 3.11, atomization (Ch. 6), fn. 51/52. The gap is practice (implicit scenarios), not theory.
- **"Monolithic"**: Always qualify — "in practice," "effectively," "as applied." Never as a descriptor of FC's framework in principle.

## Regras de trabalho
- **O autor escreve o paper.** Nao redigir secoes ou texto do paper a menos que o autor peca explicitamente.
- **O agente que implementa NAO revisa. Quem revisa NAO implementa.** Usar agentes separados para cada funcao.
- NAO rodar scripts sem aprovacao do usuario
- NAO commitar sem instrucao explicita
- NAO incorrer custos de API externos sem aprovacao explicita previa
- Skills que exigem permissao devem ser rodadas em foreground
- Sempre ler o arquivo antes de propor mudancas

## Estrutura do repositorio
```
PPP_BPT/
  paper_draft_v1.Rmd           # Manuscrito principal
  paper_draft_v1.md/pdf/html   # Versoes compiladas
  supplementary_materials.md   # Material suplementar
  quality_reports/             # Reviews e planos
    plans/
  references/                  # PDFs de papers citados
  evidence/                    # Evidencias dos estudos de caso (Chile, Oil Majors)
  drafts/                      # Rascunhos de secoes e lit reviews
  notes/                       # Notas de trabalho, entrevistas, reflexoes
```

## CLI Tools for Cross-Model Elicitation
- **Gemini CLI**: `/opt/homebrew/bin/gemini` — headless mode with `-p`. Example: `cat prompt.txt | gemini -p - --sandbox false`
- **Codex CLI**: `/opt/homebrew/bin/codex` — headless mode with `exec`. Example: `cat prompt.txt | codex exec --skip-git-repo-check -o output.txt -`
- Both installed via homebrew. No API keys needed — they use their own auth.
- Always ask the model to report its exact model ID in the prompt for reproducibility.
