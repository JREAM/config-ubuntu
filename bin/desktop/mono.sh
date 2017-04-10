#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi



echo "(+) Installing Mono Complete for .NET / C#."

sudo apt install -y\
    mono-complete

echo "(+) Complete!"
echo "    Write C# in any editor/IDE of your choice!"
echo ""
echo "(+) Ensure it's installed properly:"
echo "    $ mono --version "

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
