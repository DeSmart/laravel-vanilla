FROM php:7-fpm
MAINTAINER desmart

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
    && echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -qq --yes wget \
    && wget https://www.dotdeb.org/dotdeb.gpg \
    && apt-key add dotdeb.gpg \
    && apt-get update \
    && apt-get install --yes git less php7.0-mysql \
    && docker-php-ext-install pdo_mysql

COPY docker/php7/overrides.ini /usr/local/etc/php/conf.d/overrides.ini

# Base directory for the app code
WORKDIR /var/www/vanilla

COPY . ./
