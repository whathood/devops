#!/bin/bash

start_time=`date`

SHARE_DIR="/vagrant"
PROVISION_DIR="$SHARE_DIR/provision"

echo "*       configuring ubuntu"
source $PROVISION_DIR/configure_ubuntu.sh
#
echo "*       calling setup_whathood.sh"
#
source $PROVISION_DIR/setup_whathood.sh

echo " "
echo " "
echo "setup complete"
end_time=`date`
echo "provision started $start_time"
echo "provision ended $end_time"
echo " "
echo " "
echo " "
echo " "
echo "visit http://localhost:8080 on your host machine to test"