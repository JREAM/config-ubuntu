First Run:
-------------

    $ sudo apt-get update

Applications:
-------------
- [Chrome](https://www.google.com/intl/en-US/chrome/browser/)
- [Sublime Text 3](http://www.sublimetext.com/3)
- [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
  - Preferred: [Debian-based Linux distributions](https://www.virtualbox.org/wiki/Linux_Downloads)
- [Vagrant](http://www.vagrantup.com/)
- Shutter
- Compiz Config
- gnome-system-tools
- (From the Terminal Below)
    - Terminator
    - Gdeb
- MySQL Workbench
- Synaptic Package Manager
- Bleachbit (Trash Cleaner)
- Preload (Intelligent Bootup Time)
- [DBeaver](http://dbeaver.jkiss.org/)
- [HeidiSql](http://www.heidisql.com/) (After Wine in Terminal)
- Numix Theme & Numix Circle Icons

Terminal:
---------

### Numix Circle Icons

After installing this use the Unity Tweak Tool

    $ sudo add-apt-repository ppa:numix/ppa
    $ sudo apt-get update
    $ sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle 
    

### Utilities

    $ sudo apt-get install vim curl htop xclip terminator gdebi preload bleachbit wine\
    ubuntu-restricted-extras

## LAMP & JRE
Apache 2, PHP 5.5+, ApacheMods, Php5Mods, MySQL, Redis, and Header Files.
    $ sudo apt-get install apache2 php5 php5-dev mysql-server mysql-client libapache2-mod-php5 libapache2-mod-wsgi\
    php5-mysql php5-curl libpcre3-dev default-jre redis-server

## Python

    $ sudo apt-get install python-pip
    $ sudo pip install fabric virtualenv flask

## Ruby
Install Ruby 1.9+ with header files in dev.

    $ sudo apt-get install ruby1.9.1 ruby1.9.1-dev
    
    # Front End Items:
    $ sudo gem install sass compass middleman

## NodeJS
Use PPA to fix the nodejs path issue

    $ sudo add-apt-repository ppa:chris-lea/node.js
    $ sudo apt-get update
    $ sudo apt-get install nodejs
    $ sudo apt-get install coffeescript
    
    # @TODO:
    # npm is having dependency issues
    
If typing `$ coffee` produces an error, check:

    $ echo $PATH -- Make sure coffee is not linked there.

#### Make MySQL Open to Apps

    $ sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf

PHP Composer:
-------------

    $ curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

    # Usage
    $ composer <command>

Install Vagrant VBGuest & Fix Bug:
----------------------------------

    $ vagrant plugin install vagrant-vbguest

    $ vagrant ssh
    $ sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions


Install VirtualBox with Windows 8.1 Requires:
---------------------------------------------

    $ vboxmanage list vms
    $ vboxmanage setextradata "The Box Name" VBoxInternal/CPUM/CMPXCHG16B 1


Install AMD/ATI Drivers (Ubuntu Trusty 14)
-------------------------------------

    $ sudo apt-add-repository ppa:xorg-edgers/ppa
    [ENTER]
    $ sudo apt-get update
    $ sudo apt-get install fglrx
    $ sudo amdconfig --initial
    $ sudo apt-get install gksu

    To Edit Catalyst Settings:
    1: Launcher Type in: gksu amdcccle

Remove AMD/ATI Drivers
----------------------

    $ sudo apt-get remove --purge fglrx fglrx_* fglrx-amdcccle* fglrx-dev*
    $ sudo rm /etc/X11/xorg.conf
    $ sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx libgl1-mesa-dri libgl1-mesa-glx libgl1-mesa-dri
    $ sudo dpkg-reconfigure xserver-xorg