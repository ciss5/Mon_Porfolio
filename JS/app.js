document.addEventListener('DOMContentLoaded', () => {
    const texteElement = document.getElementById('texte');
    const phrases = ["Bienvenu sur mon portfolio  ", "Développeur back-end.", "Développeur front-end."];
    let index = 0;

    // Fonction pour afficher les phrases une par une
    function afficherPhrases() {
        if (!texteElement) return; // Sécurité : vérifie que l'élément existe
        const phraseActuelle = phrases[index];
        texteElement.innerHTML = '<i class="fa-regular fa-face-smiling-hands fa-beat" style="color: #74C0FC;"></i>'; // Effacer le contenu précédent

        // Afficher la phrase actuelle
        for (let i = 0; i < phraseActuelle.length; i++) {
            setTimeout(() => {
                texteElement.textContent += phraseActuelle[i];
            }, i * 100); // Délai entre chaque caractère
        }

        // Passer à la phrase suivante
        index = (index + 1) % phrases.length; // Boucler à la première phrase si on atteint la dernière

        // Répéter le processus après un certain délai
        setTimeout(afficherPhrases, 5000); // Délai entre les phrases
    }

    // Démarrer l'affichage des phrases
    afficherPhrases();

    // Fade-in effect
    const elements = document.querySelectorAll('.fade-in');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, { threshold: 0.1 });

    elements.forEach(element => observer.observe(element));

    // Script pour mettre à jour l'année
    document.getElementById("year").textContent = new Date().getFullYear();
});
