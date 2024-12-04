#!/bin/bash

# Variables
DB_USER="votre_utilisateur"
DB_PASSWORD="votre_mot_de_passe"
DB_NAME="nom_de_votre_base"
BACKUP_DIR="/chemin/vers/le/dossier_de_sauvegarde"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# Création du répertoire de sauvegarde s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Commande pour sauvegarder la base de données
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Supprimer les backups anciens (exemple : garder les 7 derniers jours)
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm -f {} \;

# Message de confirmation
echo "Sauvegarde effectuée : $BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

