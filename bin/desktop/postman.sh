#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

echo "(+) Downloading Postman"
wget https://dl.pstmn.io/download/latest/linux64 -O $REPO_TMP_PATH/postman.tar.gz
cd $REPO_TMP_PATH

echo "(+) Moving Postman to /opt/Postman"
sudo tar -xvf $REPO_TMP_PATH/postman.tar.gz -C /opt
rm $REPO_TMP_PATH/postman.tar.gz

if [ ! -s /usr/bin/postman ]; then
  echo "(+) Symlink in /usr/bin/postman"
  sudo ln -s /opt/Postman/Postman /usr/bin/postman
fi

echo "(+) Creating Desktop Entry $HOME/.local/share/applications/postman.desktop"

cat >$HOME/.local/share/applications/postman.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=Postman
Exec=postman
Type=Application
Terminal=false
Icon=/opt/Postman/resources/app/assets/icon.png
Categories=Development;
EOF

echo "(+) Complete! Look for Postman in your application menu."
