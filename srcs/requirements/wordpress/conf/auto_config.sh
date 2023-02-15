echo "HELLO"

sleep 2

if [ ! -f /var/www/wordpress/wp-config.php ]; then

    cd /var/www/wordpress/
    wp core download --force --allow-root
    until mysqladmin --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=mariadb ping; do
        sleep 2
    done

    echo "create wp config"

    wp config create    --dbname=${DB_NAME} \
                        --dbuser=${MYSQL_USER} \
                        --dbpass=${MYSQL_PASSWORD} \
                        --dbhost=${DB_HOST} \
                        --allow-root

    wp core install     --url=inception.42.fr \
                        --title="Inception" \
                        --admin_user=${WP_ADMIN_LOGIN} \
                        --admin_password=${WP_ADMIN_PASSWORD} \
                        --admin_email=${WP_ADMIN_EMAIL} \
                        --skip-email \
                        --allow-root

    echo "WORD PRESS OK- GO SUR LE WP USER CREATE"
    wp user create      ${USER1_LOGIN} ${USER1_MAIL} \
                        --user_pass=${USER1_PASSWORD} \
                        --role=author \
                        --allow-root
    echo "OK WP USER CREATE"
fi;
exec "$@"
