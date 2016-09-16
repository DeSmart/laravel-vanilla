FROM php:7-fpm
MAINTAINER desmart

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && apt-get update \
    && apt-get install --yes git less

COPY docker/php7/overrides.ini /usr/local/etc/php/conf.d/overrides.ini

# Base directory for the app code
WORKDIR /var/www/vanilla

COPY . ./
