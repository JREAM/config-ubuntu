#!/bin/bash
# Get the Paths and Settings
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

export OS_CODENAME=`lsb_release -s -c`
export PROJECT_BIN_PATH=$PWD/bin            # (NO Trailing Slash!)
export PROJECT_FILE_PATH=$PWD/files         # (NO Trailing Slash!)
export PROJECT_DOTFILE_PATH=$PWD/dotfiles
export PROJECT_TEMP_PATH=$PWD/tmp           # (NO Trailing Slash!)

# @important
#
# The variable $PWD will be where the script is run from
# So it's important to only allow running from the root folder
# with the install scripts.
