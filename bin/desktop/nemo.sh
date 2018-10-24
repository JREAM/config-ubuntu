#!/bin/bash
# This should come first for PPA's
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Nemo File Explorer"

sudo add-apt-repository ppa:embrosyn/cinnamon

# apt-cache search nemo

sudo apt-get install -y\
  nemo \
  nemo-dropbox \
  nemo-preview \
  nemo-emblems \
  nemo-media-columns \
  libpangox-1.0-0 \
  libpango1.0-0 -y

sudo apt -y remove nautilus-dropbox

# Dropbox
wget http://packages.linuxmint.com/pool/import/d/dropbox/dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox*.deb && rm dropbox*.deb


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

