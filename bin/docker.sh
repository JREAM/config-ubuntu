#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

# Argument Required for File
if [ -z "$1" ]; then
  error "Developer Error! Missing Argument for $FILE"; exit
fi

info "(+) Installing Docker CE | First Removing Old Docker Engine"
sudo apt-get remove -y docker docker-engine docker.io containerd runc

sudo apt-get -y install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

info "(+) Installing Docker GPG Key"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

info "(+) Updating the /etc/sources.list.d/"
info \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

apt-get update

info "(+) Installing Docker"
sudo apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose-plugin

info "(+) Adding user to docker group"
# Create a docker group, add our user to it
sudo groupadd docker
sudo usermod -aG docker "$USER"
sudo usermod -aG docker root

success "(+) Complete! Run with $ docker / $ docker-compose"
success -e "\t You may need to reload your shell to apply the new user group permissions."
success -e "\t Which were: sudo usermod -aG docker \$USER"
