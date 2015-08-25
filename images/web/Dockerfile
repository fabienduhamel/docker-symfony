FROM richarvey/nginx-php-fpm:latest

ADD nginx.conf /etc/nginx/conf.d/default.conf

RUN usermod -u 1000 www-data

ADD init-db.sh /init-db.sh
RUN chmod 755 /init-db.sh

