#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION="0.1-4"

echo "Downloading and installing Percona DB"
wget https://repo.percona.com/apt/percona-release_$VERSION.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_$VERSION.$(lsb_release -sc)_all.deb

sudo apt-get update
sudo apt-get install -y percona-server-server-5.7


rm $PROJECT_TEMP_PATH/percona*
# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Percona DB Installed."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
