# Tool Calling (Function Calling)

## O que e

Tool calling e a capacidade de um LLM de, em vez de so responder em texto, pedir para executar uma ferramenta: buscar na web, consultar um banco, chamar uma API, rodar codigo. E a peca basica que transforma um chatbot em agente -- e o que o MCP padroniza por baixo.


## Como funciona

A aplicacao envia ao modelo, junto com o prompt, a lista de ferramentas disponiveis com nome, descricao e um JSON Schema dos parametros. Quando acha util, o modelo responde com uma chamada estruturada (ex: get_weather com city='Recife'); quem executa de fato e a aplicacao, que devolve o resultado para o modelo continuar. O modelo nunca roda nada sozinho -- ele so decide o que chamar e com quais argumentos.


## Por que esta em alta agora

Todo agente moderno depende de tool calling bem feito, e os modelos ficaram muito melhores em escolher a ferramenta certa, encadear varias chamadas e ate chamar ferramentas em paralelo. A qualidade das descricoes e dos schemas das ferramentas virou quase tao importante quanto o prompt.

