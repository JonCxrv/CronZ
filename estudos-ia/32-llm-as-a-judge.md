# LLM-as-a-Judge

## O que e

LLM-as-a-judge e usar um modelo de linguagem para avaliar respostas de outro modelo (ou dele mesmo). Ele substitui ou complementa avaliadores humanos em tarefas onde nao existe uma resposta exata para comparar, como qualidade de um resumo ou tom de um atendimento.


## Como funciona

O juiz recebe a pergunta, a resposta e um criterio claro (uma rubrica), e devolve uma nota ou um veredito, de preferencia com justificativa. Pode avaliar uma resposta isolada ou comparar duas e dizer qual e melhor. Os cuidados sao conhecidos: juizes tendem a preferir respostas mais longas, a primeira opcao apresentada e textos do proprio modelo, entao e preciso calibrar com algumas notas humanas.


## Por que esta em alta agora

Avaliar milhares de respostas a mao nao escala, e evals viraram parte do ciclo de desenvolvimento de qualquer produto com IA. LLM-as-a-judge e a forma mais pratica de rodar essas avaliacoes continuamente, e tambem e usado para gerar recompensas no treino de modelos.

