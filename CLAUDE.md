# CronZ

Repositorio privado com um unico proposito: gerar contribuicoes diarias no
grafico do GitHub, mas de um jeito que tambem sirva pra estudar. Nao e um
projeto de codigo de verdade -- nao adicione testes, CI, linting, etc.

## O que o script faz

`contribute.ps1` e o unico artefato executavel. Cada execucao:

1. Sorteia um numero de 1 a 4 (`Get-Random -Minimum 1 -Maximum 5`).
2. Cria uma branch `estudo/<data-hora>` a partir da `main` e faz esse numero
   de commits nela, cada um adicionando **uma secao de conteudo** sobre um
   topico de IA em `estudos-ia/<NN-slug>.md`.
3. Da push da branch, abre um PR com `gh pr create`, mergeia e volta pra `main`
   atualizada no fim. O modo de merge segue o plano do item 4.
4. Todo commit leva o trailer `Co-authored-by: $CoAuthor` (Claude), pra cada
   PR mergeado contar na conquista "Pair Extraordinaire" do GitHub.
   `.study-state.json` guarda `coauthorPRs` (PRs com co-autor, contando a
   partir do PR #18) e `squashPRs` (PRs em squash, contando a partir do #34).
   Plano do usuario: fazer 24 PRs em squash (cada um vira 1 commit na `main`).
   Ao chegar em 24, o script mostra um aviso na tela e nao faz mais commits ate
   o repo ficar publico; dai em diante volta a usar merge commit. Se voce ver
   `squashPRs` >= 24, avise o usuario: "chegou a 24 PRs em squash, verifique se
   a conquista subiu; vou trocar para merge commit, coloque o repositorio como
   publico".

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
- O usuario pediu em 2026-11-03 para rodar o script 1 vez por dia pela tarefa
  `CronZ` do Task Scheduler. O registro da tarefa precisa ser feito por ele;
  confira com `Get-ScheduledTask CronZ` antes de assumir que ela existe. O log
  fica em `%LOCALAPPDATA%\CronZ\contribute.log`.
