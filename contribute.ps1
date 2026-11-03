# Gera de 1 a 4 commits por execucao. Cada commit adiciona um pedaco de conteudo de
# estudo sobre IA (termos e temas em alta) num arquivo dentro de estudos-ia/, indo
# fundo aos poucos em cada assunto antes de passar para o proximo.
# Uso: .\contribute.ps1  (ou clique direito > Executar com PowerShell)

$ErrorActionPreference = "Stop"

$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")

Set-Location $PSScriptRoot

$ContentDir = "estudos-ia"
$StateFile  = ".study-state.json"
$CoAuthor   = "Claude <noreply@anthropic.com>"

if (-not (Test-Path $ContentDir)) {
    New-Item -ItemType Directory -Path $ContentDir | Out-Null
}

# ---------------------------------------------------------------------------
# Fila de topicos. Cada topico vira um arquivo; cada "Section" vira um commit.
# Quando um topico acaba, o proximo comeca automaticamente.
# ---------------------------------------------------------------------------
$Topics = @(
    [PSCustomObject]@{
        File = "01-llms.md"
        Title = "LLMs (Large Language Models)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que sao"; Body = "LLMs (Modelos de Linguagem Grandes) sao redes neurais treinadas em quantidades massivas de texto para prever o proximo token de uma sequencia (um token e uma palavra ou um pedaco de palavra). Esse objetivo simples, aplicado em escala de trilhoes de tokens, faz emergir capacidades como responder perguntas, escrever codigo e resumir textos, sem que ninguem tenha programado cada uma delas.`n`nExemplos atuais: a familia GPT (OpenAI), Claude (Anthropic), Gemini (Google) e modelos abertos como Llama (Meta) e DeepSeek." },
            [PSCustomObject]@{ Heading = "Como funcionam"; Body = "A base e a arquitetura Transformer, que usa atencao (attention) para decidir quais partes do texto sao relevantes entre si. Para gerar uma resposta, o modelo calcula a probabilidade de cada proximo token possivel, sorteia um deles, acrescenta ao texto e repete. O treino tem duas fases: o pre-treino, em que ele aprende padroes da linguagem lendo enormes volumes de texto, e o pos-treino (fine-tuning, RLHF), em que e ajustado para seguir instrucoes e se comportar de forma util e segura." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Desde o ChatGPT, em novembro de 2022, os LLMs deixaram de ser pesquisa academica para virar infraestrutura de produto: assistentes de codigo, atendimento ao cliente, pesquisa e automacao. Em 2025-2026 a corrida foi para modelos que raciocinam por mais tempo, aceitam contextos maiores e usam ferramentas externas. Com isso, o LLM deixou de ser so um gerador de texto e virou o motor de decisao de sistemas mais complexos, os agentes." }
        )
    },
    [PSCustomObject]@{
        File = "02-transformers.md"
        Title = "Transformers e o Mecanismo de Atencao"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Transformer e a arquitetura de rede neural, apresentada em 2017 no paper 'Attention Is All You Need', que virou a base de quase todo modelo de IA generativa moderno, de LLMs a geradores de imagem. Sua principal inovacao foi abandonar o processamento passo a passo das RNNs: no treino, a frase inteira e processada em paralelo. Na geracao de texto, a saida continua saindo um token por vez." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O coracao e o self-attention: para cada token, o modelo calcula o quanto ele deve prestar atencao em todos os outros tokens da sequencia. Cada token gera tres vetores: a Query (o que procura), a Key (o que oferece) e o Value (o conteudo que repassa); comparar a Query de um com a Key dos outros define quanto de cada Value entra no resultado. Varias 'cabecas' de atencao rodam em paralelo, e cada uma captura um tipo diferente de relacao. Na frase 'o gato subiu no sofa porque ele estava com medo', e a atencao que ajuda a ligar 'ele' a 'gato'." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "A paralelizacao permitiu treinar modelos em escalas antes impossiveis, com milhares de GPUs ao mesmo tempo, e foi isso que viabilizou a era dos LLMs. O ponto fraco e que, na versao classica, o custo da atencao cresce quadraticamente com o tamanho da sequencia. Por isso variacoes como atencao esparsa e sliding window sao usadas para lidar com contextos cada vez maiores, e arquiteturas alternativas como Mamba tentam escapar desse custo." }
        )
    },
    [PSCustomObject]@{
        File = "03-rag.md"
        Title = "RAG (Retrieval-Augmented Generation)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "RAG e uma tecnica que combina um LLM com um sistema de busca: antes de gerar a resposta, o sistema recupera documentos relevantes de uma base de conhecimento e os injeta no contexto do modelo. Em vez de depender so do que memorizou no treino, o modelo responde com base em informacao buscada na hora da pergunta. E como fazer uma prova com consulta, em vez de confiar so na memoria." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O fluxo tipico tem tres etapas: (1) o texto da base de conhecimento e dividido em pedacos (chunks) e transformado em embeddings; (2) quando chega uma pergunta, ela tambem vira um embedding e o sistema busca os chunks mais similares em um banco vetorial; (3) esses trechos sao inseridos no prompt enviado ao LLM, que gera a resposta usando-os como referencia. Boa parte do resultado depende da preparacao: chunks mal cortados fazem a informacao certa nunca ser encontrada." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "RAG ataca dois problemas centrais dos LLMs: informacao desatualizada e falta de conhecimento sobre dados especificos de uma empresa, o que reduz a alucinacao, mas nao a elimina. E a arquitetura por tras da maioria dos chatbots corporativos e assistentes que respondem sobre documentacao interna. Continua evoluindo com reranking, busca hibrida (vetorial + palavra-chave) e RAG agentico, em que o modelo decide quando e o que buscar." }
        )
    },
    [PSCustomObject]@{
        File = "04-agentes-de-ia.md"
        Title = "Agentes de IA (AI Agents)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que sao"; Body = "Um agente de IA e um sistema onde um LLM nao apenas responde uma pergunta, mas planeja e executa uma sequencia de acoes -- chamando ferramentas, consultando APIs, escrevendo e rodando codigo, navegando na web -- para atingir um objetivo, muitas vezes com pouca ou nenhuma supervisao humana a cada passo. E a diferenca entre 'perguntar algo a um chatbot' e 'pedir para um assistente resolver uma tarefa inteira sozinho'." },
            [PSCustomObject]@{ Heading = "Como funcionam"; Body = "A maioria dos agentes segue um ciclo de raciocinio-acao-observacao: o modelo pensa sobre o proximo passo, escolhe e executa uma ferramenta, observa o resultado e repete ate concluir a tarefa ou decidir que precisa de ajuda humana. Function calling e o mecanismo nativo dos modelos para acionar ferramentas, e o MCP (Model Context Protocol) padroniza como o agente descobre e se conecta a ferramentas externas." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "2025 ficou conhecido como 'o ano dos agentes': assistentes de codigo autonomos que editam multiplos arquivos e corrigem erros sozinhos, agentes que operam navegadores e computadores (computer use) e agentes de atendimento que resolvem tickets de ponta a ponta viraram produtos reais. O desafio agora e torna-los confiaveis o suficiente para operar com mais autonomia, com bom tratamento de erros e limites claros de seguranca." }
        )
    },
    [PSCustomObject]@{
        File = "05-mcp.md"
        Title = "MCP (Model Context Protocol)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "MCP e um protocolo aberto, criado pela Anthropic e adotado por varias empresas do setor, que padroniza como modelos de IA se conectam a fontes de dados e ferramentas externas -- bancos de dados, sistemas de arquivos, APIs de terceiros, apps como Slack ou Figma. Antes do MCP, cada integracao entre um LLM e uma ferramenta externa exigia codigo sob medida; o protocolo cria uma interface comum, parecida com o papel que o USB-C tem para conectar dispositivos fisicos." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "MCP define uma arquitetura cliente-servidor: um 'servidor MCP' expoe recursos (dados), ferramentas (acoes que o modelo pode executar) e prompts de um sistema especifico; um 'cliente MCP' (como um assistente de IA) se conecta a esse servidor e descobre dinamicamente o que esta disponivel, sem precisar de integracao hardcoded para cada servico. A comunicacao segue um formato padronizado sobre JSON-RPC." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Lancado pela Anthropic em novembro de 2024, o MCP foi adotado por OpenAI, Google e Microsoft e virou o padrao de fato para conectar assistentes a ferramentas reais de trabalho. Em dezembro de 2025 a Anthropic doou o protocolo para a Agentic AI Foundation, ligada a Linux Foundation, o que reforcou seu status de padrao neutro. Hoje existem milhares de servidores prontos (GitHub, bancos de dados, Google Drive, Figma etc.) que qualquer cliente compativel pode usar." }
        )
    },
    [PSCustomObject]@{
        File = "06-modelos-de-raciocinio.md"
        Title = "Modelos de Raciocinio e Test-Time Compute"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Modelos de raciocinio (reasoning models) sao LLMs treinados para 'pensar antes de responder': em vez de gerar a resposta final direto, eles produzem uma cadeia de raciocinio intermediaria -- decompondo o problema, testando abordagens, verificando os proprios passos -- antes de chegar a conclusao. Exemplos incluem a serie 'o' da OpenAI, o DeepSeek-R1 (aberto) e os modos de 'extended thinking' de modelos como o Claude." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "A ideia central e 'test-time compute' (ou 'inference-time scaling'): em vez de so investir mais poder computacional no treino, deixa-se o proprio modelo usar mais tempo e tokens durante a inferencia para raciocinar sobre um problema dificil, parecido com uma pessoa que para para pensar antes de responder algo complexo. Esses modelos costumam ser treinados com reinforcement learning sobre a qualidade do processo de raciocinio, nao so da resposta final." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Essa abordagem trouxe ganhos expressivos em logica, matematica e programacao, areas onde LLMs tradicionais erravam por 'responder rapido demais'. A tendencia e oferecer um controle de 'quanto o modelo deve pensar', trocando velocidade e custo por mais precisao em tarefas dificeis. Um tema ativo de pesquisa e que a cadeia de raciocinio exibida nem sempre reflete o que de fato levou a resposta." }
        )
    },
    [PSCustomObject]@{
        File = "07-fine-tuning-lora.md"
        Title = "Fine-tuning, LoRA e QLoRA"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Fine-tuning e o processo de continuar o treino de um modelo ja pre-treinado usando um conjunto de dados menor e especifico, ajustando seus pesos para se especializar em uma tarefa, dominio ou estilo -- por exemplo, responder no tom de uma marca ou dominar uma linguagem de programacao de nicho. Nao confunda com RAG: fine-tuning muda o comportamento do modelo, enquanto RAG traz conhecimento novo na hora da pergunta." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Ajustar todos os bilhoes de parametros de um modelo grande e caro e exige muita memoria. LoRA (Low-Rank Adaptation) congela os pesos originais e treina apenas duas matrizes pequenas por camada, cujo produto aproxima a mudanca necessaria nos pesos, reduzindo drasticamente os parametros treinaveis. QLoRA vai alem e aplica isso sobre um modelo quantizado em 4 bits, permitindo fazer fine-tuning de modelos grandes em uma unica GPU." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "LoRA e QLoRA democratizaram o fine-tuning: o que antes exigia clusters de GPUs corporativos hoje pode ser feito por um desenvolvedor individual ou uma startup pequena em hardware acessivel. Isso alimentou uma explosao de modelos especializados derivados de modelos-base abertos, e e uma das razoes por tras do crescimento acelerado do ecossistema de modelos open-weight." }
        )
    },
    [PSCustomObject]@{
        File = "08-embeddings-e-bancos-vetoriais.md"
        Title = "Embeddings e Bancos Vetoriais"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que sao"; Body = "Embeddings sao representacoes numericas (vetores) de textos, imagens ou outros dados, geradas por um modelo de forma que itens com significado parecido fiquem proximos entre si nesse espaco vetorial. As frases 'cachorro correndo no parque' e 'cao brincando ao ar livre' teriam embeddings proximos, mesmo sem compartilhar palavras exatas." },
            [PSCustomObject]@{ Heading = "Como funcionam"; Body = "Um modelo de embedding transforma cada texto em um vetor, e a proximidade entre vetores, normalmente medida por similaridade de cosseno, indica a semelhanca de significado. Bancos vetoriais (Pinecone, Weaviate, Qdrant, ou extensoes como o pgvector do Postgres) guardam milhoes desses vetores e respondem rapido 'quais sao os mais parecidos com este aqui'. Em vez de comparar um vetor com todos os outros, eles usam indices aproximados como HNSW (Hierarchical Navigable Small World), trocando um pouco de precisao por muito mais velocidade." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Embeddings e bancos vetoriais sao a espinha dorsal de RAG, busca semantica e recomendacao modernos. Com o crescimento de agentes de IA que precisam de memoria de longo prazo, bancos vetoriais tambem passaram a ser usados como uma especie de memoria persistente para assistentes, guardando conversas e fatos passados como embeddings pesquisaveis." }
        )
    },
    [PSCustomObject]@{
        File = "09-modelos-multimodais.md"
        Title = "Modelos Multimodais"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que sao"; Body = "Modelos multimodais sao sistemas de IA capazes de entender e/ou gerar mais de um tipo de dado -- texto, imagem, audio, video -- dentro do mesmo modelo, em vez de precisar de um sistema separado para cada midia. As familias GPT, Gemini e Claude ja processam texto e imagem nativamente na mesma conversa; outros, como Sora e Veo, geram video a partir de texto." },
            [PSCustomObject]@{ Heading = "Como funcionam"; Body = "A estrategia comum e converter cada tipo de dado em uma representacao compartilhada que o Transformer consegue processar: uma imagem e dividida em patches que viram uma sequencia de tokens, parecido com palavras de um texto. Modelos de geracao de imagem e video geralmente combinam essa base com tecnicas de difusao (diffusion), que aprendem a transformar ruido aleatorio em uma imagem coerente passo a passo." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "A multimodalidade esta deixando de ser um recurso extra para virar expectativa padrao: assistentes que analisam uma captura de tela, leem um grafico em PDF ou descrevem o que veem em uma camera ao vivo ja sao comuns. Na geracao, video e audio por IA saltaram de qualidade nos ultimos anos, abrindo oportunidades criativas e tambem debates sobre deepfakes e autenticidade de conteudo." }
        )
    },
    [PSCustomObject]@{
        File = "10-mixture-of-experts.md"
        Title = "Mixture of Experts (MoE)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Mixture of Experts e uma arquitetura onde, em vez de um unico bloco denso de rede neural processar toda entrada, o modelo e dividido em varios 'especialistas' (subredes menores), e apenas alguns deles sao ativados para processar cada token, escolhidos por um componente chamado roteador (router)." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O roteador ativa so uma pequena parte dos especialistas para cada token: o Mixtral tem 8 por camada e usa 2, e o DeepSeek-V3 tem 671 bilhoes de parametros no total, mas so 37 bilhoes ativos por token. Assim o custo de computacao de cada inferencia corresponde a fracao ativada, nao ao total. A economia nao vale para a memoria, porque todos os especialistas precisam ficar carregados." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "MoE virou a arquitetura de varios modelos recentes, como DeepSeek-V3, Llama 4 e Qwen 3, porque resolve um dilema antigo: como aumentar a capacidade do modelo sem fazer o custo de cada consulta explodir junto. E uma peca chave para entender por que alguns modelos conseguem ser ao mesmo tempo muito capazes e relativamente baratos e rapidos." }
        )
    },
    [PSCustomObject]@{
        File = "11-tokenizacao.md"
        Title = "Tokenizacao e Tokens"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Token e a unidade basica de texto que um LLM le e gera -- pode ser uma palavra inteira, um pedaco de palavra ou ate um unico caractere. Tokenizacao e o processo de quebrar o texto nessas unidades antes de entrega-lo ao modelo. Em ingles, um token equivale em media a uns 4 caracteres; em portugues, costuma render um pouco menos texto por token." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "A tecnica mais usada e o BPE (Byte Pair Encoding): comeca-se com caracteres individuais e, olhando um grande corpus de texto, vai-se juntando os pares mais frequentes em novos tokens, ate formar um vocabulario de dezenas ou centenas de milhares de itens. Cada token vira um numero (ID), e e esse numero que o modelo realmente processa, via uma tabela de embeddings." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Tudo em LLM e medido em tokens: preco das APIs, tamanho da janela de contexto, velocidade de geracao. Entender tokenizacao explica esquisitices como errar ao contar as letras de 'strawberry', ja que o modelo ve tokens, nao letras, e tambem por que idiomas diferentes do ingles podem sair mais caros. Tambem ha pesquisa ativa em modelos que dispensam tokenizador e trabalham direto com bytes." }
        )
    },
    [PSCustomObject]@{
        File = "12-quantizacao.md"
        Title = "Quantizacao de Modelos"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Quantizacao e a tecnica de reduzir a precisao numerica dos pesos de um modelo -- por exemplo, de numeros de 16 bits para 8 ou ate 4 bits. Um modelo de 70 bilhoes de parametros, que ocupa cerca de 140 GB em 16 bits, cai para perto de 40 GB em 4 bits. O resultado e um modelo menor e mais rapido, com uma perda de qualidade que, feita com cuidado, costuma ser pequena." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Os pesos originais sao mapeados para um conjunto menor de valores possiveis, usando fatores de escala calculados por bloco de pesos para preservar o maximo de informacao. Metodos como GPTQ, AWQ e os formatos GGUF (usados pelo llama.cpp) aplicam isso depois do treino; ja o treino com baixa precisao (FP8, FP4) leva a ideia para dentro do proprio treinamento." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "E a quantizacao que permite rodar modelos de bilhoes de parametros num notebook ou celular, com ferramentas como Ollama e LM Studio. Nos data centers, ela reduz custo de inferencia e aumenta o numero de usuarios atendidos por GPU -- e as GPUs mais novas ja trazem suporte nativo a formatos de 4 e 8 bits." }
        )
    },
    [PSCustomObject]@{
        File = "13-alucinacao.md"
        Title = "Alucinacao em LLMs"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Alucinacao e quando um modelo de IA gera uma informacao falsa ou inventada, mas apresentada com total confianca -- uma citacao que nao existe, uma funcao de biblioteca inventada, um dado historico errado. Nao e 'mentira' intencional: e um efeito colateral de como os modelos geram texto." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Um LLM gera o texto mais provavel dado o contexto, e nao consulta um banco de fatos verificados. Quando o modelo nao 'sabe' algo, a continuacao mais plausivel pode ser uma resposta inventada que soa correta. O treino tambem pode reforcar isso, ao premiar respostas confiantes em vez de admitir incerteza." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Conforme a IA entra em areas sensiveis (juridico, saude, codigo em producao), alucinacao virou o principal obstaculo de confiabilidade. As defesas atuais combinam RAG com citacao de fontes, modelos treinados para dizer 'nao sei', verificacao por ferramentas externas e avaliacao automatica de factualidade." }
        )
    },
    [PSCustomObject]@{
        File = "14-context-engineering.md"
        Title = "Janela de Contexto e Context Engineering"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Janela de contexto e a quantidade maxima de tokens que um modelo consegue considerar de uma vez -- prompt, historico, documentos e resposta somados. Context engineering e a pratica de decidir com cuidado o que entra nessa janela: quais instrucoes, exemplos, documentos e resultados de ferramentas o modelo deve ver para fazer bem a tarefa." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Mesmo com janelas de centenas de milhares ou milhoes de tokens, encher o contexto de tudo piora a qualidade (o modelo se perde, o chamado 'context rot') e aumenta o custo. Por isso se usam tecnicas como resumir historicos longos, buscar so os trechos relevantes (RAG), guardar notas em memoria externa e usar prompt caching para reaproveitar partes fixas do contexto." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Com agentes que rodam por horas e acumulam muita informacao, o gargalo deixou de ser 'escrever o prompt perfeito' e passou a ser gerenciar o contexto ao longo de toda a tarefa. O termo context engineering ganhou forca justamente como evolucao do prompt engineering nessa nova era de agentes." }
        )
    },
    [PSCustomObject]@{
        File = "15-tool-calling.md"
        Title = "Tool Calling (Function Calling)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Tool calling e a capacidade de um LLM de, em vez de so responder em texto, pedir para executar uma ferramenta: buscar na web, consultar um banco, chamar uma API, rodar codigo. E a peca basica que transforma um chatbot em agente. O MCP padroniza como as ferramentas sao expostas ao agente, mas quem as aciona continua sendo o tool calling." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "A aplicacao envia ao modelo, junto com o prompt, a lista de ferramentas disponiveis com nome, descricao e um JSON Schema dos parametros. Quando acha util, o modelo responde com uma chamada estruturada (ex: get_weather com city='Recife'); quem executa de fato e a aplicacao, que devolve o resultado para o modelo continuar. O modelo nunca roda nada sozinho -- ele so decide o que chamar e com quais argumentos." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Todo agente moderno depende de tool calling bem feito, e os modelos ficaram muito melhores em escolher a ferramenta certa, encadear varias chamadas e ate chamar ferramentas em paralelo. A qualidade das descricoes e dos schemas das ferramentas virou quase tao importante quanto o prompt." }
        )
    },
    [PSCustomObject]@{
        File = "16-rlhf-e-dpo.md"
        Title = "RLHF, DPO e Alinhamento"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "RLHF (Reinforcement Learning from Human Feedback) e a tecnica que transformou modelos que so completavam texto em assistentes uteis, como na passagem do GPT-3 para o ChatGPT: o modelo aprende com avaliacoes humanas sobre quais respostas sao melhores. DPO (Direct Preference Optimization) e uma alternativa mais simples que chega a um resultado parecido. Ambas fazem parte do que se chama alinhamento." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "No RLHF, pessoas comparam pares de respostas; com isso se treina um modelo de recompensa, que depois guia o LLM via reinforcement learning. O DPO pula o modelo de recompensa e ajusta o LLM diretamente a partir das preferencias. Variacoes usam feedback de outra IA (RLAIF) ou um conjunto de principios escritos, como na Constitutional AI da Anthropic." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "O pos-treino virou onde boa parte da diferenca entre modelos e decidida: personalidade, seguranca, capacidade de seguir instrucoes. Alem disso, reinforcement learning com recompensas verificaveis (codigo que passa nos testes, matematica com resposta certa) e o motor por tras dos modelos de raciocinio atuais." }
        )
    },
    [PSCustomObject]@{
        File = "17-mcp-na-pratica.md"
        Title = "MCP na Pratica: Primitivas e Transportes"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Alem da ideia geral de 'USB-C da IA', o MCP tem pecas bem definidas. Ha tres papeis: o host (o app de IA, como um assistente de codigo ou chat), o cliente (a conexao que o host abre com cada servidor) e o servidor (quem expoe um sistema). E o servidor oferece tres primitivas: tools (acoes), resources (dados para leitura) e prompts (modelos de instrucao prontos)." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "A conexao usa um de dois transportes: stdio, quando o servidor roda como processo local na maquina do usuario, ou Streamable HTTP, quando o servidor esta remoto na web. Ao conectar, cliente e servidor negociam capacidades e o cliente lista as tools, resources e prompts disponiveis. O protocolo tambem permite o caminho inverso: o servidor pode pedir ao cliente uma geracao do modelo (sampling) ou uma informacao ao usuario (elicitation)." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "O movimento atual e dos servidores locais para servidores MCP remotos, oferecidos pelas proprias empresas (GitHub, Notion, Figma, Stripe etc.) e conectados com um clique. Entender primitivas e transportes e o que separa 'usar' MCP de conseguir construir um servidor proprio para expor os sistemas da sua empresa." }
        )
    },
    [PSCustomObject]@{
        File = "18-slms.md"
        Title = "SLMs (Small Language Models)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "SLMs sao modelos de linguagem pequenos, geralmente com poucos bilhoes de parametros (ou menos), pensados para rodar rapido e barato -- inclusive direto no celular ou notebook, sem nuvem. Exemplos sao as familias Phi (Microsoft), Gemma (Google) e as versoes menores de Llama e Qwen." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O segredo esta menos na arquitetura e mais nos dados: SLMs sao treinados com dados muito bem filtrados e com dados sinteticos gerados por modelos maiores, alem de destilacao (o modelo pequeno aprende a imitar um modelo grande). Somando quantizacao, cabem em poucos gigabytes de memoria." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Nem toda tarefa precisa do maior modelo do mercado: classificar textos, extrair dados ou rodar um assistente offline funcionam bem com SLMs, a uma fracao do custo e com mais privacidade. Em sistemas de agentes, e comum usar um modelo grande para planejar e varios pequenos para executar tarefas simples." }
        )
    },
    [PSCustomObject]@{
        File = "19-a2a.md"
        Title = "A2A (Agent2Agent Protocol)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "A2A e um protocolo aberto, lancado pelo Google em 2025 e depois levado para a Linux Foundation, para que agentes de IA de fornecedores diferentes conversem entre si. Se o MCP conecta um agente a ferramentas e dados, o A2A conecta um agente a outro agente." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Cada agente publica um 'Agent Card', um JSON que descreve quem ele e, o que sabe fazer e como se autenticar. Um agente cliente le esse cartao e delega uma tarefa ao agente remoto via HTTP; a tarefa tem ciclo de vida proprio (em andamento, aguardando input, concluida) e pode devolver mensagens e arquivos ao longo do caminho, inclusive para tarefas que levam horas." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Empresas estao montando varios agentes especializados (compras, RH, suporte), muitas vezes de plataformas diferentes, e precisam que eles colaborem sem integracao sob medida. MCP e A2A sao vistos como complementares e formam, juntos, a base da 'internet de agentes' que a industria tenta padronizar." }
        )
    },
    [PSCustomObject]@{
        File = "20-destilacao.md"
        Title = "Destilacao de Modelos"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Destilacao (knowledge distillation) e a tecnica de treinar um modelo menor, o 'aluno', para reproduzir o comportamento de um modelo maior e mais capaz, o 'professor'. O objetivo e manter boa parte da qualidade do modelo grande com o custo e a velocidade de um modelo pequeno." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Em vez de aprender so com as respostas 'certas' dos dados, o aluno aprende com as saidas do professor -- seja a distribuicao de probabilidades completa sobre os proximos tokens, seja grandes volumes de respostas e raciocinios gerados pelo professor. Essa informacao e mais rica que o dado original e acelera muito o aprendizado." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Quase todo modelo pequeno ou 'mini' competitivo hoje passou por algum tipo de destilacao, e modelos de raciocinio abertos, como o DeepSeek-R1, tambem foram destilados em versoes menores. O tema tambem gera debate: empresas proibem nos termos de uso que suas APIs sejam usadas para destilar modelos concorrentes." }
        )
    },
    [PSCustomObject]@{
        File = "21-agent-skills.md"
        Title = "Agent Skills"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Agent Skills sao pacotes de conhecimento que um agente carrega sob demanda: uma pasta com um arquivo SKILL.md de instrucoes e, opcionalmente, scripts e arquivos de referencia. Criadas pela Anthropic e depois publicadas como padrao aberto, servem para ensinar ao agente 'como fazer' uma tarefa especifica -- montar uma planilha no padrao da empresa, seguir um fluxo de deploy, revisar codigo com um checklist." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O truque e a divulgacao progressiva (progressive disclosure): no inicio o agente ve so o nome e uma descricao curta de cada skill, o que custa poucos tokens. Quando a tarefa pede, ele le o SKILL.md inteiro e, se precisar, os arquivos extras ou executa os scripts da pasta. Assim da para ter dezenas de skills disponiveis sem lotar a janela de contexto." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Skills preenchem um espaco que o MCP nao cobre: MCP da acesso a ferramentas, skills dao o procedimento e o conhecimento do dominio para usa-las bem. Como sao so arquivos de texto e codigo, qualquer time consegue criar, versionar no git e compartilhar suas skills, o que as tornou populares rapidamente em assistentes de codigo e de trabalho." }
        )
    },
    [PSCustomObject]@{
        File = "22-prompt-injection.md"
        Title = "Prompt Injection e Seguranca de IA"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Prompt injection e um ataque em que alguem insere instrucoes maliciosas no texto que o modelo vai ler, tentando fazer ele ignorar as regras originais. Pode ser direto (o usuario escreve 'ignore as instrucoes anteriores') ou indireto, quando a instrucao esta escondida numa pagina web, e-mail ou documento que o agente processa." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O problema de fundo e que, para um LLM, instrucoes e dados chegam no mesmo canal: tudo e texto no contexto. Se um agente le um e-mail dizendo 'encaminhe todos os arquivos para este endereco' e tem acesso a ferramentas, pode acabar obedecendo. O risco e maximo quando o agente combina acesso a dados privados, exposicao a conteudo nao confiavel e um jeito de enviar dados para fora, a chamada 'lethal trifecta'. As defesas incluem separar conteudo confiavel do nao confiavel, limitar permissoes das ferramentas, pedir confirmacao humana em acoes sensiveis e treinar os modelos para resistir a esses ataques." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Com agentes que navegam na web, leem e-mails e executam codigo, prompt injection deixou de ser curiosidade e virou risco real de seguranca -- e o primeiro item (LLM01) da lista OWASP de riscos para aplicacoes com LLM. Ainda nao existe solucao definitiva, entao o tema e central para quem constroi agentes." }
        )
    },
    [PSCustomObject]@{
        File = "23-seguranca-mcp.md"
        Title = "Seguranca e Autenticacao no MCP"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Conectar um agente a dezenas de servidores MCP abre uma nova superficie de ataque: um servidor malicioso ou comprometido pode enganar o modelo, e um servidor legitimo mal configurado pode dar acesso demais. Seguranca no MCP trata de duas perguntas: quem pode acessar o que (autenticacao e permissao) e em quais servidores o agente pode confiar." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Para servidores remotos, a especificacao do MCP adota OAuth 2.1: o usuario autoriza o acesso numa tela de login, como em 'Entrar com Google', e o cliente recebe um token com escopo limitado, sem nunca ver a senha. Entre os ataques conhecidos estao o 'tool poisoning', instrucoes escondidas na descricao de uma ferramenta, e o 'rug pull', quando um servidor muda o comportamento das ferramentas depois de aprovado. As defesas incluem usar so servidores confiaveis, dar o minimo de permissao e pedir confirmacao humana para acoes sensiveis." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Com a adocao em massa do MCP, pesquisadores passaram a encontrar servidores vulneraveis e ataques reais que exploram exatamente essa confianca entre agente e ferramenta. Surgiram registros oficiais de servidores, gateways corporativos que controlam quais servidores cada funcionario pode usar e ferramentas que auditam servidores antes da instalacao." }
        )
    },
    [PSCustomObject]@{
        File = "24-evals-e-benchmarks.md"
        Title = "Evals e Benchmarks de IA"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Evals sao testes sistematicos para medir o quao bem um modelo ou sistema de IA faz uma tarefa. Benchmarks sao evals publicos e padronizados, usados para comparar modelos -- como MMLU (conhecimento geral), SWE-bench (resolver issues reais de codigo) e GPQA (perguntas cientificas dificeis)." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Um eval reune um conjunto de entradas com a saida esperada (ou um criterio de correcao) e roda o modelo em todas, gerando uma nota. Quando a resposta nao e objetiva, usa-se outro LLM como avaliador ('LLM-as-a-judge') seguindo um roteiro de criterios. Em produto, times mantem evals proprios com casos reais do seu dominio para detectar regressoes a cada mudanca." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Os modelos evoluem tao rapido que benchmarks antigos 'saturam' (todos tiram quase 100%) e ha o risco de contaminacao, quando as perguntas vazam para os dados de treino. Por isso surgem testes mais dificeis, como o Humanity's Last Exam, e medicoes focadas em tarefas longas de agentes, como as do METR. 'Escrever bons evals' virou uma das habilidades mais valorizadas em quem constroi com IA." }
        )
    },
    [PSCustomObject]@{
        File = "25-computer-use.md"
        Title = "Computer Use e Agentes de Navegador"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Computer use e a capacidade de um modelo operar um computador como uma pessoa: ver a tela, mover o mouse, clicar e digitar. Agentes de navegador sao a versao focada na web, que abrem sites, preenchem formularios e navegam entre paginas para completar uma tarefa." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O agente trabalha em ciclo: recebe um screenshot da tela (ou a estrutura da pagina, no caso do navegador), decide a proxima acao, como 'clicar no botao Entrar' ou 'digitar o CEP', executa via ferramentas e recebe um novo screenshot para conferir o resultado. Modelos multimodais com boa leitura de interface sao o que torna isso possivel." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Boa parte dos sistemas do mundo real nao tem API nem servidor MCP -- so uma interface feita para humanos. Computer use permite automatizar esses sistemas legados, e os principais laboratorios lancaram agentes de navegador como produto. Ainda e mais lento e menos confiavel que uma API, e o risco de prompt injection vindo das paginas visitadas e grande." }
        )
    },
    [PSCustomObject]@{
        File = "26-dados-sinteticos.md"
        Title = "Dados Sinteticos"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Dados sinteticos sao dados de treino gerados por modelos de IA, em vez de coletados do mundo real -- por exemplo, exercicios de matematica com solucao, conversas simuladas ou codigo com testes, todos criados por um LLM. Sao usados para treinar ou ajustar outros modelos (ou o proprio)." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Um modelo forte gera grandes volumes de exemplos seguindo instrucoes e variacoes, e depois vem a etapa mais importante: filtrar. Respostas sao verificadas automaticamente (rodando o codigo, conferindo a conta) ou avaliadas por outro modelo, e so os exemplos bons entram no treino. Sem esse filtro, o risco e o 'model collapse', quando o modelo degrada ao aprender com os proprios erros." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "O estoque de texto humano de qualidade na internet e finito e ja foi quase todo usado nos treinos. Dados sinteticos viraram a principal forma de continuar escalando, principalmente em areas verificaveis como codigo e matematica, e estao por tras de muitos avancos recentes em SLMs e modelos de raciocinio." }
        )
    },
    [PSCustomObject]@{
        File = "27-multiagentes.md"
        Title = "Sistemas Multiagentes e Subagentes"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Um sistema multiagente divide uma tarefa grande entre varios agentes de IA, cada um com seu papel, em vez de deixar um unico agente fazer tudo. O padrao mais comum e o orquestrador com subagentes: um agente principal planeja e delega partes do trabalho para agentes auxiliares." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O orquestrador quebra o problema (ex: 'pesquise estes cinco concorrentes') e dispara subagentes, muitas vezes em paralelo, cada um com instrucoes, ferramentas e janela de contexto proprias. Cada subagente faz sua parte e devolve so um resumo, e o orquestrador junta tudo na resposta final. Isso isola o contexto: o orquestrador nao fica lotado com cada detalhe que os subagentes leram." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Pesquisas profundas, revisoes de codigo e tarefas longas de agentes ficaram bem melhores com esse padrao, e frameworks e assistentes de codigo passaram a oferecer subagentes nativamente. O contraponto e o custo: varios agentes consomem muito mais tokens, entao a pergunta pratica e quando a divisao compensa e quando um agente so resolve." }
        )
    },
    [PSCustomObject]@{
        File = "28-prompt-caching.md"
        Title = "Prompt Caching"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Prompt caching e a tecnica de reaproveitar o processamento de um trecho de prompt que se repete entre chamadas, como um system prompt longo, documentos ou definicoes de ferramentas. Em vez de o modelo reprocessar tudo do zero a cada requisicao, ele reutiliza o que ja calculou." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O provedor guarda o estado interno (o KV cache) gerado para um prefixo do prompt por alguns minutos. Se a proxima chamada comeca exatamente com o mesmo prefixo, essa parte e lida do cache, mais barata e mais rapida. Qualquer mudanca invalida o cache dali em diante, entao a regra pratica e colocar o conteudo fixo no inicio e o que muda (a pergunta do usuario) no fim." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Agentes mandam o mesmo contexto gigante dezenas de vezes por tarefa, e ler do cache custa de 50% a 90% menos, conforme o provedor, alem de reduzir a latencia. Virou um recurso padrao nas APIs dos grandes provedores e um item obrigatorio em qualquer conversa sobre custo de IA em producao." }
        )
    },
    [PSCustomObject]@{
        File = "29-kv-cache.md"
        Title = "KV Cache e Inferencia Eficiente"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "O KV cache e a memoria que um transformer guarda durante a geracao de texto: as chaves (keys) e valores (values) da atencao de todos os tokens anteriores. Sem ele, o modelo teria que recalcular a atencao sobre o texto inteiro a cada novo token gerado." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "A cada token gerado, o modelo calcula K e V so para esse token novo e os adiciona ao cache, reaproveitando o resto. O problema e que o cache cresce com o tamanho do contexto e com o numero de usuarios simultaneos, consumindo muita memoria de GPU. Tecnicas como PagedAttention (do vLLM) gerenciam essa memoria em blocos, como paginas de um sistema operacional." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Com janelas de contexto de centenas de milhares de tokens, o KV cache virou o principal gargalo da inferencia. Boa parte da inovacao recente em servidores de modelos (vLLM, SGLang) e em arquiteturas novas e justamente sobre comprimir, compartilhar ou reduzir esse cache." }
        )
    },
    [PSCustomObject]@{
        File = "30-speculative-decoding.md"
        Title = "Speculative Decoding"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Speculative decoding e uma tecnica para acelerar a geracao de texto de um LLM sem mudar o resultado. Um modelo pequeno e rapido 'chuta' os proximos tokens, e o modelo grande apenas confere esses chutes." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O modelo rascunho gera, por exemplo, 5 tokens de uma vez. O modelo grande verifica os 5 numa unica passada em paralelo e aceita os que ele mesmo teria gerado, descartando a partir do primeiro erro. Como verificar em paralelo e muito mais barato que gerar token a token, quando os chutes acertam o ganho de velocidade chega a 2-3x." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Modelos de raciocinio geram textos enormes, e cada milissegundo por token pesa no custo e na experiencia do usuario. Variacoes como Medusa e EAGLE, que usam cabecas extras no proprio modelo em vez de um modelo separado, ja vem prontas nos principais servidores de inferencia." }
        )
    },
    [PSCustomObject]@{
        File = "31-structured-outputs.md"
        Title = "Structured Outputs"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Structured outputs e a capacidade de forcar um LLM a responder em um formato exato, normalmente um JSON que segue um schema definido. Em vez de pedir 'responda em JSON' e torcer, a saida e garantida como valida. A garantia e do formato, nao do conteudo: o JSON vem correto, mas os valores ainda podem estar errados." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "A tecnica por tras e o constrained decoding: a cada passo da geracao, o sistema bloqueia os tokens que quebrariam o schema, deixando o modelo escolher so entre opcoes validas. O schema e convertido numa gramatica ou automato que diz, em cada ponto, quais caracteres podem vir a seguir." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Quando a saida de um LLM alimenta codigo (extracao de dados, chamadas de ferramenta, pipelines), um JSON quebrado derruba o sistema. As principais APIs passaram a oferecer modo estrito com schema, e bibliotecas como Outlines e Pydantic AI tornaram esse padrao a forma normal de integrar LLMs em software." }
        )
    },
    [PSCustomObject]@{
        File = "32-llm-as-a-judge.md"
        Title = "LLM-as-a-Judge"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "LLM-as-a-judge e usar um modelo de linguagem para avaliar respostas de outro modelo (ou dele mesmo). Ele substitui ou complementa avaliadores humanos em tarefas onde nao existe uma resposta exata para comparar, como qualidade de um resumo ou tom de um atendimento." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O juiz recebe a pergunta, a resposta e um criterio claro (uma rubrica), e devolve uma nota ou um veredito, de preferencia com justificativa. Pode avaliar uma resposta isolada ou comparar duas e dizer qual e melhor. Os cuidados sao conhecidos: juizes tendem a preferir respostas mais longas, a primeira opcao apresentada e textos do proprio modelo, entao e preciso calibrar com algumas notas humanas." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Avaliar milhares de respostas a mao nao escala, e evals viraram parte do ciclo de desenvolvimento de qualquer produto com IA. LLM-as-a-judge e a forma mais pratica de rodar essas avaliacoes continuamente, e tambem e usado para gerar recompensas no treino de modelos." }
        )
    },
    [PSCustomObject]@{
        File = "33-graphrag.md"
        Title = "GraphRAG"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "GraphRAG e uma variacao de RAG que organiza o conhecimento em um grafo de entidades e relacoes, em vez de so pedacos de texto soltos num banco vetorial. Isso permite responder perguntas que exigem conectar informacoes espalhadas por varios documentos." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Um LLM le os documentos e extrai entidades (pessoas, empresas, conceitos) e as relacoes entre elas, montando um grafo de conhecimento. Esse grafo e agrupado em comunidades, que recebem resumos. Na hora da pergunta, o sistema navega pelo grafo e pelos resumos, nao so pela similaridade de texto." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "O RAG classico falha em perguntas globais como 'quais os principais temas destes 500 documentos?', porque nenhum trecho isolado contem a resposta. GraphRAG, popularizado por um projeto aberto da Microsoft, ataca exatamente isso e virou opcao comum em bases de conhecimento corporativas. O ponto fraco e o custo: montar o indice exige rodar um LLM sobre todo o conjunto de documentos." }
        )
    },
    [PSCustomObject]@{
        File = "34-memoria-de-agentes.md"
        Title = "Memoria de Longo Prazo em Agentes"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Memoria de longo prazo e a capacidade de um agente de IA lembrar de informacoes entre conversas diferentes, como preferencias do usuario, decisoes passadas ou fatos de um projeto. Por padrao, um LLM nao lembra de nada: cada chamada comeca do zero." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O agente salva fatos relevantes fora do modelo, em arquivos, bancos de dados ou bancos vetoriais, e recupera o que importa no inicio de cada nova tarefa, colocando no contexto. A parte dificil e decidir o que vale guardar, quando atualizar algo que mudou e quando esquecer informacao velha ou errada." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Assistentes e agentes de codigo passaram a oferecer memoria persistente, e isso muda a experiencia: o agente deixa de ser um estagiario que chega novo todo dia. Ferramentas como Mem0 e Letta e recursos de memoria nativos dos grandes assistentes transformaram isso numa area propria de engenharia." }
        )
    },
    [PSCustomObject]@{
        File = "35-interpretabilidade-mecanicista.md"
        Title = "Interpretabilidade Mecanicista"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Interpretabilidade mecanicista e a area que tenta entender o que acontece dentro de uma rede neural, como se fosse engenharia reversa de um programa. O objetivo e descobrir quais conceitos o modelo representa internamente e quais 'circuitos' ele usa para chegar numa resposta." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Uma tecnica central sao os sparse autoencoders, que decompoem as ativacoes do modelo em 'features' interpretaveis, como uma que acende para codigo com bug ou para um lugar especifico. Com isso da para rastrear o caminho de um raciocinio e ate ligar ou desligar uma feature para ver como o comportamento muda. Num experimento famoso, a Anthropic amplificou a feature da ponte Golden Gate e o Claude passou a falar dela em qualquer assunto." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Modelos estao sendo usados em decisoes importantes, e confiar numa caixa-preta e arriscado. Pesquisas recentes de laboratorios como a Anthropic mostraram milhoes de features em modelos de producao e tracaram circuitos reais de raciocinio, tornando a area uma das grandes apostas para seguranca de IA." }
        )
    },
    [PSCustomObject]@{
        File = "36-modelos-de-difusao.md"
        Title = "Modelos de Difusao"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Modelos de difusao sao a tecnologia por tras da maioria dos geradores de imagem e video atuais. Eles aprendem a criar dados novos partindo de puro ruido aleatorio e removendo esse ruido aos poucos ate surgir uma imagem coerente." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "No treino, o modelo ve imagens sendo corrompidas com ruido em varios niveis e aprende a prever e remover esse ruido. Na geracao, ele faz o caminho inverso em varias etapas, guiado pelo texto do prompt. Versoes modernas trabalham num espaco comprimido (latent diffusion) e usam transformers no lugar das redes antigas, os chamados Diffusion Transformers." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Geracao de video com qualidade quase cinematografica saiu do laboratorio e chegou aos produtos, puxada por modelos de difusao. Alem disso, ja existem LLMs de difusao, como o Mercury, da Inception Labs, que geram texto refinando varios tokens em paralelo, uma alternativa a geracao token a token que promete ser bem mais rapida." }
        )
    },
    [PSCustomObject]@{
        File = "37-agentes-de-codigo.md"
        Title = "Agentes de Codigo e Vibe Coding"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Agentes de codigo sao assistentes de IA que nao so sugerem trechos, mas executam tarefas inteiras de programacao: leem o repositorio, editam arquivos, rodam testes e comandos e corrigem os proprios erros. 'Vibe coding', termo cunhado por Andrej Karpathy em 2025, e o estilo em que a pessoa descreve o que quer e deixa a IA escrever quase todo o codigo." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O agente roda num loop: recebe a tarefa, explora o codigo com ferramentas de busca e leitura, faz alteracoes, executa testes ou o build, le os erros e tenta de novo ate terminar. Ele roda no terminal, na IDE ou na nuvem, e arquivos de instrucoes no repositorio (como um CLAUDE.md) dao contexto sobre convencoes do projeto." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Programacao virou o caso de uso mais maduro de agentes, porque o resultado e verificavel: o teste passa ou falha. Ferramentas como Claude Code, Cursor e Codex mudaram o dia a dia de muitos desenvolvedores, e o debate agora e sobre revisao, qualidade e o que muda na profissao." }
        )
    },
    [PSCustomObject]@{
        File = "38-guardrails.md"
        Title = "Guardrails para LLMs"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Guardrails sao camadas de protecao colocadas em volta de um LLM para controlar o que entra e o que sai dele. Servem para bloquear conteudo improprio, vazamento de dados pessoais, respostas fora do escopo do produto ou tentativas de manipulacao." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Na entrada, filtros e classificadores checam a mensagem do usuario antes de ela chegar ao modelo. Na saida, outro conjunto de checagens valida a resposta: formato, presenca de dados sensiveis, aderencia a politicas. Esses verificadores podem ser regras simples, modelos classificadores pequenos ou outro LLM." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Empresas colocando chatbots e agentes em contato com clientes precisam de garantias alem do bom comportamento do modelo. Regulacoes como o AI Act europeu e incidentes publicos de chatbots dizendo o que nao deviam tornaram guardrails um requisito, com ferramentas dedicadas como NeMo Guardrails e Llama Guard." }
        )
    },
    [PSCustomObject]@{
        File = "39-leis-de-escala.md"
        Title = "Leis de Escala (Scaling Laws)"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Leis de escala sao relacoes empiricas que mostram como o desempenho de um modelo melhora de forma previsivel quando se aumenta parametros, dados de treino e computacao. Elas permitem estimar o resultado de um treino gigante antes de gastar o dinheiro nele." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "Pesquisadores treinam varios modelos menores e medem como o erro cai conforme a escala, encontrando curvas bem regulares. O trabalho Chinchilla (DeepMind, 2022) mostrou que muitos modelos tinham parametros demais para pouco dado, e que o ideal e crescer os dois juntos, com cerca de 20 tokens de treino por parametro. Hoje se fala tambem em escala no momento da inferencia, dando mais tempo de 'pensamento' ao modelo." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "As leis de escala justificam os investimentos bilionarios em data centers, entao qualquer sinal de que elas estao desacelerando vira noticia. O debate atual e se o pre-treino ainda rende tanto e quanto do progresso vira de novas frentes como test-time compute, aprendizado por reforco e dados sinteticos." }
        )
    },
    [PSCustomObject]@{
        File = "40-world-models.md"
        Title = "World Models"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "World models sao modelos de IA que aprendem uma representacao de como o mundo funciona, a ponto de simular o que acontece a seguir dado um estado e uma acao. Em vez de so gerar texto ou imagem, eles preveem a dinamica de um ambiente." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "O modelo e treinado com enormes volumes de video e, as vezes, dados de acoes (como comandos de um jogo ou de um robo). Ele aprende a prever os proximos quadros ou estados, o que exige captar fisica, objetos e causa e efeito. Depois pode servir de simulador interativo, onde um agente ou robo treina sem precisar do mundo real." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Robotica e IA fisica viraram uma das grandes frentes de investimento, e treinar robos no mundo real e lento e caro. Modelos como o Genie, do Google DeepMind, e o Cosmos, da Nvidia, geram ambientes jogaveis e simulacoes realistas, e pesquisadores como Yann LeCun apontam world models como o proximo passo alem dos LLMs." }
        )
    },
    [PSCustomObject]@{
        File = "41-busca-hibrida-e-reranking.md"
        Title = "Busca Hibrida e Reranking"
        Sections = @(
            [PSCustomObject]@{ Heading = "O que e"; Body = "Busca hibrida combina busca por palavras-chave (como BM25) com busca semantica por embeddings, para recuperar documentos relevantes num sistema de RAG. Reranking e uma segunda etapa que reordena esses resultados com um modelo mais preciso antes de mandar para o LLM." },
            [PSCustomObject]@{ Heading = "Como funciona"; Body = "As duas buscas rodam em paralelo: a de palavras-chave acha termos exatos, como codigos e nomes proprios, e a semantica acha textos com o mesmo sentido em outras palavras. Os resultados sao fundidos (por exemplo com Reciprocal Rank Fusion) e um reranker, normalmente um cross-encoder, le cada par pergunta-documento e da uma nota de relevancia mais fina. Como e caro, ele roda so sobre os melhores candidatos (digamos, 50), e apenas os poucos do topo (digamos, 5) vao para o LLM." },
            [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "Quem colocou RAG em producao descobriu que so busca vetorial erra muito, e que a qualidade da resposta depende mais da recuperacao do que do LLM. Busca hibrida com reranking virou a receita padrao, e bancos vetoriais e provedores de embeddings passaram a oferecer as duas coisas prontas." }
        )
    }
)

