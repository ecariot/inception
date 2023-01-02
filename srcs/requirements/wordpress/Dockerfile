FROM debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
    php-fpm\
    php-mysql\
    mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
COPY	./conf/php.conf			/etc/php/7.3/fpm/pool.d/www.conf
RUN		chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/auto_config.sh auto_config.sh
EXPOSE 3306 
ENTRYPOINT ["bash", "auto_config.sh"]