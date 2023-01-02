FROM debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/init.sh /init.sh
ENTRYPOINT ["bash", "init.sh"]
EXPOSE 3306