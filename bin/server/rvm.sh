#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "[+] Installing RVM (Ruby Version Manager)"

echo "[+] Adding PPA Repository"
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install -y rvm

echo "(+) Complete! Run with $ rvm"

echo "[+] Adding ${USER} to \"rvm\" group"
sudo usermod -aG rvm $USER
sudo usermod -aG rvm root

echo "[!] To load RVM add the following to .bashrc or a similar startup dotfile:"
echo ""
echo -e "\tif [ -f /etc/profile.d/rvm.sh ]; then source /etc/profile.d/rvm.sh; fi"
echo ""
echo -e "\tYou should also the following: (@TODO I want to fix this, perhaps using GPG key rather than Ubuntu package they suggested)"
echo -e "\tsudo su"
echo -e "\Add the above line to the root users \".bashrc\" as well (or startup file)"
echo -e "\tb) This seems od
if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
