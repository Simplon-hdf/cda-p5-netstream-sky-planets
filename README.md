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
-- Récupérer les films avec leur date, dans l'ordre de sortie
SELECT titre, date_de_sortie
FROM film
ORDER BY date_de_sortie DESC;

-- Récupérer les acteurs de plus de 30 ans
SELECT nom_acteur, prenom_acteur, age_acteur
FROM (
  SELECT nom_acteur, prenom_acteur, TRUNC((CURRENT_DATE - date_de_naissance)/365.25) AS age_acteur
  FROM acteur
)
WHERE age_acteur > 30 
ORDER BY nom_acteur;

-- Lister les acteurs/actrices principaux d’un film donné
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
    f.titre ILIKE '%Minecraft%'
ORDER BY 
    a.nom_acteur, 
    a.prenom_acteur;

-- Lister les films pour un acteur/actrice donné
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
    a.nom_acteur ILIKE '%jack%' 
    AND a.prenom_acteur ILIKE '%black%'
ORDER BY 
    f.titre;

-- Ajouter un film
INSERT INTO film (titre, annee_de_sortie, duree, id_realisateur)
VALUES ('Mario Film', 2023, '01:32', '43748c8d-df99-426d-9903-792d1cfa84fb'); 

-- Ajouter un acteur
INSERT INTO acteur (nom_acteur, prenom_acteur, date_de_naissance)
VALUES ('Chris', 'Pratt', '1979-06-21');

-- Modifier le titre du film
UPDATE film
SET titre = 'Super Mario Bros, le film'
WHERE titre = 'Mario Film';

-- Afficher les 3 derniers acteurs ajoutés
SELECT * 
FROM acteur 
LIMIT 3 OFFSET (
    SELECT COUNT(0) - 3 FROM acteur
);

-- Supprimer un acteur
DELETE FROM acteur
WHERE nom_acteur = 'Black';

-- PROCÉDURES STOCKÉES / FONCTIONS

-- Afficher la liste des films d’un réalisateur en paramètre
CREATE OR REPLACE FUNCTION film_realisateur(nom VARCHAR(50), prenom VARCHAR(50))
RETURNS TABLE(titre VARCHAR(250), nom_realisateur VARCHAR(50), prenom_realisateur VARCHAR(50))
AS $$
BEGIN
    RETURN QUERY
    SELECT film.titre, r.nom_realisateur, r.prenom_realisateur
    FROM film
    JOIN realisateur r ON r.id_realisateur = film.id_realisateur
    WHERE r.nom_realisateur = nom AND r.prenom_realisateur = prenom;
END;
$$ LANGUAGE plpgsql;

-- Appeler la fonction
SELECT * FROM film_realisateur('Jelenic', 'Michael');

-- Ajout d’un acteur
CREATE OR REPLACE PROCEDURE create_actor(
    IN p_nom_acteur VARCHAR(50),
    IN p_prenom_acteur VARCHAR(50),
    IN p_date_de_naissance DATE
)
LANGUAGE plpgsql
AS $$ 
BEGIN
    INSERT INTO acteur (nom_acteur, prenom_acteur, date_de_naissance)
    VALUES (p_nom_acteur, p_prenom_acteur, p_date_de_naissance);
END; 
$$;

-- Appeler la procédure
CALL create_actor('John', 'Doe', '1990-01-01');

-- Supprimer un acteur et les rôles associés
CREATE OR REPLACE PROCEDURE delete_acteur(
    IN p_id_acteur UUID
)
LANGUAGE plpgsql
AS $$
BEGIN 
    DELETE FROM jouer WHERE id_acteur = p_id_acteur;
    DELETE FROM acteur WHERE id_acteur = p_id_acteur;
END;
$$;

-- Appeler la procédure
CALL delete_acteur('43748c8d-df99-426d-9903-792d1cfa84fb');

-- Modifier un acteur
CREATE OR REPLACE PROCEDURE update_acteur(
    IN p_id_acteur UUID,
    IN p_nom_acteur VARCHAR(50),
    IN p_prenom_acteur VARCHAR(50),
    IN p_date_de_naissance DATE,
    IN p_id_role UUID
)
LANGUAGE plpgsql
AS $$ 
BEGIN
    UPDATE acteur 
    SET nom_acteur = COALESCE(p_nom_acteur, nom_acteur),
        prenom_acteur = COALESCE(p_prenom_acteur, prenom_acteur),
        date_de_naissance = COALESCE(p_date_de_naissance, date_de_naissance)
    WHERE id_acteur = p_id_acteur; 

    UPDATE jouer
    SET id_acteur = COALESCE(p_id_acteur, id_acteur)
    WHERE id_role = p_id_role; 
END;
$$;

-- Appeler la procédure
CALL update_acteur(
    '793420c4-71f4-43e5-a76b-ea47fd346d0a', 
    NULL, NULL, NULL, 
    'e5a75a4f-713d-4392-b1d3-d130fc48d446'
);

