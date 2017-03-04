#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Get the user who ran the sudo command
if [ $SUDO_USER ]; then
    export USER=$SUDO_USER;
else
    export USER=`whoami`;
fi

# Detect the Home path for root or a user
if [[ $USER == 'root' ]]; then
    export HOME_PATH="/root"          # (No Trailing Slash)
else
    export HOME_PATH="/home/$USER"    # (No Trailing Slash)
fi

# Just a friendly warning, but not required -- as you may want dotfiles for root also.
if [[ $USER == "root" ]]; then
    "It's not recommended run as the root user, this configures many local user files."
    sleep 2
fi
