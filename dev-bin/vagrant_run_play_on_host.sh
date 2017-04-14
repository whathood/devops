#!/bin/sh

INVENTORY="$(pwd)/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"

TARGET_INVENTORY="$(pwd)/ansible/vagrant_hosts"

# link their inventory file
if [ ! -e $TARGET_INVENTORY ]; then
  echo "linking vagrant inventory $INVENTORY to $TARGET_INVENTORY"
  ln -s $INVENTORY $TARGET_INVENTORY
fi

ansible-playbook -i $TARGET_INVENTORY $*
