#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing IRSSI IRC Terminal Client"

sudo apt update
sudo apt install -y irssi

# If error messages pop up after running the command
# sudo dpkg -i google-chrome*.deb then run the command
# sudo apt-get install -f

echo "(+) Complete!  From Terminal, $ irssi"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
