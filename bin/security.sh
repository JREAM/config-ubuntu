#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Installing RKHunter (Rootkit), ClamAV (Antivirus)"
sudo apt-get install -y rkhunter clamav

echo "(+) Updating ClamAV Defintions"
sudo freshclam

echo "(+) Updating RKHunter Definitions"
sudo rkhunter --update

echo "(+) Complete! ClamAV (AntiVirus) installed."
echo "To have ClamAV Definition updates periodically, set:"
echo "----------------------------------------------------"
echo "$ sudo crontab -e"
echo "55 08 * * * freshclam"
echo "55 08 * * * sudo rkhunter --update"
echo "-----------------------------------------------------"
echo "To run ClamAV: $ clamscan (try --help for more, it does not auto scan)"
echo "To run RKHunter: $ sudo rkhunter -c"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi

