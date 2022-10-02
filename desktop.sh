#!/bin/bash
# Desktop: Quick Installer

# Required FLAG for child processes to run
export INSTALL_SCRIPT=true

# The base script if needed
export BASE_SCRIPT='desktop'

# Exports used throughout scripts
source ./bin/exports.sh

echo " ╔════════════════════════════════════════════════════════════════════╗ "
echo " ║                      JREAM - Ubuntu Installer                      ║ "
echo " ╠════════════════════════════════════════════════════════════════════╣ "
echo " ║ Installation runs after command is entered.                        ║ "
echo " ║ View OUTPUT.LOG when complete.                                     ║ "
echo " ║                                                                    ║ "
echo " ║ (q) to Quit                                      (Or press CTRL+C) ║ "
echo " ╚════════════════════════════════════════════════════════════════════╝ "
echo ""
sleep 1


while true; do
  cat <<-command_list
    (Gnome)
    ──────────────────────────────────────────────────────────────────────
    gnome-tweak   Install Chrome Addon and Tweak Tool
    shutter       Best Screenshot Tool (Instructions to overwrite PrintScreen after install)

    (Browsers)
    ──────────────────────────────────────────────────────────────────────
    Brave
    Chrome
    Firefox
    Vivaldi

    (Code Editors)
    ──────────────────────────────────────────────────────────────────────
    sublime-text      Installs Sublime text 3 (deb package) (x64)
    vscode            Install Visual Studio Code
    vscode-insiders   Install VSCode Insider Edition (Both can be installed)

    postman           (on hold)The popular Postman Client for API testing

    (Utilities)
    ──────────────────────────────────────────────────────────────────────
    arronax       Easily Create Launchers for any Linux Environment
    dropbox       Installs Dropbox (x64)

    ffmpeg        ffmpeg cli converter
    flux          f.lux for eye strain, GUI app
    mysqlwb       Install MySQL Workbench
    guake         Drop down terminal
    security      Install ClamAV, RKHunter (read instructions after install)

    util          Install Utilities: (git, curl, htop, unzip, terminator, tmux, screen)
    vim           Install Vim (.vimrc and Vundle Plugins)

    ──────────────────────────────────────────────────────────────────────
    q             Quit (or CTRL + C)

command_list

  echo -e "\n══════════════════════════════════════════════════════════════════════\n"

  read -e -p "Type a Command: " cmd

  # Enable previous commands with arrow key
  history -s "$cmd"

  case $cmd in
  arronax)
    bash ./bin/desktop/arronax.sh
    ;;
  beekeeper)
    bash ./bin/desktop/mysql-beekeeper-studio.sh
    ;;
  brave | chrome | chromium | vivaldi | opera)
    bash ./bin/desktop/browsers.sh "$cmd"
    ;;
  dropbox)
    bash ./bin/desktop/dropbox.sh
    ;;
  ffmpeg)
    bash ./bin/desktop/ffmpeg.sh
    ;;
  flux)
    bash ./bin/desktop/flux.sh
    ;;
  gnome-tweak)
    bash ./bin/desktop/gnome-tweak.sh
    ;;
  guake)
    bash ./bin/desktop/guake.sh
    ;;
  mysqlwb)
    bash ./bin/desktop/mysql-workbench.sh
    ;;
  postman)
    bash ./bin/desktop/postman.sh
    ;;
  security)
    bash ./bin/security.sh
    ;;
  shutter)
    bash ./bin/desktop/shutter.sh
    ;;
  vscode | vscode-insiders | sublime-text)
    bash ./bin/desktop/code-editors.sh "$cmd"
    ;;
  util)
    bash ./bin/util.sh
    ;;
  vim)
    bash ./bin/vim.sh
    ;;
  q)
    exit 1
    ;;
  *)
    echo -e "\n    (!) OOPS! You typed a command that's not available. \n"
    sleep 2
    ;;

  esac

  echo -e "\n══════════════════════════════════════════════════════════════════════\n"

done
