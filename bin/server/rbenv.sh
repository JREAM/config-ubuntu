#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Install (RBENV) Ruby Version Manager"

# Dependencies
sudo apt-get install -y rbenv ruby-build

# Remove old folder no longe rused
if [ -d $HOME_PATH/.rbenv ]; then
  rm -rf $HOME_PATH/.rbenv
fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete!"
echo "    $ rbenv install -l"
echo "    $ rbenv global 2.5.3"
echo ""
echo ""
if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
