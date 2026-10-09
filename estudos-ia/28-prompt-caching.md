# Prompt Caching

## O que e

Prompt caching e a tecnica de reaproveitar o processamento de um trecho de prompt que se repete entre chamadas, como um system prompt longo, documentos ou definicoes de ferramentas. Em vez de o modelo reprocessar tudo do zero a cada requisicao, ele reutiliza o que ja calculou.


## Como funciona

O provedor guarda o estado interno (o KV cache) gerado para um prefixo do prompt por alguns minutos. Se a proxima chamada comeca exatamente com o mesmo prefixo, essa parte e lida do cache, mais barata e mais rapida. Por isso a regra pratica e colocar o conteudo fixo no inicio e o que muda (a pergunta do usuario) no fim.


## Por que esta em alta agora

Agentes mandam o mesmo contexto gigante dezenas de vezes por tarefa, e o cache pode cortar boa parte do custo e da latencia dessas chamadas. Virou um recurso padrao nas APIs dos grandes provedores e um item obrigatorio em qualquer conversa sobre custo de IA em producao.

