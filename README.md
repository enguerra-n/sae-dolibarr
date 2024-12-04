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

## 📝 Étapes réalisées

### 1. **Découverte de Dolibarr** 🔍
- Visite du site Web du constructeur
- Création du Dockerfile
- Création de la base de données Mariadb
- Ouverture de la page web
- Premières manipulations

### 2. **Automatisation de l'Import des Données** 🔄
- Création du srcypt d'import des données
  
## 🔗 Liens Utiles
- [Enterprise Resource Planning (ERP)](https://en.wikipedia.org/wiki/Enterprise_resource_planning)
- [Customer Relationship Management (CRM)](https://en.wikipedia.org/wiki/Customer_relationship_management)

## ⚠️ Statut du Projet
**🚧 Ce projet est en cours de développement. La page est en cours de création !**  
*(Mise à jour en novembre 2024)*
