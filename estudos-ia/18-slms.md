# SLMs (Small Language Models)

## O que e

SLMs sao modelos de linguagem pequenos, geralmente com poucos bilhoes de parametros (ou menos), pensados para rodar rapido e barato -- inclusive direto no celular ou notebook, sem nuvem. Exemplos sao as familias Phi (Microsoft), Gemma (Google) e as versoes menores de Llama e Qwen.


## Como funciona

O segredo esta menos na arquitetura e mais nos dados: SLMs sao treinados com dados muito bem filtrados e com dados sinteticos gerados por modelos maiores, alem de destilacao (o modelo pequeno aprende a imitar um modelo grande). Somando quantizacao, cabem em poucos gigabytes de memoria.

