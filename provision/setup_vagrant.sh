#!/bin/bash

# master setup script
# runs
# this gets run inside the virtual machine
#  * configure_ubuntu.sh to configure environment
#  * chef_configure.sh - configures other stuff
#  * copies custom .bash_aliases
#  * setup_whathood.sh

start_time=`date`

SHARE_DIR="/vagrant"
PROVISION_DIR="$SHARE_DIR/provision"

source $PROVISION_DIR/configure_ubuntu.sh

sudo $PROVISION_DIR/chef_configure.rb

echo "*       copying bash_alaises"
cp $PROVISION_DIR/bash_aliases /home/vagrant/.bash_aliases
chmod +r /home/vagrant/.bash_aliases

# setup whathood env
source $PROVISION_DIR/setup_whathood.rb

echo "setup complete"
end_time=`date`
echo "provision started $start_time"
echo "provision ended $end_time"
echo " "
echo " "
echo " "
echo " "
echo "visit http://localhost:8080 on your host machine to test"
echo " "
