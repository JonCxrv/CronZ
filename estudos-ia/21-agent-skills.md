# Agent Skills

## O que e

Agent Skills sao pacotes de conhecimento que um agente carrega sob demanda: uma pasta com um arquivo SKILL.md de instrucoes e, opcionalmente, scripts e arquivos de referencia. Criadas pela Anthropic e depois publicadas como padrao aberto, servem para ensinar ao agente 'como fazer' uma tarefa especifica -- montar uma planilha no padrao da empresa, seguir um fluxo de deploy, revisar codigo com um checklist.


## Como funciona

O truque e a divulgacao progressiva (progressive disclosure): no inicio o agente ve so o nome e uma descricao curta de cada skill, o que custa poucos tokens. Quando a tarefa pede, ele le o SKILL.md inteiro e, se precisar, os arquivos extras ou executa os scripts da pasta. Assim da para ter dezenas de skills disponiveis sem lotar a janela de contexto.

