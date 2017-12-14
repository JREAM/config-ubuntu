# Docker Folder

If you choose to use the `.dockerrc` file which is sourced from `.bashrc`
if it exists, then this folder will help you.

Redis by default will bind to the loopback address within the docker container,
that being `127.0.0.1` but will not be accessible from the host machine. We simply
comment out the `bind 127.0.0.1` feature.

## Where to store data

All data goes into the root levle `/data` folder. 

- `/data/conf` stores any configuration files used.
- `/data/db/mysql` stores mysql data (so removing the image/container wont lose data)
- `/data/db/mongo` stores mongo data (same reason as above)

To easily set this up, run:
```
cd docker
sudo ./addfiles.sh
```

## TODO

Mongo and MySQL are not used right now
