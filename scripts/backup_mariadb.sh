#!/bin/bash

###########################################
# Explication du script
###########################################
# Ce script permet de sauvegarder la base de données MariaDB dans un fichier SQL.
# Il crée un fichier de sauvegarde avec un nom basé sur la date et l'heure actuelle.
# De plus, il supprime les fichiers de sauvegarde plus anciens que 7 jours.
#
# Utilisation : 
# 1. Exécutez ce script pour sauvegarder la base de données.
# 2. Le script crée un fichier de sauvegarde et le stocke dans le répertoire spécifié.
#
# Le script effectue les étapes suivantes :
# - Crée un répertoire de sauvegarde s'il n'existe pas.
# - Effectue une sauvegarde de la base de données.
# - Supprime les anciennes sauvegardes.

# Variables
DB_USER="root"
DB_PASSWORD="root"
DB_NAME="dolibarr"
BACKUP_DIR="/var/lib/backup-mariadb/"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# Création du répertoire de sauvegarde s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Commande pour sauvegarder la base de données
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Supprimer les backups anciens (exemple : garder les 7 derniers jours)
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm -f {} \;

# Message de confirmation
echo "Sauvegarde effectuée : $BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

