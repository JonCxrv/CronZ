# Alucinacao em LLMs

## O que e

Alucinacao e quando um modelo de IA gera uma informacao falsa ou inventada, mas apresentada com total confianca -- uma citacao que nao existe, uma funcao de biblioteca inventada, um dado historico errado. Nao e 'mentira' intencional: e um efeito colateral de como os modelos geram texto.


## Como funciona

Um LLM gera o texto mais provavel dado o contexto, e nao consulta um banco de fatos verificados. Quando o modelo nao 'sabe' algo, a continuacao mais plausivel pode ser uma resposta inventada que soa correta. O treino tambem pode reforcar isso, ao premiar respostas confiantes em vez de admitir incerteza.


## Por que esta em alta agora

Conforme a IA entra em areas sensiveis (juridico, saude, codigo em producao), alucinacao virou o principal obstaculo de confiabilidade. As defesas atuais combinam RAG com citacao de fontes, modelos treinados para dizer 'nao sei', verificacao por ferramentas externas e avaliacao automatica de factualidade.

