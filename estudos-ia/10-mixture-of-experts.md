# Mixture of Experts (MoE)

## O que e

Mixture of Experts e uma arquitetura onde, em vez de um unico bloco denso de rede neural processar toda entrada, o modelo e dividido em varios 'especialistas' (subredes menores), e apenas alguns deles sao ativados para processar cada token, escolhidos por um componente chamado roteador (router).


## Como funciona

Um modelo MoE pode ter, por exemplo, 8 ou mais especialistas em cada camada, mas o roteador ativa so 2 deles para cada token processado. Isso significa que o modelo pode ter um numero total de parametros gigantesco, mas o custo computacional de cada inferencia corresponde so a fracao de parametros realmente ativados, nao ao total.

