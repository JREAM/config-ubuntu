First run:
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
- [DBeaver](http://dbeaver.jkiss.org/)
- [HeidiSql](http://www.heidisql.com/) (After Wine in Terminal)

Terminal:
---------

### Utilities

    $ sudo apt-get install vim curl htop xclip terminator gdebi wine

## LAMP & JRE

    $ sudo apt-get install apache2 php5 mysql-server mysql-client libapache2-mod-php5 libapache2-mod-wsgi\
    php5-mysql php5-curl libpcre3-dev default-jre redis-server

## Python

    $ sudo apt-get install python-pip
    $ sudo pip install fabric virtualenv

## Ruby

    $ sudo gem install sass compass

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