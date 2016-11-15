FROM nginx:1.11-alpine
MAINTAINER desmart

COPY docker/nginx/vhost.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /usr/src/app/public
COPY public /usr/src/app/public
