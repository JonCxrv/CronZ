# Janela de Contexto e Context Engineering

## O que e

Janela de contexto e a quantidade maxima de tokens que um modelo consegue considerar de uma vez -- prompt, historico, documentos e resposta somados. Context engineering e a pratica de decidir com cuidado o que entra nessa janela: quais instrucoes, exemplos, documentos e resultados de ferramentas o modelo deve ver para fazer bem a tarefa.


## Como funciona

Mesmo com janelas de centenas de milhares ou milhoes de tokens, encher o contexto de tudo piora a qualidade (o modelo se perde, o chamado 'context rot') e aumenta o custo. Por isso se usam tecnicas como resumir historicos longos, buscar so os trechos relevantes (RAG), guardar notas em memoria externa e usar prompt caching para reaproveitar partes fixas do contexto.

