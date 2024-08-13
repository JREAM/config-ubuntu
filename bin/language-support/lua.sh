#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

info "Getting the Build tools"
sudo apt install build-essential libreadline-dev

info "Compiling lua"
cd ~ && mkdir lua_build &&
  cd lua_build &&
  curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz &&
  tar -zxf lua-5.3.4.tar.gz &&
  cd lua-5.3.4 &&
  make linux test &&
  sudo make install

rm ../lua-5.3.4.tar.gz

success "[+] Finished, ensure there were no errors."
success "    Try typing: $ lua"
success  "You may also delete the $HOME/lua_build folder."
