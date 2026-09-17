# Gera de 1 a 4 commits aleatorios no repo e envia (push) para o GitHub.
# Uso: clique com o botao direito > "Executar com PowerShell", ou rode `.\contribute.ps1` no terminal.

$ErrorActionPreference = "Stop"

# Garante PATH atualizado (necessario logo apos instalar o git via winget)
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")

Set-Location $PSScriptRoot

$logFile = "activity.log"
if (-not (Test-Path $logFile)) {
    New-Item -ItemType File -Path $logFile | Out-Null
}

$numCommits = Get-Random -Minimum 1 -Maximum 5  # 1 a 4 (Maximum é exclusivo)
Write-Output "Fazendo $numCommits commit(s)..."

for ($i = 1; $i -le $numCommits; $i++) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $randomBit = -join ((48..57) + (97..122) | Get-Random -Count 8 | ForEach-Object { [char]$_ })
    Add-Content -Path $logFile -Value "$timestamp - $randomBit"

    git add $logFile
    git commit -m "update $timestamp" --quiet

    Write-Output "  [$i/$numCommits] commit criado"
}

git push origin main

Write-Output "Concluido: $numCommits commit(s) enviados para o GitHub."
