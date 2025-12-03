/***************** CREATION DES TABLES ************************/
/********* TABLE Utilisateur **************/
CREATE TABLE Utilisateur (
    username VARCHAR(50) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(60) NOT NULL,
    role VARCHAR(10) DEFAULT 'auteur',
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    etat VARCHAR(10) DEFAULT 'actif',
    CHECK (role IN ('auteur', 'admin', 'subscriber', 'editor')),
    CHECK (etat IN ('actif', 'inactif'))
);
/********* TABLE Categorie**************/
CREATE TABLE Categorie (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(50) NOT NULL,
    description TEXT
);
/********* TABLE Article**************/
CREATE TABLE Article (
    id_article INT  PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(50) NOT NULL,
    contenu TEXT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modification DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(30) DEFAULT 'draft',
    view_count INT DEFAULT 0,
    username VARCHAR(50),
    id_categorie INT NOT NULL,
    CHECK (status IN ('draft', 'published', 'archived')),
    FOREIGN KEY (username) REFERENCES Utilisateur(username) ON DELETE SET NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categorie(id_categorie)
);
/********* TABLE Commentaire**************/
CREATE TABLE Commentaire (
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    contenu TEXT NOT NULL,
    date_commentaire DATETIME DEFAULT CURRENT_TIMESTAMP,
    username VARCHAR(50) NULL,
    email VARCHAR(50) NOT NULL,
    status VARCHAR(10) DEFAULT 'pending',
    id_article INT NOT NULL,
    CHECK (status IN ('pending', 'approved', 'rejected')),
    FOREIGN KEY (id_article) REFERENCES Article(id_article) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES Utilisateur(username) ON DELETE SET NULL
);

