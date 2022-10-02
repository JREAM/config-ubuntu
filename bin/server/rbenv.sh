#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

echo "(+) Install (RBENV) Ruby Version Manager"

# Dependencies
sudo apt-get install -y rbenv ruby-build

# Remove old folder no longe rused
if [ -d $HOME/.rbenv ]; then
  rm -rf $HOME/.rbenv
fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete!"
echo "    $ rbenv install -l"
echo "    $ rbenv global 2.5.3"
echo ""
echo ""
