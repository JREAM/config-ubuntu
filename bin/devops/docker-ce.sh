#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Installing Docker Apt-Key"
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


echo "(+) Adding the Apt File"

if [[ $OS_CODENAME == 'xenial' ]]; then
    sudo add-apt-repository "deb https://apt.dockerproject.org/repo ubuntu-xenial main"
fi

echo "(+) Updating the Apt Cache"
sudo apt-get update

# Remove any old docker items
echo "(+) Purging any old docker"
sudo apt-get purge lxc-docker
apt-cache policy docker-engine

echo "(+) Installing Docker"
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y docker-engine
sudo service docker start

# Create a docker group, add our user to it
sudo groupadd docker
sudo usermod -aG docker $USER

echo "(+) Complete! Run with $ docker"
echo "    If you are using UFW, please see:"
echo "    https://docs.docker.com/engine/installation/linux/ubuntulinux/#/enable-ufw-forwarding"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
