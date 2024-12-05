# 🚀 Migration ERP/CRM vers Dolibarr

**Projet de migration d'une solution ERP/CRM externalisée vers un système interne basé sur Dolibarr.**  
L'objectif est de mettre en place un système ERP/CRM hébergé en interne et d'assurer l'import des données existantes à partir de fichiers CSV, ainsi que la sauvegarde et la récupération des données en cas d'incident.

## 🎯 Objectifs du Projet

### 1. **Mise en Place de Dolibarr** 🖥️
   - Installation automatisée de **Dolibarr** et du SGBD requis via `docker-compose`.
     
### 2. **Import des Données** 📂
   - Import des données (clients, fournisseurs, factures, commandes, etc.) depuis l'ancien système via un script unique.
   - Possibilité de manipulation directe du SGBD pour automatiser l'importation des données.

### 3. **Sauvegarde et Récupération des Données** 💾
   - Mise en place d'un système de sauvegarde permettant une récupération complète en cas d'incident (PRA).
   - Capacité de restaurer un serveur Dolibarr fonctionnel à partir des sauvegardes existantes.

## 📊 **Analyse et Découverte de Dolibarr**

### Origine et Développement 🚀  
- **Origine** : Dolibarr est un logiciel open source lancé en 2003 par **Laurent Destailleur**. Initialement conçu comme un ERP/CRM simple et léger, il vise les petites et moyennes entreprises (PME), les indépendants, et les associations.  
- **Développement** : Le projet est principalement maintenu par une communauté internationale d'utilisateurs et de développeurs.  
- **Rythme de release** : Dolibarr suit un cycle de mise à jour régulier, avec des versions majeures publiées environ tous les 6 à 12 mois.  

### Communauté et Support 💬  
- **Forums** : Une communauté active est présente sur le forum officiel de Dolibarr, avec des discussions sur des sujets variés (installation, modules, erreurs, personnalisation, etc.).  
- **Évolutions** : Le logiciel s'est enrichi de nombreux modules et intégrations au fil des années, couvrant des domaines comme la gestion des stocks, les RH, les projets, ou encore la facturation.  
- **Support** : Plusieurs entreprises offrent des services professionnels pour l'installation, la personnalisation, et la maintenance de Dolibarr, garantissant une assistance payante si nécessaire.  

### Points Forts et Faiblesses 🌟⚠️  
**Points forts** :  
- Gratuit et open source.  
- Installation facile et légère, même sur des serveurs peu puissants.  
- Très modulable : les utilisateurs peuvent activer ou désactiver les modules selon leurs besoins.  
- Une grande communauté offrant des ressources et une assistance gratuite.  
- Disponible sur une large variété de plateformes (Windows, Linux, Docker, etc.).  

**Points faibles** :  
- Moins adapté aux très grandes entreprises ou organisations complexes.  
- Nécessite parfois des compétences techniques pour les personnalisations poussées.  
- Documentation parfois incomplète ou dispersée.  

### Concurrence 🏁  
**Projets libres similaires** :  
- **Odoo** : Un concurrent majeur, offrant plus de fonctionnalités mais avec un modèle freemium.  
- **ERPNext** : Une alternative open source axée sur les PME avec un écosystème riche.  
- **SuiteCRM** : Une solution CRM open source comparable pour la gestion de la relation client.  

**Produits commerciaux** :  
- **Salesforce**, **SAP**, ou encore **Microsoft Dynamics** offrent des solutions ERP/CRM complètes mais bien plus coûteuses et complexes à mettre en œuvre.  

## 📝 Étapes réalisées

### 1. **Découverte de Dolibarr** 🔍
- Visite du site Web du constructeur
- Création du Dockerfile pour déploiement
- Création de la base de données Mariadb
- Ouverture de la page web
- Premières manipulations

### 2. **Choix techniques** 👩‍💻

- mariadb pour la SGBD, ce choix est arbitraire (nous sommes plus à l'aise avec ce SGBD).
- version 20.0.0 pour dolibarr afin d'avoir la dernière version majeur, avec le plus de fonctionalité possible
- version 11.6.2 pour mariadb qui est la derinère version stable.
- pour le traitement csv, nous avons choisi pyhton, qui est plus simple pour cette tâches avec des librairies existantes.
- nous avons créé un Dockerfile pour le conteneur mariadb, car nous devons pré-installer certains packages :
   - dos2unix : étant donné que nous faisions le projet avec une machine windows, le formatage pour les fichiers .sh été erronné ainsi avec ce packages les caractères invisibles (retour à la ligne pour nous) sont bien formaté.

   - cron : ce package nous permet de faire une sauvegarde journalière de la BDD

   - python3 : afin de pouvoir exécuter le script de traitement csv.

### 3. **Automatisation de l'Import des Données** 🔄
- Création du script d'import des données pour une table `import-table.sh`
- Un listing de toute les tables existantes avec `list-table.sh`

### 4. **Mise en place d'une automatisation de sauvegarde**
- Création du script de sauvegarde de données périodique Mariadb `backup_mariadb.sh`, qui est compris dans une crontab installé lors du build de l'image mariadb avec le script `install-cron.sh`
- Création du script d'import de sauvegarde Mariadb dans Dolibarr
- ajustement des fichiers csv pour qu'ils correspondent pour les colonnes avec `csv_ordering.py`
- Possible de redéployer la BDD avec le script `restore_mariadb.sh`

### 5. **Utilisation**

- le script `start.sh` permet de lancer directement le docker.


## 🛠️ **Axes d'amélioration**
 

1. **Documentation** :  
   - Compléter une documentation claire pour chaque script (installation, import, sauvegarde).  
   - Inclure des tutoriels pour les utilisateurs non techniques.  

2. **Sécurité** :  
   - Mettre en place des politiques de sauvegarde chiffrées.
     
3. **Optimisation des scripts ** :  
   - compresser les fichiers de sauvegarde pour réduire l'utilisation de l'espace de stockage.
   - rendre possible l'execution des scripts agissants sur la BDD depuis la machine hôte. 


## 🔗 Liens Utiles
- [Enterprise Resource Planning (ERP)](https://en.wikipedia.org/wiki/Enterprise_resource_planning)
- [Customer Relationship Management (CRM)](https://en.wikipedia.org/wiki/Customer_relationship_management)