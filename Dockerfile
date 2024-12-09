FROM mariadb:11.6.2

# Définir le mot de passe root
ENV MYSQL_ROOT_PASSWORD=root

# Copier les scripts dans le conteneur
COPY scripts /home/script

# Mettre à jour le système et installer cron et dos2unix
RUN apt-get update -y && apt-get install -y cron dos2unix python3

# Convertir les fins de ligne Windows avec dos2unix -> Unix pour tous les fichiers .sh et .py
RUN dos2unix /home/script/*.sh /home/script/*.py

# Donner les permissions d'exécution
RUN chmod +x /home/script/*.sh

# Exécuter le script d'installation du cron
RUN /home/script/install-cron.sh

# Ajouter un fichier crontab
#RUN crontab -l | { cat; echo "0 22 * * * /home/script/backup_mariadb.sh"; } | crontab -

# Démarrer cron et laisser le conteneur en exécution
RUN service cron start
