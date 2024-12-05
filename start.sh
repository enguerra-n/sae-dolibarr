#!/bin/bash

##############################################
# Explication du script
##############################################
# Ce script utilise docker-compose pour construire les images et démarrer les services
# définis dans le fichier docker-compose.yml.
# Si des erreurs se produisent pendant l'exécution, un message d'erreur sera affiché.
#
# Utilisation : 
# 1. Exécutez ce script pour construire et démarrer les conteneurs Docker.
# 2. Le script vérifie si l'exécution de docker-compose a réussi et affiche un message approprié.
#
# Le script exécutera la commande suivante :
#   docker-compose up --build

# Afficher un message d'information
echo "Démarrage du processus Docker..."

# Construire les images Docker et démarrer les services
docker-compose up --build

# Vérifier si la commande docker-compose a réussi
if [ $? -eq 0 ]; then
    echo "Les services Docker sont maintenant en cours d'exécution."
else
    echo "Une erreur est survenue lors du démarrage des services Docker."
    exit 1
fi
