#!/bin/bash

echo "Provisioning virtual machine"

start_time=`date`
user_is=`whoami`
echo "running as $user_is"

APP_DIR="/var/www/whathood"
SHARE_DIR="/var/vagrant_share"

echo "Updating apt-get"
sudo apt-get update > /dev/null

# to remove warning about 
export LANGUAGE=en_US.UTF-8 > /dev/null
export LANG=en_US.UTF-8 > /dev/null
export LC_ALL=en_US.UTF-8 > /dev/null
locale-gen en_US.UTF-8 > /dev/null
dpkg-reconfigure locales > /dev/null

apt_cmd='sudo apt-get -y install'

#
# Installing Server Stuff
#
echo "Installing Server Stuff"
$apt_cmd python-software-properties > /dev/null
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable 2>&1 > /dev/null
sudo apt-get update -y > /dev/null
echo "*      installing Nginx"
$apt_cmd nginx > /dev/null
echo "*      installing Miscillaneous PROGRAMS"
$apt_cmd git > /dev/null
echo "*      installing Node.js"
$apt_cmd nodejs npm build-essential > /dev/null
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo chown -R vagrant:vagrant /usr/share/node_modules
sudo npm install --silent -g grunt-cli

echo "*      installing PHP"
$apt_cmd git libpq-dev php5-pgsql php5-curl php5-cli php5-fpm php-pear php5-dev > /dev/null
echo "*      installing PostgreSQL"
$apt_cmd postgresql postgresql-client postgresql-contrib -y > /dev/null
echo "*      installing PostGIS-2.1"
$apt_cmd postgis postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-2.1-scripts -y > /dev/null
echo "*      configuring PostGIS"
sudo cp -f $SHARE_DIR/provision/config/pg_hba.conf /etc/postgresql/9.3/main
sudo service postgresql restart > /dev/null
sudo su - postgres -c 'createuser --superuser whathood'
sudo su - postgres -c 'createdb whathood'
sudo su - postgres -c 'CREATE EXTENSION postgis'
echo "*      configuring Nginx"
sudo cp $SHARE_DIR/provision/config/whathood.conf /etc/nginx/sites-available/whathood.conf > /dev/null
sudo ln -s /etc/nginx/sites-available/whathood.conf /etc/nginx/sites-enabled/ > /dev/null
sudo rm -rf /etc/nginx/sites-available/default > /dev/null

# delete the default website
sudo rm -rf /var/www/html
sudo service nginx restart > /dev/null

echo "*      Cleaning up repistories"
sudo apt-get autoremove > /dev/null

echo ""
echo "Building Whathood App"
echo ""
sudo mkdir -p $APP_DIR
sudo chown -R vagrant.vagrant $APP_DIR
echo "*     cloning data repository"
sudo git clone https://github.com/jimRsmiley/whathood-data.git /tmp/whathood-data > /dev/null
sudo psql -U whathood < /tmp/whathood-data/whathood_sql/whathood_bak.sql 2>&1 > /dev/null
echo "*     pulling code repository"

git clone https://github.com/jimRsmiley/what-hood.git $APP_DIR > /dev/null
sudo chown -R vagrant.vagrant $APP_DIR
cd $APP_DIR/app
echo "*     installing composer"
curl -sS https://getcomposer.org/installer | php > /dev/null
echo "*     installing vendor libraries"
php composer.phar install > /dev/null
cp -f $SHARE_DIR/config/local.php $APP_DIR/app/config/autoload
echo "*     configuring Whathood Zend"
cp $SHARE_DIR/provision/config/local.php $APP_DIR/app/config/autoload


echo "*      building Whathood's coffeescript(to do)"
echo "*      building grunt"
# DO NOT SUDO GRUNT
cd $APP_DIR
npm config set loglevel warn
npm install --silent grunt --save-dev
npm install --silent grunt-contrib-watch --save-dev
npm install --silent grunt-contrib-coffee --save-dev

echo "*      building coffeescript into whathood-compiled.js"
grunt coffee
echo "setup complete"
end_time=`date`
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "provision started $start_time"
echo "provision ended $end_time"
echo ""
echo ""
echo "visit http://localhost:8080 on your host machine to test"