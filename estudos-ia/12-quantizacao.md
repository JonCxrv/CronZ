# Quantizacao de Modelos

## O que e

Quantizacao e a tecnica de reduzir a precisao numerica dos pesos de um modelo -- por exemplo, de numeros de 16 bits para 8 ou ate 4 bits. O resultado e um modelo bem menor e mais rapido, com uma perda de qualidade que, feita com cuidado, costuma ser pequena.


## Como funciona

Os pesos originais sao mapeados para um conjunto menor de valores possiveis, usando fatores de escala calculados por bloco de pesos para preservar o maximo de informacao. Metodos como GPTQ, AWQ e os formatos GGUF (usados pelo llama.cpp) aplicam isso depois do treino; ja o treino com baixa precisao (FP8, FP4) leva a ideia para dentro do proprio treinamento.

