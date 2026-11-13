# Mixture of Experts (MoE)

## O que e

Mixture of Experts e uma arquitetura onde, em vez de um unico bloco denso de rede neural processar toda entrada, o modelo e dividido em varios 'especialistas' (subredes menores), e apenas alguns deles sao ativados para processar cada token, escolhidos por um componente chamado roteador (router).


## Como funciona

O roteador ativa so uma pequena parte dos especialistas para cada token: o Mixtral tem 8 por camada e usa 2, e o DeepSeek-V3 tem 671 bilhoes de parametros no total, mas so 37 bilhoes ativos por token. Assim o custo de computacao de cada inferencia corresponde a fracao ativada, nao ao total. A economia nao vale para a memoria, porque todos os especialistas precisam ficar carregados.

