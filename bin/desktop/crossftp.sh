#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

VERSION=1.99.0

# Create user Permissions for usr/local
echo "(+) Downloading Cross FTP (30 Day Trial; FTP/FTPS/S3/CloudFront/Glacier/Google Cloud/etc)"
wget http://www.crossftp.com/crossftp_$VERSION.deb -P $PROJECT_TEMP_PATH

sudo dpkg -i "$PROJECT_TEMP_PATH/crossftp_$VERSION.deb"
sudo apt-get install -y -f

rm "$PROJECT_TEMP_PATH/crossftp_$VERSION.deb"


echo "(+) Complete! "
echo "(+) Check your Applications menu for CrossFTP"
echo ""
echo "    For More Info see: https://crossftp.com"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
