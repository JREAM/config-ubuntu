#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Installing GVM (Google Version Manager)"

sudo apt install -y bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

echo "(+) Complete! Run with $ gvm listall"
echo "If not using my dotfiles ensure this is in .bashrc:"
echo ""
echo '    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"'

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
