#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Ensure the dotfile submodule is installed
if [ "$(ls -A $PROJECT_DOTFILE_PATH)"  ]; then
    echo "(+) Dotfiles exists, overwriting old.";
else
    echo "(!) Error: You must install the submodule(s)."
    echo "    $ git submodule init && git submodule update"
    sleep 10
    exit
fi

source $PROJECT_DOTFILE_PATH/copy-dotfiles.sh

echo "(+) Complete! Make sure to $ source $HOME_PATH/.bashrc && source $HOME_PATH/.profile"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
