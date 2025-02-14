<?php
// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $subject = htmlspecialchars($_POST['subject']);
    $message = htmlspecialchars($_POST['message']);

    // Adresse email de destination
    $to = "contact@ciss-mame.fr";

    // En-têtes de l'email
    $headers = "From: $name <$email>\r\n";
    $headers .= "Reply-To: $email\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // Corps de l'email
    $email_body = "Nom: $name\n";
    $email_body .= "Email: $email\n";
    $email_body .= "Sujet: $subject\n\n";
    $email_body .= "Message:\n$message\n";

    // Envoyer l'email
    if (mail($to, $subject, $email_body, $headers)) {
        // Rediriger l'utilisateur vers une page de confirmation
        header("Location: ../HTML/thank.html"); //
        exit();
    } else {
        // Afficher un message d'erreur si l'email n'a pas pu être envoyé
        echo "Une erreur s'est produite lors de l'envoi du message. Veuillez réessayer.";
    }
} else {
    // Rediriger l'utilisateur si le formulaire n'a pas été soumis
    header("Location: ../HTML/contact.html");
    exit();
}
?>