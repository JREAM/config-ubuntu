#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi


echo "(+) Installing jhbuild"


sudo apt install -y\
    jhbuild \
    build-essential \
    libxml2-utils \
    docbook-xsl \
    flex \
    bison \
    cvs \
    gperf \
    cmake \
    valac \
    g++ \
    lib{pam0g,iw,db,gdbm,png12,ffi,tiff,boost-signals,ldap2}-dev \
    lib{vorbis,gl1-mesa,unistring,icu,neon27,usb-1.0-0,sasl2}-dev \
    lib{asound2,ncurses5,nss3,udev,usb,acl1,polkit-gobject-1,cairo}-dev \
    lib{oauth,nl-route-3,nl-genl-3,cups2,rsvg2}-dev \
    lib{dvdread,soundtouch,wnck-3,avahi-gobject}-dev \
    libtasn1-bin \
    libx{cb-util0,composite,randr,damage,ft2,i,t}-dev \
    {uuid,ppp,python-cairo}-dev \
    icc-profiles-free libxml-simple-perl subversion ruby gnome-doc-utils \
    yelp-tools apt-file

jhbuild sysdeps --install

echo "(+) Installing PyGtk and three & Glade GUI Editor"
sudo apt install -y
    python-glade2\
    python-gtk2\
    libgtk2.0\
    libgtk2.0-dev\
    libgtk-3-0\
    libgtk-3-dev\
    libgtk-3-doc\
    python-gtk2-dbg\
    python-gtk2-dev\
    python-gtk2-doc\
    glade

echo "(+) Complete!"
echo "    Load Glade editor from your Applications Menu"
echo ""
echo "(+) Ensure GTK Is setup for python with this inside Python CLI:"
echo "    $ python "
echo "    >>> import gi; gi.require_version('Gtk', '3.0'); from gi.repository import Gtk; dir(Gtk);"

echo "(+) Full Resource at: http://python-gtk-3-tutorial.readthedocs.io/en/latest/introduction.html"

if [ $SKIP_SLEEP == false ]; then
    sleep 4
fi
