# Se placer sur C:\
Set-Location -Path C:\
$Mewo = "C:\Mewo"
If(Test-Path -Path $Mewo)
{
   Set-Location -Path C:\Mewo
}
Else
{ # la creation du dossier 
 New-Item -Path . -Name "Mewo" -ItemType "Directory" 
 Set-Location -Path "C:\Mewo"
}
$test = "C:\Mewo"
If(Test-Path -Path $test)
{
   #Rien a fair 
}
Else
{ # la creation du fichier test.txt

$x=@" 
Name: MAME 
Version: 1.0
Description: Fichier de text
"@
 New-Item -itemtype file -Path "C:\Mewo\test.txt" -value $x
 
 $nom = Read-Host "Vieullez entre votre nom please "

 Select-String -Path "C:\Mewo\test.txt" -Pattern "MAME"

 if ($nom -eq "MAME"){
 Write-Host " ok"
 } else {
 Write-Host " nok"
 }
 }
   