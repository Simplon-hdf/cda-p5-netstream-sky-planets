# 🎬 NetStream Sky Planets

## 🌟 À propos

NetStream Sky Planets est une plateforme innovante de gestion de films, permettant aux cinéphiles de découvrir, suivre et partager leur passion pour le cinéma. Notre application offre une expérience utilisateur unique avec une base de données riche en informations sur les films, acteurs et réalisateurs.

## ✨ Fonctionnalités

### 🎭 Pour les Cinéphiles
- 👤 Création et gestion de compte
- 🔍 Recherche avancée par acteur ou film
- ❤️ Création de listes de films et rôles préférés
- 🔐 Système d'authentification sécurisé

### 🎬 Gestion des Films
- 📽️ Base de données complète de films
- 👥 Information détaillée sur les acteurs et leurs rôles
- 🎯 Détails sur les réalisateurs
- ⏱️ Informations sur la durée et l'année de sortie

### 🛡️ Sécurité et Confidentialité
- 🔒 Mots de passe sécurisés avec hachage Argon2
- 📝 Système d'archivage des modifications
- 🔐 Protection des données utilisateurs

## 🚀 Installation

```bash
# Cloner le repository
https://github.com/Simplon-hdf/cda-p5-netstream-sky-planets

# Se déplacer dans le dossier
cd cda-p5-netstream-sky-planets
```
```sql
-- Select film et date par ordre du plus recent au plus ancien
SELECT titre_film, date_sortie_film
FROM film
ORDER BY date_sortie_film DESC;

-- requete age en dessous de 30
SELECT nom_acteur, prenom_acteur, age_acteur
FROM (
  SELECT nom_acteur, prenom_acteur, TRUNC((CURRENT_DATE - date_de_naissance)/365.25) "age_acteur"
  FROM acteur
)
WHERE age_acteur > 30 
ORDER BY nom_acteur;

-- Select les acteurs principaux d'un film donné
SELECT 
    a.nom_acteur,
    a.prenom_acteur,
    rf.nom_role,
    f.titre
FROM 
    acteur a
    INNER JOIN jouer j ON a.id_acteur = j.id_acteur
    INNER JOIN role_film rf ON j.id_role = rf.id_role
    INNER JOIN film f ON rf.id_film = f.id_film
WHERE 
    f.titre like '%Minecraft%'
ORDER BY 
    a.nom_acteur, 
    a.prenom_acteur;

-- Select le film par rapport au acteur
SELECT  
    a.nom_acteur,
    a.prenom_acteur,
    rf.nom_role,
    f.titre
FROM 
    acteur a
    INNER JOIN jouer j ON a.id_acteur = j.id_acteur
    INNER JOIN role_film rf ON j.id_role = rf.id_role
    INNER JOIN film f ON rf.id_film = f.id_film
WHERE 
    lower(a.nom_acteur) like '%jack%' AND lower(a.prenom_acteur) like '%black%'
ORDER BY 
    f.titre;

-- Ajouter un film
insert into film (titre, annee_de_sortie, duree, id_realisateur) values ('mario film', 2023, '01:32', '43748c8d-df99-426d-9903-792d1cfa84fb'); 

-- Ajouter un acteur
insert into acteur (nom_acteur, prenom_acteur, date_de_naissance) values ('Chris', 'pratt', '1979-06-21');

-- Modifier le titre du film
UPDATE film SET titre = 'Super Mario Bros, le film' WHERE titre = 'mario film';

-- Afficher les 3 derniers acteurs ajoutés
select * from acteur limit 3 offset (SELECT (count(0)-3) FROM acteur);

-- Suprimer un acteur
delete from acteur where nom_acteur = 'black';

-- creer une procedure stockée permettant d'afficher la liste des films d'un realisateur en parametre
CREATE OR REPLACE FUNCTION film_realisateur(nom VARCHAR(50), prenom VARCHAR(50))
RETURNS TABLE(titre VARCHAR(250), nom_realisateur VARCHAR(50), prenom_realisateur VARCHAR(50))
AS $$
BEGIN
RETURN QUERY
SELECT film.titre, r.nom_realisateur,r.prenom_realisateur
FROM film
JOIN realisateur r
ON r.id_realisateur = film.id_realisateur
WHERE r.nom_realisateur = nom            
AND r.prenom_realisateur = prenom;
END;
$$ LANGUAGE plpgsql;
-- appeler la procedure
select * from film_realisateur('Jelenic', 'Michael');
-- gerer le CRUD pour l'ajout d'un nouvelles acteur au sein d'un film via une procedure stockée


```


## 📚 Documentation

Pour plus d'informations sur l'utilisation de l'application, consultez :
- [Règles de Gestion](./regle-gestion.md)
- [Dictionnaire de Données](./dictionnaire-de-donnees.md)

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. 🍴 Forker le projet
2. 🔧 Créer une branche pour votre fonctionnalité
3. 📝 Commiter vos changements
4. 🚀 Pusher vers la branche
5. 🎉 Ouvrir une Pull Request

## 📞 Contact

Pour toute question ou suggestion, n'hésitez pas à ouvrir une issue ou à nous contacter directement.

---
<div align="center">
  
Fait avec ❤️ par l'équipe NetStream Sky Planets

</div>