#!/bin/bash
# Desktop: Quick Installer

# Required FLAG for child processes to run
export INSTALL_SCRIPT=true

# The base script if needed
export BASE_SCRIPT='desktop'

# Exports used throughout scripts
source ./bin/_exports.sh

echo " ╔════════════════════════════════════════════════════════════════════╗ "
echo " ║                      JREAM - Ubuntu Installer                      ║ "
echo " ║                      Target: 22.04 Jammy                           ║ "
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
    (GUI Tools)
    ──────────────────────────────────────────────────────────────────────
    gnome-tweak       Install Chrome Addon and Tweak Tool
    flameshot         Gnome Screenshot Tool
    kazam             Gnome Screen Recorder
    dropbox           UI Client for DropBox
    flux              Protect your Eyes (Alternative is RedShift)
    guake             Popular F12 Drop Down Terminal
    mysql-workbench   MySQL GUI/CLI Powerful Tool
            mysqlwb
    postman           REST GUI Application
    beekeeper         Clean and UI Friendly MySQL GUI

    (Browsers)
    ──────────────────────────────────────────────────────────────────────
    Brave           Install Brave Browser
    Chrome          Install Google Chrome Browser
    Firefox         Install Firefox Browser (Default: In Ubuntu)
    Vivaldi         Install Vivaldi Browser

    (Code Editors)
    ──────────────────────────────────────────────────────────────────────
    sublime-text      Installs Sublime text 3 (deb package) (x64)
    vscode            Install Visual Studio Code
    vscode-insiders   Install VSCode Insider Edition (Both can be installed)

    postman           (on hold)The popular Postman Client for API testing

    (Language Support)
    ──────────────────────────────────────────────────────────────────────
    php             FPM Only: 7.0-4, 8.0-2 (Select Version) *in progress*
    lua             *in progress*
    go              1.19.2
    rust            *in progress*

    (Database Support)
    ──────────────────────────────────────────────────────────────────────
    mysql             Install Latest MySQL Server and Client
    mongo             Install Mongo Community Edition
    postgres          Install Postgres SQL
    redis             Install Redis Server In  Memory Database

    (Webserver Support)
    ──────────────────────────────────────────────────────────────────────
    apache            Install Apache2 Webserver
    nginx             Install Nginx Webserver
    caddy             Install Caddy Webserver

    (Version Managers)
    ──────────────────────────────────────────────────────────────────────
    fnm             Install Faster Node Manager
    gvm             Install Go Version Manager
    nvm             Installs Node Version Manager
    phpenv          Install PHP Environment Manager
    pipenv          Install PipEnv Manager
    pyenv           Install PyEnv Manager (With VirtualEnvs)
    rbenv           Install RbEnv (Ruby) Manager
    rvm             Installs RVM (Ruby) Manager

    (DevOps)
    ──────────────────────────────────────────────────────────────────────
    docker         Install Docker, Compose, Machine & bash-autocomplete

    ansible        Install Ansible Provisioner
    saltstack      Install Saltstack Provisioner
    puppet         Install Puppet Configuration Manager

    (Hashicorp)
    ──────────────────────────────────────────────────────────────────────
    consul         Install Hashicorp Consul
    nomad          Install Hashicorp Nomad
    packer         Install Hashicorp Packer
    serf           Install Hashicorp Serf
    terraform      Install Hashicorp Terraform
    vault          Install Hashicorp Vault
    vagrant        Install Hashicorp Vagrant

    (Benchmarks)
    ──────────────────────────────────────────────────────────────────────
    iperf          Install iperf CLI util
    sysbench       Install sysbench CLI util
    wrk2           Install wrk2 CLI util (Quick Build)

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
  # Version Managers
  gvm | nvm | fnm | phpenv | pyenv | pipenv | rbenv | rvm)
    bash ./bin/version-managers.sh "$cmd"
    ;;
  arronax)
    bash ./bin/desktop/arronax.sh
    ;;
  # Browsers
  brave | chrome | chromium | vivaldi | opera)
    bash ./bin/browsers.sh "$cmd"
    ;;
  # Gui tools
  dropbox | flux | gnome-tweak | guake | mysql-workbench | mysqlwb | postman | beekeeper | flameshot | kazam)
    bash ./bin/gui-tools.sh "$cmd"
    ;;
  security)
    bash ./bin/security.sh
    ;;
  # Databases
  mysql | mongo | postgres | redis)
    bash ./bin/databases.sh "$cmd"
    ;;
  # Webservers
  apache | apache2 | nginx | caddy)
    bash ./bin/webservers.sh "$cmd"
    ;;
  # Code Editors
  vscode | vscode-insiders | sublime-text | vim)
    bash ./bin/code-editors.sh "$cmd"
    ;;
  go | golang)
    bash ./bin/language-support/go.sh
    ;;
  util)
    bash ./bin/util.sh
    ;;
  # Hashicorp
  consul | nomad | packer | serf | terraform | vagrant | vault)
    bash ./bin/hashicorp.sh "$cmd"
    ;;
  docker)
    bash ./bin/docker.sh
    ;;
  # Benchmarks
  iperf | sysbench | wrk2)
    bash ./bin/benchmarks.sh "$cmd"
    ;;
  # Provisioners
  ansible | saltstack | puppet)
    bash ./bin/provisioners.sh "$cmd"
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
