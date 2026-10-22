# Modelos de Difusao

## O que e

Modelos de difusao sao a tecnologia por tras da maioria dos geradores de imagem e video atuais. Eles aprendem a criar dados novos partindo de puro ruido aleatorio e removendo esse ruido aos poucos ate surgir uma imagem coerente.


## Como funciona

No treino, o modelo ve imagens sendo corrompidas com ruido em varios niveis e aprende a prever e remover esse ruido. Na geracao, ele faz o caminho inverso em varias etapas, guiado pelo texto do prompt. Versoes modernas trabalham num espaco comprimido (latent diffusion) e usam transformers no lugar das redes antigas, os chamados Diffusion Transformers.

