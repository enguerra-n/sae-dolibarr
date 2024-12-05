#!/bin/bash

###########################################
# Explication du script
###########################################
# Ce script permet d'afficher la liste des tables présentes dans la base de données MariaDB spécifiée.
# Il se connecte à la base de données et exécute une commande SQL pour obtenir la liste des tables.
#
# Utilisation : 
# 1. Exécutez ce script pour afficher la liste des tables de la base de données.
#
# Le script effectue les étapes suivantes :
# - Se connecte à MariaDB.
# - Exécute la commande SQL SHOW TABLES.
# - Affiche les tables de la base de données spécifiée.

# Variables de configuration
DB_USER="root"           # Nom d'utilisateur MariaDB
DB_PASSWORD="root"      # Mot de passe MariaDB
DB_NAME="dolibarr"      # Nom de la base de données (dolibarr dans ce cas)

# Commande pour afficher les tables
echo "Liste des tables dans la base de données $DB_NAME :"
mariadb -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "SHOW TABLES;" | tail -n +2

# le tail permet d'afficher à partir de la deuxième ligne
