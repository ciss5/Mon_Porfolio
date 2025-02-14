[int]$var = 0
Do{

    $var++
    Write-Host $var

}While(Get-Process -Name "bash" -ErrorAction SilentlyContinue)

Write-host "L'applicaiton Git Bash est fermée apres avoir lancer $var "