# SUIVI DE PROJET

### Groupe LELOUP LECOQ

* SAE ERP / CRM (Dolibar)
* Chef de projet : Enguerran LECOQ
* Autre membre : Quentin LELOUP
* Début du projet : 05/11/2024


## Séance n° 1

* 05/11 > 14H30 - 17H30
* Travail effectué : Création du Readme, du document suivi de projet
  et recherche de l'environnement idéale pour le projet
* A faire à la prochaine séance : découvrir dolibarr + regarder des tutos
* Difficultés rencontrées : aucune
* Remarques divers : ne pas utiliser de windows du aux scripts a effectuer en bash


## Séance n° 2

* 06/11 > 8H30 - 11H30
* Travail effectué : Prise en main de l'interface web dolibarr, création de user et user group
* A faire à la prochaine séance : création des utilisateurs basiques : super-admin, admin, user + ajout de module(s) à des fins de tests.
* Difficultés rencontrées : création du dockerfiles avec les bon user et la bonne liaisons à la DB.
* Remarques sur la séances (membre absent, pbe technique, ...) : aucune


## Séance n° 3

* 07/11 > 8H30 - 11H30
* Travail effectué : tests des nouveaux modules installé + la gestion des utilisateurs
* A faire à la prochaine séance : comprendre la BDD
* Difficultés rencontrées : compréhension générale de l'ERP Dolibarr
* Remarques sur la séances (membre absent, pbe technique, ...)

## Séance n° 4

* 07/11 > 13H00 - 19H00
* Travail effectué : découverte de la BDD + début de la création du script import csv (découverte de toutes les tables + les éléments essentiels)
* A faire à la prochaine séance : continuer le script et effectuer des tests simple avec.
* Difficultés rencontrées : connexion à la base de données en ligne de commande pour le code de manière sécurisé.
* Remarques sur la séances (membre absent, pbe technique, ...)

## Séance n° 5

* 12/11 > 8H30 - 11H30
* Travail effectué : tests d'import de DATA pour la table llx_user + script pour voir toutes les tables + scripts d'import de DATA en format csv
* A faire à la prochaine séance : création scripts preprocesing pour les fichiers csv + finalisation des DockerFile 
* Difficultés rencontrées : structure du script et de la forme de la table llx_user
* Remarques sur la séances (membre absent, pbe technique, ...)


## Séance n° 6

* 12/11 > 13H00 - 16H00
* Travail effectué : mettre une build image pour mariadb + ajout des volumes
* A faire à la prochaine séance : réussir a se connecter a dolibarr
* Difficultés rencontrées : connexion à dolibarr impossible, erreur "wrong login or password"
* Remarques sur la séances (membre absent, pbe technique, ...) : problème de connexion sur dolibarr non résolu

## Séance n° 7

* 04/12 > 8H30 - 11H30
* Travail effectué : créer un script qui ajoute dans la crontab le script d'export dump de la BDD + dans le docker compose ajout de nom pour les conteneures + ajout de volumes bind mount
* A faire à la prochaine séance : faire script modification csv + backup + import backup
* Difficultés rencontrées : 
* Remarques sur la séances (membre absent, pbe technique, ...) : 

## Séance n° 8

* 04/12 > 13H00 - 17H30
* Travail effectué : ajustement du dockerfile (installation de la cron pour sauvegarde journalière) et docker-compose + création des scripts modification csv + backup BDD + import backup BDD
* A faire à la prochaine séance : voir pour activer tous les modules directement
* Difficultés rencontrées : 
* Remarques sur la séances (membre absent, pbe technique, ...) : 
...
