# Déclaration des variables Pour les question 
[string]$Q1 = "1. Quelle est la sortie du code suivant ? `nconsole.log(typeof null);"
[string]$Q2 = "2. Comment déclare-t-on une fonction en JavaScript ?"
[string]$Q3 = "3. Quel mot-clé est utilisé pour créer une variable avec un scope de bloc ?"
[string]$Q4 = "4. Que fait le code suivant ? `nconst arr = [1, 2, 3]; `narr.push(4); `nconsole.log(arr);"
[string]$Q5 = "5. Quel est le résultat de l'expression suivante ? `n'5' + 3"
[string]$Q6 = "6. Comment accède-t-on au troisième élément d'un tableau nommé myArray ?"
[string]$Q7 = "7. Quelle méthode est utilisée pour convertir un objet JSON en chaîne de caractères en JavaScript ?"
[string]$Q8 = "8. Quel opérateur est utilisé pour vérifier l'égalité stricte en JavaScript ?"
[string]$Q9 = "9. Quel est le résultat de l'expression suivante ? `n0.1 + 0.2 === 0.3"
[string]$Q10 = "10. Comment peut-on créer un objet en JavaScript ?"
#declation des variables pour les question 
[string]$R1 = "object"
[string]$R2 = "function myFunction() {}"
[string]$R3 = "let"
[string]$R4 = "[1, 2, 3, 4]"
[string]$R5 = "53"
[string]$R6 = "myArray[2]"
[string]$R7 = "JSON.stringify()"
[string]$R8 = "==="
[string]$R9 = "false"
[string]$R10 = "let obj = {};"
# tableau pour les scores 
$TableauUser= @()

# Fonction pour vérifier la réponse
function Check-Answer {
    param (
        [string]$question,
        [string]$correctAnswer
    )
    $minR = 0
    $maxR = 3
    do {
        $minR++
        $response = Read-Host "Donnez votre réponse pour la question `$question"
        if ($response -eq $correctAnswer) {
            Write-Host "Vous avez gagné!"
            return 1
        } else {
            Write-Host "Mauvaise réponse, essayez encore."
        }
    } until ($minR -ge $max)
    Write-Host "Vous avez perdu."
    return 0
}

do {
    # Affichage des questions
    Write-Host "Vous avez le droit de choisir parmi les 10 questions, voici les questions :"
    Write-Host $Q1
    Write-Host $Q2
    Write-Host $Q3
    Write-Host $Q4
    Write-Host $Q5
    Write-Host $Q6
    Write-Host $Q7
    Write-Host $Q8
    Write-Host $Q9
    Write-Host $Q10

    # Initialisation du score
    [int]$score = 0
    #le non du joueur 
    [String]$User= Read-Host "Veuillez donner ton nom "
    # Boucle pour choisi les niveau 3/5/10 questions
    $Niv = Read-Host "Veuillez choisir le niveau 3/5/10 questions "
    for ($i = 0; $i -lt $Niv; $i++) {
        $choixQ = Read-Host "Veuillez choisir une question (1-10)"
        switch ($choixQ) {
            1 { $score += Check-Answer -question $Q1 -correctAnswer $R1 }
            2 { $score += Check-Answer -question $Q2 -correctAnswer $R2 }
            3 { $score += Check-Answer -question $Q3 -correctAnswer $R3 }
            4 { $score += Check-Answer -question $Q4 -correctAnswer $R4 }
            5 { $score += Check-Answer -question $Q5 -correctAnswer $R5 }
            6 { $score += Check-Answer -question $Q6 -correctAnswer $R6 }
            7 { $score += Check-Answer -question $Q7 -correctAnswer $R7 }
            8 { $score += Check-Answer -question $Q8 -correctAnswer $R8 }
            9 { $score += Check-Answer -question $Q9 -correctAnswer $R9 }
            10 { $score += Check-Answer -question $Q10 -correctAnswer $R10 }
            default { Write-Host "Choix invalide. Veuillez entrer un nombre entre 1 et 10." }
        }
    }
    
     $TableauUser = @(

        [pscustomobject]@{FirstName=$User; Score = $score}

   )

    # Affichage du score final
    Write-Host "Votre score final est : $score sur $NIV "
    #Affichage des noms et scores des utilisateurs
    Write-Host $TableauUser[0]
    
    # Demander à l'utilisateur s'il veut rejouer
    $rejouer = Read-Host "Voulez-vous rejouer ? (o/n)"
} while ($rejouer -eq "o" -or $rejouer -eq "O")

Write-Host "Merci d'avoir joué !"