# ---------------------------------------------------------------------------
# Estado: qual topico/secao vem a seguir
# ---------------------------------------------------------------------------
if (Test-Path $StateFile) {
    $state = Get-Content $StateFile -Raw | ConvertFrom-Json
} else {
    $state = [PSCustomObject]@{ topicIndex = 0; sectionIndex = 0 }
}
# Quantos PRs ja sairam com co-autor, pra conquista Pair Extraordinaire
if ($null -eq $state.coauthorPRs) {
    $state | Add-Member -NotePropertyName coauthorPRs -NotePropertyValue 0
}
$CoauthorGoal = 24
$SettingsUrl  = "https://github.com/JonCxrv/CronZ/settings"

# O script roda agendado e sem janela, entao o aviso precisa aparecer na tela.
function Show-Notice([string]$Message) {
    Write-Output $Message
    (New-Object -ComObject WScript.Shell).Popup($Message, 0, "CronZ", 48) | Out-Null
}

trap {
    Show-Notice "A execucao do CronZ falhou: $_"
    exit 1
}

# Teste da conquista: os proximos PRs precisam sair com o repo publico.
$visibility = gh repo view --json visibility --jq .visibility
if ($LASTEXITCODE -ne 0) { throw "Nao consegui consultar a visibilidade do repo." }
if ($visibility -ne "PUBLIC") {
    Show-Notice "Nenhum commit foi feito. Coloque o repositorio como publico em $SettingsUrl para o CronZ voltar a rodar."
    exit 0
}

