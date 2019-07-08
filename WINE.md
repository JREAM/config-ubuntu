# Wine 

Windows Application Layer, Play on Linux. This is an attempt to solve
the x32 Error.

## 32-Bit Error Missing Dependencies

Error when installing:

```sh
# Default Wine with wine32:
apt install wine playonlinux -y

# Package Error when using PlayOnLinux for some software
apt install libwine:i386
```

## Enable Multiarch support:

```sh
sudo dpkg --add-architecture i386 
sudo vim /etc/apt/sources.list
# Paste the following somewhere, use a comment like:

# WINE
deb https://dl.winehq.org/wine-builds/ubuntu/ disco main
```

Add GPG Key
```
wget https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
apt update
```

Add DEB Package

```
apt-get install winehq-devel
```


---

- Trying this:
- `sudo apt-get install libwine-devel`
- Get deb file: https://ubuntu.pkgs.org/19.04/winehq-i386/winehq-devel_4.10~disco_i386.deb.html
- Or the Link is here: `wget `

---

Error Message:

```sh
The following packages have unmet dependencies:
 wine32:i386 : Depends: libwine:i386 (= 4.0-1) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
```


Dependencies Attempts:

```sh
sudo apt install -y
  libpulse0:i386 \
  libdbus-1-3:i38 \
  libsystemd0:i386

sudo apt update && sudo apt upgrade && sudo apt autoremove
```

---

MIT Open Source

(c) 2019 Jesse Boyer | [JREAM](https://jream.com)


