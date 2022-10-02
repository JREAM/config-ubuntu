#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

# Add fix for Nautlus Glitch
sudo add-apt-repository -y ppa:costales/folder-color
sudo apt-get install -y folder-color
nautilus -q

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
  imagemagick
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

#wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; rm gitflow-installer.sh

# For Additional Bash Scripts
mkdir ~/.bash

if [ $BASE_SCRIPT == 'desktop' ]; then
  UTILS+=(
    terminator
    gdebi
  )

  for util in "${UTILS[@]}"; do
    sudo apt-get install $util -y
  done

fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Git Extras Autocomplete
cp "$REPO_FILES_PATH/gh_complete.sh" "$HOME/.bash/"
sudo chown $USER:$USER "$HOME/.bash/gh_complete.sh"

echo "(+) Completed install utilities."
echo ""
echo "    If you'd like git-extras autocomplete installed,"
echo "    add this to your ~/.bashrc file:"
echo ""
echo 'if [ -f "$HOME/.bash/gh_complete.sh" ]; then'
echo '   source "$HOME/.bash/gh_complete.sh"'
echo 'fi'
echo ""
