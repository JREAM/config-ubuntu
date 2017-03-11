#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y iperf

echo "(+) Complete! Run with: "
echo "Start Server:      $ iperf -s -p 8080"
echo "Connect to Server: $  iperf -c 192.168.72.1 -p 8000"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

