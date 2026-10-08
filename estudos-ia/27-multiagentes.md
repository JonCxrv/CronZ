# Sistemas Multiagentes e Subagentes

## O que e

Um sistema multiagente divide uma tarefa grande entre varios agentes de IA, cada um com seu papel, em vez de deixar um unico agente fazer tudo. O padrao mais comum e o orquestrador com subagentes: um agente principal planeja e delega partes do trabalho para agentes auxiliares.


## Como funciona

O orquestrador quebra o problema (ex: 'pesquise estes cinco concorrentes') e dispara subagentes, muitas vezes em paralelo, cada um com instrucoes, ferramentas e janela de contexto proprias. Cada subagente faz sua parte e devolve so um resumo, e o orquestrador junta tudo na resposta final. Isso isola o contexto: o orquestrador nao fica lotado com cada detalhe que os subagentes leram.


## Por que esta em alta agora

Pesquisas profundas, revisoes de codigo e tarefas longas de agentes ficaram bem melhores com esse padrao, e frameworks e assistentes de codigo passaram a oferecer subagentes nativamente. O contraponto e o custo: varios agentes consomem muito mais tokens, entao a pergunta pratica e quando a divisao compensa e quando um agente so resolve.

