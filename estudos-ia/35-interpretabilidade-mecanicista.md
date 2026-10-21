# Interpretabilidade Mecanicista

## O que e

Interpretabilidade mecanicista e a area que tenta entender o que acontece dentro de uma rede neural, como se fosse engenharia reversa de um programa. O objetivo e descobrir quais conceitos o modelo representa internamente e quais 'circuitos' ele usa para chegar numa resposta.


## Como funciona

Uma tecnica central sao os sparse autoencoders, que decompoem as ativacoes do modelo em 'features' interpretaveis, como uma que acende para codigo com bug ou para um lugar especifico. Com isso da para rastrear o caminho de um raciocinio e ate ligar ou desligar uma feature para ver como o comportamento muda.


## Por que esta em alta agora

Modelos estao sendo usados em decisoes importantes, e confiar numa caixa-preta e arriscado. Pesquisas recentes de laboratorios como a Anthropic mostraram milhoes de features em modelos de producao e tracaram circuitos reais de raciocinio, tornando a area uma das grandes apostas para seguranca de IA.

