CREATE DATABASE netstream;

CREATE TABLE realisateur (
    id_realisateur UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom_realisateur VARCHAR(50) NOT NULL,
    prenom_realisateur VARCHAR(50) NOT NULL
);

CREATE TABLE film (
    id_film UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    titre VARCHAR(250) NOT NULL,
    date_de_sortie DATE NOT NULL,
    duree TIME NOT NULL,
    id_realisateur UUID NOT NULL,
    FOREIGN KEY (id_realisateur) REFERENCES realisateur(id_realisateur)
);

CREATE TABLE role_film (
    id_role UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom_role VARCHAR(150) NOT NULL,
    id_film UUID NOT NULL,
    FOREIGN KEY (id_film) REFERENCES film(id_film)
);

CREATE TABLE acteur (
    id_acteur UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom_acteur VARCHAR(50) NOT NULL,
    prenom_acteur VARCHAR(50) NOT NULL,
    date_de_naissance DATE NOT NULL
);

CREATE TABLE cinephile (
    id_cinephile UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom_cinephile VARCHAR(50) NOT NULL,
    prenom_cinephile VARCHAR(50) NOT NULL,
    email VARCHAR(320) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(72) NOT NULL
);

CREATE TABLE role_preferer (
    id_cinephile UUID NOT NULL,
    id_role UUID NOT NULL,
    FOREIGN KEY (id_cinephile) REFERENCES cinephile(id_cinephile),
    FOREIGN KEY (id_role) REFERENCES role_film(id_role)
);

CREATE TABLE film_preferer (
    id_cinephile UUID NOT NULL,
    id_film UUID NOT NULL,
    FOREIGN KEY (id_cinephile) REFERENCES cinephile(id_cinephile),
    FOREIGN KEY (id_film) REFERENCES film(id_film)
);

CREATE TABLE jouer (
    id_acteur UUID NOT NULL,
    id_role UUID NOT NULL,
    FOREIGN KEY (id_acteur) REFERENCES acteur(id_acteur),
    FOREIGN KEY (id_role) REFERENCES role_film(id_role)
);

CREATE TABLE archive (
    id_archive UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_cinephile UUID NOT NULL,
    champ_modifie VARCHAR(50) NOT NULL,
    ancienne_valeur TEXT NOT NULL,
    nouvelle_valeur TEXT NOT NULL,
    date_modification TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);