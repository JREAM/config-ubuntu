#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

source _exports.sh

if [ ! -z $1 ]; then
  error "Developer Error! Missing Argument for hashicorp.sh"
  return 0
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
  log "Installed Hashicorp Nomad; $ boundary"
  ;;
consul)
  sudo apt install -y consul
  log "Installed Hashicorp Nomad; $ consul"
  ;;
nomad)
  sudo apt install -y nomad
  log "Installed Hashicorp Nomad; $ nomad"
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
    log "Package: /usr/bin/serf not found, problem installing"
  fi
  ;;
terraform)
  sudo apt install -y terraform
  log "Installed Hashicorp Terraform; $ terraform"
  ;;
vagrant)
  sudo apt install -y vagrant
  log "Installed Hashicorp Vagrant; $ vagrant"
  ;;
vault)
  sudo apt install -y vault
  log "Installed Hashicorp Vault; $ vault"
  ;;
waypoint)
  sudo apt install -y waypoint
  log "Installed Hashicorp Vault; $ waypoint"
  ;;
*)
  error "Developer Error! Invalid \$program for hashicorp.sh"
  ;;
esac
