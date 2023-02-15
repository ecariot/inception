FROM debian:buster

RUN apt update
RUN apt install nginx -y
RUN  mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
	-out /etc/nginx/ssl/emcariot.crt \
	-keyout /etc/nginx/ssl/emcariot.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=emcariot.42.fr/UID=emcariot"

RUN mkdir -p /etc/nginx/ssl

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 443
