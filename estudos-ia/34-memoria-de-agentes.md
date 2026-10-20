# Memoria de Longo Prazo em Agentes

## O que e

Memoria de longo prazo e a capacidade de um agente de IA lembrar de informacoes entre conversas diferentes, como preferencias do usuario, decisoes passadas ou fatos de um projeto. Por padrao, um LLM nao lembra de nada: cada chamada comeca do zero.


## Como funciona

O agente salva fatos relevantes fora do modelo, em arquivos, bancos de dados ou bancos vetoriais, e recupera o que importa no inicio de cada nova tarefa, colocando no contexto. A parte dificil e decidir o que vale guardar, quando atualizar algo que mudou e quando esquecer informacao velha ou errada.

