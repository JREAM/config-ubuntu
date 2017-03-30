#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Adding GPG Key"
sudo ufw enable
# http
sudo ufw allow 80
# https
sudo ufw allow 442
# sails (node)
sudo ufw allow 1337
# docker
sudo ufw allow 2375
# django
sudo ufw allow 8000
# extra test ports
sudo ufw allow 8001
sudo ufw allow 8002
sudo ufw allow 8080
# elastic search
sudo ufw allow 9000
# mongo port
sudo ufw allow 27017

sudo ufw reload

sudo ufw status

echo "(+) Complete!"



if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
