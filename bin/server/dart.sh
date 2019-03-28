#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update; sudo apt-get install dart -y

echo "(+) Complete! Run with $ dart"
echo "    Ensure you have this in a .bash* file:"
echo "    export PATH=\"\$PATH:/usr/lib/dart/bin"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
