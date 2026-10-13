# Structured Outputs

## O que e

Structured outputs e a capacidade de forcar um LLM a responder em um formato exato, normalmente um JSON que segue um schema definido. Em vez de pedir 'responda em JSON' e torcer, a saida e garantida como valida.


## Como funciona

A tecnica por tras e o constrained decoding: a cada passo da geracao, o sistema bloqueia os tokens que quebrariam o schema, deixando o modelo escolher so entre opcoes validas. O schema e convertido numa gramatica ou automato que diz, em cada ponto, quais caracteres podem vir a seguir.

