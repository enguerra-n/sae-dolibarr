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

## 📝 Étapes du Projet

### 1. **Découverte de Dolibarr** 🔍
   - Installation initiale sur une VM Debian ou un conteneur Docker pour la prise en main.
   - Configuration manuelle : base de données, création d'un compte administrateur, ajout de modules, etc.
   - Première importation des données CSV via les outils intégrés de Dolibarr.

### 2. **Automatisation de l'Import des Données** 🔄
   - Exploration des options d'import intégrées ou création de scripts d'import personnalisés pour une automatisation complète.
   - Manipulation directe des tables du SGBD pour optimiser le processus d'importation.

### 3. **Dockerisation de l'Environnement** 🛠️
   - Création de Dockerfiles pour une installation propre et segmentée :
     - Un conteneur pour **Dolibarr**.
     - Un conteneur pour le **SGBD**.
   - Tests et évaluation des images Docker existantes de Dolibarr pour choisir la meilleure configuration.

## 🔗 Liens Utiles
- [Enterprise Resource Planning (ERP)](https://en.wikipedia.org/wiki/Enterprise_resource_planning)
- [Customer Relationship Management (CRM)](https://en.wikipedia.org/wiki/Customer_relationship_management)

## ⚠️ Statut du Projet
**🚧 Ce projet est en cours de développement. La page est en cours de création !**  
*(Mise à jour en novembre 2024)*
