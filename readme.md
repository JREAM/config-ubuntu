# Config Ubuntu
This is primarily for a Workstation (_Not a server_)
Works with __Debian__ and __Elementary OS__

- [Ubuntu Desktop](http://ubuntu.com/desktop)
- [Elementary Desktop](http://elementaryos.org/)

# Automatic Install
**This is not ready** - But the command would go as follows

- This is for the user named Jesse
    - To change this, change the variable in `install.sh` and the `apache/sites-available/projects.conf`

    $ sudo bash install.sh

# Manual Install
Run these commands and tweak them as needed. The `-y` flag installs without a prompt. Run these commands from the terminal.

### Make PPA's Available

    $ sudo apt-get install -y python-software-properties
    
### PPA's for: Phalcon, Numix Icons, NodeJS
You must hit enter after each one of these.

    $ sudo apt-add-repository ppa:phalcon/stable
    $ sudo add-apt-repository ppa:numix/ppa
    $ sudo add-apt-repository ppa:chris-lea/node.js
    
Now lets run an update with our PPA's

    $ sudo apt-get update

### System Tools

    $ sudo apt-get install -y unity-tweak-tool dconf-editor

### Numix Circle Icons

Use the Unity Tweak Tool (Apply Icon and Themes)

    $ sudo apt-get install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle

### Utilities

    $ sudo apt-get install -y vim curl htop xclip terminator gdebi preload bleachbit ubuntu-restricted-extras
    
    # If you want wine
    $ sudo apt-get install -y wine

## LAMP & JRE
Apache 2, PHP 5.5+, ApacheMods, Php5Mods, MySQL, Redis, and Header Files.

    $ sudo apt-get install -y apache2 php5 php5-dev mysql-server mysql-client libapache2-mod-php5 libapache2-mod-wsgi php5-mysql php5-curl libpcre3-dev default-jre redis-server

## Phalcon

    $ sudo apt-get update
    $ sudo apt-get install -y php5-phalcon

#### Phalcon Dev Tools
This is an easy to use install script that will cleanup after itself. It can also be used for updating:

    $ sudo bash install_phalcon_devtools.sh

To test it run: `$ phalcon`

## Python

If you need Python headers for some PIP packages install `python-dev`:
    
    $ sudo apt-get install -y python-dev 
    
Otherwise you are good to go with PIP and a few packages:

    $ sudo apt-get install -y python-pip
    $ sudo pip install fabric virtualenv flask grip

### Ruby
Install Ruby 1.9+ with header files in dev.

    $ sudo apt-get install ruby1.9.1 ruby1.9.1-dev

A few gems for front-end (I prefer NPM Gulp currently)
    
    $ sudo gem install sass compass middleman

### NodeJS
Using a PPA to fix the nodejs path issue

    $ sudo apt-get update
    $ sudo apt-get install nodejs
    $ sudo npm install bower -g

If installing coffee-script and typing `$ coffee` produces an error, make sure coffee is not within the $PATH

    $ echo $PATH

### Make MySQL Open to Apps

    $ sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf

### PHP Composer:

    $ curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

    # Usage
    $ composer <command>

### Install Vagrant VBGuest & Fix Bug with Location:

    $ vagrant plugin install vagrant-vbguest

    $ vagrant ssh
    $ sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions


### Install VirtualBox that uses Windows 8.1 Requires:

    $ vboxmanage list vms
    $ vboxmanage setextradata "The Box Name" VBoxInternal/CPUM/CMPXCHG16B 1

### Install AMD/ATI Drivers (Ubuntu Trusty 14)

    $ sudo apt-add-repository ppa:xorg-edgers/ppa
    [ENTER]
    
    $ sudo apt-get update
    $ sudo apt-get install fglrx
    $ sudo amdconfig --initial
    $ sudo apt-get install gksu

To Edit Catalyst Settings, Type the following in the Global Launcher: 

    gksu amdcccle

### Remove AMD/ATI Drivers

    $ sudo apt-get remove --purge fglrx fglrx_* fglrx-amdcccle* fglrx-dev*
    $ sudo rm /etc/X11/xorg.conf
    $ sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx libgl1-mesa-dri libgl1-mesa-glx libgl1-mesa-dri
    $ sudo dpkg-reconfigure xserver-xorg

### Applications:
- [Chrome](https://www.google.com/intl/en-US/chrome/browser/)
- [Sublime Text 3](http://www.sublimetext.com/3)
- [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
  - Preferred: [Debian-based Linux distributions](https://www.virtualbox.org/wiki/Linux_Downloads)
- [Vagrant](http://www.vagrantup.com/)
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
- [Pixeluvo](http://www.pixeluvo.com/) Nice Image Editor
- [DBeaver](http://dbeaver.jkiss.org/)
- [HeidiSql](http://www.heidisql.com/) (After Wine in Terminal)
- Numix Theme & Numix Circle Icons
- PIP Grip (For easy localhost preview of markdown)
