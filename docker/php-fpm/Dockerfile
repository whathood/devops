FROM php:5.6-fpm-alpine

RUN set -ex \
  && apk --no-cache add \
    postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql

# Ensure UTF-8
# RUN locale-gen en_US.UTF-8
# ENV LANG       en_US.UTF-8
# ENV LC_ALL     en_US.UTF-8
# ENV TERM       vt100
# ENV HOME /root

# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# RUN 
# RUN apt-add-repository --yes ppa:brightbox/ruby-ng

# RUN apt-get update && apt-get install -y vim git

# RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim curl wget build-essential python-software-properties

# # to run phpunit
# RUN wget https://phar.phpunit.de/phpunit.phar
# RUN chmod +x phpunit.phar
# RUN sudo mv phpunit.phar /usr/local/bin/phpunit

# RUN sed -i "s/;date.timezone =.*/date.timezone = America\/New_York/" /etc/php5/fpm/php.ini
# RUN sed -i "s/;date.timezone =.*/date.timezone = America\/New_York/" /etc/php5/cli/php.ini

# RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
# RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

# RUN rm -rf          /var/www
# RUN mkdir -p        /var/www
# RUN mkdir           /etc/service/phpfpm
# ADD build/phpfpm.sh /etc/service/phpfpm/run
# RUN chmod +x        /etc/service/phpfpm/run

# # End Nginx-PHP

# RUN apt-get install -y postgresql postgresql-contrib postgresql-client-common
# RUN apt-get install -y git curl

# RUN ln -s /etc/php5/fpm/mods-available/timezone.ini /etc/php5/fpm/conf.d/20-timezone.ini

# # set up env vars so connecting is easy
# RUN echo "export PGHOST='wh-postgis'" >> /etc/bash.bashrc
# RUN echo "export PGUSER='docker'" >> /etc/bash.bashrc
# RUN echo "export PGDATABASE='whathood'" >> /etc/bash.bashrc
# RUN echo "set -o vi" >>  /etc/bash.bashrc

# # OPCACHE
# ADD build/opcache.ini   /etc/php5/fpm/mods-available/opcache.ini

# # SET timezone
# ADD build/timezone.ini   /etc/php5/fpm/mods-available/timezone.ini

# # memcached
# RUN apt-get install -y 

# # clean up
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
