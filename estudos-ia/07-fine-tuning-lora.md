# Fine-tuning, LoRA e QLoRA

## O que e

Fine-tuning e o processo de continuar o treino de um modelo ja pre-treinado usando um conjunto de dados menor e especifico, ajustando seus pesos para se especializar em uma tarefa, dominio ou estilo -- por exemplo, ensinar um LLM generico a responder no tom de uma marca ou a ser melhor em uma linguagem de programacao de nicho.


## Como funciona (LoRA)

Ajustar todos os bilhoes de parametros de um modelo grande e caro e exige muita memoria. LoRA (Low-Rank Adaptation) resolve isso congelando os pesos originais do modelo e treinando apenas pequenas matrizes adicionais de baixa dimensao, reduzindo drasticamente o numero de parametros treinaveis. QLoRA vai alem, aplicando isso sobre um modelo quantizado, permitindo fazer fine-tuning de modelos grandes ate em uma unica GPU de consumidor.

