# Config Ubuntu

This is primarily a __Debian__ based OS, such as __Debuan__, __Ubuntu__, __Mint__, and __Elementary OS__.

# Index
- [OS Downloads](#os-downloads)
- [Optional Configurations](#optional-configurations)
- [Installation Packages](#installation-packages)
	- [Use 32Bit on 64bit](#use-32bit-on-64bit)
	- [Enable PPA](#enable-ppa)
	- [System Tools](#system-tools)
		- [Numix Theme](#numix-theme)
		- [Utilities](#utilities)
		- [Wine](#wine)
	- [LAMP](#lamp)
		- [PHP5](#php5)
		- [Apache](#apache)
		- [Nginx](#nginx)
		- [MySQL](#mysql)
		- [Redis](#redis)
		- [Phalcon](#phalcon)
		- [Phalcon Dev Tools](#phalcon-dev-tools)
	- [Python](#python)
	- [Ruby](#ruby)
	- [NodeJS](#nodejs)
- [Virtual Machine Related](#virtual-machine-related)
	- [Fix Mouse Side Buttons in VMWare](#fix-mouse-side-buttons-in-vmware)
	- [Vagrant VBGuest Fix](#vagrant-vbguest-fix)
	- [Windows 8 VirtualBox Fix](#windows-8-virtualbox-fix)
	- [Install ATI Drivers](#install-ati-drivers)
	- [Remove ATI Drivers](#remove-ati-drivers)
- [Other Applications](#other-applications)

# OS Downloads

- [Ubuntu Desktop](http://ubuntu.com/desktop)
- [Elementary Desktop](http://elementaryos.org/)
- [Linux Mint](http://www.linuxmint.com/)

# Optional Configurations
- Some items (`termatinator`, `virtualenvs`) copied from [Dan Sackett](https://github.com/dansackett/dotfiles).

# Installation Packages

Login to your Linux user and go to your home directory, 
 
	cd ~

Run these commands and tweak them as needed. The `-y` flag installs without a prompt. Run these commands from the terminal.

    sudo apt-get update && sudo apt-get upgrade

## Use 32Bit on 64bit

    sudo apt-get update && sudo apt-get install -y unetbootin

## Enable PPA
PPA's are provided within cateogories below.

    sudo apt-get install -y python-software-properties

## System Tools

    sudo apt-get install -y unity-tweak-tool compizconfig-settings-manager dconf-editor

### Numix Theme

Use the Unity Tweak Tool (Apply Icon & Themes)

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle

### Utilities

    sudo apt-get install -y vim git mercurial meld curl htop xclip terminator gdebi preload bleachbit ubuntu-restricted-extras

### Wine

    sudo add-apt-repository ppa:ubuntu-wine/ppa
    sudo apt-get install -y wine1.7-amd64

If you need a 32bit installation:

    sudo apt-get install -y wine1.7-i386

## LAMP
Apache 2, PHP 5.5+, ApacheMods, Php5Mods, MySQL, Redis, and Header Files.

### PHP5

    sudo apt-get install -y php5 php5-dev php5-curl libpcre3-dev
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
    
### Apache

    sudo apt-get install -y apache2 libapache2-mod-php5

### Nginx
Or if you prefer to use nginx

    sudo apt-get install -y nginx

### MySQL

    sudo apt-get install -y mysql-server mysql-client php5-mysql
    sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf

### Redis

    sudo apt-get install -y redis-server

Java Runtime

    sudo apt-get install -y default-jre

### Phalcon

    sudo apt-add-repository ppa:phalcon/stable
    sudo apt-get update
    sudo apt-get install -y php5-phalcon

### Phalcon Dev Tools
This is an easy to use install script that will cleanup after itself. It can also be used for updating:

    sudo bash install_phalcon_devtools.sh

To test it run: `$ phalcon`

## Python

If you need Python headers for some PIP packages install `python-dev`:

    sudo apt-get install -y python-dev python-pip
    sudo apt-get install -y python-pip
    sudo pip install fabric virtualenv virtualenvwrapper

## Ruby
Install Ruby 1.9+ with header files in dev.

    sudo apt-get install -y ruby2.0 ruby2.0-dev

For Ruby RVM (Version Management)

    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable

## NodeJS
Using a PPA to fix the nodejs path issue

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs
    sudo npm install bower gulp grunt-cli -g

If installing coffee-script and typing `$ coffee` produces an error, make sure coffee is not within the $PATH

    echo $PATH

# Virtual Machine Related

## Fix Mouse Side Buttons in VMWare
Append the following to `yourbox.vmx` with the machine off.

    mouse.vusb.enable = "TRUE"
    mouse.vusb.useBasicMouse = "FALSE"
    usb.generic.allowHID = "TRUE"

## Vagrant VBGuest Fix:

    vagrant plugin install vagrant-vbguest

    vagrant ssh
    sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions


## Windows 8 VirtualBox Fix:

    vboxmanage list vms
    vboxmanage setextradata "The Box Name" VBoxInternal/CPUM/CMPXCHG16B 1

## Install ATI Drivers

    sudo apt-add-repository ppa:xorg-edgers/ppa
    sudo apt-get update

    sudo apt-get install fglrx
    sudo amdconfig --initial
    sudo apt-get install gksu

To Edit Catalyst Settings, Type the following in the Global Launcher:

    gksu amdcccle

## Remove ATI Drivers

    sudo apt-get remove --purge fglrx fglrx_* fglrx-amdcccle* fglrx-dev*
    sudo rm /etc/X11/xorg.conf
    sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx libgl1-mesa-dri libgl1-mesa-glx libgl1-mesa-dri
    sudo dpkg-reconfigure xserver-xorg

# Other Applications
- [Chrome](https://www.google.com/intl/en-US/chrome/browser/)
- [Sublime Text 3](http://www.sublimetext.com/3)
- [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
  - Preferred: [Debian-based Linux distributions](https://www.virtualbox.org/wiki/Linux_Downloads)
- [Vagrant](http://www.vagrantup.com/)
- [DragonDisk](http://www.dragondisk.com/) S3
- Kazam (Screen Recorder)
- Shutter
- Compiz Config
- gnome-system-tools
- Terminator
- Gdeb
- MySQL Workbench
- Synaptic Package Manager
- Bleachbit (Trash Cleaner)
- Preload (Intelligent Bootup Time)
- [DBeaver](http://dbeaver.jkiss.org/)
- Numix Theme & Numix Circle Icons
- PIP
    - fabric
    - virtualenv
    - virtualenvwrapper
