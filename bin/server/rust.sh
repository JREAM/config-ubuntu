#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Getting the Rust Installer"
curl https://sh.rustup.rs -sSf | sh

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
