#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Adding Elastic PPA to APT"
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

echo "(+) Installing ElasticSearch"
sudo apt-get update && sudo apt-get install elasticsearch

echo "(+) Elastic Search Installed"
echo ""
echo "     For Non-Local Sites, Security:"
echo "     sudo ufw enable"
echo "     sudo ufw allow 9200"
eho ""
echo "     Also Look into configuring the /etc/elasticsearch files"

echo "(+) File Placement"
echo ""
echo "     Binary @ /usr/share/elasticsearch/bin/"
echo "     Config @ /etc/elasticsearch/ "
echo "     Init Script @ /etc/init.d/elasticsearch"

echo "(+) Manual Test Elastic Search"
echo ""
echo "     curl -X GET 'http://localhost:9200'"
echo "     curl -X POST 'http://localhost:9200/tutorial/helloworld/1' -d '{ \"message\": \"Hello World!\" }'"

echo "(+) Testing Elastic Search GET, and POST"
echo "$ curl -X GET 'http://localhost:9200'"
curl -X GET 'http://localhost:9200'

echo ""
echo "$ curl -X POST 'http://localhost:9200/tutorial/helloworld/1' -d '{ \"message\": \"Hello World!\" }'"
curl -X POST 'http://localhost:9200/tutorial/helloworld/1' -d '{ "message": "Hello World!" }'
echo ""

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
