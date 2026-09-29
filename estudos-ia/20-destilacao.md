# Destilacao de Modelos

## O que e

Destilacao (knowledge distillation) e a tecnica de treinar um modelo menor, o 'aluno', para reproduzir o comportamento de um modelo maior e mais capaz, o 'professor'. O objetivo e manter boa parte da qualidade do modelo grande com o custo e a velocidade de um modelo pequeno.


## Como funciona

Em vez de aprender so com as respostas 'certas' dos dados, o aluno aprende com as saidas do professor -- seja a distribuicao de probabilidades completa sobre os proximos tokens, seja grandes volumes de respostas e raciocinios gerados pelo professor. Essa informacao e mais rica que o dado original e acelera muito o aprendizado.

