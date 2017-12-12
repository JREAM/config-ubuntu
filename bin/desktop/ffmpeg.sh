#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing ffmpeg CLI Tool"

sudo apt update
sudo apt install -y ffmpeg libav-tools x264 x265

# If error messages pop up after running the command
# sudo dpkg -i google-chrome*.deb then run the command
# sudo apt-get install -f

echo "(+) Complete!  From Terminal, $ ffmpeg"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
