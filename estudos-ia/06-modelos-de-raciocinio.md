# Modelos de Raciocinio e Test-Time Compute

## O que e

Modelos de raciocinio (reasoning models) sao LLMs treinados para 'pensar antes de responder': em vez de gerar a resposta final direto, eles produzem uma cadeia de raciocinio intermediaria -- decompondo o problema, testando abordagens, verificando os proprios passos -- antes de chegar a conclusao. Exemplos incluem os modelos da serie 'o' da OpenAI e os modos de 'extended thinking' de modelos como o Claude.


## Como funciona

A ideia central e 'test-time compute' (ou 'inference-time scaling'): em vez de so investir mais poder computacional no treino, deixa-se o proprio modelo usar mais tempo e tokens durante a inferencia para raciocinar sobre um problema dificil, parecido com uma pessoa que para para pensar antes de responder algo complexo. Esses modelos costumam ser treinados com reinforcement learning sobre a qualidade do processo de raciocinio, nao so da resposta final.

