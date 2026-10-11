# Emenda operacional anterior à primeira geração válida

11/10/2026 03:33 UTC. O CLI autenticado com ChatGPT recusou gpt-6-sol em todas as 17 chamadas antes de gerar respostas; não houve tokens de saída ou dados de mundos. O teste com configuração padrão funcionou e identificou gpt-5.6-sol no cabeçalho do CLI. O experimento passa a solicitar explicitamente gpt-5.6-sol, esforço low, em todos os braços LLM e na codificação. Não há snapshot imutável exposto. Essa é uma alteração de disponibilidade operacional, não escolha em função de resultados.

As primeiras chamadas, prompts e logs foram movidos intactos para failed_model_attempt/. Nenhuma geração inválida foi removida seletivamente. Desenho probabilístico, tamanho, métricas, controles e discrepância permanecem congelados. Hash SHA256 do design.md original: a366a878a45c769807a8c9b37e0141d9eb1ad528eb89d4fb710da14f3ffdffef.
