#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Github CLI aka 'Hub'"
git clone https://github.com/github/hub.git && cd hub
script/build -o ~/bin/hub

echo "(+) Add: alias git=hub  --  to .bashaliases or .bashrc`
echo "(+) Test With: git version && hub version"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