/******* INSERTION DANS TABLE Utilisateur *******/
INSERT INTO Utilisateur(username, nom, email, mot_de_passe, role, date_creation, etat) VALUES
('admin_blog', 'Administrateur Blog', 'admin@blogcms.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'admin', '2024-01-15 10:00:00', 'actif'),
('marie_dubois', 'Marie Dubois', 'marie.dubois@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'editor', '2024-02-10 11:30:00', 'actif'),
('pierre_leroy', 'Pierre Leroy', 'pierre.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-02-15 09:15:00', 'actif'),
('sophie_martin', 'Sophie Martin', 'sophie.martin@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-03-01 14:20:00', 'actif'),
('jean_dupont', 'Jean Dupont', 'jean.dupont@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-03-10 16:45:00', 'actif'),
('lucie_bernard', 'Lucie Bernard', 'lucie.bernard@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-03-15 08:00:00', 'actif'),
('thomas_petit', 'Thomas Petit', 'thomas.petit@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', '2024-03-20 10:30:00', 'actif'),
('julie_roux', 'Julie Roux', 'julie.roux@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', '2024-04-01 12:00:00', 'actif'),
('marc_vincent', 'Marc Vincent', 'marc.vincent@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-04-05 15:45:00', 'actif'),
('isabelle_leroy', 'Isabelle Leroy', 'isabelle.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', '2024-04-10 18:20:00', 'actif'),
('david_morel', 'David Morel', 'david.morel@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-04-15 09:30:00', 'actif'),
('caroline_duval', 'Caroline Duval', 'caroline.duval@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'editor', '2024-05-02 14:10:00', 'actif'),
('nicolas_lambert', 'Nicolas Lambert', 'nicolas.lambert@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-05-10 11:45:00', 'actif'),
('elodie_garnier', 'Elodie Garnier', 'elodie.garnier@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', '2024-05-20 16:30:00', 'actif'),
('antoine_chevalier', 'Antoine Chevalier', 'antoine.chevalier@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-06-01 08:15:00', 'actif'),
('clara_royer', 'Clara Royer', 'clara.royer@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-06-10 10:40:00', 'actif'),
('quentin_menard', 'Quentin Menard', 'quentin.menard@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', '2024-06-15 13:25:00', 'actif'),
('amelie_colin', 'Amélie Colin', 'amelie.colin@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auteur', '2024-07-03 17:50:00', 'actif'),
('vincent_gauthier', 'Vincent Gauthier', 'vincent.gauthier@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'editor', '2024-07-12 12:05:00', 'actif'),
('marine_lebrun', 'Marine Lebrun', 'marine.lebrun@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', '2024-07-20 15:20:00', 'actif');

/******* INSERTION DANS TABLE Categorie *******/
INSERT INTO Categorie(nom_categorie, description)
VALUES
('Technologie', 'Actualités, tutoriels et analyses sur les nouvelles technologies'),
('Santé', 'Conseils santé, bien-être et médecine préventive'),
('Voyage', 'Récits de voyage, guides pratiques et conseils touristiques'),
('Cuisine', 'Recettes, techniques culinaires et astuces de cuisine'),
('Sport', 'Actualités sportives, conseils d\'entraînement et nutrition'),
('Éducation', 'Pédagogie, conseils d\'apprentissage et innovations éducatives'),
('Finance', 'Gestion budgétaire, investissements et actualités économiques'),
('Mode', 'Tendances, conseils style et actualités de la mode');

/******* INSERTION DANS TABLE Article *******/
INSERT INTO Article (titre, contenu, date_creation, date_modification, status, view_count, username, id_categorie) VALUES
('Les Nouvelles Tensions Technologiques en 2024', 'Explorez les technologies émergentes qui vont transformer notre quotidien cette année...', '2024-02-20 10:00:00', '2024-02-21 11:00:00', 'published', 1245, 'pierre_leroy', 1),
('Comment Maintenir une Bonne Santé au Travail', 'Des conseils pratiques pour préserver votre santé physique et mentale...', '2024-02-25 14:30:00', '2024-02-25 14:30:00', 'published', 876, 'sophie_martin', 2),
('Les 10 Destinations à Visiter Absolument en 2024', 'Découvrez les destinations qui vont marquer l''année 2024...', '2024-03-05 09:15:00', '2024-03-06 10:30:00', 'draft', 0, 'jean_dupont', 3),
('Recette du Gâteau au Chocolat Fondant', 'Une recette simple et rapide pour un gâteau au chocolat irrésistible...', '2024-03-10 16:45:00', '2024-03-11 08:30:00', 'published', 2345, 'lucie_bernard', 4),
('Préparation Marathon : Guide Complet du Débutant', 'Tout ce qu''il faut savoir pour préparer son premier marathon...', '2024-03-15 08:00:00', '2024-03-16 09:15:00', 'published', 1567, 'marc_vincent', 5),
('Apprendre à Coder en 6 Mois : Mon Parcours', 'Comment j''ai appris la programmation web en moins de 6 mois...', '2024-03-20 10:30:00', '2024-03-21 11:45:00', 'published', 3210, 'david_morel', 6),
('Investir dans la Cryptomonnaie en 2024', 'Guide pour débutants sur les opportunités et risques...', '2024-04-01 12:00:00', '2024-04-02 13:30:00', 'published', 1890, 'nicolas_lambert', 7),
('Les Tendances Mode Printemps-Été 2024', 'Découvrez les must-have de la saison prochaine...', '2024-04-05 15:45:00', '2024-04-06 16:20:00', 'published', 943, 'antoine_chevalier', 8),
('Les Avantages du Télétravail pour la Productivité', 'Comment le travail à distance peut booster vos performances...', '2024-04-10 18:20:00', '2024-04-11 10:15:00', 'published', 1123, 'amelie_colin', 1),
('Les Superaliments pour Renforcer l''Immunité', '10 aliments à intégrer dans votre alimentation pour être en forme...', '2024-04-15 09:30:00', '2024-04-16 14:20:00', 'published', 765, 'clara_royer', 2),
('Voyager en Solo : Mes Conseils Sécurité', 'Guide pratique pour voyager seul en toute sécurité...', '2024-04-20 11:45:00', '2024-04-21 09:30:00', 'published', 890, 'vincent_gauthier', 3),
('Les Bases de la Pâtisserie Française', 'Apprenez les techniques fondamentales de la pâtisserie...', '2024-05-02 14:10:00', '2024-05-03 16:40:00', 'draft', 0, 'marine_lebrun', 4),
('Yoga pour Débutants : Programme sur 30 Jours', 'Un programme progressif pour découvrir le yoga...', '2024-05-10 11:45:00', '2024-05-11 12:30:00', 'published', 654, 'jean_dupont', 5),
('Les Méthodes d''Apprentissage des Langues Efficaces', 'Comparatif des différentes approches pour apprendre une langue...', '2024-05-20 16:30:00', '2024-05-21 17:15:00', 'published', 432, 'lucie_bernard', 6),
('Économiser pour Son Premier Achat Immobilier', 'Stratégies pour constituer son apport personnel...', '2024-06-01 08:15:00', '2024-06-02 10:20:00', 'published', 987, 'marc_vincent', 7),
('Le Style Minimaliste : Less is More', 'Comment adopter une garde-robe minimaliste et élégante...', '2024-06-10 10:40:00', '2024-06-11 11:50:00', 'published', 543, 'david_morel', 8),
('Introduction à l''Intelligence Artificielle', 'Comprendre les bases de l''IA et ses applications...', '2024-06-15 13:25:00', '2024-06-16 14:30:00', 'published', 1876, 'nicolas_lambert', 1),
('La Méditation pour Réduire le Stress', 'Techniques de méditation accessibles à tous...', '2024-07-03 17:50:00', '2024-07-04 18:45:00', 'draft', 0, 'antoine_chevalier', 2),
('Voyager avec un Petit Budget', 'Astuces pour voyager sans se ruiner...', '2024-07-12 12:05:00', '2024-07-13 13:10:00', 'published', 765, 'clara_royer', 3),
('Les Plats Typiques de la Cuisine Marocaine', 'Découverte des saveurs et traditions culinaires du Maroc...', '2024-07-20 15:20:00', '2024-07-21 16:25:00', 'published', 1098, 'amelie_colin', 4),
('Préparation Physique pour le Ski', 'Conseils pour se préparer avant la saison de ski...', '2024-08-01 09:30:00', '2024-08-02 10:35:00', 'draft', 0, 'vincent_gauthier', 5),
('Les Outils Numériques pour l''Éducation', 'Les meilleures applications pour apprendre et enseigner...', '2024-08-10 14:45:00', '2024-08-11 15:50:00', 'published', 876, 'marine_lebrun', 6),
('Comprendre les Marchés Boursiers', 'Guide pour débutants en bourse...', '2024-08-20 11:20:00', '2024-08-21 12:25:00', 'published', 654, 'pierre_leroy', 7),
('Le Style Casual Chic au Bureau', 'Comment être élégant tout en restant confortable...', '2024-09-01 16:30:00', '2024-09-02 17:35:00', 'published', 432, 'sophie_martin', 8),
('La Sécurité Informatique pour les Particuliers', 'Protégez vos données et votre vie privée en ligne...', '2024-09-10 08:15:00', '2024-09-11 09:20:00', 'published', 1567, 'jean_dupont', 1),
('L''Importance du Sommeil pour la Santé', 'Comment améliorer la qualité de son sommeil...', '2024-09-20 10:25:00', '2024-09-21 11:30:00', 'published', 765, 'lucie_bernard', 2),
('Les Plus Beaux Villages de France', 'Découverte des villages classés parmi les plus beaux de France...', '2024-10-01 14:35:00', '2024-10-02 15:40:00', 'published', 987, 'marc_vincent', 3),
('Les Techniques de Cuisson Santé', 'Cuire ses aliments tout en préservant les nutriments...', '2024-10-10 16:45:00', '2024-10-11 17:50:00', 'published', 543, 'david_morel', 4),
('Le CrossFit : Avantages et Risques', 'Analyse complète de cette discipline sportive...', '2024-10-20 12:55:00', '2024-10-21 13:00:00', 'published', 876, 'nicolas_lambert', 5),
('Apprendre par le Jeu : La Ludopédagogie', 'Utiliser le jeu comme outil d''apprentissage...', '2024-11-01 09:05:00', '2024-11-02 10:10:00', 'published', 654, 'antoine_chevalier', 6);
/******* INSERTION DANS TABLE Commentaire *******/
INSERT INTO Commentaire (contenu, date_commentaire, username, email, status, id_article) VALUES
('Excellent article sur les nouvelles technologies !', '2024-02-22 14:30:00', 'jean_dupont', 'jean.dupont@yahoo.fr', 'approved', 1),
('Je suis d''accord avec l''analyse présentée.', '2024-02-23 10:15:00', 'sophie_martin', 'sophie.martin@protonmail.com', 'approved', 1),
('Conseils pratiques pour la santé au travail.', '2024-02-26 11:45:00', 'thomas_petit', 'thomas.petit@gmail.com', 'approved', 2),
('Belles photos de voyage.', '2024-02-28 16:20:00', 'julie_roux', 'julie.roux@protonmail.com', 'pending', 3),
('Recette délicieuse et facile à réaliser.', '2024-03-01 10:30:00', 'marc_vincent', 'marc.vincent@yahoo.fr', 'approved', 4),
('Guide très utile pour les débutants en sport.', '2024-03-02 08:45:00', 'isabelle_leroy', 'isabelle.leroy@gmail.com', 'approved', 5),
('Explications claires sur la programmation.', '2024-03-03 13:20:00', 'david_morel', 'david.morel@email.com', 'approved', 6),
('Trop risqué selon moi.', '2024-03-04 17:10:00', 'caroline_duval', 'caroline.duval@protonmail.com', 'rejected', 7),
('J''adore les tendances de cette saison !', '2024-03-05 12:30:00', 'nicolas_lambert', 'nicolas.lambert@gmail.com', 'approved', 8),
('Le télétravail a amélioré ma productivité.', '2024-03-06 15:45:00', 'elodie_garnier', 'elodie.garnier@email.com', 'approved', 9),
('Super conseils pour renforcer l''immunité.', '2024-03-07 10:15:00', 'antoine_chevalier', 'antoine.chevalier@yahoo.fr', 'approved', 10),
('Voyager seul est une belle expérience.', '2024-03-08 14:20:00', 'clara_royer', 'clara.royer@protonmail.com', 'approved', 11),
('La pâtisserie française est excellente.', '2024-03-09 09:30:00', 'quentin_menard', 'quentin.menard@gmail.com', 'pending', 12),
('Le yoga m''aide beaucoup.', '2024-03-10 16:40:00', 'amelie_colin', 'amelie.colin@email.com', 'approved', 13),
('Méthodes intéressantes pour apprendre.', '2024-03-11 11:55:00', 'vincent_gauthier', 'vincent.gauthier@protonmail.com', 'approved', 14),
('Bon guide pour les premiers investissements.', '2024-03-12 13:25:00', 'marine_lebrun', 'marine.lebrun@gmail.com', 'approved', 15),
('Le style minimaliste est élégant.', '2024-03-13 10:10:00', 'pierre_leroy', 'pierre.leroy@gmail.com', 'approved', 16),
('Introduction claire à l''intelligence artificielle.', '2024-03-14 15:30:00', 'lucie_bernard', 'lucie.bernard@email.com', 'approved', 17),
('La méditation est bénéfique.', '2024-03-15 08:45:00', 'marie_dubois', 'marie.dubois@email.com', 'pending', 18),
('Conseils pratiques pour économiser en voyage.', '2024-03-16 17:20:00', 'admin_blog', 'admin@blogcms.com', 'approved', 19),
('La cuisine marocaine est délicieuse.', '2024-03-17 12:35:00', 'sophie_martin', 'sophie.martin@protonmail.com', 'approved', 20),
('Préparation utile pour le ski.', '2024-03-18 09:50:00', 'jean_dupont', 'jean.dupont@yahoo.fr', 'approved', 21),
('Outils numériques essentiels pour l''éducation.', '2024-03-19 14:15:00', 'thomas_petit', 'thomas.petit@gmail.com', 'approved', 22),
('Article technique sur la bourse.', '2024-03-20 11:25:00', 'julie_roux', 'julie.roux@protonmail.com', 'rejected', 23),
('Style parfait pour le bureau.', '2024-03-21 16:40:00', 'marc_vincent', 'marc.vincent@yahoo.fr', 'approved', 24),
('La sécurité informatique est importante.', '2024-03-22 10:30:00', 'isabelle_leroy', 'isabelle.leroy@gmail.com', 'approved', 25),
('Le sommeil est crucial pour la santé.', '2024-03-23 13:45:00', 'david_morel', 'david.morel@email.com', 'approved', 26),
('Les villages de France sont magnifiques.', '2024-03-24 09:20:00', 'caroline_duval', 'caroline.duval@protonmail.com', 'approved', 27),
('Techniques de cuisson utiles.', '2024-03-25 15:10:00', 'nicolas_lambert', 'nicolas.lambert@gmail.com', 'approved', 28),
('Le CrossFit demande de la discipline.', '2024-03-26 11:35:00', 'elodie_garnier', 'elodie.garnier@email.com', 'approved', 29),
('Apprendre par le jeu est efficace.', '2024-03-27 14:50:00', 'antoine_chevalier', 'antoine.chevalier@yahoo.fr', 'approved', 30);
