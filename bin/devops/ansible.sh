#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update && sudo apt-get install -y ansible

echo "(+) Complete! Use with $ ansible"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
