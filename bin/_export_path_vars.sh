#!/bin/bash
# Get the Paths and Settings
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

export OS_CODENAME=`lsb_release -s -c`
export REPO_BIN_PATH=$PWD/bin            # (NO Trailing Slash!)
export REPO_FILES_PATH=$PWD/files         # (NO Trailing Slash!)
export REPO_DOTFILES_PATH=$PWD/dotfiles   # (NO Trailing Slash!)
export REPO_TMP_PATH=$PWD/tmp           # (NO Trailing Slash!)

# @important
#
# The variable $PWD will be where the script is run from
# So it's important to only allow running from the root folder
# with the install scripts.
