#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

# Argument Required for File
if [ -z "$1" ]; then
  error "Developer Error! Missing Argument for $FILE"
  exit
fi

# Program to install
PROGRAM=$1

case $PROGRAM in
ansible)
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get install -y ansible
  if [ -x /usr/bin/ansible ]; then
    log "Package: Ansible installed. $ ansible" success
  else
    log "Package: Ansible had a problem installing" error
  fi
  ;;
saltstack)
  sudo apt-add-repository -y ppa:saltstack/salt
  sudo apt-get install -y salt-api \
    salt-cloud \
    salt-master \
    salt-minion \
    salt-ssh \
    salt-syndic
  if [ -x /usr/bin/salt-master ]; then
    log "Package: Installed Saltstack; $ salt-*" success
  else
    log "Package: Saltstack has a problem installing." error
  fi
  ;;
puppet)
  sudo apt install -y puppet
  if [ -x /usr/bin/puppet ]; then
    log "Package: Puppet installed. $ puppet" success$()
  else
    log "Package: Puppet has a problem installing." error
  fi
  ;;
*)
  error "Developer Error! Invalid \$program for $FILE"
  ;;
esac
