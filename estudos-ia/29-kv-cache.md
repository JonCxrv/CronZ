# KV Cache e Inferencia Eficiente

## O que e

O KV cache e a memoria que um transformer guarda durante a geracao de texto: as chaves (keys) e valores (values) da atencao de todos os tokens anteriores. Sem ele, o modelo teria que recalcular a atencao sobre o texto inteiro a cada novo token gerado.


## Como funciona

A cada token gerado, o modelo calcula K e V so para esse token novo e os adiciona ao cache, reaproveitando o resto. O problema e que o cache cresce com o tamanho do contexto e com o numero de usuarios simultaneos, consumindo muita memoria de GPU. Tecnicas como PagedAttention (do vLLM) gerenciam essa memoria em blocos, como paginas de um sistema operacional.

