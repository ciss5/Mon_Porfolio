# Déclaration des variables
$Date= '^\d{4}\s:\d{2}\\\d{2}-save ok$'

# Test de correspondance pour '2019 :01\03-save ok'
$testStr1 = '2019 :01\03-save ok'
#Test avec la commande -match
$testStr1 -match $Date
#Test avec la commande -notmatch
$testStr1 -notmatch $Date
Write-Host "Valeur de \$matches pour '$testStr1' :"
$matches

# Test de correspondance pour '2020 :04\03-save ok'
$testStr2 = '2020 :04\03-save ok'
#Test avec la commande -match
$testStr2 -match $Date
#Test avec la commande -notmatch
$testStr2 -notmatch $Date
Write-Host "Valeur de \$matches pour '$testStr2' :"
$matches

