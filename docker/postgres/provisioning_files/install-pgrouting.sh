#!/bin/sh

set +x

# taken from https://github.com/pgRouting/pgrouting/wiki/Download%3A-Debian-and-Ubuntu

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt-get -y install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

sudo apt-get -y install postgresql-9.3-postgis-2.4
sudo apt-get -y install postgresql-9.3-pgrouting