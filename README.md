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
- pour les users en csv pour la table llx_user, nous les avons généré avec l'IA ChatGPT avec le prompt suivants : 
>créer moi 5 users pour ce csv stp : 
Identifiant* (u.login),Nom* (u.lastname),Prénom (u.firstname),Salarié* (u.employee),Poste/fonction (u.job),Genre (u.gender),Code comptable de l'utilisateur (u.accountancy_code),Mot de passe (u.pass_crypted),Administrateur du système (u.admin),Société* (u.fk_soc),Adresse (u.address),Code postal (u.zip),Ville (u.town),ID d'état (u.fk_state),Code pays (u.fk_country),Téléphone (u.office_phone),Mobile (u.user_mobile),Fax (u.office_fax),Email (u.email),Note (publique) (u.note_public),Note (privée) (u.note_private),Signature (u.signature),Responsable hiérarchique (u.fk_user),Tarif horaire moyen (u.thm),Tarif journalier moyen (u.tjm),Heures de travail (par semaine) (u.weeklyhours),Date d'embauche (u.dateemployment),Date de fin d'emploi (u.dateemploymentend),Salaire (u.salary),Couleur (u.color),ApiKey (u.api_key),Date de naissance (u.birth),Date création (u.datec),État (u.statut)
jdoe,Doe,John,0 or 1,CTO,man or woman,,Encrypted password,,0 (internal user) or company name (external user),61 jump street,123456,Big town,,US/ FR/ DE...,0101010101,,0101010102,test@mycompany.com,This is an example of public note for record,This is an example of private note for record,,,,,,,,10000,,,,2015-01-01 or 2015-01-01 12:30:00,0 (closed) or 1 (active)

nous avons le résultat suivant : 
>Identifiant*,Nom*,Prénom,Salarié*,Poste/fonction,Genre,Code comptable de l'utilisateur,Mot de passe,Administrateur du système,Société*,Adresse,Code postal,Ville,ID d'état,Code pays,Téléphone,Mobile,Fax,Email,Note (publique),Note (privée),Signature,Responsable hiérarchique,Tarif horaire moyen,Tarif journalier moyen,Heures de travail (par semaine),Date d'embauche,Date de fin d'emploi,Salaire,Couleur,ApiKey,Date de naissance,Date création,État
jdoe,Doe,John,1,CTO,man,,encrypted123,1,0,123 Innovation Drive,75001,Paris,,FR,0101234567,0601234567,0107654321,jdoe@company.com,"Public note for John Doe","Private note for John Doe",,,50,400,40,2015-01-01,2024-12-04,100000,#FF5733,,1985-04-15,2024-12-04 12:00:00,1
asmith,Smith,Alice,1,Manager,woman,,encrypted456,0,CompanyX,456 Business Ave,10001,New York,,US,0201234567,0701234567,0207654321,asmith@companyx.com,"Public note for Alice Smith","Private note for Alice Smith",,,45,360,38,2017-06-10,,85000,#33FF57,,1987-08-20,2024-12-04 12:10:00,1
bcollins,Collins,Bob,1,Analyst,man,,encrypted789,0,CompanyY,789 Analyst Blvd,10115,Berlin,,DE,0301234567,0801234567,0307654321,bcollins@companyy.com,"Public note for Bob Collins","Private note for Bob Collins",,,40,320,35,2019-03-01,,70000,#3357FF,,1992-03-18,2024-12-04 12:20:00,1
djohnson,Johnson,Diana,1,Designer,woman,,encrypted321,0,CompanyZ,321 Creative Lane,00185,Rome,,IT,0401234567,0901234567,0407654321,djohnson@companyz.com,"Public note for Diana Johnson","Private note for Diana Johnson",,,42,330,37,2018-09-15,,75000,#FF33AA,,1990-12-25,2024-12-04 12:30:00,1
egarcia,Garcia,Edward,0,Technician,man,,encrypted654,0,CompanyW,654 Tech Street,28001,Madrid,,ES,0501234567,0912345678,0507654321,egarcia@companyw.com,"Public note for Edward Garcia","Private note for Edward Garcia",,,38,300,36,2021-02-01,,60000,#AA33FF,,1995-07-04,2024-12-04 12:40:00,1


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