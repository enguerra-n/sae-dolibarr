###########################################
# Explication du script
###########################################

# Ce script permet de réorganiser les colonnes d'un fichier CSV
# en fonction d'un ordre spécifié dans un fichier de configuration.
# Il nettoie les noms de colonnes en supprimant les annotations entre parenthèses.
#
# utilisation :
# - Lecture du fichier CSV d'importation.
# - Lecture du fichier d'ordre des colonnes.
# - Nettoyage des noms de colonnes (suppression des annotations).
# - Vérification des colonnes manquantes et ajout de celles-ci avec des valeurs vides.
# - Réorganisation des colonnes selon l'ordre spécifié.
# - Sauvegarde du fichier réorganisé.
#

###########################################
# Importations
###########################################
import pandas as pd
import sys
import os
import re

###########################################
# définition des fonctions
###########################################
def nettoyer_colonne(colonne):
    """Enlève les annotations entre parenthèses pour faciliter la comparaison des colonnes."""
    return re.sub(r"\s?\(.*\)", "", colonne).strip()

def reconfigurer_csv(fichier_import, fichier_ordre, fichier_sortie):
    try:
        # Charger les fichiers CSV
        df_import = pd.read_csv(fichier_import)
        print(f"Fichier importé : {fichier_import}")
        print(f"Colonnes présentes dans le fichier d'importation : {df_import.columns.tolist()}")

        # Lire les colonnes du fichier d'ordre
        with open(fichier_ordre, 'r', encoding='utf-8') as f:
            ordre_colonnes = [col.strip() for col in f.readline().split(',')]
        print(f"Colonnes attendues dans l'ordre : {ordre_colonnes}")

        # Nettoyer les noms de colonnes du fichier d'ordre pour les rendre plus flexibles
        ordre_colonnes_nettoyees = [nettoyer_colonne(col) for col in ordre_colonnes]
        print(f"Colonnes attendues après nettoyage : {ordre_colonnes_nettoyees}")

        # Nettoyer les noms de colonnes du fichier d'importation
        df_import.columns = [nettoyer_colonne(col) for col in df_import.columns]
        print(f"Colonnes dans le fichier d'import après nettoyage : {df_import.columns.tolist()}")

        # Vérifier les colonnes manquantes
        colonnes_manquantes = [col for col in ordre_colonnes_nettoyees if col not in df_import.columns]
        if colonnes_manquantes:
            print(f"Attention : Colonnes manquantes dans le fichier d'import : {colonnes_manquantes}")
            # Ajouter des colonnes manquantes avec des valeurs vides
            for col in colonnes_manquantes:
                df_import[col] = ""  # Ajouter colonne manquante avec valeur vide

        # Réorganiser les colonnes dans l'ordre demandé
        try:
            df_reconfigure = df_import[ordre_colonnes_nettoyees]
        except KeyError as e:
            print(f"Erreur dans l'indexation des colonnes : {e}")
            return

        # Sauvegarder le fichier réorganisé
        df_reconfigure.to_csv(fichier_sortie, index=False, encoding='utf-8')
        print(f"Fichier réorganisé sauvegardé sous : {fichier_sortie}")

    except Exception as e:
        print(f"Erreur dans le traitement du fichier : {e}")

###########################################
# Programme principal
###########################################
if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage : python csv_ordering.py <fichier_import> <fichier_ordre> <fichier_sortie>")
        sys.exit(1)

    fichier_import = os.path.normpath(sys.argv[1])
    fichier_ordre = os.path.normpath(sys.argv[2])
    fichier_sortie = os.path.normpath(sys.argv[3])

    print(f"Lancement avec :\n  - fichier_import: {fichier_import}\n  - fichier_ordre: {fichier_ordre}\n  - fichier_sortie: {fichier_sortie}")
    
    reconfigurer_csv(fichier_import, fichier_ordre, fichier_sortie)
