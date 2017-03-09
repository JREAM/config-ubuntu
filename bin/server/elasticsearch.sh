#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading elasticsearch .deb File"
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.1/elasticsearch-2.3.1.deb
mv elasticsearch-2.3.1.deb $PROJECT_TEMP_PATH

echo "(+) Installing elasticsearch"
cd $PROJECT_TEMP_PATH
sudo dpkg -i elasticsearch-2.3.1.deb

echo "(+) Removing .deb file"
rm elasticsearch-2.3.1.deb

echo "(+) SystemCtl: Enable autostart"
sudo systemctl enable elasticsearch.service

echo "(+) Restarting elasticsearch"
sudo systemctl restart elasticsearch

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
