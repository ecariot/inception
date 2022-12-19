FROM    debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/config.sh /config.sh
ENTRYPOINT ["bash", "config.sh"]
EXPOSE 3306