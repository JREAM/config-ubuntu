#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

# These are core tools
UTILS=(
  bzip2
  colordiff
  curl
  dconf-editor
  git
  gnupg2
  gparted
  htop
  lsscsi # Addtl Tool to Inspect SCSI Devices (HDD/Optical)
  hwinfo # Addtl Tool to Inspect Hardware
  jumpapp # Focus/Unfocus hotkey customization for shortcuts
  lsb-core # For lsb_release when missing
  ncdu
  nmap # nmap -p 3333 localhost  (cannot ping ports, this checks them)
  net-tools
  netperf
  preload
  pydf
  python-software-properties
  screen
  shellcheck
  software-properties-common
  synaptic
  slugify
  task-spooler
  tmux
  tree
  unzip
  whois
  xclip
  xsel
)
for util in "${UTILS[@]}"; do
  sudo apt-get install $util -y
done


