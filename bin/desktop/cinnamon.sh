#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Cinnamon + Muffin & OpenGL"
sudo apt-get install -y\
  cinnamon\
  muffin\
  freeglut3\
  freeglut3-dev


# IMPORTANT: Do NOT have a trailing \ on the LAST item!


echo " (+) Complete! Logout and run cinnamon!"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

