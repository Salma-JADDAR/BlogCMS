/******* Opérations CRUD de Base *******/
/******* 1. INSERT - Création d'un nouvel utilisateur*******/
INSERT INTO Utilisateur (username, nom, email, role, mot_de_passe)
VALUES ('jdupont', 'Jean Dupont', 'jean.dupont@email.com', 'editor', '$2y$10$...');
/******* 2. SELECT - Récupération d'articles*******/
SELECT titre, date_creation,  status
FROM Article;
/******* 3. . UPDATE - Modification de statut*******/
UPDATE Article
SET status = 'archivé'
WHERE status = 'draft' AND date_creation < '2024-01-01';
/******* 4. . Nettoyage des commentaires*******/
DELETE FROM Commentaire
WHERE status = 'rejected' AND YEAR(date_commentaire) < 2024;

/*******  Interrogation de Données*******/
/******* 5. .  Filtrage temporelt*******/
SELECT * 
FROM Article
WHERE date_creation > '2024-12-01';
/******* 6. . Tri chronologique*******/
SELECT *
FROM Utilisateur
ORDER BY date_creation ASC;
/******* 7. .LIMIT - Articles récents*******/
SELECT titre, date_creation
FROM Article
ORDER BY date_creation DESC
LIMIT 5;
/******* 8. .DISTINCT - Rôles uniques*******/
SELECT DISTINCT role
FROM Utilisateur;
/******* Opérateurs Logiques*******/
/******* 9. AND/OR - Articles par catégorie et statut*******/
SELECT *
FROM Article
WHERE id_categorie = 1  AND status IN ('published', 'draft');
/******* 10.  BETWEEN - Commentaires par période*******/
SELECT *
FROM Commentaire
WHERE  date_commentaire BETWEEN '2024-12-01' AND '2024-12-15';
/******* 11. IN - Articles par catégories multiples*******/
SELECT *
FROM Article
WHERE id_categorie IN (
    SELECT id_categorie 
    FROM Categorie 
    WHERE  nom_categorie IN ('PHP', 'JavaScript', 'Base de données')
);
/******* 12.  LIKE - Recherche par email*******/
SELECT *
FROM Utilisateur
WHERE email LIKE '%@gmail.com';
/******* . Fonctions d'Agrégation*******/
/******* 13.  COUNT() - Statistique articles*******/
SELECT COUNT(*) AS nombre_articles_publies
FROM Article
WHERE status = 'published';
/******* 14.  COUNT() avec GROUP BY - Articles par catégorie*******/
SELECT id_categorie, COUNT(*) AS nombre_articles
FROM Article
GROUP BY id_categorie;
/******* 15.  AVG() - Longueur moyenne des articles*******/
SELECT AVG(LENGTH(contenu)) AS longueur_moyenne_caracteres
FROM Article
WHERE status = 'published';
/******* 16. Date du dernier article publié*******/
SELECT MAX(date_creation) AS dernier_article_publie
FROM Article
WHERE status = 'published';
/*******   Date du premier commentaire du système*******/
SELECT MIN(date_commentaire) AS premier_commentaire
FROM Commentaire;
/******* 17.  SUM() - Total des vues*******/
SELECT SUM(view_count) AS total_vues
FROM Article;
/******* . Jointures et Relations*******/
/******* . INNER JOIN - Articles avec auteurs*******/
SELECT a.titre AS titre_article,u.nom AS nom_auteur, a.date_creation AS date_publication
FROM Article a
JOIN Utilisateur u ON a.username = u.username
WHERE a.status = 'published';
/******* . LEFT JOIN - Catégories complètes*******/
SELECT  c. nom_categorie AS categorie,COUNT(a.id_article) AS nombre_articles
FROM Categorie c
LEFT JOIN Article a ON c.id_categorie = a.id_categorie
GROUP BY c.id_categorie, c. nom_categorie;
/******* . Jointure avec agrégation - Productivité des auteurs*******/
SELECT a.username,COUNT(a.id_article) AS articles_ecrits,COUNT(c.id_commentaire) AS commentaires_recus
FROM Article a
LEFT JOIN Commentaire c ON a.id_article = c.id_article
GROUP BY a.username;