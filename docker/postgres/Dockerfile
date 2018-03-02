#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
FROM phusion/baseimage:0.9.15

MAINTAINER Tim Sutton<tim@kartoza.com>

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive
RUN  dpkg-divert --local --rename --add /sbin/initctl

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

# needed for apt-add-repository
RUN apt-get install -y software-properties-common
## Add pgRouting launchpad repository ("stable" or "unstable")
RUN apt-get -y update
RUN apt-get -y install ca-certificates rpl pwgen

#------------- POSTGRES Specific Stuff ----------------------------------------------------

# RUN apt-get -y install postgresql-9.3 postgresql-client-9.3

# Start with supervisor
ADD provisioning_files/postgres.conf /etc/supervisor/conf.d/postgres.conf

#-------------- build extensions

# POSTGIS

# RUN sudo apt-get install -y postgresql-9.3-postgis-2.1

# PGROUTING

ADD provisioning_files/install-pgrouting.sh /install-pgrouting.sh
RUN sh /install-pgrouting.sh

#-------------- set up how we start when the container runs

# Open port 5432 so linked containers can see them
EXPOSE 5432

# Run any additional tasks here that are too tedious to put in
# this dockerfile directly.
ADD provisioning_files/setup.sh /setup.sh
RUN chmod 0755 /setup.sh
RUN /setup.sh

# We will run any commands in this when the container starts
ADD provisioning_files/start-postgis.sh /start-postgis.sh
RUN chmod 0755 /start-postgis.sh

# Correct the Error: could not open temporary statistics file "/var/run/postgresql/9.3-main.pg_stat_tmp/global.tmp": No such file or directory
RUN mkdir -p /var/run/postgresql/9.3-main.pg_stat_tmp
RUN chown postgres.postgres /var/run/postgresql/9.3-main.pg_stat_tmp -R

# Correct the error: "FATAL:  private key file "/etc/ssl/private/ssl-cert-snakeoil.key" has group or world access"
RUN chmod 600 /etc/ssl/private/ssl-cert-snakeoil.key

CMD /start-postgis.sh
