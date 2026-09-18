# Agentes de IA (AI Agents)

## O que sao

Um agente de IA e um sistema onde um LLM nao apenas responde uma pergunta, mas planeja e executa uma sequencia de acoes -- chamando ferramentas, consultando APIs, escrevendo e rodando codigo, navegando na web -- para atingir um objetivo, muitas vezes com pouca ou nenhuma supervisao humana a cada passo. E a diferenca entre 'perguntar algo a um chatbot' e 'pedir para um assistente resolver uma tarefa inteira sozinho'.


## Como funcionam

A maioria dos agentes segue um ciclo de raciocinio-acao-observacao: o modelo pensa sobre o proximo passo, escolhe e executa uma ferramenta (function calling), observa o resultado, e repete ate concluir a tarefa ou decidir que precisa de ajuda humana. Protocolos como function calling nativo dos modelos e, mais recentemente, o MCP (Model Context Protocol) padronizam como um agente descobre e usa ferramentas externas.


## Por que esta em alta agora

2025-2026 e frequentemente chamado de 'o ano dos agentes': assistentes de codigo autonomos que editam multiplos arquivos e corrigem erros sozinhos, agentes que operam navegadores e computadores (computer use), e agentes de atendimento que resolvem tickets de ponta a ponta viraram produtos reais. O desafio atual da industria e torna-los confiaveis o suficiente para operar com mais autonomia, com bom tratamento de erros e limites claros de seguranca.

