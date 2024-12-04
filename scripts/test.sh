#!/bin/bash

#######
# Initialisation des variables
#######
DB_USER="root"           
DB_PASSWORD="root"       
DB_NAME="dolibarr"       

#####
# Fonction d'importation
#####
import_csv_to_mariadb() {
    local table_name=$1    
    local csv_file=$2      

    echo "Importation du fichier $csv_file vers la table $table_name ..." 


    #mariadb --local-infile=1 -u root -p dolibarr --password=root
    
    mariadb --local-infile=1 -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "
        LOAD DATA LOCAL INFILE '$csv_file' 
        INTO TABLE $table_name
        FIELDS TERMINATED BY ','  # Définit la virgule comme séparateur de champs dans le fichier CSV
        ENCLOSED BY '\"'         # Définit les guillemets comme délimiteurs de champs dans le fichier CSV
        LINES TERMINATED BY '\n' # Définit le saut de ligne comme délimiteur de lignes
        IGNORE 1 ROWS;          # Ignore la première ligne (en-têtes de colonnes du fichier CSV)
    "

    if [ $? -eq 0 ]; then   # Vérifie si la commande précédente (importation) a réussi (code de sortie égal à 0)
        echo "Importation du fichier $csv_file vers $table_name réussie." 
        # Si l'importation a réussi, affiche un message de succès.
    else
        echo "Erreur lors de l'importation du fichier $csv_file vers $table_name." 
        # Si l'importation a échoué, affiche un message d'erreur.
    fi
}

#######
# Vérification et extraction des arguments
#######
while getopts "t:c:" opt; do
  case $opt in
    t) table_name="$OPTARG" ;;  # Si l'option -t est passée, affectation de la valeure à la variable
    c) csv_file="$OPTARG" ;;    # Si l'option -c est passée, affectation de la valeure à la variable
    *) echo "Usage: $0 -t table_name -c csv_file" >&2; exit 1 ;; 
    # Si une option non valide est passée, affiche un message d'erreur et quitte le script
  esac
done



if [ -z "$table_name" ] || [ -z "$csv_file" ]; then
    echo "Usage: $0 -t table_name -c csv_file" >&2
    exit 1
fi


####
# programme principal
####
import_csv_to_mariadb "$table_name" "$csv_file" 
