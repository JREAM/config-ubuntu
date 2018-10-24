#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing Pyenv"

if hash git 2> /dev/null; then
  echo "(+) Installing Dependencies to build Python"
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev

  git clone https://github.com/pyenv/pyenv.git $HOME_PATH/.pyenv
  echo "(+) Installing PyEnv Virtualenvwrapper"
  git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME_PATH/.pyenv/plugins/pyenv-virtualenv
  git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $HOME_PATH/.pyenv/plugins/pyenv-virtualenvwrapper

  # Set Permissions to local user
  sudo chown -R $USER:$USER /home/$USER/.pyenv/
else
  print "Error: Git is required, please install 'utils'"
  exit 1
fi

echo "(+) Complete! Run with $ pyenv"
echo -e "\tIf you are not using my dotfiles, please add this to ~/.bash_profile or similar:"
echo -e '\texport PYENV_ROOT="$HOME/.pyenv"'
echo -e '\texport PATH="$PYENV_ROOT/bin:$PATH"'
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi'
echo ""
echo "(!) Suggested to have pyenv virtualenvwrapper create venvs, add to .bash_aliases/etc"
echo 'export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV=\"true\"'

if [ $SKIP_SLEEP == false ]; then
    sleep 3
fi
