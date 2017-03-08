#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo apt-get install -y\
    default-jre\
    default-jdk

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Complete! JRE and JDK in installed."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
