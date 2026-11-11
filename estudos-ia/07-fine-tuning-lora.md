# Fine-tuning, LoRA e QLoRA

## O que e

Fine-tuning e o processo de continuar o treino de um modelo ja pre-treinado usando um conjunto de dados menor e especifico, ajustando seus pesos para se especializar em uma tarefa, dominio ou estilo -- por exemplo, responder no tom de uma marca ou dominar uma linguagem de programacao de nicho. Nao confunda com RAG: fine-tuning muda o comportamento do modelo, enquanto RAG traz conhecimento novo na hora da pergunta.


## Como funciona

Ajustar todos os bilhoes de parametros de um modelo grande e caro e exige muita memoria. LoRA (Low-Rank Adaptation) congela os pesos originais e treina apenas duas matrizes pequenas por camada, cujo produto aproxima a mudanca necessaria nos pesos, reduzindo drasticamente os parametros treinaveis. QLoRA vai alem e aplica isso sobre um modelo quantizado em 4 bits, permitindo fazer fine-tuning de modelos grandes em uma unica GPU.


## Por que esta em alta agora

LoRA e QLoRA democratizaram o fine-tuning: o que antes exigia clusters de GPUs corporativos hoje pode ser feito por um desenvolvedor individual ou uma startup pequena em hardware acessivel. Isso alimentou uma explosao de modelos especializados derivados de modelos-base abertos, e e uma das razoes por tras do crescimento acelerado do ecossistema de modelos open-weight.

