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
  ack-grep
  at
  bashdb
  bleachbit
  bridge-utils
  bzip2
  colordiff
  curl
  dconf-editor
  elinks
  figlet    # For output of ASCII, http://www.figlet.org/examples.html
  gdebi
  git
  git-extras
  gnupg2
  gpa
  gparted
  gpw
  htop
  lolcat    # For rainbow output, ls | lolcat
  lsscsi    # Addtl Tool to Inspect SCSI Devices (HDD/Optical)
  hwinfo    # Addtl Tool to Inspect Hardware
  imagemagick
  lsb-core  # For lsb_release when missing
  ncdu
  nmap      # nmap -p 3333 localhost  (cannot ping ports, this checks them)
  net-tools
  netperf
  parallel
  preload
  putty-tools
  pwgen
  pydf
  python-software-properties
  rename
  screen
  shotwell  # Image Viewer
  software-properties-common
  stress
  stress-ng
  super
  supervisor
  synaptic
  slugify
  task-spooler
  tmux
  tree
  libkrb5-dev # Fornnode-gym rebuild (rm -rf ~/.node-gyp && npm i -g update
  ubuntu-restricted-addons
  ubuntu-restricted-extras
  unetbootin
  unzip
  whois
  xclip
  # For cht.sh (xsel is good despite cht.sh also)
  rlwrap
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
    powertop
    gdebi
  )

  for util in "${UTILS[@]}"; do
    sudo apt-get install $util -y
  done

fi

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

# Git Extras Autocomplete
cp "$PROJECT_FILE_PATH/gh_complete.sh" "$HOME_PATH/.bash/"
sudo chown $USER:$USER "$HOME_PATH/.bash/gh_complete.sh"


echo "(+) Completed install utilities."
echo ""
echo "    If you'd like git-extras autocomplete installed,"
echo "    add this to your ~/.bashrc file:"
echo ""
echo 'if [ -f "$HOME/.bash/gh_complete.sh" ]; then'
echo '   source "$HOME/.bash/gh_complete.sh"'
echo 'fi'
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 6
fi