$numCommits = Get-Random -Minimum 1 -Maximum 5  # 1 a 4
Write-Output "Tentando fazer $numCommits commit(s) de conteudo..."

# Cada execucao vira um PR: os commits vao para uma branch propria, que e
# mergeada na main pelo gh no final.
git checkout main --quiet
git pull origin main --quiet
$branch = "estudo/" + (Get-Date -Format "yyyy-MM-dd-HHmmss")
git checkout -b $branch --quiet
$prTitles = @()

$done = 0
for ($i = 0; $i -lt $numCommits; $i++) {

    if ($state.topicIndex -ge $Topics.Count) {
        Write-Output "Fila de topicos esgotada -- peca para o Claude adicionar mais assuntos."
        break
    }

    $topic   = $Topics[$state.topicIndex]
    $section = $topic.Sections[$state.sectionIndex]
    $filePath = Join-Path $ContentDir $topic.File

    if ($state.sectionIndex -eq 0) {
        $block = "# $($topic.Title)`n`n## $($section.Heading)`n`n$($section.Body)`n"
        Set-Content -Path $filePath -Value $block -Encoding utf8
    } else {
        $block = "`n## $($section.Heading)`n`n$($section.Body)`n"
        Add-Content -Path $filePath -Value $block -Encoding utf8
    }

    $state.sectionIndex++
    if ($state.sectionIndex -ge $topic.Sections.Count) {
        $state.topicIndex++
        $state.sectionIndex = 0
    }
    if ($done -eq 0) { $state.coauthorPRs++ }  # conta 1 vez por execucao/PR
    $state | ConvertTo-Json | Set-Content -Path $StateFile -Encoding utf8

    git add $filePath $StateFile
    # O trailer Co-authored-by faz cada PR mergeado contar para a conquista
    # "Pair Extraordinaire" do GitHub. O conteudo foi escrito com o Claude.
    git commit -m "estudo(IA): $($topic.Title) - $($section.Heading)" -m "Co-authored-by: $CoAuthor" --quiet

    $done++
    $prTitles += "$($topic.Title) - $($section.Heading)"
    Write-Output "  [$done/$numCommits] $($topic.Title) - $($section.Heading)"
}

