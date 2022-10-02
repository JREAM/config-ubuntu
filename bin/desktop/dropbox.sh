#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

echo "(+) Downloading DropBox"
cd $HOME && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# Make sure permissions are correct
sudo chown -R $USER:$USER $HOME/.dropbox
sudo chown -R $USER:$USER $HOME/Dropbox

echo "(+) Running Daemon (~/.dropbox-dist/dropboxd)"
$HOME/.dropbox-dist/dropboxd

echo "(+) Complete! Check your $HOME/Dropbox folder (you'll need to login)"
