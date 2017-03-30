#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Install Keys
echo "(+) Downloading Hyper.sh CLI (PaaS)"
curl -sSL https://hyper.sh/install | bash



if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
