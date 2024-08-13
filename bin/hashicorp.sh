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

function check_apt_list() {
  if [ -f /etc/apt/sources.list.d/hashicorp.list ]; then
    echo -e "[+] Found: /etc/apt/sources.list.d/hashicorp.list -- continuing."
    return 0
  fi

  info "[+] Adding Hashicorp GPG Key"
  info "[+] Adding /etc/apt/sources.list.d/hashicorp.list"
  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
  info "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt-get update
}

check_apt_list

# Hashicorp Program to install
PROGRAM=$1

case $PROGRAM in
boundary)
  sudo apt install -y boundary
  log "Installed Hashicorp Boundary; $ boundary"
  ;;
consul)
  sudo apt install -y consul
  log "Installed Hashicorp Consul; $ consul" sucess
  ;;
nomad)
  sudo apt install -y nomad
  log "Installed Hashicorp Nomad; $ nomad" sucess
  ;;
packer)
  sudo apt install -y packer
  log "Installed Hashicorp Packer; $ packer"
  ;;
serf)
  sudo apt install -y serf
  if [ -x /usr/bin/serf ]; then
    log "Package: /usr/bin/serf installed. ( $ serf )"
  else
    log "Package: /usr/bin/serf not found, problem installing" error
  fi
  ;;
terraform)
  sudo apt install -y terraform
  log "Installed Hashicorp Terraform; $ terraform" success
  ;;
vagrant)
  sudo apt install -y vagrant
  log "Installed Hashicorp Vagrant; $ vagrant" success
  ;;
vault)
  sudo apt install -y vault
  log "Installed Hashicorp Vault; $ vault" success
  ;;
waypoint)
  sudo apt install -y waypoint
  log "Installed Hashicorp Vault; $ waypoint" success
  ;;
*)
  error "Developer Error! Invalid \$program for hashicorp.sh"
  ;;
esac
