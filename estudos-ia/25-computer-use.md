# Computer Use e Agentes de Navegador

## O que e

Computer use e a capacidade de um modelo operar um computador como uma pessoa: ver a tela, mover o mouse, clicar e digitar. Agentes de navegador sao a versao focada na web, que abrem sites, preenchem formularios e navegam entre paginas para completar uma tarefa.


## Como funciona

O agente trabalha em ciclo: recebe um screenshot da tela (ou a estrutura da pagina, no caso do navegador), decide a proxima acao, como 'clicar no botao Entrar' ou 'digitar o CEP', executa via ferramentas e recebe um novo screenshot para conferir o resultado. Modelos multimodais com boa leitura de interface sao o que torna isso possivel.


## Por que esta em alta agora

Boa parte dos sistemas do mundo real nao tem API nem servidor MCP -- so uma interface feita para humanos. Computer use permite automatizar esses sistemas legados, e os principais laboratorios lancaram agentes de navegador como produto. Ainda e mais lento e menos confiavel que uma API, e o risco de prompt injection vindo das paginas visitadas e grande.

