FROM debian:buster

RUN     apt-get update && apt-get install -y \
        mariadb-server \
        mariadb-client
RUN     mkdir -p /run/mysqld /var/lib/mysql && \
        chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY    ./conf/my.cnf /etc/mysql/my.cnf
COPY    conf/init.sh /init.sh

ENTRYPOINT ["bash", "init.sh"]
EXPOSE  3306

CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]
