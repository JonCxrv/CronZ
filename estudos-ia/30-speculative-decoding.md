# Speculative Decoding

## O que e

Speculative decoding e uma tecnica para acelerar a geracao de texto de um LLM sem mudar o resultado. Um modelo pequeno e rapido 'chuta' os proximos tokens, e o modelo grande apenas confere esses chutes.


## Como funciona

O modelo rascunho gera, por exemplo, 5 tokens de uma vez. O modelo grande verifica os 5 numa unica passada em paralelo e aceita os que ele mesmo teria gerado, descartando a partir do primeiro erro. Como verificar em paralelo e muito mais barato que gerar token a token, quando os chutes acertam o ganho de velocidade chega a 2-3x.

