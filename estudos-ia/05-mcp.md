# MCP (Model Context Protocol)

## O que e

MCP e um protocolo aberto, criado pela Anthropic e adotado por varias empresas do setor, que padroniza como modelos de IA se conectam a fontes de dados e ferramentas externas -- bancos de dados, sistemas de arquivos, APIs de terceiros, apps como Slack ou Figma. Antes do MCP, cada integracao entre um LLM e uma ferramenta externa exigia codigo sob medida; o protocolo cria uma interface comum, parecida com o papel que o USB-C tem para conectar dispositivos fisicos.


## Como funciona

MCP define uma arquitetura cliente-servidor: um 'servidor MCP' expoe recursos (dados), ferramentas (acoes que o modelo pode executar) e prompts de um sistema especifico; um 'cliente MCP' (como um assistente de IA) se conecta a esse servidor e descobre dinamicamente o que esta disponivel, sem precisar de integracao hardcoded para cada servico. A comunicacao segue um formato padronizado sobre JSON-RPC.


## Por que esta em alta agora

Lancado pela Anthropic em novembro de 2024, o MCP foi adotado por OpenAI, Google e Microsoft e virou o padrao de fato para conectar assistentes a ferramentas reais de trabalho. Em dezembro de 2025 a Anthropic doou o protocolo para a Agentic AI Foundation, ligada a Linux Foundation, o que reforcou seu status de padrao neutro. Hoje existem milhares de servidores prontos (GitHub, bancos de dados, Google Drive, Figma etc.) que qualquer cliente compativel pode usar.

