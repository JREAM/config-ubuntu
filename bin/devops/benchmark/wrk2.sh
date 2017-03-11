#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y build-essential libssl-dev git
git clone https://github.com/giltene/wrk2.git /opt/wrk2
cd /opt/wrk2
sudo make

# move the executable to somewhere in your PATH
sudo cp wrk /usr/local/bin

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! Run with $ wrk "

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

