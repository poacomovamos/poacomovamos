#!/usr/bin/env bash

set -e

VAGRANT_REMOTE_LOCATION="http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/Vagrant-1.3.5.dmg"
VIRTUALBOX_REMOTE_LOCATION="http://download.virtualbox.org/virtualbox/4.3.0/VirtualBox-4.3.0-89960-OSX.dmg"
BASE_BOX_NAME='precise32'
BASE_BOX_LOCATION="http://files.vagrantup.com/precise32.box"

echo "Bootstrapping:"
echo ".. Checking for Vagrant"

VAGRANT=`which vagrant`

if echo $VAGRANT | grep -q 'not found'
then
  echo ".... No Vagrant installed. Fetching from:" $VAGRANT_REMOTE_LOCATION
  wget -O /tmp/Vagrant-1.3.5.dmg $VAGRANT_REMOTE_LOCATION
  open /tmp/Vagrant-1.3.5.dmg
  read -p ".... Press [Enter] key after vagrant has installed to continue..."
else
  echo ".... Vagrant found at:" $VAGRANT
fi

echo ".. Checking for '$BASE_BOX_NAME' base box"

BOXES=`vagrant box list | cut -f 1 -d ' '`

if echo $BOXES | grep -q $BASE_BOX_NAME
then
  echo ".... Base box found"
else
  echo ".... No suitable base box found. The following base boxes exist:" $BOXES
  echo ".... Fetching base box from:" $BASE_BOX_LOCATION
  vagrant box add $BASE_BOX_NAME $BASE_BOX_LOCATION
fi

echo ".. Checking for VirtualBox"

VIRTUALBOX=`which VBoxManage`

if echo $VIRTUALBOX | grep -q 'not found'
then
  echo ".... No VirtualBox installed. Fetching from:" $VIRTUALBOX_REMOTE_LOCATION
  wget -O /tmp/Virtualbox-4.3.0-89960-.dmg $VIRTUALBOX_REMOTE_LOCATION
  open /tmp/Virtualbox-4.3.0-89960-OSX.dmg
  read -p ".... Press [Enter] key after VirtualBox has installed to continue..."
else
  echo ".... VirtualBox found"
fi

echo ".. Finished - run ./go.sh to get started"
