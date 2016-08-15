#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install -y\
    ruby2.3\
    ruby2.3-dev\
    gem

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Run with $ ruby, and $ gem"
