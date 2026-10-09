# Speculative Decoding

## O que e

Speculative decoding e uma tecnica para acelerar a geracao de texto de um LLM sem mudar o resultado. Um modelo pequeno e rapido 'chuta' os proximos tokens, e o modelo grande apenas confere esses chutes.

