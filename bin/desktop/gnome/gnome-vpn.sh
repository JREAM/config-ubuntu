#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Installing Gnome OpenVPN Tools"

sudo apt-get install -y\
    network-manager-openvpn \
    network-manager-vpnc \
    network-manager-openconnect \
    network-manager-openvpn-gnome \
    network-manager-vpnc-gnome \
    network-manager-openconnect-gnome

echo "Restarting Network Manager Tool"
sudo systemctl daemon-reload
sudo service network-manager restart

echo "(+) Complete! You can edit your networks these 3 ways:"
echo "    1: Settings > Networks area"
echo "    2: $ nm-connection-manager"
echo "    3: $ nmcli (If you are very advanced"
echo ""
if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
