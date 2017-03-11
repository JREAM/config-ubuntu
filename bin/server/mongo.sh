#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Adding GPG Key"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo echo "[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target
Documentation=https://docs.mongodb.org/manual

[Service]
User=mongodb
Group=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
" > mongod.service
    mv mongod.service /lib/systemd/system/
    rm mongod.service  # If this lingers remove it

sudo apt-get update

echo "(+) Installing Mogno"
sudo apt-get install -y\
    mongodb-org

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

sudo service mongod start


echo "(+) Complete! Installed Mongo DB Community Edition."
echo "    use $ sudo service mongod <command>"
echo "    Consider getting a GUI like mongochef"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
