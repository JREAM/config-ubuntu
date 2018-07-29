#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

OS_VERSION=$(lsb_release -cs)

if [[ $OS_VERSION == 'bionic' ]]; then
  sudo apt update && sudo apt install mongodb -y
  sudo systemctl start mongodb
  sudo systemctl enable mongodb
  exit 1;
fi

echo "(+) Adding GPG Key"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5


echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

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
echo "    Consider getting a GUI like Mongo Studio 3T"
echo ""
echo "    Default Storage: /var/lib/mongodb"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
