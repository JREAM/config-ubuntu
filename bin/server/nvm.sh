#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

echo "Installing NVM (Node Version Manager)"

URL=https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh

echo "[!] Run manually, they changed the install script and it will go to /root if not done manually:"
if hash curl 2>/dev/null; then
  echo curl -o- $URL | bash
else
  echo wget -qO- $URL | bash
fi

sleep 4

# echo "(+) Adding to $HOME_PATH/.nvm"
# sudo chown -R $USER:$USER $HOME_PATH/.nvm

# echo "(+) Complete! Run with $ nvm ls-remote"
# echo "If not using my dotfiles ensure this is in .bashrc:"
# echo ""
# echo '    export NVM_DIR="$HOME/.nvm"'
# echo '    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'

# if [ $SKIP_SLEEP == false ]; then
#   sleep 4
# fi
