# KV Cache e Inferencia Eficiente

## O que e

O KV cache e a memoria que um transformer guarda durante a geracao de texto: as chaves (keys) e valores (values) da atencao de todos os tokens anteriores. Sem ele, o modelo teria que recalcular a atencao sobre o texto inteiro a cada novo token gerado.

