#!/bin/sh

set -ex

CWD=$(pwd)

cd docker/php-fpm && docker build -t whathood/php-fpm .

cd ${CWD}

docker-compose down -v && docker-compose up -d && docker-compose logs -f php-fpm
