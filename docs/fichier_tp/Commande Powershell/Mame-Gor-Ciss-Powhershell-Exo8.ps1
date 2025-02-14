[int]$Chif1 = Read-Host "Vieullez un chiffre entre 1 et 10 "
if (( $Chif1 -ge 1 ) -and ($Chif1 -le 10)){
Write-Host " le tour du joueur "
[int]$Chif2 = Read-Host "Vieullez  deviner le chiffre entre "
if ($Chif1 -eq $Chif2){
Write-Host " tu a gagne"

} else{ 
Write-Host " ouppp tu es perdu"
}
}else {
Write-Host "le numero n'est pas compris entre 1 et 10 "
}