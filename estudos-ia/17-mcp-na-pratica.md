# MCP na Pratica: Primitivas e Transportes

## O que e

Alem da ideia geral de 'USB-C da IA', o MCP tem pecas bem definidas. Ha tres papeis: o host (o app de IA, como um assistente de codigo ou chat), o cliente (a conexao que o host abre com cada servidor) e o servidor (quem expoe um sistema). E o servidor oferece tres primitivas: tools (acoes), resources (dados para leitura) e prompts (modelos de instrucao prontos).


## Como funciona

A conexao usa um de dois transportes: stdio, quando o servidor roda como processo local na maquina do usuario, ou Streamable HTTP, quando o servidor esta remoto na web. Ao conectar, cliente e servidor negociam capacidades e o cliente lista as tools, resources e prompts disponiveis. O protocolo tambem permite o caminho inverso: o servidor pode pedir ao cliente uma geracao do modelo (sampling) ou uma informacao ao usuario (elicitation).


## Por que esta em alta agora

O movimento atual e dos servidores locais para servidores MCP remotos, oferecidos pelas proprias empresas (GitHub, Notion, Figma, Stripe etc.) e conectados com um clique. Entender primitivas e transportes e o que separa 'usar' MCP de conseguir construir um servidor proprio para expor os sistemas da sua empresa.

