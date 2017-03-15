#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    ruby2.3\
    ruby2.3-dev\
    gem

# IMPORTANT: Do NOT have a trailing \ on the LAST item!


sudo gem install bundler

echo "(+) Complete! Run with $ ruby, and $ gem"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
