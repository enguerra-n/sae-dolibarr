FROM mariadb:10.11.5

# définition du mot de passe root
ENV MYSQL_ROOT_PASSWORD=root

COPY ./scripts /tmp/script

RUN ./tmp/script/install-cron.sh
#RUN ./test.sh -t llx_user -c /tmp/data/user1