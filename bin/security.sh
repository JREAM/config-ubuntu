#!/bin/bash
# Variables/Logging
source $PWD/bin/_exports.sh
FILE=$(basename "$0")

if [[ ! $INSTALL_SCRIPT ]]; then
  error "Error: You must use the installer script."; exit
fi

info "(+) Installing RKHunter (Rootkit), ClamAV (Antivirus)"
sudo apt-get install -y rkhunter clamav

info "(+) Updating ClamAV Defintions"
sudo freshclam

info "(+) Updating RKHunter Definitions"
sudo rkhunter --update

info "(+) Complete! ClamAV (AntiVirus) installed."
info "To have ClamAV Definition updates periodically, set:"
info "----------------------------------------------------"
info "$ sudo crontab -e"
info "55 08 * * * freshclam"
info "55 08 * * * sudo rkhunter --update"
info "-----------------------------------------------------"
info "To run ClamAV: $ clamscan (try --help for more, it does not auto scan)"
info "To run RKHunter: $ sudo rkhunter -c"
