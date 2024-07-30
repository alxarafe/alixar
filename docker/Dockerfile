# docker/Dockerfile
FROM php:8.1-fpm

# RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www/html

# ADD https://github.com/alxarafe/alixar.git ./

COPY ./public/ ./public/
COPY ./docker/conf/ ./public/htdocs/conf/
COPY ./Core/ ./Core/
COPY ./Dolibarr/ ./Dolibarr/
COPY ./Modules/ ./Modules/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000