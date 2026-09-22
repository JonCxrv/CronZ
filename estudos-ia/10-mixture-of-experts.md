# Mixture of Experts (MoE)

## O que e

Mixture of Experts e uma arquitetura onde, em vez de um unico bloco denso de rede neural processar toda entrada, o modelo e dividido em varios 'especialistas' (subredes menores), e apenas alguns deles sao ativados para processar cada token, escolhidos por um componente chamado roteador (router).

