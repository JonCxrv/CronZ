# CronZ

Repositorio privado com um unico proposito: gerar contribuicoes diarias no
grafico do GitHub, mas de um jeito que tambem sirva pra estudar. Nao e um
projeto de codigo de verdade -- nao adicione testes, CI, linting, etc.

## O que o script faz

`contribute.ps1` e o unico artefato executavel. Cada execucao:

1. Sorteia um numero de 1 a 4 (`Get-Random -Minimum 1 -Maximum 5`).
2. Faz esse numero de commits, cada um adicionando **uma secao de conteudo**
   sobre um topico de IA em `estudos-ia/<NN-slug>.md`.
3. Da `git push origin main` no final.

O conteudo NAO e gerado dinamicamente -- esta tudo escrito a mao dentro do
array `$Topics` no proprio script. Cada topico tem 3 secoes fixas:
"O que e", "Como funciona", "Por que esta em alta agora". O script consome
essas secoes em ordem, uma por commit, e guarda o progresso em
`.study-state.json` (`topicIndex` / `sectionIndex`). Quando um topico acaba
as 3 secoes, passa pro proximo topico da fila automaticamente.

Quando `topicIndex` passa do fim do array `$Topics`, o script para de commitar
e avisa no terminal que a fila esgotou -- isso e esperado, nao e bug.

## O que fazer quando o usuario pedir mais topicos

Quando a fila esgotar (ou o usuario simplesmente pedir "adiciona mais
assuntos"), edite `$Topics` em `contribute.ps1` e adicione novos itens no
mesmo formato:

```powershell
[PSCustomObject]@{
    File = "11-novo-slug.md"          # proximo numero da sequencia
    Title = "Nome do Topico"
    Sections = @(
        [PSCustomObject]@{ Heading = "O que e"; Body = "..." },
        [PSCustomObject]@{ Heading = "Como funciona"; Body = "..." },
        [PSCustomObject]@{ Heading = "Por que esta em alta agora"; Body = "..." }
    )
}
```

Regras a seguir (pedido original do usuario, nao mude sem confirmar):

- Foco em **IA** -- termos, conceitos e tecnologias que estao em alta agora
  (nao topicos genericos de banco de dados ou dev em geral).
- Conteudo em **portugues**, tom direto, 2-4 frases por secao (nao precisa
  ser gigante, e uma leitura por dia).
- Sempre 3 secoes por topico, mesmos titulos das secoes existentes.
- Nao repita topicos que ja existem no array.
- Depois de adicionar topicos, nao precisa rodar o script -- o usuario roda
  quando quiser gerar as contribuicoes do dia.

## Convencoes do repo

- E-mail de commit correto: `jhonatancarv0@gmail.com` (verificado na conta
  GitHub `JonCxrv`). Ja configurado local e globalmente -- nao mude.
- Nao recriar `activity.log` nem nenhum mecanismo de conteudo aleatorio sem
  sentido -- isso foi removido de proposito, o usuario nao quer commits
  "vazios".
- `.study-state.json` e versionado no git de proposito (garante que o
  progresso segue o repo, nao a maquina local).
- Nao ha agendamento automatico configurado (Task Scheduler) -- o usuario
  decidiu rodar manualmente por enquanto. So configurar isso se ele pedir
  explicitamente.
