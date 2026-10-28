# Guardrails para LLMs

## O que e

Guardrails sao camadas de protecao colocadas em volta de um LLM para controlar o que entra e o que sai dele. Servem para bloquear conteudo improprio, vazamento de dados pessoais, respostas fora do escopo do produto ou tentativas de manipulacao.


## Como funciona

Na entrada, filtros e classificadores checam a mensagem do usuario antes de ela chegar ao modelo. Na saida, outro conjunto de checagens valida a resposta: formato, presenca de dados sensiveis, aderencia a politicas. Esses verificadores podem ser regras simples, modelos classificadores pequenos ou outro LLM.


## Por que esta em alta agora

Empresas colocando chatbots e agentes em contato com clientes precisam de garantias alem do bom comportamento do modelo. Regulacoes como o AI Act europeu e incidentes publicos de chatbots dizendo o que nao deviam tornaram guardrails um requisito, com ferramentas dedicadas como NeMo Guardrails e Llama Guard.

