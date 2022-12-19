FROM debian:buster
RUN apt update 
RUN apt install nginx -y 
RUN    apt install vim -y 
RUN  mkdir -p /etc/nginx/ssl 
RUN apt install openssl -y 
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=emcariot.42.fr/UID=emcariot"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/index.html /var/www/html/index.html
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]