# PPP_BPT Project Instructions

## Key Rule
- **O autor escreve o paper.** Nao redigir secoes ou texto do paper a menos que o autor peca explicitamente.

## CLI Tools for Cross-Model Elicitation
- **Gemini CLI**: `/opt/homebrew/bin/gemini` — headless mode with `-p`. Example: `cat prompt.txt | gemini -p - --sandbox false`
- **Codex CLI**: `/opt/homebrew/bin/codex` — headless mode with `exec`. Example: `cat prompt.txt | codex exec --skip-git-repo-check -o output.txt -`
- Both installed via homebrew. No API keys needed — they use their own auth.
- Always ask the model to report its exact model ID in the prompt for reproducibility.
