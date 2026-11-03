# RAG (Retrieval-Augmented Generation)

## O que e

RAG e uma tecnica que combina um LLM com um sistema de busca: antes de gerar a resposta, o sistema recupera documentos relevantes de uma base de conhecimento e os injeta no contexto do modelo. Em vez de depender so do que memorizou no treino, o modelo responde com base em informacao buscada na hora da pergunta. E como fazer uma prova com consulta, em vez de confiar so na memoria.


## Como funciona

O fluxo tipico tem tres etapas: (1) o texto da base de conhecimento e dividido em pedacos (chunks) e transformado em embeddings; (2) quando chega uma pergunta, ela tambem vira um embedding e o sistema busca os chunks mais similares em um banco vetorial; (3) esses trechos sao inseridos no prompt enviado ao LLM, que gera a resposta usando-os como referencia. Boa parte do resultado depende da preparacao: chunks mal cortados fazem a informacao certa nunca ser encontrada.

