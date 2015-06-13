#!/bin/bash

# master setup script
#
# this will get run as user vagrant
#
# runs
# this gets run inside the virtual machine
#  * configure_ubuntu.sh to configure environment
#  * chef_configure.sh - configures other stuff
#  * setup_whathood.sh

start_time=`date`

SHARE_DIR="/vagrant"
PROVISION_DIR="$SHARE_DIR/provision"
BIN_DIR="$PROVISION_DIR/bin"

source $BIN_DIR/configure_ubuntu.sh

sudo ruby $BIN_DIR/chef_configure.rb
