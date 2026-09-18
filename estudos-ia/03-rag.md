# RAG (Retrieval-Augmented Generation)

## O que e

RAG e uma tecnica que combina um LLM com um sistema de busca externo: antes de gerar uma resposta, o sistema recupera documentos relevantes de uma base de conhecimento (geralmente um banco vetorial) e os injeta no contexto do modelo. Em vez de depender so do que o modelo memorizou durante o treino, ele passa a responder com base em informacao buscada em tempo real.


## Como funciona

O fluxo tipico tem tres etapas: (1) o texto da base de conhecimento e dividido em pedacos (chunks) e transformado em embeddings; (2) quando chega uma pergunta, ela tambem vira um embedding e o sistema busca os chunks mais similares em um banco vetorial; (3) esses trechos recuperados sao inseridos no prompt enviado ao LLM, que gera a resposta final usando essas informacoes como referencia.

