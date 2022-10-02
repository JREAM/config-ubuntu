#!/bin/bash
# DevOps: Quick Installer

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
    (DevOps)
    ──────────────────────────────────────────────────────────────────────
    docker         Install Docker, Compose, Machine & bash-autocomplete

    ansible        Install Ansible Provisioner
    saltstack      Install Saltstack Provisioner

    (Hashicorp)
    ──────────────────────────────────────────────────────────────────────
    consul         Install Hashicorp Consul
    nomad          Install Hashicorp Nomad
    packer         Install Hashicorp Packer
    serf           Install Hashicorp Serf
    terraform      Install Hashicorp Terraform
    vault          Install Hashicorp Vault
    vagrant        Install Hashicorp Vagrant

    (Benchmarking):
    ──────────────────────────────────────────────────────────────────────
    iperf          Install iperf CLI util
    sysbench       Install sysbench CLI util
    wrk2           Install wrk2 CLI util

    (Utilities)
    ──────────────────────────────────────────────────────────────────────
    security      Install ClamAV, RKHunter (read instructions after install)

    ──────────────────────────────────────────────────────────────────────
    q             Quit (or CTRL + C)

command_list

  echo -e "\n══════════════════════════════════════════════════════════════════════\n"

  read -e -p "Type a Command: " cmd

  # Enable previous commands with arrow key
  history -s "$cmd"

  case $cmd in
  # @TODO ensure all the pacakges are avail double check
  consul | nomad | packer | serf | terraform | vagrant | vault)
    bash ./bin/devops/hashicorp.sh "$cmd"
    ;;
  docker)
    bash ./bin/devops/docker.sh
    ;;
  iperf)
    bash ./bin/devops/benchmark/iperf.sh
    ;;
  saltstack)
    bash ./bin/devops/saltstack.sh
    ;;
  security)
    bash ./bin/security.sh
    ;;
  sysbench)
    bash ./bin/devops/benchmark/sysbench.sh
    ;;
  wrk2)
    bash ./bin/devops/benchmark/wrk2.sh
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
