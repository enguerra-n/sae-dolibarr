#!/bin/bash

# Variables de configuration
DB_USER="root"           # Nom d'utilisateur MariaDB
DB_PASSWORD="root"      # Mot de passe MariaDB
DB_NAME="dolibarr"       # Nom de la base de données

# Fonction d'importation
import_csv_to_mariadb() {
    local table_name=$1
    local csv_file=$2

    echo "Importation du fichier $csv_file vers la table $table_name ..."
    #mariadb --local-infile=1 -u root -p dolibarr --password=root
    mariadb --local-infile=1 -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "
        LOAD DATA LOCAL INFILE '$csv_file'
        INTO TABLE $table_name
        FIELDS TERMINATED BY ',' 
        ENCLOSED BY '\"' 
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS;
    "

    if [ $? -eq 0 ]; then
        echo "Importation du fichier $csv_file vers $table_name réussie."
    else
        echo "Erreur lors de l'importation du fichier $csv_file vers $table_name."
    fi
}

# Vérification et extraction des arguments
while getopts "t:c:" opt; do
  case $opt in
    t) table_name="$OPTARG" ;;
    c) csv_file="$OPTARG" ;;
    *) echo "Usage: $0 -t table_name -c csv_file" >&2; exit 1 ;;
  esac
done

# Vérification que les arguments sont fournis
if [ -z "$table_name" ] || [ -z "$csv_file" ]; then
    echo "Usage: $0 -t table_name -c csv_file" >&2
    exit 1
fi

# Appel de la fonction d'importation avec les arguments fournis
import_csv_to_mariadb "$table_name" "$csv_file"
