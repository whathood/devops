FROM php:5.6-fpm-alpine

RUN set -ex \
  && apk update

RUN apk --no-cache add \
    postgresql-dev autoconf libmemcached-dev zlib zlib-dev gcc g++ make pkgconfig file

RUN pecl install memcached-2.2.0

RUN docker-php-ext-enable memcached