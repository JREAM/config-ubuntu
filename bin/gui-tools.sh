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

case $PROGRAM in
dropbox)
  cd ~
  wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  sudo chown -R "$USER":"$USER" ~/.dropbox
  sudo chown -R "$USER":"$USER" ~/Dropbox
  ~/.dropbox-dist/dropboxd
  log "Installed DropBox; You must authenticate from Gnome." success
  ;;
pgadmin)
  cd ~
  curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
  sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
  sudo apt install -y pgadmin4
  log "Installed Pgadmin Web/Desktop Client." success
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
