#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

if [ -f /etc/apt/sources.list.d/phalcon*ppa ]; then
    sudo rm /etc/apt/sources.list.d/phalcon*ppa
fi
sudo add-apt-repository -y ppa:phalcon/stable
echo "(+) Re-Adding Phalcon PPA."

# Update to get the new repo details
sudo apt-get update

echo "(+) Installing Phalcon."

sudo apt-get install -y\
    php7.0-phalcon

sudo sh -c 'echo "extension=phalcon.so" >> /etc/php/7.0/mods-available/phalcon.ini'
sudo phpenmod phalcon

echo "(+) Phalcon Enabled (phpenmod phalcon)."
