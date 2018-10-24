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
  nemo-preview \
  nemo-emblems \
  nemo-media-columns \
  libpangox-1.0-0 \
  libpango1.0-0 -y

sudo apt -y remove nautilus-dropbox

# Dropbox
wget http://packages.linuxmint.com/pool/import/d/dropbox/dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox*.deb && rm dropbox*.deb

sudo apt install -y nemo-dropbox

echo "(+) Complete! To set nemo as your default file program run:"
echo "    $ xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search"
echo "(+) If you want to set Nautilus back to the default program run:"
echo "    $ xdg-mime default nautilus.desktop inode/directory application/x-gnome-saved-search"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

