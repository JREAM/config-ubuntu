#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Installing PPA for evdev-smoothscroll"
sudo add-apt-repository ppa:w-shackleton/evdev-smoothscroll
sudo sed -i 's/(bionic|xenial)/trusty/gi' /etc/apt/sources.list.d/w-shackleton/evdev-smoothscroll*.list

echo '(+) Adding you to the plugdev group'
sudo usermod -aG plugdev $USER

echo "(+) Complete! "
echo "xinput list  # find your mouse..."
echo "xinput list-props 9  # as an example"
echo "(+) Add the following to your $HOME/.bash_profile or $HOME/.profile:"
echo ''
echo 'xinput set-prop "Logitech Performance MX" "Evdev Scrolling Distance" -8 1 1'
echo
echo "Logout and back in, you can adjust properties with the following:"

echo -e "\nMore Here: https://github.com/pwr/Solaar/issues/158"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
