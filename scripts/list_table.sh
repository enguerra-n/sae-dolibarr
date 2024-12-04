#!/bin/bash

# Variables de configuration
DB_USER="root"           # Nom d'utilisateur MariaDB
DB_PASSWORD="root"      # Mot de passe MariaDB
DB_NAME="dolibarr"      # Nom de la base de données (dolibarr dans ce cas)

# Commande pour afficher les tables
echo "Liste des tables dans la base de données $DB_NAME :"
mariadb -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "SHOW TABLES;" | tail -n +2

# le tail permet d'afficher à partir de la deuxième ligne
