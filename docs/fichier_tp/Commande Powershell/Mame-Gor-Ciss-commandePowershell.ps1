# Se placer sur C:\
Set-Location -Path C:\

# la creation du dossier kprod
New-Item -Path . -Name "kprod" -ItemType "Directory"

# la creation des deux sous-dossiers MAIN et SECOND dans kprod
New-Item -Path .\kprod -Name "MAIN" -ItemType "Directory"
New-Item -Path .\kprod -Name "SECOND" -ItemType "Directory"

# la creation du fichier test.txt dans MAIN
New-Item -Path .\kprod\MAIN -Name "test.txt" -ItemType "File"

# placer dans SECOND
Set-Location -Path .\kprod\SECOND

# se déplacer test.txt de MAIN vers SECOND
Move-Item -Path ..\MAIN\test.txt -Destination .

#je  Copier test.txt de SECOND dans MAIN
Copy-Item -Path .\test.txt -Destination ..\MAIN

# Se replacer dans le dossier parent kprod pour pouvoir supprimer le dossier SECOND 
Set-Location -Path ..\

# JE Supprime le dossier SECOND Avec l'argument -Force 
Remove-Item -Path .\SECOND -Recurse -Force

# je renomme le dossier MAIN en MAIN_new
Rename-Item -Path .\MAIN -NewName "MAIN_new"