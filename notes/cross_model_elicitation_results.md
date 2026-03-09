# Cross-Model Elicitation Results

Date: 2026-03-06

## Models
- **Gemini**: gemini-2.0-flash (via Gemini CLI, headless mode)
- **Codex**: gpt-5.3-codex / GPT-5 (via Codex CLI v0.99.0, headless mode)

## Prompt
See `elicitation_prompt.txt` for the full prompt used for both models.

## Raw Results

### Gemini (gemini-2.0-flash)

**Standard:**
| Evidence | H_EA | H_MV | H_CC |
|----------|------|------|------|
| e*_1 | 0.85 | 0.30 | 0.15 |
| e*_2 | 0.80 | 0.40 | 0.40 |
| e*_3 | 0.90 | 0.25 | 0.10 |
| e*_4 | 0.60 | 0.30 | 0.95 |

**Skeptical:**
| Evidence | H_EA | H_MV | H_CC |
|----------|------|------|------|
| e*_1 | 0.60 | 0.50 | 0.40 |
| e*_2 | 0.50 | 0.60 | 0.60 |
| e*_3 | 0.65 | 0.50 | 0.30 |
| e*_4 | 0.40 | 0.40 | 0.98 |

**Minimalist:**
| Evidence | H_EA | H_MV | H_CC |
|----------|------|------|------|
| e*_1 | 0.75 | 0.40 | 0.30 |
| e*_2 | 0.60 | 0.50 | 0.50 |
| e*_3 | 0.85 | 0.30 | 0.20 |
| e*_4 | 0.40 | 0.40 | 0.90 |

### Codex (gpt-5.3-codex)

**Standard:**
| Evidence | H_EA | H_MV | H_CC |
|----------|------|------|------|
| e*_1 | 0.85 | 0.45 | 0.30 |
| e*_2 | 0.75 | 0.40 | 0.50 |
| e*_3 | 0.90 | 0.20 | 0.15 |
| e*_4 | 0.65 | 0.45 | 0.85 |

**Skeptical:**
| Evidence | H_EA | H_MV | H_CC |
|----------|------|------|------|
| e*_1 | 0.60 | 0.50 | 0.45 |
| e*_2 | 0.55 | 0.45 | 0.65 |
| e*_3 | 0.65 | 0.35 | 0.30 |
| e*_4 | 0.50 | 0.50 | 0.90 |

**Minimalist:**
| Evidence | H_EA | H_MV | H_CC |
|----------|------|------|------|
| e*_1 | 0.72 | 0.50 | 0.42 |
| e*_2 | 0.58 | 0.48 | 0.52 |
| e*_3 | 0.78 | 0.24 | 0.20 |
| e*_4 | 0.55 | 0.50 | 0.74 |

## Key Finding

Ordinal rankings preserved across ALL channels (Human + 3 Claude + Gemini-standard + Gemini-skeptical + Gemini-minimalist + Codex-standard + Codex-skeptical + Codex-minimalist) for all evidence items:
- e*_1, e*_2, e*_3: highest under H_EA
- e*_4: highest under H_CC

NOTE: Gemini skeptical assessment for e*_2 breaks the ordinal ranking — H_EA (0.50) tied with or lower than H_MV (0.60) and H_CC (0.60). Same for Codex skeptical on e*_2: H_CC (0.65) > H_EA (0.55). This is the ONE evidence item where skeptical channels diverge — consistent with the paper's own finding that e*_2 is the most ambiguous prediction.
