-- Update un film
CREATE OR REPLACE PROCEDURE update_film(
    IN p_id_film UUID,
    IN p_titre VARCHAR(250),
    IN p_date_de_sortie SMALLINT,
    IN p_duree TIME,
    IN p_id_realisateur UUID,
)
LANGUAGE plpgsql
AS $$
BEGIN 
    UPDATE film 
    SET titre = COALESCE(p_titre, titre),
        date_de_sortie = COALESCE(p_date_de_sortie,date_de_sortie),
        duree = COALESCE(p_duree, duree),
        id_realisateur = COALESCE(p_id_realisateur, id_realisateur)
    WHERE id_film = p_id_film;
END;
$$;

-- Appeler la procédure
CALL update_film('43748c8d-df99-426d-9903-792d1cfa84fb', 'Mario Bros', NULL, NULL, NULL);

-- Delete un réalisateur et les films associés
CREATE OR REPLACE PROCEDURE delete_realisateur(
    IN p_id_realisateur UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM film WHERE id_realisateur = p_id_realisateur;
    DELETE FROM realisateur WHERE id_realisateur = p_id_realisateur;
END;
$$;

-- Appeler la procédure
CALL delete_realisateur('43748c8d-df99-426d-9903-792d1cfa84fb');

-- Delete un film et les rôles associés 
CREATE OR REPLACE PROCEDURE delete_film(
    IN p_id_film UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM role_film WHERE id_film = p_id_film;
    DELETE FROM film WHERE id_film = p_id_film;
END;
$$;

-- Appeler la procédure
CALL delete_film('43748c8d-df99-426d-9903-792d1cfa84fb');

-- Créer un réalisateur
CREATE OR REPLACE PROCEDURE create_realisateur(
    IN p_nom_realisateur VARCHAR(50),
    IN p_prenom_realisateur VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN 
    INSERT INTO realisateur (nom_realisateur, prenom_realisateur) 
    VALUES (p_nom_realisateur, p_prenom_realisateur);
END;
$$;

-- Appeler la procédure
CALL create_realisateur('John', 'Doe');

-- Créer un film 
CREATE OR REPLACE PROCEDURE create_film(
    IN p_titre VARCHAR(250),
    IN p_date_sortie_film DATE,
    IN p_duree TIME,
    IN p_id_realisateur UUID
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
    INSERT INTO film (titre, date_sortie_film, duree, id_realisateur) 
    VALUES (p_titre, p_date_sortie_film, p_duree, p_id_realisateur);
END;
$$;

-- Appeler la procédure
CALL create_film('Mario Bros', '2024-04-01', '01:30:00', '43748c8d-df99-426d-9903-792d1cfa84fb');
