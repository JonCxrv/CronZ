# Agentes de IA (AI Agents)

## O que sao

Um agente de IA e um sistema onde um LLM nao apenas responde uma pergunta, mas planeja e executa uma sequencia de acoes -- chamando ferramentas, consultando APIs, escrevendo e rodando codigo, navegando na web -- para atingir um objetivo, muitas vezes com pouca ou nenhuma supervisao humana a cada passo. E a diferenca entre 'perguntar algo a um chatbot' e 'pedir para um assistente resolver uma tarefa inteira sozinho'.


## Como funcionam

A maioria dos agentes segue um ciclo de raciocinio-acao-observacao: o modelo pensa sobre o proximo passo, escolhe e executa uma ferramenta, observa o resultado e repete ate concluir a tarefa ou decidir que precisa de ajuda humana. Function calling e o mecanismo nativo dos modelos para acionar ferramentas, e o MCP (Model Context Protocol) padroniza como o agente descobre e se conecta a ferramentas externas.


## Por que esta em alta agora

2025 ficou conhecido como 'o ano dos agentes': assistentes de codigo autonomos que editam multiplos arquivos e corrigem erros sozinhos, agentes que operam navegadores e computadores (computer use) e agentes de atendimento que resolvem tickets de ponta a ponta viraram produtos reais. O desafio agora e torna-los confiaveis o suficiente para operar com mais autonomia, com bom tratamento de erros e limites claros de seguranca.

