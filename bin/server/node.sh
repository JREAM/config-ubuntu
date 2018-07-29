#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# For compiling addons, this should be installed already but just incase..
sudo apt-get install -y build-essential

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "(+) Adding Bash Autocompletions"
sudo curl -o /etc/bash_completion.d/npm https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/npm.completion.bash


echo "(+) Complete! Run with $ node and $ npm"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
