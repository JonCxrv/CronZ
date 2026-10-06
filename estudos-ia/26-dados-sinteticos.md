# Dados Sinteticos

## O que e

Dados sinteticos sao dados de treino gerados por modelos de IA, em vez de coletados do mundo real -- por exemplo, exercicios de matematica com solucao, conversas simuladas ou codigo com testes, todos criados por um LLM. Sao usados para treinar ou ajustar outros modelos (ou o proprio).


## Como funciona

Um modelo forte gera grandes volumes de exemplos seguindo instrucoes e variacoes, e depois vem a etapa mais importante: filtrar. Respostas sao verificadas automaticamente (rodando o codigo, conferindo a conta) ou avaliadas por outro modelo, e so os exemplos bons entram no treino. Sem esse filtro, o risco e o 'model collapse', quando o modelo degrada ao aprender com os proprios erros.

