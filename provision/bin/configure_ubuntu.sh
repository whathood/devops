#!/bin/bash

echo "##########################

      configure_ubuntu.sh 

#################################"

SHARE_DIR="/vagrant"
PROVISION_DIR="$SHARE_DIR/provision"
PROVISION_CONFIG_DIR="$PROVISION_DIR/config"
BASEDIR=$(dirname $0)
apt_cmd='sudo apt-get -y install'

#
echo "*      Updating apt-get"
#
apt-get update > /dev/null

#
echo "*      configuring screen"
#
$apt_cmd \
    git \
    screen \
    ack-grep \
    python-pip build-essential python-dev \
    apache2-utils \
    > /dev/null

sudo pip install Glances

apt-get -y autoremove

cp -f /vagrant/provision/config/screenrc /etc/screenrc

echo "*      Running apt-get update"

sudo apt-get update -y > /dev/null 2>&1

has_docker=`which docker`

echo "has_docker is '$has_docker'"
if [ "$has_docker" = "" ]
then
  echo "*      installing docker"
  sudo apt-get install -y linux-image-generic-lts-trusty
  wget -qO- https://get.docker.com/ | sh
else
  echo "*      docker already installed"
fi

usermod -a -G docker vagrant

echo "*      configuring vim"

su - vagrant -c "mkdir -p /home/vagrant/.vim/autoload"
su - vagrant -c "mkdir -p /home/vagrant/.vim/bundle"
su - vagrant -c "curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"
su - vagrant -c "echo 'execute pathogen#infect()' >> /home/vagrant/.vimrc"
su - vagrant -c "echo 'syntax on' >> /home/vagrant/.vimrc"
su - vagrant -c "echo 'filetype plugin indent on' >> /home/vagrant/.vimrc"
su - vagrant -c 'git clone https://github.com/kchmck/vim-coffee-script.git /home/vagrant/.vim/bundle/vim-coffee-script/ > /dev/null 2>&1'
su - vagrant -c 'git clone git://github.com/ntpeters/vim-better-whitespace.git /home/vagrant/.vim/bundle/vim-better-whitespace > /dev/null 2>&1'
cp -f $PROVISION_CONFIG_DIR/vimrc /etc/vim/vimrc

sudo echo "WH_APP_ENV=development" >> /etc/environment

#
echo "*      copying bash_aliases"
#
cp $PROVISION_CONFIG_DIR/bash_aliases /etc/bash_aliases
chmod +rx /etc/bash_aliases

echo "*      copying over bashrc"
cp -f $SHARE_DIR/provision/config/bash_bashrc /home/vagrant/.bashrc

source /home/vagrant/.bashrc

echo "* #### done in configure_ubuntu"
