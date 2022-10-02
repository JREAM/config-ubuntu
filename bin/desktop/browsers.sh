#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

source ../exports.sh

if [ ! -z $1 ]; then
  error "Developer Error! Missing Argument for browesers.sh"
  return 0
fi

# Hashicorp Program to install
PROGRAM=$1

case $PROGRAM in
brave)
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  sudo echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt-get update && sudo apt install -y brave-browser
  ;;
chrome)
  # @TODO Convert to GPP Key ??
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt update && sudo apt install -y google-chrome-stable
  ;;
chromium)
  sudo apt install -y chromium-browser
  ;;
vivaldi)
  wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg
  echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list
  sudo apt update && sudo apt install -y vivaldi-stable
  ;;
opera)
  # @TODO Convert to GPP Key
  wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
  sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
  sudo apt install -y opera-stable
  ;;
firefox)
  sudo apt install -y firefox
  ;;
*)
  error "Developer Error! Invalid \$program for browsers.sh"
  ;;
esac
