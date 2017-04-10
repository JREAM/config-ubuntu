#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi



echo "(+) Installing PyGtk and three & Glade GUI Editor"

sudo apt install -y\
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
