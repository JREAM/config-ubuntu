#!/bin/bash

F=(
  .bash_aliases
  .bashrc
  .bash_vars
  .bash_vendors
  .dockerrc
  .exports
  .gemrc
  .gh_complete
  .curlrc
  .pylintrc
  nvm-update.sh
  .virtualenvs
  .zshrc
  .jscsrc
  .jslintrc.json
  .tmux.conf
  tslint.json
  .editorconfig
  .grc
  # Do NOT copy .git
  .phpcs.xml
  .profile
  .scss-lint.yml
  .eslintrc.json
  .wgetrc
)

# Entry
echo -e "\n -------------------------------------------"
echo -e "\n       Copy Dotfiles to Home Folder\n"
echo -e ""
echo -e "\n     ++ The files below will be copied ++"
echo -e "\n -------------------------------------------"

# 8 column max array
for f in "${F[@]}"; do
  printf "%-8s\n" "${f}"
done | column

echo -e "\n ------------------------------------------- \n"

read -p "Do you want to copy the above files to ${HOME} folder [y/N]?: " yn

if [[ $yn =~ ^([yY])+$ ]]; then
  echo -e "Copying to ${HOME}...\n"

  for file in "${F[@]}"; do
    cp -r $file $HOME
  done

  echo "Finished, run: $ source ~/.bashrc"
  echo "[+] If you want to install and use ZSH over Bash, Run this command:"
  echo ""
  echo 'sudo apt install zsh && sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'
  echo ""
else
  echo "Exiting..."
fi
