#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

# Argument Required for File
if [ -z "$1" ]; then
  error "Developer Error! Missing Argument for $FILE"
  exit
fi

# Program to install
PROGRAM=$1

function check_vscode_apt_list() {
  if [ -f /etc/apt/sources.list.d/vscode.list ]; then
    echo -e "[+] Found: /etc/apt/sources.list.d/vscode.list -- continuing."
    return 0
  fi

  info "[+] Adding GPG Key"
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  info "[+] Adding /etc/apt/sources.list.d/vscode.list"
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  sudo apt-get update
}

function check_sublimetext_apt_list() {
  if [ -f /etc/apt/sources.list.d/sublime-text.list ]; then
    echo -e "[+] Found: /etc/apt/sources.list.d/sublime-text.list -- continuing."
    return 0
  fi

  info "[+] Adding GPG Key"
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
  info "(+) Addding apt respository to /etc/apt/sources.list.d/sublime-text.list"
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
}

case $PROGRAM in
vscode)
  check_vscode_apt_list
  sudo apt install -y code
  log "Package: Code (VSCode) installed" success
  ;;
vscode-insiders)
  check_vscode_apt_list
  sudo apt install -y code-insiders
  log "Package: Code Insiders (VSCode Insiders) installed" success
  ;;
sublimetext)
  check_sublimetext_apt_list
  sudo apt install -y sublime-text
  log "Package: Sublime Text installed" success
  ;;
vim)
  # @TODO i prefer this in XDG paths.
  sudo apt-get install -y vim
  curl -fLo $XDG_CONFIG_HOME/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  log "Package: Vim + Plugged" success
  ;;
*)
  error "Developer Error! Invalid \$program for $FILE"
  ;;
esac
