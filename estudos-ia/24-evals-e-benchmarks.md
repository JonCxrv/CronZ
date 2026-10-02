# Evals e Benchmarks de IA

## O que e

Evals sao testes sistematicos para medir o quao bem um modelo ou sistema de IA faz uma tarefa. Benchmarks sao evals publicos e padronizados, usados para comparar modelos -- como MMLU (conhecimento geral), SWE-bench (resolver issues reais de codigo) e GPQA (perguntas cientificas dificeis).


## Como funciona

Um eval reune um conjunto de entradas com a saida esperada (ou um criterio de correcao) e roda o modelo em todas, gerando uma nota. Quando a resposta nao e objetiva, usa-se outro LLM como avaliador ('LLM-as-a-judge') seguindo um roteiro de criterios. Em produto, times mantem evals proprios com casos reais do seu dominio para detectar regressoes a cada mudanca.

