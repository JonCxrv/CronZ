# GraphRAG

## O que e

GraphRAG e uma variacao de RAG que organiza o conhecimento em um grafo de entidades e relacoes, em vez de so pedacos de texto soltos num banco vetorial. Isso permite responder perguntas que exigem conectar informacoes espalhadas por varios documentos.


## Como funciona

Um LLM le os documentos e extrai entidades (pessoas, empresas, conceitos) e as relacoes entre elas, montando um grafo de conhecimento. Esse grafo e agrupado em comunidades, que recebem resumos. Na hora da pergunta, o sistema navega pelo grafo e pelos resumos, nao so pela similaridade de texto.

