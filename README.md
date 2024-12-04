# 🚀 Migration ERP/CRM vers Dolibarr

**Projet de migration d'une solution ERP/CRM externalisée vers un système interne basé sur Dolibarr.**  
L'objectif est de mettre en place un système ERP/CRM hébergé en interne et d'assurer l'import des données existantes à partir de fichiers CSV, ainsi que la sauvegarde et la récupération des données en cas d'incident.

## 🎯 Objectifs du Projet

### 1. **Mise en Place de Dolibarr** 🖥️
   - Installation automatisée de **Dolibarr** et du SGBD requis via un script unique `install.sh`.
   - Préférence pour une solution **dockerisée** 🐳 afin de faciliter la portabilité et l'indépendance de l'OS.

### 2. **Import des Données** 📂
   - Import des données (clients, fournisseurs, factures, commandes, etc.) depuis l'ancien système via un script unique `import_csv.sh`.
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

### 2. **Automatisation de l'Import des Données** 🔄
- Création du srcypt d'import des données

### 3. **Mise en place d'une automatisation de sauvegarde**
- Création du scrypt de sauvegarde de données périodique Mariadb
- Création du scrypt d'import de sauvegarde Mariadb dans Dolibarr

## 🛠️ **Axes d'amélioration**

1. **Amélioration des scripts** :  
   - Rendre les scripts `install.sh` et `import_csv.sh` plus robustes avec une gestion des erreurs améliorée.  
   - Ajouter des messages d’état pour informer l’utilisateur de chaque étape.  

2. **Documentation** :  
   - Compléter une documentation claire pour chaque script (installation, import, sauvegarde).  
   - Inclure des tutoriels pour les utilisateurs non techniques.  

3. **Tests automatisés** :  
   - Mettre en place des tests pour valider l’installation, l’importation, et la restauration des données.  
   - Vérifier la compatibilité avec plusieurs versions de Dolibarr et SGBD.  

4. **Personnalisation** :  
   - Créer des modèles de factures et rapports adaptés aux besoins spécifiques de l’entreprise.  
   - Ajouter des modules supplémentaires si nécessaire.  

5. **Sécurité** :  
   - Mettre en place des politiques de sauvegarde encryptées.  
   - Ajouter un pare-feu applicatif et vérifier la sécurité des accès (authentification forte).  

6. **Optimisation des performances** :  
   - Tester Dolibarr avec des volumes importants de données pour évaluer les performances.  
   - Optimiser les requêtes SQL si nécessaire pour les temps de réponse.  

7. **Formation des utilisateurs** :  
   - Créer une formation pour les employés sur l’utilisation des principales fonctionnalités.  
   - Préparer un guide utilisateur simplifié.  

## 🔗 Liens Utiles
- [Enterprise Resource Planning (ERP)](https://en.wikipedia.org/wiki/Enterprise_resource_planning)
- [Customer Relationship Management (CRM)](https://en.wikipedia.org/wiki/Customer_relationship_management)

## ⚠️ Statut du Projet
**🚧 Ce projet est en cours de développement. La page est en cours de création !**  
*(Mise à jour en novembre 2024)*  
