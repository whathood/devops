#!/bin/bash

APP_DIR="/var/www/whathood"

echo "*      cloning Whathood"
git clone https://github.com/jimRsmiley/what-hood.git $APP_DIR > /dev/null
chown -R vagrant.vagrant $APP_DIR
cd $APP_DIR/app

echo "*      importing data"
cd $APP_DIR
$APP_DIR/dev-bin/import_db

echo "*      deploying Whathood"
cd $APP_DIR
$APP_DIR/bin/deploy
