#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Docker CE | First Removing Old Docker Engine"
sudo apt-get remove docker docker-engine

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo "(+) Installing Docker GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "(+) Adding the Apt File [AMD64]"
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
sudo usermod -aG docker root

echo  "(+) Adding Docker Machine"
curl -L https://github.com/docker/machine/releases/download/v0.11.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

echo "(+) Installing: Compose"
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

echo "(+) Adding: bash-completion for docker-machine"
sudo curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker

echo "(+) Adding: bash-completion for docker-compose"
sudo url -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose


echo "(+) Complete! Run with $ docker / docker-machine / docker-compose"
echo ""
echo "    If you are using UFW, please see:"
echo "    https://docs.docker.com/engine/installation/linux/ubuntulinux/#/enable-ufw-forwarding"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
