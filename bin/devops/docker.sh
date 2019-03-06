#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

COMPOSE_VERSION="1.23.2"

echo "(+) Installing Docker CE | First Removing Old Docker Engine"
sudo apt-get remove docker docker-engine

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo "(+) Installing Docker GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "(+) Updating the Apt Cache & Installing Docker"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "(+) Adding user to docker group"
# Create a docker group, add our user to it
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG docker root

# Docker Compose
echo "(+) Installing: Docker Compose ($COMPOSE_VERSION)"
sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose

echo "(+) Adding: bash-completion for docker-compose"
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose


echo "(+) Complete! Run with $ docker / $ docker-compose"
echo -e "\t You may need to reload your shell to apply the new user group permissions."
echo -e "\t Which were: sudo usermod -aG docker \$USER"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
