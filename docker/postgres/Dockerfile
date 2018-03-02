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

RUN apt-get -y install postgresql-9.3

# Start with supervisor
ADD postgres.conf /etc/supervisor/conf.d/postgres.conf

# Open port 5432 so linked containers can see them
EXPOSE 5432

# Run any additional tasks here that are too tedious to put in
# this dockerfile directly.
ADD provisioning_files/setup.sh /setup.sh
RUN chmod 0755 /setup.sh
RUN /setup.sh

#-------------- build extensions

# POSTGIS

ADD provisioning_files/install-postgis.sh /install-postgis.sh
RUN sh /install-postgis.sh

# PGROUTING

ADD provisioning_files/install-pgrouting.sh /install-pgrouting.sh
RUN sh /install-pgrouting.sh

#-------------- set up how we start when the container runs

# We will run any commands in this when the container starts
ADD provisioning_files/start-postgis.sh /start-postgis.sh
RUN chmod 0755 /start-postgis.sh

CMD /start-postgis.sh
