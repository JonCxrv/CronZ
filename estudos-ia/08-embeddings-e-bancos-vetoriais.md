# Embeddings e Bancos Vetoriais

## O que sao

Embeddings sao representacoes numericas (vetores) de textos, imagens ou outros dados, geradas por um modelo de forma que itens com significado parecido fiquem proximos entre si nesse espaco vetorial. As frases 'cachorro correndo no parque' e 'cao brincando ao ar livre' teriam embeddings proximos, mesmo sem compartilhar palavras exatas.


## Como funcionam

Um modelo de embedding transforma cada texto em um vetor, e a proximidade entre vetores, normalmente medida por similaridade de cosseno, indica a semelhanca de significado. Bancos vetoriais (Pinecone, Weaviate, Qdrant, ou extensoes como o pgvector do Postgres) guardam milhoes desses vetores e respondem rapido 'quais sao os mais parecidos com este aqui'. Em vez de comparar um vetor com todos os outros, eles usam indices aproximados como HNSW (Hierarchical Navigable Small World), trocando um pouco de precisao por muito mais velocidade.


## Por que esta em alta agora

Embeddings e bancos vetoriais sao a espinha dorsal de RAG, busca semantica e recomendacao modernos. Com o crescimento de agentes de IA que precisam de memoria de longo prazo, bancos vetoriais tambem passaram a ser usados como uma especie de memoria persistente para assistentes, guardando conversas e fatos passados como embeddings pesquisaveis.

