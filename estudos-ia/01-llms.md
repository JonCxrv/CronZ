# LLMs (Large Language Models)

## O que sao

LLMs (Modelos de Linguagem Grandes) sao redes neurais treinadas em quantidades massivas de texto para prever o proximo token de uma sequencia (um token e uma palavra ou um pedaco de palavra). Esse objetivo simples, aplicado em escala de trilhoes de tokens, faz emergir capacidades como responder perguntas, escrever codigo e resumir textos, sem que ninguem tenha programado cada uma delas.

Exemplos atuais: a familia GPT (OpenAI), Claude (Anthropic), Gemini (Google) e modelos abertos como Llama (Meta) e DeepSeek.


## Como funcionam

A base e a arquitetura Transformer, que usa atencao (attention) para decidir quais partes do texto sao relevantes entre si. Para gerar uma resposta, o modelo calcula a probabilidade de cada proximo token possivel, sorteia um deles, acrescenta ao texto e repete. O treino tem duas fases: o pre-treino, em que ele aprende padroes da linguagem lendo enormes volumes de texto, e o pos-treino (fine-tuning, RLHF), em que e ajustado para seguir instrucoes e se comportar de forma util e segura.

