#!/bin/bash

###########################################
# Explication du script
###########################################
# Ce script installe et configure le service cron pour exécuter un script de sauvegarde de la base de données chaque jour à 22h.
# Si le service cron n'est pas actif, le script tente de le démarrer.
#
# Utilisation :
# 1. Exécutez ce script pour installer cron et ajouter une tâche cron pour exécuter un script de sauvegarde.
#
# Le script effectue les étapes suivantes :
# - Met à jour le système et installe le service cron.
# - Ajoute une tâche cron pour exécuter un script à 22h chaque jour.
# - Vérifie si le service cron est en cours d'exécution et tente de le démarrer si nécessaire.

# Mettre à jour le système et installer crontab si nécessaire
echo "Mise à jour du système et installation de crontab..."
apt-get update -y
apt-get install -y cron

# Vérifier si le script export-dump.sh existe
SCRIPT_PATH="/home/script/backup_mariadb.sh"
if [[ ! -f "$SCRIPT_PATH" ]]; then
    echo "Erreur : Le fichier $SCRIPT_PATH n'existe pas."
    exit 1
fi

# Ajouter la tâche cron pour exécuter export-dump.sh tous les soirs à 22h
echo "Ajout de la tâche cron..."
(crontab -l ; echo "0 22 * * * $SCRIPT_PATH") | crontab -

# Vérifier si la tâche cron a bien été ajoutée
echo "La tâche cron suivante a été ajoutée :"
crontab -l

service cron start

# Vérifier si le service cron est en cours d'exécution
echo "Vérification de l'état du service cron..."
if service cron status | grep -q 'running'; then
    echo "Le service cron est en cours d'exécution."
else
    echo "Le service cron n'est pas en cours d'exécution. Tentative de démarrage..."
    service cron start
    if service cron status | grep -q 'running'; then
        echo "Le service cron a été démarré avec succès."
    else
        echo "Échec du démarrage du service cron. Veuillez vérifier les logs."
        exit 1
    fi
fi
