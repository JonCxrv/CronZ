# RLHF, DPO e Alinhamento

## O que e

RLHF (Reinforcement Learning from Human Feedback) e a tecnica que transformou modelos que so completavam texto em assistentes uteis: o modelo aprende com avaliacoes humanas sobre quais respostas sao melhores. DPO (Direct Preference Optimization) e uma alternativa mais simples que chega a um resultado parecido. Ambas fazem parte do que se chama alinhamento.


## Como funciona

No RLHF, pessoas comparam pares de respostas; com isso se treina um modelo de recompensa, que depois guia o LLM via reinforcement learning. O DPO pula o modelo de recompensa e ajusta o LLM diretamente a partir das preferencias. Variacoes usam feedback de outra IA (RLAIF) ou um conjunto de principios escritos, como na Constitutional AI da Anthropic.