if ($done -gt 0) {
    git push -u origin $branch --quiet
    if ($LASTEXITCODE -ne 0) { throw "Falha no push da branch $branch." }

    $prBody = "Secoes estudadas:`n`n" + (($prTitles | ForEach-Object { "- $_" }) -join "`n")
    gh pr create --base main --head $branch --title "estudo(IA): $(Get-Date -Format 'yyyy-MM-dd')" --body $prBody
    if ($LASTEXITCODE -ne 0) { throw "Falha ao abrir o PR da branch $branch." }

    gh pr merge $branch --merge --delete-branch
    if ($LASTEXITCODE -ne 0) { throw "PR aberto, mas o merge falhou -- confira no GitHub." }

    git checkout main --quiet
    git pull origin main --quiet
    Write-Output "Concluido: PR com $done commit(s) aberto e mergeado na main."

    Write-Output "PRs com co-autor: $($state.coauthorPRs)/$CoauthorGoal"
    if ($state.coauthorPRs -eq $CoauthorGoal) {
        Show-Notice "Chegou a $CoauthorGoal PRs com co-autor. Verifique se a conquista Pair Extraordinaire subiu de nivel."
    }
} else {
    git checkout main --quiet
    git branch -D $branch --quiet
    Write-Output "Nenhum commit feito."
}
