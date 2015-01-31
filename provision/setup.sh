#!/bin/bash

echo "Provisioning virtual machine"

start_time=`date`
user_is=`whoami`
echo "running as $user_is"

SHARE_DIR="/vagrant"
PROVISION_DIR="$SHARE_DIR/provision"
PROVISION_CONFIG_DIR="$PROVISION_DIR/config"
BASEDIR=$(dirname $0)
apt_cmd='apt-get -y install'

#
echo "*      Updating apt-get"
#
apt-get update > /dev/null

echo "Configuring shell environment"

#
echo "*      copying bash_aliases"
#
cp $SHARE_DIR/provision/config/bash_aliases /etc/bash_aliases
echo "source /etc/bash_aliases" >> /etc/bash.bashrc

#
echo "*      configuring screen"
#
$apt_cmd screen > /dev/null
sudo cp /vagrant/provision/config/screenrc /etc/screenrc

# to remove warning about 
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8 > /dev/null
dpkg-reconfigure locales > /dev/null

#
# Installing Server Stuff
#
echo "Installing Server Stuff"
$apt_cmd python-software-properties 2>&1 > /dev/null
echo "Adding ubuntugis to apt-repository"
add-apt-repository ppa:ubuntugis/ubuntugis-unstable &> /dev/null
echo "Running apt-get update"
apt-get update -y &> /dev/null



#
echo "*      installing Nginx"
#
$apt_cmd nginx &> /dev/null
usermod -G vagrant www-data

#
echo "*      installing Miscillaneous PROGRAMS"
#
$apt_cmd git ack-grep &> /dev/null

#
echo "*      installing Node.js"
#
$apt_cmd nodejs npm build-essential &> /dev/null
$apt_cmd coffeescript &> /dev/null

sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install --silent -g grunt-cli &> /dev/null

#
echo "*      installing PHP"
#
$apt_cmd git libpq-dev php5-pgsql php5-curl php5-cli php5-fpm php-pear php5-dev &> /dev/null

#
echo "*      installing PostgreSQL"
#
$apt_cmd postgresql postgresql-client postgresql-contrib &> /dev/null

#
echo "*      installing PostGIS-2.1"
#
$apt_cmd postgis postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-2.1-scripts &> /dev/null

#
echo "*      configuring PostGIS"
#
cp -f $SHARE_DIR/provision/config/pg_hba.conf /etc/postgresql/9.3/main
sudo service postgresql restart > /dev/null

#
echo "*      configuring Nginx"
#
rm -rf /etc/nginx/sites-available/default > /dev/null
# delete the default website
rm -rf /var/www/html
service nginx restart > /dev/null

echo "*      configuring vim"
su - vagrant -c "mkdir -p /home/vagrant/.vim/autoload"
su - vagrant -c "mkdir -p /home/vagrant/.vim/bundle"
su - vagrant -c "curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"

su - vagrant -c "echo 'execute pathogen#infect()' >> /home/vagrant/.vimrc"
su - vagrant -c "echo 'syntax on' >> /home/vagrant/.vimrc"
su - vagrant -c "echo 'filetype plugin indent on' >> /home/vagrant/.vimrc"
su - vagrant -c 'git clone https://github.com/kchmck/vim-coffee-script.git /home/vagrant/.vim/bundle/vim-coffee-script/'
su - vagrant -c 'git clone git://github.com/ntpeters/vim-better-whitespace.git /home/vagrant/.vim/bundle/vim-better-whitespace'

# DO ANY COPYING
echo "*       copying vim config file $PROVISION_CONFIG_DIR/vimrc to /etc/vim/vimrc"
cp -f $PROVISION_CONFIG_DIR/vimrc /etc/vim/vimrc

#
echo "*      installing Glances"
#
pip install Glances

#
echo "*       installing perl modules"
#
#perl -MCPAN -e 'notest install App::cpanminus'

#
echo "*       calling setup_whathood.sh"
#
$PROVISION_DIR/setup_whathood.sh

echo ""
echo ""
echo "setup complete"
end_time=`date`
echo "provision started $start_time"
echo "provision ended $end_time"
echo ""
echo "visit http://localhost:8080 on your host machine to test"
