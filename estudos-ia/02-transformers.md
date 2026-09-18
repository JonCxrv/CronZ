# Transformers e o Mecanismo de Atencao

## O que e

Transformer e a arquitetura de rede neural, apresentada em 2017 no paper 'Attention Is All You Need', que se tornou a base de praticamente todo modelo de IA generativa moderno, de LLMs a geradores de imagem. Sua principal inovacao foi eliminar a necessidade de processar sequencias passo a passo (como faziam as RNNs), permitindo processar uma frase inteira em paralelo.


## Como funciona

O coracao do Transformer e o mecanismo de self-attention: para cada token da entrada, o modelo calcula o quanto ele deve prestar atencao em todos os outros tokens da mesma sequencia, gerando uma representacao que ja incorpora contexto. Isso e feito atraves de tres vetores por token (Query, Key e Value), e multiplas 'cabecas' de atencao rodam em paralelo, cada uma capturando um tipo diferente de relacao entre palavras.


## Por que importa hoje

A capacidade de paralelizar o processamento foi o que permitiu treinar modelos em escalas antes impossiveis, usando milhares de GPUs simultaneamente -- e literalmente o que viabilizou a era dos LLMs. Hoje, variacoes da arquitetura original (atencao esparsa, sliding window attention, atencao linear) sao usadas para lidar com contextos cada vez maiores sem explodir o custo computacional, que cresce quadraticamente com o tamanho da sequencia na versao classica.

