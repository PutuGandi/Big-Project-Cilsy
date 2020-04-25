FROM php:7.2-fpm

MAINTAINER gandi <putugandi12@gmail.com>

WORKDIR /var/www/html

RUN apt-get update -y \
    && apt-get install -y nginx \
    && docker-php-ext-install mysqli pdo pdo_mysql 

RUN rm index.nginx-debian.html

COPY sosial-media/ .
COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
