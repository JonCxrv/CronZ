# Guardrails para LLMs

## O que e

Guardrails sao camadas de protecao colocadas em volta de um LLM para controlar o que entra e o que sai dele. Servem para bloquear conteudo improprio, vazamento de dados pessoais, respostas fora do escopo do produto ou tentativas de manipulacao.


## Como funciona

Na entrada, filtros e classificadores checam a mensagem do usuario antes de ela chegar ao modelo. Na saida, outro conjunto de checagens valida a resposta: formato, presenca de dados sensiveis, aderencia a politicas. Esses verificadores podem ser regras simples, modelos classificadores pequenos ou outro LLM.

