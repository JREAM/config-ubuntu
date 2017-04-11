#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "I think docker is better.."

exit 1

# Install Keys
echo "(+) Creating Kafka User"

sudo useradd kafka -m -s /bin/basah
echo "kafka:kafka" | chpasswd

su - kafka
# Java is Required, Ill assume its installed till i do a rewrite

echo "(+) Installing ZooKeeperD"
sudo apt-get install zookeeperd


echo "(+) Downloading Kafka"
wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz" -O ~/Downloads/kafka.tgz

# WHERE  TO INSTALL KAFKA?
mkdir -p ~/kafka && cd ~/kafka # <-- dont like that!

tar -xvzf ~/Downloads/kafka.tgz --strip 1

sudo sed -i "s/delete.topic.enable/delete.topic.enable = true/" /kafka/config/server.properties # @TODO FIX LOCATION WHEN I KNOW

# START SERVER, BUT ITS BETTER TO USER SYSTEMV than this CRAP
nohup ~/kafka/bin/kafka-server-start.sh ~/kafka/config/server.properties > ~/kafka/kafka.log 2>&1 &

echo "(+) New User/Pass: kafka/kafka"
echo "(+) Ensure ZookeeperD is working, run: "
echo "    telnet localhost 2181"
echo "    > ruok   [ENTER]"


if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
