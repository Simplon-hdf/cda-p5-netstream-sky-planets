# 📦 Politique de sauvegarde

## 🎯 Objectif
Afin de limiter les risques liés à toutes sortes de menaces et dégâts (piratage, erreur humaine...), une politique de sauvegarde est à mettre en place pour Netstream. Dans notre contexte, le risque majeur est l'erreur humaine, lors du développement actif et intensif de l'application.

Ainsi, en cas de problème majeur et manque de bonne pratique de sauvegarde manuelle, il est possible de restaurer la base de données à un point ultérieur. L'impact sur la conception et le développement est ainsi minimisé.


## 🔁 Fréquence
Avec l'aide d'une tâche planifiée CRON, une sauvegarde sera effectuée tous les jours à 01:00.

Bien qu'il soit meilleure pratique de faire des sauvegardes partielles journalières et sauvegardes complètes de manière hebdomadaires, nous avons décidé de rester sur des sauvegardes complètes uniquement. La raison étant, dans le cas d'un développement rapide de l'application Netstream avec une expansion de la base de données à l'avenir, il peut être intéressant d'avoir un backup complet journalier. Aussi, le coût reste relativement faible, puisque les données de test sont assez peu nombreuses.


## Futures améliorations
3.2.1
