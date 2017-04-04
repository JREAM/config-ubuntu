#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo gem install middleman

echo "(+) Complete! Run with:"
echo "              middleman init"
echo "              middleman server"
echo "              middleman build"
echo ""
echo "See: https://middlemanapp.com/basics/install/"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
