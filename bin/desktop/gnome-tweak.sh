#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

sudo apt-get install -y chrome-gnome-shell \
  gnome-tweak-tool

echo "(+) Complete! Open Chrome and install extensions at:"
echo "    https://extensions.gnome.org/local/"
