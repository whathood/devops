#!/bin/bash

APP_DIR="/var/www/whathood"

mkdir /opt/whathood
chown -R vagrant.vagrant /opt/whathood

chown -R vagrant.vagrant /usr/local

echo "*      cloning Whathood"
git clone https://github.com/jimRsmiley/what-hood.git $APP_DIR > /dev/null 2>&1
chown -R vagrant.vagrant $APP_DIR
cd $APP_DIR/app

# do NOT run as vagrant
echo "*      importing data"
cd $APP_DIR
sudo -u vagrant $APP_DIR/dev-bin/import_db

echo "*      deploying Whathood"
cd $APP_DIR
sudo -u vagrant $APP_DIR/bin/deploy
