#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

cd ~

echo "(+) Downloading Papertrail Remote_Syslog2 Installer"
# I dont use beta/pre-releases.
wget https://github.com/papertrail/remote_syslog2/releases/download/v0.20-beta1/remote_syslog_linux_amd64.tar.gz

echo "(+) Extracting and copying to /usr/local/bin"
tar xzf remote_syslog*.tar.gz
sudo mv ./remote_syslog/remote_syslog /usr/local/bin

echo "(+) Removing GZIP and Folder, Not Needed"
rm remote_syslog*.tar.gz

echo "(+) Creating /etc/log_files.yml (You need to change settings)"
sudo cat <<EOT > /etc/log_files.yml
files:
  - /var/log/apache2/access.log
  - /var/log/apache2/error.log
  - /var/log/mysql/error.log
  - /var/log/mysql/mysql-slow.log # You have to uncomment in /etc/mysql/mysql.conf.d/mysqld.conf to enable (log_slow_queries)
destination:
  host: HOST.papertrailapp.com # NOTE: change this to YOUR papertrail host!
  port: 12345   # NOTE: change to your Papertrail port
  protocol: tls
EOT

if [[ !-f '/var/log/mysql/mysqld-slow.log' ]]; then
    sudo touch /var/log/mysql/mysql-slow.log
    sudo chown mysql:adm /var/log/mysql-mysqld/slow.log
    sudo chmod 640 /var/log/mysql/mysql-slow.log
fi

echo "Creating SystemD record in /etc/systemd/system/remote_syslog.service"

sudo cat <<EOT > /etc/systemd/system/remote_syslog.service
[Unit]
Description=remote_syslog2
Documentation=https://github.com/papertrail/remote_syslog2
After=network-online.target

[Service]
ExecStartPre=/usr/bin/test -e /etc/log_files.yml
ExecStart=/usr/local/bin/remote_syslog -D
Restart=always
User=root
Group=root

[Install]
WantedBy=multi-user.target
EOT


echo "(+) Enabling with: systemctl enable remote_syslog.service"
sudo systemctl enable remote_syslog.service
echo "(+) Starting with: systemctl start remote_syslog.service"
sudo systemctl start remote_syslog.service


echo "(+) Preventing paper trail from UFW Flooding:"
echo "    Turning UFW logging into file /etc/rsyslog.d/*.ufw.conf"
sudo sed 's/#& stop/& stop/' /etc/rsyslog.d/*ufw.conf
sudo service rsyslog restart

echo "(+) Default example file placed in /etc/log_files.yml"
echo "    You MUST customize it with your PaperTrail credentials"
echo "    And which log files files you want to aggregate."
echo "    If you want to log UFW: /var/log/ufw.log / Even add to your config file"
echo "    For more help, see: http://help.papertrailapp.com/kb/configuration/configuring-centralized-logging-from-text-log-files-in-unix/#2-configure"
echo ""
echo "(+) To start the Daemon:"
echo "     sudo service remote_syslog restart"

echo "(+) Confirm its running with:"
echo "    ps aux | grep 'usr/local/bin/remote_syslog -D''"

