#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=true

# The base script if needed
export BASE_SCRIPT='gnome-ext'

# Source Temporary Environment Variables.
source ./bin/_export_path_variables.sh

# Source the variables so they are exported and assigned
source ./bin/_export_user_variables.sh


echo "====================================================================="
echo ""
echo "                    JREAM - Ubuntu Gnome Extensions               "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Installation runs after command is entered."
echo ""
echo "====================================================================="
echo ""

while true; do
cat <<- command_list
    Extensions
    ----------
    alt-tab-workspace       Isolate Alt+Tab to Current Workspace
    battery-percentage      Top Panel Icon
    connection-manager      Top Panel Drop Down
    dash-to-dock            Bottom or Side Dock
    desktop-scroller        Scroll from Several Points
    force-quit              Top Panel Icon to close apps
    hardware-sensors        Top Panel Drop Down
    netspeed                Top Panel Drop Down
    simpledock              Bottom Dock
    workspaces-to-dock      Workspace on the Side of Screen

    Misc
    ----
    gnome-restart           This will restart gnome shell without closing anything

    Quit:
    -----
    q             Quit (or CTRL + C)

    Important: You will likely be required to restart gnome after installing.
               type: gnome-restart
               Otherwise wait until you reboot.


command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd

    case $cmd in
        alt-tab-workspace)
            bash ./bin/gnome-ext/force-quit.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        battery-percentage)
            bash ./bin/gnome-ext/force-quit.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        connection-manager)
            bash ./bin/gnome-ext/force-quit.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        dash-to-dock)
            bash ./bin/gnome-ext/force-quit.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        desktop-scroller)
            bash ./bin/gnome-ext/force-quit.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        force-quit)
            bash ./bin/gnome-ext/force-quit.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        hardware-sensors)
            bash ./bin/gnome-ext/hardware-sensors.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        netspeed)
            bash ./bin/gnome-ext/netspeed.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        simpledock)
            bash ./bin/gnome-ext/simpledock.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        workspaces-to-dock)
            bash ./bin/gnome-ext/workspaces-to-dock.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        gnome-restart)
            dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        q)
            exit 1
            ;;
        *)
            echo ""
            echo "    (!) OOPS! You typed a command that's not available."
            echo ""
            echo "====================================================================="
            echo ""

    esac


done
