FROM debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y
RUN    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql
RUN    mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db
COPY ./conf/my.cnf /etc/mysql/my.cnf
# COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/init.sh /init.sh
ENTRYPOINT ["bash", "init.sh"]
EXPOSE 3306


CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]