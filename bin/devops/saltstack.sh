#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-add-repository ppa:saltstack/salt
sudo apt-get update

sudo apt-get install -y salt-api\
    salt-cloud\
    salt-master\
    salt-minion\
    salt-ssh\
    salt-syndic

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Use with $ salt, salt-cloud, salt-msater, salt-minion, salt-shh, salt-syndic"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
