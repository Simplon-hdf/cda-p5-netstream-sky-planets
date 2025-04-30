# 📦 Politique de sauvegarde

## 🎯 Objectif
Afin de limiter les risques liés à toutes sortes de menaces et dégâts (piratage, erreur humaine...), une politique de sauvegarde est à mettre en place pour Netstream. Dans notre contexte, le risque majeur est l'erreur humaine, lors du développement actif et intensif de l'application.

Ainsi, en cas de problème majeur et manque de bonne pratique de sauvegarde manuelle, il est possible de restaurer la base de données à un point antérieur. L'impact sur la conception et le développement est ainsi minimisé.


## 🔁 Fréquence
Avec l'aide d'une tâche planifiée CRON, une sauvegarde sera effectuée tous les jours à 01:00.

Bien qu'il soit une meilleure pratique de faire des sauvegardes partielles journalières et sauvegardes complètes de manière hebdomadaires, nous avons décidé, pour l'instant, de rester sur des sauvegardes complètes uniquement.


## 💾 Mise en place de la politique de sauvegarde.
Pour mettre en place la tâche CRON, créer un dossier dédié à netstream, et y placer ces lignes dans un fichier `backup.sh`:

```bash
#!/bin/bash
/usr/bin/pg_dump -U nom_compte -d nom_bdd -F c -f "/chemin/vers/dossier/netstream/backups/netstream_$(date +%F).dump"
```

> *Ne pas oublier de rendre le script éxécutable !* `chmod +x /chemin/vers/dossier/netstream/backup.sh`

> *Il faut aussi que le compte ait accès à la base de données, sans entrer de mot de passe. La solution adoptée ici est de créer un fichier le contenant, `~/.pgpass`, contenant une ligne avec `localhost:port:nom_bdd:nom_compte:mot_de_passe` et en restreignant l'accès avec `chmod 600 ~/.pgpass`.*

Ensuite, éxécuter dans le terminal bash `crontab -e`.
Une fois dans l'éditeur, rajouter cette ligne à la fin du fichier:
`0 1 * * * /chemin/vers/dossier/netstream/backup.sh >> /chemin/vers/dossier/netstream/backups/backup.log 2>&1`

La sauvegarde avec CRON est maintenant en place. Les sauvegardes se trouveront dans le dossier spécifié (ici, `/chemin/vers/dossier/netstream/backups/[date].dump`), et dans le cas d'une erreur, elle s'écrira le fichier log (ici, `/chemin/vers/dossier/netstream/backups/backup.log`).


Pour tester la restauration, il est possible de créer une base de données de test et importer la sauvegarde. Pour ce faire:
*Créer une base de données*
```bash
createdb -U nom_compte netstream_test
```

*Restauration*
```bash
pg_restore -U nom_compte -d netstream_test /chemin/vers/dossier/netstream/backups/[date].dump
```


## Futures améliorations
Dans le cas d'un développement rapide de l'application Netstream avec une expansion de la base de données à l'avenir, il peut être intéressant d'avoir un backup complet journalier.

Le coût reste relativement faible, puisque les données peuvent seraient assez peu nombreuses pendant un moment. De plus, modifier ce système de sauvegarde représente assez peu de risque de d'efforts supplémentaires.


### Bonne pratique de sauvegarde : règle 3–2–1

Il est recommandé de suivre la règle 3–2–1, considérée comme une référence en matière de sauvegarde :
- 3 copies des données
- 2 supports différents (disque local, cloud, NAS, etc.)
- 1 copie hors site (cloud, serveur distant, stockage externe déplacé)

Dans le contexte de Netstream, cela signifie par exemple :
- Une sauvegarde locale sur le serveur (dossier `backups`)
- Une copie automatisée vers un autre disque ou un NAS
- Une synchronisation régulière vers un cloud chiffré (ou une clé USB déplacée physiquement)

*(Comment expliqué plus haut, ce système n’est pas encore en place dans Netstream, mais doit être envisagé à moyen terme pour garantir une résilience face aux pertes physiques ou logiques.)*
