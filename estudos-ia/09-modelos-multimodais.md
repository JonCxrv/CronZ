# Modelos Multimodais

## O que sao

Modelos multimodais sao sistemas de IA capazes de entender e/ou gerar mais de um tipo de dado -- texto, imagem, audio, video -- dentro do mesmo modelo, em vez de precisar de um sistema separado para cada midia. As familias GPT, Gemini e Claude ja processam texto e imagem nativamente na mesma conversa; outros, como Sora e Veo, geram video a partir de texto.


## Como funcionam

A estrategia comum e converter cada tipo de dado em uma representacao compartilhada que o Transformer consegue processar: uma imagem e dividida em patches que viram uma sequencia de tokens, parecido com palavras de um texto. Modelos de geracao de imagem e video geralmente combinam essa base com tecnicas de difusao (diffusion), que aprendem a transformar ruido aleatorio em uma imagem coerente passo a passo.

