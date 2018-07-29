#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Installing NVM (Node Version Manager)"

URL=https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh
if hash curl 2>/dev/null; then
  curl -o- $URL | bash
else
  wget -qO- $URL | bash
fi

echo "(+) Adding Bash Autocompletions"
sudo curl -o /etc/bash_completion.d/npm https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/npm.completion.bash
sudo curl -o /etc/bash_completion.d/nvm https://raw.githubusercontent.com/Bash-it/bash-it/master/completion/available/nvm.completion.bash


sudo chown -R $USER:$USER $HOME_PATH/.nvm

echo "(+) Complete! Run with $ nvm ls-remote"
echo "If not using my dotfiles ensure this is in .bashrc:"
echo ""
echo '    export NVM_DIR="$HOME/.nvm"'
echo '    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
