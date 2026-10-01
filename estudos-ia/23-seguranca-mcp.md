# Seguranca e Autenticacao no MCP

## O que e

Conectar um agente a dezenas de servidores MCP abre uma nova superficie de ataque: um servidor malicioso ou comprometido pode enganar o modelo, e um servidor legitimo mal configurado pode dar acesso demais. Seguranca no MCP trata de duas perguntas: quem pode acessar o que (autenticacao e permissao) e em quais servidores o agente pode confiar.


## Como funciona

Para servidores remotos, a especificacao do MCP adota OAuth 2.1: o usuario autoriza o acesso numa tela de login, como em 'Entrar com Google', e o cliente recebe um token com escopo limitado, sem nunca ver a senha. Entre os ataques conhecidos estao o 'tool poisoning', instrucoes escondidas na descricao de uma ferramenta, e o 'rug pull', quando um servidor muda o comportamento das ferramentas depois de aprovado. As defesas incluem usar so servidores confiaveis, dar o minimo de permissao e pedir confirmacao humana para acoes sensiveis.

