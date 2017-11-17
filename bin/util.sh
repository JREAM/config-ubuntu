#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# These are core tools
UTILS=(
  at
  ack-grep
  unzip
  bridge-utils
  bzip2
  git
  git-extras
  curl
  elinks
  htop
  netperf
  putty-tools
  python-software-properties
  pwgen
  gpw
  software-properties-common
  screen
  stress
  stress-ng
  supervisor
  tree
  tmux
  whois
  pydf
  ncdu
  super
  colordiff
  xclip
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
