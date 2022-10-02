#!/bin/bash

# Color Exports
# ──────────────────────────────────────────────────────────────────────
export __RED="\033[1;91m"
export __GREEN="\033[1;92m"
export __BLUE="\033[1;94m"
export __YELLOW="\033[1;93m"
export __RESET="\033[0m"

# Path Exports
# ──────────────────────────────────────────────────────────────────────
# @important
# $PWD will be reference from where script is run from.
# So it's important to only allow running from the root folder
# of this repository with the install scripts.
# export REPO_FILES_PATH=$PWD/files       # (NO Trailing Slash!)
export LOG_PATH=$PWD/OUTPUT.LOG # .gitignored

# User Exports
# ──────────────────────────────────────────────────────────────────────
# When running sudo ./script.sh we want the caller, not the SUDO user.
# This will set an environment variable $SUDO_USER / $SUDO_UUID and will
# provide if "jesse" ran `sudo ./file` rather than giving back root.
if [[ $SUDO_USER ]]; then
  export USER=$SUDO_USER
else
  # If $SUDO_USER is not set this was run as root, so we'll let him do as he pleases.
  export USER=$LOGNAME
fi

# Helper Functions
# ──────────────────────────────────────────────────────────────────────
# Since this is internal only I won't worry about checki
function success() {
  if [ -z "$1" ]; then echo "{$__RED}[X]{$__RESET} Developer Error! Missing argument."; fi
  MSG="{$__GREEN}[+]{$__RESET} $1"
  echo -e $MSG
  [ "$2" == 'log' ] && log $MSG
}

function info() {
  if [ -z "$1" ]; then echo "{$__RED}[X]{$__RESET} Developer Error! Missing argument."; fi
  MSG="{$__BLUE}[+]{$__RESET} $1"
  echo -e $MSG
  [ "$2" == 'log' ] && log $MSG
}

function warn() {
  if [ -z "$1" ]; then echo "{$__RED}[X]{$__RESET} Developer Error! Missing argument."; fi
  MSG="{$__YELLOW}[!]{$__RESET} $1"
  echo -e $MSG
  [ "$2" == 'log' ] && log $MSG
}

function error() {
  if [ -z "$1" ]; then echo "{$__RED}[X]{$__RESET} Developer Error! Missing argument."; fi
  echo -e "{$__RED}[X]{$__RESET} $1"
}

function log() {
  local TYPE=$1
  local MSG=$1

  if [ -z "$TYPE" ]; then
    echo -e "{$__RED}[X]{$__RESET} Developer Error! Missing argument for: log <\$TYPE: info|warn|error|success>."
    return 0
  fi

  if [ -z "$MSG" ]; then
    echo -e "{$__RED}[X]{$__RESET} Developer Error! Missing argument for: log $TYPE <\$MSG: message content>."
    return 0
  fi

  # Determine the type of message, cannot get here
  case $TYPE in
  info)
    STDOUT="{$__BLUE}[info]{$__RESET} $MSG"
    ;;
  error)
    STDOUT="{$__RED}[error]{$__RESET} $MSG"
    ;;
  warn)
    STDOUT="{$__YELLOW}[notice]{$__RESET} $MSG"
    ;;
  success)
    STDOUT="{$__GREEN}[good]{$__RESET} $MSG"
    ;;
  *)
    echo -e "{$__RED}[X]{$__RESET} Developer Error! Using invalid parameter for: log <\$TYPE: info|warn|error|success>."
    return 0
    ;;
  esac
  DATE=$("date +\"%Y-%m-%d %r\"")
  echo -e "$STDOUT"
  echo -e "$DATE \t|\t $STDOUT" >>LOG_PATH
}

# @important
#
# The variable $PWD will be where the script is run from
# So it's important to only allow running from the root folder
# with the install scripts.
