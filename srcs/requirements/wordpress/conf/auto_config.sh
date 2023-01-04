echo "HELLO"

wp core download --allow-root
sleep 2

if [ -f /var/www/html/wp-config.php ]
then
    echo "wp config already exists"
    sleep 2
else

echo "create wp config"


wp config create	    --allow-root \
                    --dbname=${DB_NAME} \
                    --dbuser=${DB_USER} \
                    --dbpass=${DB_PASSWORD} \
                    --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install     --url=localhost \
                    --title="Inception" \
                    --admin_user=${WP_ADMIN_LOGIN} \
                    --admin_password=${WP_ADMIN_PASSWORD} \
                    --admin_email=${WP_ADMIN_EMAIL} \
                    --skip-email \
                    --allow-root

echo "OK"
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
mkdir ./run/php
/usr/sbin/php-fpm7.3 -F
fi