-- Rechercher un acteur
CREATE OR REPLACE FUNCTION recherche_acteur(
    IN p_nom_acteur VARCHAR(50),
    IN p_prenom_acteur VARCHAR(50)
)
RETURNS TABLE ( 
    id_acteur UUID,
    nom_acteur VARCHAR(50),
    prenom_acteur VARCHAR(50),
    date_de_naissance DATE
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
    RETURN QUERY 
    SELECT a.id_acteur, a.nom_acteur, a.prenom_acteur, a.date_de_naissance
    FROM acteur a
    WHERE (p_nom_acteur IS NULL OR a.nom_acteur = p_nom_acteur)
        AND (p_prenom_acteur IS NULL OR a.prenom_acteur = p_prenom_acteur);
END;
$$;

-- Appeler la fonction
SELECT * FROM recherche_acteur('Black', 'Jack');

-- Créer un acteur et un rôle pour un film
CREATE OR REPLACE PROCEDURE create_acteur_role(
    IN p_id_acteur UUID,
    IN p_prenom_acteur VARCHAR(50),
    IN p_nom_acteur VARCHAR(50), 
    IN p_date_de_naissance DATE,
    IN p_nom_role VARCHAR(150),
    IN p_id_role UUID,
    IN p_id_film UUID
) 
LANGUAGE plpgsql 
AS $$
DECLARE
    v_exists BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM acteur WHERE id_acteur = p_id_acteur) INTO v_exists;

    IF NOT v_exists THEN
        INSERT INTO acteur (id_acteur, prenom_acteur, nom_acteur, date_de_naissance)
        VALUES (p_id_acteur, p_prenom_acteur, p_nom_acteur, p_date_de_naissance);
    END IF;

    SELECT EXISTS(SELECT 1 FROM role_film WHERE id_role = p_id_role) INTO v_exists;

    IF NOT v_exists THEN
        INSERT INTO role_film (id_role, nom_role, id_film)
        VALUES (p_id_role, p_nom_role, p_id_film);
    END IF;

    INSERT INTO jouer (id_acteur, id_role)
    VALUES (p_id_acteur, p_id_role);
END;
$$;

-- Exemple : Chuck Norris joue Dieu dans Minecraft
CALL create_acteur_role(
    '567e31c2-a4bd-4b4a-a096-ec32e643936c',
    'Chuck', 'Norris',
    '1985-05-10',
    'Dieu',
    'e5a75a4f-713d-4392-b1d3-d130fc48d446',
    'cd219724-f963-436f-abec-e2bd31c2f9b7'
);


-- Trigger pour la table archive qui vient ce mettre a jour lorsque l'on modifie une table
CREATE OR REPLACE FUNCTION trigger_archive()
RETURNS trigger 
AS $$ 
BEGIN
    -- Prénom
    IF NEW.prenom_cinephile IS DISTINCT FROM OLD.prenom_cinephile THEN 
        INSERT INTO archive (id_archive,id_cinephile,champ_modifie, ancienne_valeur, nouvelle_valeur, date_modification) VALUES(
            gen_random_uuid(),
            OLD.id_cinephile,
            'prenom_cinephile',
            OLD.prenom_cinephile,
            NEW.prenom_cinephile,
            NOW()
        );
    END IF;

    -- Nom
    IF NEW.nom_cinephile IS DISTINCT FROM OLD.nom_cinephile THEN 
        INSERT INTO archive (id_archive, id_cinephile, champ_modifie, ancienne_valeur, nouvelle_valeur, date_modification) VALUES(
            gen_random_uuid(),
            OLD.id_cinephile,
            'nom_cinephile',
            OLD.nom_cinephile,
            NEW.nom_cinephile,
            NOW()
        );
    END IF;

    -- E-mail
    IF NEW.email IS DISTINCT FROM OLD.email THEN 
        INSERT INTO archive (id_archive, id_cinephile, champ_modifie, ancienne_valeur, nouvelle_valeur, date_modification) VALUES(
            gen_random_uuid(),
            OLD.id_cinephile,
            'email',
            OLD.email,
            NEW.email,
            NOW()
        );
    END IF;
    
    -- Mot de passe 
    IF NEW.mot_de_passe IS DISTINCT FROM OLD.mot_de_passe THEN 
        INSERT INTO archive (id_archive, id_cinephile, champ_modifie, ancienne_valeur, nouvelle_valeur, date_modification) VALUES(
            gen_random_uuid(),
            OLD.id_cinephile,
            'mot_de_passe',
            OLD.mot_de_passe,
            NEW.mot_de_passe,
            NOW()
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER trigger_save_archive
AFTER UPDATE ON cinephile
FOR EACH ROW
EXECUTE FUNCTION trigger_archive();

-- Gestion des droits par rôle
-- Création du rôle administrateur
CREATE ROLE netstream_admin WITH
    LOGIN
    PASSWORD 'mot_de_passe_securise'
    CREATEDB
    CREATEROLE
    REPLICATION
    BYPASSRLS;

-- Création du rôle lecture seule pour les utilisateurs standards
CREATE ROLE netstream_user WITH
    LOGIN
    PASSWORD 'mot_de_passe_utilisateur'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT;

-- Révocation de tous les droits existants sur les tables
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM PUBLIC;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM PUBLIC;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA public FROM PUBLIC;

-- Attribution des droits d'administration complets à l'administrateur
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO netstream_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO netstream_admin;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO netstream_admin;

-- Attribution des droits de lecture seule aux utilisateurs standards
GRANT SELECT ON ALL TABLES IN SCHEMA public TO netstream_user;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO netstream_user;

-- Configuration pour que les nouvelles tables héritent automatiquement des permissions
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT ALL ON TABLES TO netstream_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT ON TABLES TO netstream_user;



-- sudo nano /etc/postgresql/16/main/pg_hba.conf
-- local   all             netstream_user                          scram-sha-256
-- local   all             netstream_admin                         scram-sha-256

-- sudo systemctl restart postgresql.service

-- Exemple d'utilisation :

-- Pour se connecter en tant qu'administrateur :
-- psql -U netstream_admin -d netstream

-- Pour se connecter en tant qu'utilisateur standard :
-- psql -U netstream_user -d netstream

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