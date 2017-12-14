#!/bin/bash
# ___________________________________________________________________
#
#
#                       Bashalias [Sourced from .bashrc]
#                        Speed up Commands in Terminal
#
# Suggested Apt Packages: pydf colordiff nmap
# Note: See .exports for Color ENV variables
#
# Table of Contents:
#   - COLORS
#   - COMMON
#   - COMMON W/INSTALLS
#   - NGINX
#   - APACHE2
#   - PYTHON
#   - GIT
#   - LEGIT FUNCTIONS
# ___________________________________________________________________

# Personal Folder shortcuts
if [ -d ~/projects ]; then alias p='cd ~/projects/'; fi

# ___________________________________________________________________
#
#                           COLORS
# ___________________________________________________________________
if [[ ! -z DOTEXPORTS_SET_COLORS ]]; then
tput sgr0   # Reset Colors While Setting Variables
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    PURPLE=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)

    BOLD=$(tput bold)
    RESET=$(tput sgr0)
fi

# ___________________________________________________________________
#
#                           COMMON
# ___________________________________________________________________

alias c='clear'
alias h='history'
alias j='jobs -l'
alias py='python'
alias vi=vim
alias ports='netstat -tulanp'
alias now="date +'%A, %B %m %Y at%l:%M%P %Z'"

# Listing
alias l="ls -l --color=auto"
alias la="ls -la --color=auto"
alias ls="command ls --color=auto"

alias os="lsb_release -a"           # Get OS Version

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias www='cd /var/www/'

# Super User (SUDO) Shortcuts
alias sudo='sudo '                  # Enable aliases to be sudo-ed
alias apt-get='sudo apt-get'
alias apt='sudo apt'
alias service='sudo service'
alias root='sudo -i'                # Become root
alias su='sudo -i'                  # Become root

alias update='sudo apt-get update'
alias updatey='sudo apt-get update && sudo apt-get upgrade -y'

# Preserve / root folder permissions
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Utility
alias mkdir='mkdir -pv'             # $ mkdir x/y/z
alias xclip='xclip -sel clip'       # Copy to Clipboard $ cat file.txt | xclip
alias wget="wget -c"                # Resume if failed by default
alias findfile="find . -name "      # Make find a little easier

# Utility: Get My IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# ___________________________________________________________________
#
#                       COMMON W/INSTALLS
# ___________________________________________________________________

if (( $+commands[colordiff] )) >/dev/null 2>&1; then
    # install: $ sudo apt install colordiff
    alias diff='colordiff'
fi

if (( $+commands[nmap] )) >/dev/null 2>&1; then
    # install: $ sudo apt install nmap
    alias portsopen='nmap localhost --open'
fi

if (( $+commands[pydf] )) >/dev/null 2>&1; then
    # install: $ sudo apt install pydf
    alias df='pydf'
fi

# For Windows | Make Shortcut Run as Administrator!
if [ -f "/c/ProgramData/chocolatey/bin/choco" ]; then
    alias choco="/c/ProgramData/chocolatey/bin/choco"
fi

# ___________________________________________________________________
#
#                           NGINX
# ___________________________________________________________________

function ngmake { sudo vim /etc/nginx/sites-available/$1; }
function ngenable { sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled; }
function ngdisable { sudo rm /etc/nginx/sites-enabled/$1; }
alias ngtest='sudo service nginx configtest'
alias ngreload='sudo service nginx reload'
alias ngrestart='sudo service nginx restart'
alias ngstart='sudo service nginx start'
alias ngstop='sudo service nginx stop'
alias ngpath='cd /etc/nginx/'

# ___________________________________________________________________
#
#                           APACHE2
# ___________________________________________________________________

alias a2graceful='sudo /usr/sbin/apachectl -k graceful'
alias a2modules='sudo apachectl -t -D DUMP_MODULES'
alias a2vhosts='sudo apachectl -t -D DUMP_VHOSTS'
alias a2version='sudo apachectl -v'
alias a2test='sudo apachectl -t'
alias a2reload='sudo service apache2 reload'
alias a2restart='sudo service apache2 restart'
alias a2start='sudo service apache2 start'
alias a2stop='sudo service apache2 stop'
alias a2path='cd /etc/apache2/'

alias a2disconf='sudo a2disconf'
alias a2enconf='sudo a2enconf'
alias a2dismod='sudo a2dismod'
alias a2enmod='sudo a2enmod'
alias a2dissite='sudo a2dissite'
alias a2ensite='sudo a2ensite'
alias a2graceful='sudo a2graceful'
alias a2modules='sudo a2modules'

alias a2log='cat /var/log/apache2/error.log'
alias a2access='cat /var/log/apache2/access.log'

