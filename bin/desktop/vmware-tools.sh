#!/bin/bash
# This should come first for PPA's
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Checking for VMWare Tools on /media/$USER"

if [ ! -d "/media/$USER/VMware\ Tools" ]; then
    echo "(!) You don't have VMWare Tools mounted from the Host Menu"
    echo "    VM > Install/Update VMWare Tools [skipping]"
    if [ $SKIP_SLEEP == false ]; then
        sleep 4
    fi

    exit
fi

echo "(+) Installing VMWare-Tools (Defaults)"
sudo cp /media/$USER/VMware\ Tools/VMwareTools-*.tar.gz $HOME_PATH/Downloads
cd $HOME_PATH/Downloads
sudo tar -zxvf VMwareTools-*
sudo rm VMwareTools-*

# -d = Install Defaults
echo "(+) Installing VMWare-Tools (Defaults)"
sudo ./vmware-tools-distrib/vmware-install.pl -d

sudo rm -rf vmware-tools-distrib

# I would use this, yet it might NOT be installed, so we can't
# sudo vmware-config-tools.pl -d

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
