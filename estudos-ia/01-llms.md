# LLMs (Large Language Models)

## O que sao

LLMs (Modelos de Linguagem Grandes) sao redes neurais treinadas em quantidades massivas de texto para prever a proxima palavra (ou token) de uma sequencia. Esse objetivo aparentemente simples, aplicado em escala de trilhoes de tokens de treino, faz emergir capacidades como responder perguntas, escrever codigo, resumir textos e raciocinar sobre problemas, sem terem sido explicitamente programadas para cada uma dessas tarefas.

Exemplos atuais: a familia GPT (OpenAI), Claude (Anthropic), Gemini (Google) e modelos abertos como Llama (Meta) e DeepSeek.


## Como funcionam

No nucleo de praticamente todo LLM atual esta a arquitetura Transformer, que processa o texto inteiro de uma vez usando um mecanismo chamado atencao (attention) para decidir quais partes do texto sao relevantes entre si. O treino acontece em duas grandes fases: pre-treino, onde o modelo aprende padroes gerais da linguagem lendo bilhoes de paginas de texto, e pos-treino (fine-tuning, RLHF), onde e ajustado para seguir instrucoes e se comportar de forma util e segura.

