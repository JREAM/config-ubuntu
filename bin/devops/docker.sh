#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Docker CE"
# For 14 but perhaps I have a bug?
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual\
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Install Keys
echo "(+) Installing Docker GPG Key"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88


echo "(+) Adding the Apt File"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "(+) Updating the Apt Cache & Installing Docker"
sudo apt-get update
sudo apt-get install docker-ce

echo "(+) Adding user to docker group"
# Create a docker group, add our user to it
sudo groupadd docker
sudo usermod -aG docker $USER

echo "(+) Complete! Run with $ docker"
echo "    If you are using UFW, please see:"
echo "    https://docs.docker.com/engine/installation/linux/ubuntulinux/#/enable-ufw-forwarding"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
