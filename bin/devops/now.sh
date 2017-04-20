#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing Zeit.co Now CLI Tools"
wget https://github.com/zeit/now-cli/releases/download/4.11.2/now-linux
chmod +x now-linux
mv now-linux /usr/local/bin


echo "(+) Complete! Begin setup now $ now-linux:"
echo "    More docs at https://zeit.co/now"
echo ""
echo "    Remove, $ rm -rf /usr/bin/now-linux"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
