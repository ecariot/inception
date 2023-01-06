FROM    debian:buster

RUN     apt-get update -y && apt-get upgrade -y
RUN     apt-get -y install curl \
        #pour utiliser mysqladmin
        mariadb-client \
        #php pour utiliser wordpress
        php7.3 \
        php7.3-fpm \
        php7.3-curl \
        php7.3-mysql \
        php7.3-mbstring \
        php7.3-xml \
        php7.3-zip \
        php7.3-gd \
        php7.3-imap

RUN        mkdir -p /var/www/wordpress ; mkdir -p /run/php


COPY ./conf/php.conf	/etc/php/7.3/fpm/pool.d/www.conf
# RUN		chown -R root:root /var/www/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
COPY conf/auto_config.sh auto_config.sh
ENTRYPOINT ["bash", "auto_config.sh"]

CMD ["php-fpm7.3", "-F"]