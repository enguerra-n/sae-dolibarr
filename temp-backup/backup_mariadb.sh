#Enregistrez le fichier et rendez-le exécutable : chmod +x backup_mariadb.sh
#Planifier une exécution automatique avec cron : crontab -e
#Ajoutez une ligne pour exécuter le script à une heure spécifique. Par exemple, pour une sauvegarde quotidienne 
#à 3h du matin : 0 3 * * * /chemin/vers/backup_mariadb.sh >> /chemin/vers/logs/backup.log 2>&1
#Testez manuellement pour vérifier que tout fonctionne correctement :./backup_mariadb.sh



#!/bin/bash

# Variables
DB_USER="root"
DB_PASSWORD="root"
DB_NAME="dolibarr"
BACKUP_DIR="/tmp/data"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# Création du répertoire de sauvegarde s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Commande pour sauvegarder la base de données
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Supprimer les backups anciens (exemple : garder les 7 derniers jours)
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm -f {} \;

# Message de confirmation
echo "Sauvegarde effectuée : $BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

