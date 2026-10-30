# Busca Hibrida e Reranking

## O que e

Busca hibrida combina busca por palavras-chave (como BM25) com busca semantica por embeddings, para recuperar documentos relevantes num sistema de RAG. Reranking e uma segunda etapa que reordena esses resultados com um modelo mais preciso antes de mandar para o LLM.


## Como funciona

As duas buscas rodam em paralelo: a de palavras-chave acha termos exatos, como codigos e nomes proprios, e a semantica acha textos com o mesmo sentido em outras palavras. Os resultados sao fundidos (por exemplo com Reciprocal Rank Fusion) e um reranker, normalmente um cross-encoder, le cada par pergunta-documento e da uma nota de relevancia mais fina.

