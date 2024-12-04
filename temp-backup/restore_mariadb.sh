#!/bin/bash

# Variables
DB_USER="root"
DB_PASSWORD="root"
DB_NAME="nom_de_votre_base"
DUMP_FILE="/chemin/vers/le/dump.sql"

# Vérification de l'existence du fichier dump
if [ ! -f "$DUMP_FILE" ]; then
    echo "Erreur : Le fichier $DUMP_FILE n'existe pas."
    exit 1
fi

# Importation du dump
echo "Importation du dump dans la base de données $DB_NAME..."
mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < "$DUMP_FILE"

if [ $? -eq 0 ]; then
    echo "Importation terminée avec succès !"
else
    echo "Erreur lors de l'importation."
    exit 1
fi

