# Recopie Cible Photo dans Carnet de tir.
#
# cible-photo.html est une copie exacte de index.html du depot cible-photo : on ne la modifie jamais ici.
# Pour faire evoluer la saisie par photo : travailler dans le depot cible-photo, puis lancer ce script,
# puis android\build_apk.ps1.
#
# Par defaut le depot cible-photo est cherche a cote de celui-ci (..\cible-photo).
#   .\outils\maj-cible-photo.ps1
#   .\outils\maj-cible-photo.ps1 -Source D:\autre\chemin\cible-photo
param([string]$Source = (Join-Path $PSScriptRoot "..\..\cible-photo"))
$ErrorActionPreference = "Stop"

$src = Join-Path $Source "index.html"
$dst = Join-Path $PSScriptRoot "..\cible-photo.html"
if (-not (Test-Path $src)) { throw "Cible Photo introuvable : $src" }
if (-not (Select-String -Path $src -Pattern "cible-photo:end" -Quiet)) { throw "Ce index.html n'a pas le mode integre (cible-photo:end)." }

Copy-Item $src $dst -Force
$ver = (Select-String -Path (Join-Path $Source "sw.js") -Pattern 'VERSION = "([^"]+)"').Matches[0].Groups[1].Value
Write-Host "cible-photo.html mis a jour (Cible Photo $ver)." -ForegroundColor Green
