# Wine 

Windows Application Layer

## 32-Bit Error Missing Dependencies

Error when installing:

```sh
apt install libwine:i386
```

Dependencies Attempts:

```sh
sudo apt install -y
  libpulse0:i386 \
  libdbus-1-3:i38 \
  libsystemd0:i386

sudo apt update && sudo apt upgrade && sudo apt autoremove
```


