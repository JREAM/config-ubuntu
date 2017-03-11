#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Postgres"
sudo apt-get install -y postgresql postgresql-client

echo "(+) Complete, run with $ sudo su - postgres"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
