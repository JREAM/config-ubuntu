#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

source _exports.sh

if [ ! -z $1 ]; then
  error "Developer Error! Missing Argument"
  return 0
fi

# Program to install
PROGRAM=$1

case $PROGRAM in
gvm)
  if [ -x /usr/bin/ansible ]; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    log "Package: Go Version Manager (GVM) installed. $ gvm" success
    log "Add to your .bashrc:" info
    log "[ -s ~/.gvm/scripts/gvm ] && source ~/.gvm/scripts/gvm" info
  else
    log "Package: GVM had a problem installing" error
  fi
  ;;
nvm)
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
  log "Package: Installed Node Version Manager (NVM); $ nvm (after adding to .bashrc)" success
  log "Add to your .bashrc:" info
  log "export NVM_DIR=~/.config/nvm" info
  log "[ -s \"$NVM_DIR/nvm.sh\" ] && source \"$NVM_DIR/nvm.sh\"" info
  ;;
fnm)
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir ".local/bin/" --skip-shell
  fnm completions --shell bash >.config/bash_completion/fnm.bash
  log "Package: Faster Node Manager (FNM) installed. $ fnm ( ~/.local/bin )" success
  ;;
phpenv)
  log "Installing PyEnv into ~/.local/opt/phpenv" info
  mkdir -p ~/.local/opt
  git clone git://github.com/phpenv/phpenv.git ~/.local/opt/phpenv
  log "Package: PHPEnv installed. $ phpenv ((after adding to .bashrc)" success
  log "Add to your .bashrc:" info
  log "export PATH=\"~/.local/opt/phpenv/bin:$PATH\"" info
  log "[[ -s \"~/.local/opt/phpenv/\" ]] && eval \"$(phpenv init -)\"" info
  ;;
pyenv)
  sudo apt-get install -y \
    libbz2-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    llvm \
    zlib1g-dev \
    xz-utils tk-dev

  log "Installing PyEnv into ~/.local/opt/pyenv" info
  mkdir -p ~/.local/opt
  git clone https://github.com/pyenv/pyenv.git ~/.local/opt/pyenv
  log "Installing PyEnv VirtualEnv" info
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.local/opt/pyenv/plugins/pyenv-virtualenv
  log "Installing PyEnv VirtualEnvWrapper" info
  git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git ~/.local/opt/pyenv/plugins/pyenv-virtualenvwrapper
  sudo chown -R $USER:$USER ~/.local/opt/pyenv
  log "Package: Pyenv installed. $ pyenv (after adding to .bashrc)" success
  log "Add to your .bashrc:" info
  log "export PYENV_ROOT=~/.local/opt/pyenv" info
  log "export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV=\"true\"" info
  log "export PATH=\"\$PYENV_ROOT/bin:\$PATH\"" info
  log "command -v pyenv 1>/dev/null 2>&1 && eval \"$(pyenv init --path)\"" info
  ;;
pipenv)
  if hash pip 2>/dev/null; then
    sudo -H pip install pipenv
    log "Package: PipEnv installed. $ pipenv" success
  else
    log "Package: PipEnv had a problem installing" error
  fi
  ;;
rbenv)
  sudo apt-get install -y \
    rbenv \
    ruby-build
  if [ -x /usr/bin/rbenv ]; then
    log "Package: RBEnv installed. $ rbenv" success
  else
    log "Package: RBEnv has a problem installing." error
  fi
  ;;
rvm)
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get install -y rvm
  sudo usermod -aG rvm $USER
  sudo usermod -aG rvm root
  if [ -x /usr/bin/rvm ]; then
    log "Package: RVM installed. $ rvm (Once added to .bashrc)" success
    log "Add to your .bashrc:" info
    log "[ -f /etc/profile.d/rvm.sh ] && source /etc/profile.d/rvm.sh" info
  else
    log "Package: RVM had a problem installing." error
  fi
  ;;
*)
  error "Developer Error! Invalid \$program"
  ;;
esac
