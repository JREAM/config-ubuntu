#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
  echo "(!) Error: You must use the installer script."
  exit
fi

# These are most of the modules the general public use at some point.
sudo apt-get install -y apache2

# IMPORTANT: Do NOT have a trailing \ on the LAST item!

echo "(+) Disabling mpm_event and enabling mpm_prefork"
# For PHP Not Thread Safe
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork

# Some Apache Finishing up
sudo a2enmod rewrite headers
sudo service apache2 restart

echo "(+) Apache Completed."
echo ""
echo "    If PHP doesn't parse run sudo a2dismod mpm_prefork && a2enmod mpm_event"
echo ""

if [ $SKIP_SLEEP == false ]; then
  sleep 4
fi
