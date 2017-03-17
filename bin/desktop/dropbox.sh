#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading DropBox"
cd $HOME_PATH && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# Make sure permissions are correct
sudo chown -R $SUDO_USER:$SUDO_USER $HOME_PATH/.dropbox

echo "(+) Running Daemon (~/.dropbox-dist/dropboxd)"
$HOME_PATH/.dropbox-dist/dropboxd

echo "(+) Complete! Check your $HOME/Dropbox folder (you'll need to login)"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
