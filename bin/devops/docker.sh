#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

COMPOSE_VERSION="1.23.2"

echo "(+) Installing Docker CE | First Removing Old Docker Engine"
sudo apt-get remove -y docker docker-engine docker.io containerd runc

sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "(+) Installing Docker GPG Key"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "(+) Updating the /etc/sources.list.d/"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "(+) Installing Docker"
sudo apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose-plugin

echo "(+) Adding user to docker group"
# Create a docker group, add our user to it
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG docker root

# Docker Compose
echo "(+) Installing: Docker Compose ($COMPOSE_VERSION)"
sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose"



echo "(+) Complete! Run with $ docker / $ docker-compose"
echo -e "\t You may need to reload your shell to apply the new user group permissions."
echo -e "\t Which were: sudo usermod -aG docker \$USER"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
