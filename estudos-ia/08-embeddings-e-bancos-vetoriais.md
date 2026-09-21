# Embeddings e Bancos Vetoriais

## O que sao

Embeddings sao representacoes numericas (vetores) de textos, imagens ou outros dados, geradas por um modelo de forma que itens com significado parecido fiquem proximos entre si nesse espaco vetorial. As frases 'cachorro correndo no parque' e 'cao brincando ao ar livre' teriam embeddings proximos, mesmo sem compartilhar palavras exatas.


## Como funcionam os bancos vetoriais

Bancos vetoriais (Pinecone, Weaviate, Qdrant, ou extensoes como o pgvector do Postgres) sao otimizados para armazenar milhoes de embeddings e responder rapidamente 'quais vetores sao mais parecidos com este aqui'. Em vez de comparar um vetor contra todos os outros um por um, eles usam indices aproximados como HNSW (Hierarchical Navigable Small World), trocando um pouco de precisao por velocidade de busca muito maior.


## Por que esta em alta agora

Embeddings e bancos vetoriais sao a espinha dorsal de RAG, busca semantica e recomendacao modernos. Com o crescimento de agentes de IA que precisam de memoria de longo prazo, bancos vetoriais tambem passaram a ser usados como uma especie de memoria persistente para assistentes, guardando conversas e fatos passados como embeddings pesquisaveis.

