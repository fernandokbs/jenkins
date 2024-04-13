FROM php:8.3-fpm

RUN apt-get update && apt-get install -y git

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/www/html

WORKDIR /var/www/html

RUN composer install