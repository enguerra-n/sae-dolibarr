# Utiliser l'image MariaDB de base
FROM mariadb:latest

# Définir la variable d'environnement pour le mot de passe root
ENV MYSQL_ROOT_PASSWORD=root

# Créer un dossier pour les scripts d'initialisation
COPY ./scripts /docker-entrypoint-initdb.d/
