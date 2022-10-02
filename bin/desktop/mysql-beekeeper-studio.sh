#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

echo "(+) Adding Beekeeper Key"
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -

echo "(+) Adding Beekeeper to/etc/apt/sources.list.d/"
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

echo "(+) Installing Beekeeper Studio"
sudo apt install beekeeper-studio -y

echo "(+) Complete!"
