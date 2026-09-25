# SLMs (Small Language Models)

## O que e

SLMs sao modelos de linguagem pequenos, geralmente com poucos bilhoes de parametros (ou menos), pensados para rodar rapido e barato -- inclusive direto no celular ou notebook, sem nuvem. Exemplos sao as familias Phi (Microsoft), Gemma (Google) e as versoes menores de Llama e Qwen.


## Como funciona

O segredo esta menos na arquitetura e mais nos dados: SLMs sao treinados com dados muito bem filtrados e com dados sinteticos gerados por modelos maiores, alem de destilacao (o modelo pequeno aprende a imitar um modelo grande). Somando quantizacao, cabem em poucos gigabytes de memoria.


## Por que esta em alta agora

Nem toda tarefa precisa do maior modelo do mercado: classificar textos, extrair dados ou rodar um assistente offline funcionam bem com SLMs, a uma fracao do custo e com mais privacidade. Em sistemas de agentes, e comum usar um modelo grande para planejar e varios pequenos para executar tarefas simples.

