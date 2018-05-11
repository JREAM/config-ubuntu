#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Installing Jekyll"

# Deps
sudo apt install -y\
    gcc\
    g++\
    make\
    ruby

mkdir $HOME_PATH/{gems,.gem} && chown $USER:$USER $HOME_PATH/{gems,.gem}

gem install bundler jekyll

echo "(+) Complete! "
echo "(+) "
echo "   $ jekyll"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
