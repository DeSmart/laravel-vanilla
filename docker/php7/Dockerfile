FROM desmart/php:7.0-fpm-alpine

COPY ["composer.json", "composer.lock", "./"]
COPY database/ database/
COPY tests/ tests/
COPY config/ config/

RUN set -xeu \
    && composer install --no-dev --prefer-dist --no-interaction --no-progress --no-scripts \
    && composer clear-cache

COPY . ./

RUN mkdir -p public/upload \
    && chmod -R 777 public/upload

RUN chmod -R 777 bootstrap/cache
RUN chmod -R 777 storage

RUN set -xeu \
    && php artisan optimize \
    && php artisan vendor:publish

VOLUME /usr/src/app/public/upload
