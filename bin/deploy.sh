#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "Installing Deploy (Shell)"

cd $REPO_TMP_PATH
wget https://github.com/visionmedia/deploy/archive/master.zip
unzip master.zip
cd deploy-master
sudo make install
cd $REPO_TMP_PATH
rm -rf deploy-master
rm master.zip

echo "(!) Complete! Use $ deploy"
echo "    For Project setup see: https://github.com/visionmedia/deploy"
echo "    For a step by step see: https://github.com/visionmedia/deploy/wiki"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
