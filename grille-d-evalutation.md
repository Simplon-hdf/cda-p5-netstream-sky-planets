# ✅ Grille d'Évaluation – Mode OK / KO

## 1. Modélisation (Merise)

| Élément                                                                                        | OK  | KO  |
| ---------------------------------------------------------------------------------------------- | :-: | :-: |
| Règles de gestion explicites, identifiables et cohérentes                                      | [x] | [ ] |
| Dictionnaire de données présent, bien structuré (nom, type, contrainte, description, exemples) | [ ] | [x] |
| MCD (Modèle Conceptuel de Données) clair et complet                                            | [ ] | [x] |
| MLD (Modèle Logique de Données) correct et conforme au MCD                                     | [x] | [ ] |
| MPD (Modèle Physique de Données) bien adapté au SGBD choisi                                    | [x] | [ ] |
| Respect des 3 premières formes normales de la méthode Merise                                   | [x] | [ ] |
| Respect de la structure de la base de données demandée par le client                           | [ ] | [x] |
| Benchmark présent pour le choix du SGBDR                                                       | [x] | [ ] |

## 2. Structure de la Base de Données

| Critère                                                                      | OK  | KO  |
| ---------------------------------------------------------------------------- | :-: | :-: |
| Script SQL de création de tables conforme au MPD                             | [x] | [ ] |
| Relations bien modélisées (1-N, N-N avec table de jointure)                  | [x] | [ ] |
| Clés primaires / étrangères correctement définies                            | [x] | [ ] |
| Champs date de création et modification dans chaque table sauf table archive | [x] | [ ] |
| Types de données adaptés                                                     | [x] | [ ] |

## 3. Requêtes SQL fonctionnelles(README.md)

| Requête                                                                 | OK  | KO  |
| ----------------------------------------------------------------------- | :-: | :-: |
| Titres et dates des films (du plus récent au plus ancien)               | [x] | [ ] |
| Acteurs/actrices de plus de 30 ans (nom, prénom, âge), tri alphabétique | [x] | [ ] |
| Acteurs/actrices principaux pour un film donné                          | [x] | [ ] |
| Liste des films pour un acteur/actrice donné                            | [x] | [ ] |
| Ajouter un film                                                         | [x] | [ ] |
| Ajouter un acteur/actrice                                               | [x] | [ ] |
| Modifier un film                                                        | [x] | [ ] |
| Supprimer un acteur/actrice                                             | [x] | [ ] |
| Afficher les 3 derniers acteurs/actrices ajoutés                        | [x] | [ ] |

## 4. Manipulations Avancées fonctionnelles

| Fonctionnalité                                                          | OK  | KO  |
| ----------------------------------------------------------------------- | :-: | :-: |
| Procédure stockée : films d'un réalisateur donné                        | [x] | [ ] |
| Procédure stockée CRUD : gestion des acteurs d'un film                  | [x] | [ ] |
| Trigger : suivi des modifications utilisateurs avec une table d'archive | [x] | [ ] |

## 5. Exportation & Sauvegarde fonctionnelles

| Tâche                                                                                 | OK  | KO  |
| ------------------------------------------------------------------------------------- | :-: | :-: |
| Export SQL bien réalisé et documenté                                                  | [x] | [ ] |
| Script de sauvegarde opérationnel                                                     | [x] | [ ] |
| Politique de rétention documentée (fréquence, durée, restauration, menaces couvertes) | [x] | [ ] |

## 6. Divers

| Divers                                                          | OK  | KO  |
| --------------------------------------------------------------- | :-: | :-: |
| Uniquement l'administrateur peut insérer, modifier ou supprimer | [x] | [ ] |
| README clair avec exemples de requêtes                          | [x] | [ ] |
| Code SQL lisible, indenté, commenté                             | [x] | [ ] |
| Présence d'un script de création de la base données             | [x] | [ ] |
| Présence d'un script de jeu de données fictives cohérentes      | [ ] | [x] |
