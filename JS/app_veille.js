document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.querySelector(".form-control[type='search']");
    const articles = document.querySelectorAll(".bloc_articles .article_contenu");

    searchInput.addEventListener("input", () => {
        const query = searchInput.value.toLowerCase().trim();

        articles.forEach(article => {
            const title = article.querySelector("h4").textContent.toLowerCase();

            if (title.includes(query)) {
                article.style.display = ""; // Afficher l'article
            } else {
                article.style.display = "none"; // Masquer l'article
            }
        });
    });
});
