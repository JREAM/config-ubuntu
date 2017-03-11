#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y sysbench

echo "(+) Complete! Run with $ sysbench --test=cpu --num-threads=4 --cpu-max-prime=9999 run"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

