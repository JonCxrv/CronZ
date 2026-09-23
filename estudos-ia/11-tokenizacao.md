# Tokenizacao e Tokens

## O que e

Token e a unidade basica de texto que um LLM le e gera -- pode ser uma palavra inteira, um pedaco de palavra ou ate um unico caractere. Tokenizacao e o processo de quebrar o texto nessas unidades antes de entrega-lo ao modelo. Em ingles, um token equivale em media a uns 4 caracteres; em portugues, costuma render um pouco menos texto por token.


## Como funciona

A tecnica mais usada e o BPE (Byte Pair Encoding): comeca-se com caracteres individuais e, olhando um grande corpus de texto, vai-se juntando os pares mais frequentes em novos tokens, ate formar um vocabulario de dezenas ou centenas de milhares de itens. Cada token vira um numero (ID), e e esse numero que o modelo realmente processa, via uma tabela de embeddings.


## Por que esta em alta agora

Tudo em LLM e medido em tokens: preco das APIs, tamanho da janela de contexto, velocidade de geracao. Entender tokenizacao explica varias esquisitices dos modelos -- como errar ao contar letras de uma palavra -- e por que idiomas diferentes do ingles podem sair mais caros. Tambem ha pesquisa ativa em modelos que dispensam tokenizador e trabalham direto com bytes.

