# Dictionnaire de données

## FILM
| Nom              | Description                          | Type | Format                     | Taille | Exemples                               |
|------------------|--------------------------------------|------|----------------------------|--------|----------------------------------------|
| id_film          | Identifiant du film                  | AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36     | a6b12f6a-d1d3-41db-bafc-8df0055e5242   |
| titre            | Titre du film                        | AN   | -                          | 250    | Minecraft, le film                    |
| annee_de_sortie  | L'année de sortie du film            | N    | -                          | 4      | 2025                                   |
| duree            | Durée du film en minutes             | AN   | 00h 00m                    | 7      | 01h 41m                                |

## ROLE_FILM
| Nom              | Description                          | Type | Format                     | Taille | Exemples                               |
|------------------|--------------------------------------|------|----------------------------|--------|----------------------------------------|
| id_role          | Identifiant du rôle                  | AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36     | a6b12f6a-d1d3-41db-bafc-8df0055e5242   |
| nom_role         | Nom du personnage joué par l'acteur  | AN   | -                          | 150    | Steve                                  |

## ACTEUR
| Nom               | Description                          | Type | Format                     | Taille | Exemples                               |
|-------------------|--------------------------------------|------|----------------------------|--------|----------------------------------------|
| id_acteur         | Identifiant de l'acteur              | AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36     | a6b12f6a-d1d3-41db-bafc-8df0055e5242   |
| nom_acteur        | Nom de l'acteur                      | A    | -                          | 50     | Black                                  |
| prenom_acteur     | Prénom de l'acteur                   | A    | -                          | 50     | Jack                                   |
| date_de_naissance | Date de naissance de l'acteur        | D    | JJ/MM/AAAA                 | 10     | 28/08/1969                             |

## CINEPHILE
| Nom              | Description                          | Type | Format                     | Taille | Exemples                               |
|------------------|--------------------------------------|------|----------------------------|--------|----------------------------------------|
| id_cinephile     | Identifiant du cinéphile             | AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36     | a6b12f6a-d1d3-41db-bafc-8df0055e5242   |
| nom_cinephile    | Nom du cinéphile                     | A    | -                          | 50     | Doe                                    |
| prenom_cinephile | Prénom du cinéphile                  | A    | -                          | 50     | John                                   |
| email            | E-mail du cinéphile                  | AN   | -                          | 320    | exemple@example.ex                     |
| mot_de_passe     | Empreinte du mot de passe            | AN   | -                          | 72     | P0titChat! > `$argon2i$v=19$m=12,t=3,p=1$bHF3bTdmazdsNWEwMDAwMA$l3TBBjTnW3BbvU60aO0TPg` |

## RÉALISATEUR
| Nom              | Description                          | Type | Format                     | Taille | Exemples                               |
|------------------|--------------------------------------|------|----------------------------|--------|----------------------------------------|
| id_realisateur   | Identifiant du réalisateur           | AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36     | a6b12f6a-d1d3-41db-bafc-8df0055e5242   |
| nom_realisateur  | Nom du réalisateur                   | A    | -                          | 50     | Hess                                   |
| prenom_realisateur| Prénom du réalisateur                | A    | -                          | 50     | Jared                                  |

## ARCHIVE_UTILISATEUR
| Nom              | Description                          | Type | Format                     | Taille | Exemples                               |
|------------------|--------------------------------------|------|----------------------------|--------|----------------------------------------|
| id_archive       | Identifiant de l'entrée dans l'archive| AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36     | a6b12f6a-d1d3-41db-bafc-8df0055e5242   |
| id_cinephile     | Identifiant du cinéphile ayant été mis à jour | AN   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | 36 | a6b12f6a-d1d3-41db-bafc-8df0055e5242 |
| champ_modifie    | Nom du champ ayant été modifié dans cinéphile | A   | -                          | 50     | prenom_cinephile                       |
| ancienne_valeur  | Ancienne valeur du champ             | Texte | -                          | -      | Twitter                                |
| nouvelle_valeur  | Nouvelle valeur du champ             | Texte | -                          | -      | X                                      |
| date_modification| Date où le champ a été modifié       | Date-Heure | JJ/MM/AAAA hh:mm:ss      | 0      | 24/07/2023 11h43                      |
