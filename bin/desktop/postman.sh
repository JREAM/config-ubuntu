#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Downloading Postman"
curl -L https://dl.pstmn.io/download/latest/linux64 -o $PROJECT_TEMP_PATH/Postman.tar.gz
cd $PROJECT_TEMP_PATH

ls

tar -zxvf Postman.tar.gz

echo "(+) Moving Postman to /opt/Postman"
sudo mv Postman /opt

rm Postman.tar.gz

echo "(+) Creating Desktop Entry $HOME_PATH/.local/share/applications/postman.desktop"

echo "#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/opt/Postman/Postman
Name=Postman
Icon=/opt/Postman/resources/app/assets/icon.png
Categories=Development" > "$HOME_PATH/.local/share/applications/postman.desktop"

echo "(+) Complete! Look for Postman in your application menu."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
