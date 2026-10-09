# Prompt Caching

## O que e

Prompt caching e a tecnica de reaproveitar o processamento de um trecho de prompt que se repete entre chamadas, como um system prompt longo, documentos ou definicoes de ferramentas. Em vez de o modelo reprocessar tudo do zero a cada requisicao, ele reutiliza o que ja calculou.


## Como funciona

O provedor guarda o estado interno (o KV cache) gerado para um prefixo do prompt por alguns minutos. Se a proxima chamada comeca exatamente com o mesmo prefixo, essa parte e lida do cache, mais barata e mais rapida. Por isso a regra pratica e colocar o conteudo fixo no inicio e o que muda (a pergunta do usuario) no fim.

