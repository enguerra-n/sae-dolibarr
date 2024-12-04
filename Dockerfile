FROM mariadb:10.11.5

# Définir le mot de passe root
ENV MYSQL_ROOT_PASSWORD=root

# Copier les scripts dans le conteneur
COPY scripts /home/script

# Donner les permissions d'exécution
RUN chmod +x /home/script/*.sh

# Exécuter le script pour accorder les privilèges
RUN /home/script/grant-privileges.sh

# Exécuter le script d'installation du cron
RUN /home/script/install-cron.sh