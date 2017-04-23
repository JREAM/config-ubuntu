#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

# Create user Permissions for usr/local
echo "(+) Downloading Cross FTP (30 Day Trial; FTP/FTPS/S3/CloudFront/Glacier/Google Cloud/etc)"
wget http://www.crossftp.com/crossftp_1.97.9.deb -P $PROJECT_TEMP_PATH

sudo dpkg -i "$PROJECT_TEMP_PATH/crossftp_1.97.9.deb"
sudo apt-get install -y -f

rm "$PROJECT_TEMP_PATH/crossftp_1.97.9.deb"


echo "(+) Complete! "
echo "(+) Check your Applications menu for CrossFTP"
echo ""
echo "    For More Info see: https://crossftp.com"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
