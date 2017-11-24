#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "[+] Mint 18.2: Installing Docker CE"
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo deb https://apt.dockerproject.org/repo ubuntu-xenial main >> /etc/apt/sources.list.d/docker.list
sudo apt-get update

echo -e "[+] Mint: Installing Docker Dependencies"
sudo apt-get purge lxc-docker
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install docker-engine cgroup-lite apparmor -y

echo -e "[+] Mint: Adding 'docker' group, adding ${USER}, Running Docker"
sudo usermod -a -G docker $USER
sudo service docker start

echo -e "[+] Complete. Run with $ docker\n"

