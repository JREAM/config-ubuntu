#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install sysbench

echo "(+) Complete! Run with $ sysbench --test=cpu --num-threads=4 --cpu-max-prime=9999 run"
