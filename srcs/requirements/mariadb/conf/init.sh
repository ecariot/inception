
#!/bin/sh


if [ ! -d /var/lib/mysql/wordpress ]
then

    echo "Starting temporary server..."
    cd '/usr' ; /usr/bin/mysqld_safe --datadir=/var/lib/mysql &

    until mysqladmin ping 2> /dev/null; do
        sleep 2
    done
    echo "Creating Wordpress database..."
    mysql -u root << EOF
       CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
       CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
       GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
       FLUSH PRIVILEGES;
EOF

    echo "Wordpress database created!"

    echo "Securing the MYSQL installation..."
    mysql -u root <<- _EOF_
        echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
        echo "DELETE FROM mysql.user WHERE User='';" | mysql
        echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql
        echo "FLUSH PRIVILEGES;" | mysql
_EOF_
    echo "MYSQL installation secured!"

    echo "Stopping temporary server!"
    mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown

    sleep 3
fi

echo "Starting mariadb server..."
# exec mariadbd --user=root
exec "$@"
