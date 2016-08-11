# If not running interactively, don"t do anything
[ -z "$PS1" ] && return

# History Details
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don"t overwrite it
shopt -s histappend

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#################################################
############### PHP Version Toggle ##############
#################################################
# Remove the -q to see debugging information if there are problems
alias enphp7="sudo a2dismod php5.6 -q; sudo a2enmod php7.0 -q; sudo ln -sf /usr/bin/php7.0 /usr/bin/php; sudo service apache2 restart"
alias enphp5="sudo a2dismod php7.0 -q; sudo a2enmod php5.6 -q; sudo ln -sf /usr/bin/php5.6 /usr/bin/php; sudo service apache2 restart" 

################################################
####################  NGINX  ###################
################################################

# Usage: ngeanble sitename
function ngmake { sudo vim /etc/nginx/sites-available/$1; }
function ngenable { sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled; }
function ngdisable { sudo rm /etc/nginx/sites-enabled/$1; }

################################################
#################### PYTHON ####################
################################################

# Virtualenv stuff
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/projects
export PIP_VIRTUALENV_BASE=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias mkvirtualenv="mkvirtualenv --no-site-packages --distribute"

# Stop python from generating bytecode files
export PYTHONDONTWRITEBYTECODE=1

#################################################
#################### ALIASES ####################
#################################################

colorflag="--color"

#################### File Commands ####################
# Some ls aliases
alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"


# Always use color output for `ls`
alias ls="command ls ${colorflag}"
# IMPORTANT! If you get a bunch out output decalres
# Make sure this is all on the same line!
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"


# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#################### Util #####################
# use xclip
alias xclip="xclip -sel clip"

# IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enable aliases to be sudoed
alias sudo="sudo "

# Find file in current folder
alias ffile="find . -name "  

# Find file with contents in current folder
ftext () { grep -rnwi "$1" . ;}

# This gets really annoying!
alias apt-get="sudo apt-get"

# Mkdir more than one level if needed.
alias mkdir='mkdir -pv'

# Some real Shorties
alias h='history'
alias j='jobs -l'

# Use VIM
alias vi=vim

# See UDP/TCP Open Ports
alias ports='netstat -tulanp'

alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias updatey='sudo apt-get update && sudo apt-get upgrade'

#################### Various ####################
# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
