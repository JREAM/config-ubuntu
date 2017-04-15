#!/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Disabling Middle Mouse Paste (Scroll will Work)"

if [[ -f "$HOME_PATH/.Xmodmap" ]]; then
    echo "Creating backup to $HOME_PATH/.Xmodmap.bak"
    sudo cp "$HOME_PATH/.Xmodmap" "$HOME_PATH/.Xmodmap.bak"
fi

echo "Running.."
sudo xmodmap -pp |perl -ne 'BEGIN{@a=();$h=0} {next unless /^\s*\d+\s+\d+\s*$/; ($v)=/^\s*\d+\s+(\d+)\s*$/; push(@a,$v); if ($v gt $h) {$h=$v}} END{@b=();foreach(@a){ if ($_ eq "2"){push(@b,$h)} elsif($_ eq $h){push(@b,"2")} else{push(@b,$_)} }; print "pointer = ".join(" ",@b)."\n";}' >> $HOMEPATH/.Xmodmap
echo "Complete, you should have a $HOME_PATH/.Xmodmap if you did not before"

echo "(+) Complete! At anytime to undo this, you can do the following:"
echo "    If you had an existing file: cp ~/.Xmodmap.bak ~/.Xmodmap"
echo "    If you had no file: rm ~/.Xmodmap"


if [ $SKIP_SLEEP == false ]; then
    sleep 2
fi
