#/bin/bash
echo "(+) Downloading NW.js 12.1 Linux x64."
wget http://dl.nwjs.io/v0.12.1/nwjs-v0.12.1-linux-x64.tar.gz
tar -zxvf nwjs-v0.12.1-linux-x64.tar.gz

echo "(+) Moving file to /usr/local and symlinking to /usr/local/bin."
if [ -d "/usr/local/nwjs" ]; then
    sudo rm -rf /usr/local/nwjs
    sudo mkdir /usr/local/nwjs
fi
sudo mv nwjs-v0.12.1-linux-x64/ /usr/local/nwjs

if [ ! -L /usr/local/bin/nw ]; then
    sudo ln -s /usr/local/nwjs/nw /usr/local/bin
fi

rm nwjs-v0.12.1-linux-x64.tar.gz*
echo "(+) Complete! Run with $ nw"