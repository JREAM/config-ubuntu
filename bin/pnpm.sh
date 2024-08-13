#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

# Argument Required for File
if [ -z "$1" ]; then
  error "Developer Error! Missing Argument for $FILE"; exit
fi

info "[+] Install PNPM (Phantom NPM)"

curl -fsSL https://get.pnpm.io/install.sh | sh -

info "[+] An entry was added into ~/.bashrc at the bottom"
info "[+] Reload to use command with: $ source ~/.bashrc"

info "[+] Recommended: Add an alias to your ~/.bashrc or other sourced file:"
info "    alias pn=pnpm"

info -e "\n[+] Install node with: $ pnpm env use --global lts"
info -e "[+] You can install everything with $ pn / $ pnpm i -g rather than npm also"





