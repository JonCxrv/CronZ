# Transformers e o Mecanismo de Atencao

## O que e

Transformer e a arquitetura de rede neural, apresentada em 2017 no paper 'Attention Is All You Need', que virou a base de quase todo modelo de IA generativa moderno, de LLMs a geradores de imagem. Sua principal inovacao foi abandonar o processamento passo a passo das RNNs: no treino, a frase inteira e processada em paralelo. Na geracao de texto, a saida continua saindo um token por vez.


## Como funciona

O coracao e o self-attention: para cada token, o modelo calcula o quanto ele deve prestar atencao em todos os outros tokens da sequencia. Cada token gera tres vetores: a Query (o que procura), a Key (o que oferece) e o Value (o conteudo que repassa); comparar a Query de um com a Key dos outros define quanto de cada Value entra no resultado. Varias 'cabecas' de atencao rodam em paralelo, e cada uma captura um tipo diferente de relacao. Na frase 'o gato subiu no sofa porque ele estava com medo', e a atencao que ajuda a ligar 'ele' a 'gato'.


## Por que esta em alta agora

A paralelizacao permitiu treinar modelos em escalas antes impossiveis, com milhares de GPUs ao mesmo tempo, e foi isso que viabilizou a era dos LLMs. O ponto fraco e que, na versao classica, o custo da atencao cresce quadraticamente com o tamanho da sequencia. Por isso variacoes como atencao esparsa e sliding window sao usadas para lidar com contextos cada vez maiores, e arquiteturas alternativas como Mamba tentam escapar desse custo.

