#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

if [ $JAVA_HOME == "" ]; then
    echo "(!) Error, you must have Java installed and \$JAVA_HOME set."
    exit
fi

# Install Keys
echo "(+) Adding GPG Key"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "(+) Adding the dependency to /etc/apt/sources.list.d"
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

sudo apt-get update
sudo apt-get install logstash

echo "(+) Complete! Test LogStash with:"
echo "bin/logstash -e 'input { stdin { } } output { stdout {} }'"
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
