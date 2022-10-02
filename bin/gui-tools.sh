#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

source _exports.sh

if [ ! -z $1 ]; then
  error "Developer Error! Missing Argument"
  return 0
fi

# Hashicorp Program to install
PROGRAM=$1

case $PROGRAM in
dropbox)
  cd ~
  wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  sudo chown -R $USER:$USER ~/.dropbox
  sudo chown -R $USER:$USER ~/Dropbox
  ~/.dropbox-dist/dropboxd
  log "Installed DropBox; You must authenticate from Gnome." success
  ;;
flameshot)
  sudo apt install -y flameshot
  log "Installed Flameshot" success
  ;;
kazam)
  sudo apt install -y kazam
  log "Installed kazam" success
  ;;
flux)
  sudo add-apt-repository -y ppa:nathan-renniewaldock/flux
  sudo apt-get install -y fluxgui
  log "Installed Flux GUI" success
  ;;
guake)
  sudo apt-get install -y guake
  log "Installed Guake Terminal: <F12>" success
  ;;
gnome-tweak)
  sudo apt-get install -y \
    chrome-gnome-shell \
    gnome-tweak-tool
  log "Installed Gnome Tweak Tool and Chrome Gnome Shell" success
  ;;
mysql-beekeeper | beekeeper)
  wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
  echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list
  sudo apt install -y beekeeper-studio -y
  log "Installed Beekeeper Studio (MySQL)" success
  ;;
mysql-wb | mysql-workbench)
  sudo apt-get install -y mysql-workbench
  log "Installed MySQL Workbench" success
  ;;
typora)
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
  sudo add-apt-repository -y 'deb http://typora.io linux/'
  sudo apt-get install -y typora
  log "Installed Typora; $ typora" success
  ;;
postman)
  cd ~
  wget https://dl.pstmn.io/download/latest/linux64 -O ~/postman.tar.gz
  tar -xvf ~/postman.tar.gz -C ~/.local/opt/postman
  rm ~/postman.tar.gz
  if [ ! -s /.local/bin/postman ]; then
    # Todo ensure this is correct path
    sudo ln -s ~/.local/opt/postman/Postman ~/.local/bin/postman
  fi
  log "Installed Postman ; $ postman" success

  # Create Shortcut Launcher
  cat >~/.local/share/applications/postman.desktop <<EOF
    [Desktop Entry]
    Version=1.0
    Name=Postman
    Exec=postman
    Type=Application
    Terminal=false
    Icon=/.local/opt/postman/resources/app/assets/icon.png
    Categories=Development;
EOF
  ;;
*)
  error "Developer Error! Invalid \$program"
  ;;
esac
