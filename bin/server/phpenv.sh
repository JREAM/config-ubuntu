#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Installing PHPEnv (PHP Version Manager)"

git clone git://github.com/phpenv/phpenv.git $HOME/.phpenv


echo "(+) Complete! Run with $ phpenv"
echo "    Anytime you install a php version run: $ phpenv rehash"
echo "    If not using my dotfiles ensure this is in .bashrc:"
echo ""
echo '    export PATH="$HOME/.phpenv/bin:$PATH"'
echo '    [[ -s "$HOME/.phpenv/" ]] && eval "$(phpenv init -)"'

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