alias a2ctl='sudo apachectl'
alias apachectl='sudo apachectl'
alias apache2ctl='sudo apache2ctl'

# ___________________________________________________________________
#
#                           PYTHON
# ___________________________________________________________________

if [ -d "~/.virtualenvs" ] ; then
    export WORKON_HOME=~/.virtualenvs
    export PROJECT_HOME=~/projects
    export PIP_VIRTUALENV_BASE=~/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh

    alias mkvirtualenv="mkvirtualenv --no-site-packages --distribute"
fi

export PYTHONDONTWRITEBYTECODE=1  # Stop Python from generating bytecode files

# ___________________________________________________________________
#
#                           GIT
# ___________________________________________________________________

# Fetch all remote git branches to local in working directory
#
# examples: $ gitallbranches
# ___________________________________________________________________
alias gitallbranches='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'

# Clone all Github User Repos (Limit 100 repos)
#   Defaults to all Users Repositories (Private Included),
#   For Organizations, Pass -o or --org for Organization.
#
# examples: $ gitallclone jesse123         # Clones user/jesse and private repos if you own
#           $ gitallclone privateteam -o   # Clones org/privateteam and all public repos (NOT READY)
# ___________________________________________________________________
function gitallclone() {
    CLONE_FROM='users' # Default
    if [ -z "$1" ]; then
        "Provide a name or organization, cannot be empty"
        return
    fi
    if [ -z "${GITHUB_ACCESS_TOKEN}" ]; then
        "Please set GITHUB_ACCESS_TOKEN='yourtoken' in .bashrc so you can bulk clone private users and orgs you belong to"
    fi

    access_token=$GITHUB_ACCESS_TOKEN
    REPO_URL= "https://api.github.com/users/$1/repos?page=1&per_page=100"
    curl "https://api.github.com/users/$1/repos?page=1&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
}

# ___________________________________________________________________
#
#                        LEGIT FUNCTIONS
# ___________________________________________________________________

# Find in file
#
# examples:  $ findinfile 'hello mom' .
# ___________________________________________________________________
function findinfile() {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: findinfile <text|text2> <path (defaults to \$PWD>"
    return
  fi

  if [ -z "$2" ]; then
    local search_path=$PWD
  else
    search_path=$2
  fi

  grep -Elir "(${1}) ${serach_path}"
}

# Directory Loop (All Children/Sub-Folders)
#
#   @TODO [ON HOLD, SEE BELOW] PASS -d=2 or --depth=<number> to allow over 1 level deep
#
# examples: $ loopdircmd git checkout development
# ___________________________________________________________________
loopdircmd() {
    if [ -z "$1" ]; then
        echo -e "[!] Whoops! Provide a command,\n\t eg: loopdircmd git checkout development\n"
        return
    fi

    # $* joins all arguments as a string
    echo "$*"

    # Go One Level Deep
    # @TODO Using this right now for CWD OUTPUT
    for d in ./*/; do
        echo -e "\n${BOLD}${WHITE}${d}${RESET}"
        (cd "$d" && $*);
    done

    # @TODO: This works great, but I'd like to print out the directory im in better
    # -name . skips running from the CWD
    # find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && echo -e \"\n${BOLD}${GREEN}In Directory: ${PWD}${RESET}\" && $*" \;
}

# One EXTRACT method to rule them all
#
#  examples: $ extract <file.ext> <(optional path) .>
# ___________________________________________________________________
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# One COMPRESS method to rule them all
# examples: $ compress <file.tar> <./path>
# ___________________________________________________________________
compress() {
  if [[ -n "$1" ]]; then
    FILE=$1
    case $FILE in
      *.tar ) shift && tar cf $FILE $* ;;
      *.tar.bz2 ) shift && tar cjf $FILE $* ;;
      *.tar.gz ) shift && tar czf $FILE $* ;;
      *.tgz ) shift && tar czf $FILE $* ;;
      *.zip ) shift && zip $FILE $* ;;
      *.rar ) shift && rar $FILE $* ;;
    esac
  else
    echo "Usage: compress <foo.tar.gz> ./foo ./bar"
  fi
}



# Go Up(n) Parent Directories
#
# examples:  $ up 4      # Goes four parents up
# ___________________________________________________________________
up() {
  local d=''
  limit=$1
  for ((i=1; i <= limit; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')

  if [[ -z "$d" ]]; then d=..; fi
  cd $d
}


# Calculator
#   Simple calculator, cannot use spaces (MIGHT FIX)
#
# examples:     $  calc 5*500
# ___________________________________________________________________
calc() {
  if (( $+commands[bc] )); then
    echo "scale=3; $*" | bc -l
  else
    awk "BEGIN { print $* }"
  fi
}

# End of File
