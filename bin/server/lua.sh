#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Getting the Build tools"
sudo apt install build-essential libreadline-dev

echo "Compiling lua"
cd ~ && mkdir lua_build && \
  cd lua_build && \
  curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz && \
  tar -zxf lua-5.3.4.tar.gz && \
  cd lua-5.3.4 && \
  make linux test && \
  sudo make install

rm ../lua-5.3.4.tar.gz

echo ""
echo "[+] Finished, ensure there were no errors."
echo "    Try typing: $ lua"
echo ""
echo "You may also delete the $HOME_PATH/lua_build folder."

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
