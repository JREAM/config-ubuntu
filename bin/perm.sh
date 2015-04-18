#/bin/bash
# Create user Permissions for usr/local
sudo groupadd local
sudo usermod -a -G local $USER
sudo chgrp -R local /usr/local
sudo chmod -R g+rwx /usr/local