#!/bin/bash

sudo mkdir /server
sudo chown nobody:nogroup /server
sudo chmod 755 /server # not recursive
sudo setfacl -m d:u::rwx,d:g::rwx,d:o::rx /server

sudo echo -e "#!/bin/bash\n\nsudo sshfs jesse@10.10.10.200:/server /server -o reconnect,allow_other,workaround=rename,_netdev,idmap=user,uid=1000,gid=1000,IdentityFile=/home/jesse/.ssh/server-local,Cipher=arcfour,compression=no" > /etc/network/if-up.d/sshfs-mount

echo -e "
  Edit: /etc/fuse.conf
  Uncomment: #user_allow_other
"

sudo mkdir /docker /www
sudo chown -R root:docker /docker
sudo chown -R jesse:www-data /www

