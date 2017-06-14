#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Installing Shutter Screenshot & Dependencies"
sudo apt install -y\
    shutter\
    libimage-exiftool-perl\
    gnome-web-photo

echo "(+) Complete! "
echo "(+) Check your Applications menu for Shutter"
echo ""   Or type $ shutter
echo ""
echo "(+) To replace your PrintScreen, go to Settings > Keyboard > Shortcuts"
echo "    Custom Shortcuts (Bottom Left) > (+) Icon to create new and Add:"
echo "     Name: Shutter"
echo "     Command: shutter -s     (-s selection, -f full screen, many more)"
echo ""
echo "[*]  For the arguments list for the default hotkey type: $ shutter --help in terminal."


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
