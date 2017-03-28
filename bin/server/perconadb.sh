#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Downloading and installing Percona DB"
wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb -O $PROJECT_TEMP_PATH/percona.deb

sudo apt-get update

sudo apt-get -y install percona-server-server


rm $PROJECT_TEMP_PATH/percona*
# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Percona DB Installed."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
