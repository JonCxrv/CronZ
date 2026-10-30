# Busca Hibrida e Reranking

## O que e

Busca hibrida combina busca por palavras-chave (como BM25) com busca semantica por embeddings, para recuperar documentos relevantes num sistema de RAG. Reranking e uma segunda etapa que reordena esses resultados com um modelo mais preciso antes de mandar para o LLM.


## Como funciona

As duas buscas rodam em paralelo: a de palavras-chave acha termos exatos, como codigos e nomes proprios, e a semantica acha textos com o mesmo sentido em outras palavras. Os resultados sao fundidos (por exemplo com Reciprocal Rank Fusion) e um reranker, normalmente um cross-encoder, le cada par pergunta-documento e da uma nota de relevancia mais fina.


## Por que esta em alta agora

Quem colocou RAG em producao descobriu que so busca vetorial erra muito, e que a qualidade da resposta depende mais da recuperacao do que do LLM. Busca hibrida com reranking virou a receita padrao, e bancos vetoriais e provedores de embeddings passaram a oferecer as duas coisas prontas.

