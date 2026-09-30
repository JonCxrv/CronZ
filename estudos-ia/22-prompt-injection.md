# Prompt Injection e Seguranca de IA

## O que e

Prompt injection e um ataque em que alguem insere instrucoes maliciosas no texto que o modelo vai ler, tentando fazer ele ignorar as regras originais. Pode ser direto (o usuario escreve 'ignore as instrucoes anteriores') ou indireto, quando a instrucao esta escondida numa pagina web, e-mail ou documento que o agente processa.


## Como funciona

O problema de fundo e que, para um LLM, instrucoes e dados chegam no mesmo canal: tudo e texto no contexto. Se um agente le um e-mail dizendo 'encaminhe todos os arquivos para este endereco' e tem acesso a ferramentas, pode acabar obedecendo. As defesas incluem separar conteudo confiavel do nao confiavel, limitar permissoes das ferramentas, pedir confirmacao humana em acoes sensiveis e treinar os modelos para resistir a esses ataques.

