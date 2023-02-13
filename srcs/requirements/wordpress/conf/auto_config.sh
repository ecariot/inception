echo "HELLO"

sleep 2

rm -f /var/www/wordpress/wp-config.php
if [ ! -f /var/www/wordpress/wp-config.php ]
then
    echo "Hello word"
    cd /var/www/wordpress/
    wp core download --force --allow-root
    until mysqladmin --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=mariadb ping; do
        sleep 2
    done

    echo "create wp config"

    wp config create	--allow-root \
                        --dbname=${DB_NAME} \
                        --dbuser=${MYSQL_USER} \
                        --dbpass=${MYSQL_PASSWORD} \
                        --dbhost=${DB_HOST}

    wp core install     --url=localhost \
                        --title="Inception" \
                        --admin_user=${WP_ADMIN_LOGIN} \
                        --admin_password=${WP_ADMIN_PASSWORD} \
                        --admin_email=${WP_ADMIN_EMAIL} \
                        --skip-email \
                        --allow-root

    echo "WORD PRESS OK- GO SUR LE WP USER CREATE"
    wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASSWORD
    echo "OK WP USER CREATE"
fi;
exec "$@"
