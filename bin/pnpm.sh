#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi



echo "[+] Install PNPM (Phantom NPM)"

curl -fsSL https://get.pnpm.io/install.sh | sh -

echo "[+] An entry was added into ~/.bashrc at the bottom"
echo "[+] Reload to use command with: $ source ~/.bashrc"

echo "[+] Recommended: Add an alias to your ~/.bashrc or other sourced file:"
echo "    alias pn=pnpm"

echo -e "\n[+] Install node with: $ pnpm env use --global lts"
echo -e "[+] You can install everything with $ pn / $ pnpm i -g rather than npm also"





