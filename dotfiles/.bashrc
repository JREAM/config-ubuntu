#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ BASHRC                                                          ║
# ╠═════════════════════════════════════════════════════════════════╣
# ║ Entry Point to all Bash Utilities                               ║
# ╚═════════════════════════════════════════════════════════════════╝

# If not running interactively, don't do anything
# ___________________________________________________________________
[ -z "$PS1" ] && return


# ┌─────────────────────────────────────────────────────────────────┐
# │ Terminal Display                                                │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Unobtrusive user@name[~/path]:~$
# Unobtrusive user@name[~/path (git-branch)]:~$
export PS1="\u\[$(tput sgr0)\]\[\033[38;5;250m\]@\[$(tput sgr0)\]\[\033[38;5;15m\]\H[\[$(tput sgr0)\]\[\033[38;5;251m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\[$(tput sgr0)\]\[\033[38;5;15m\]]:~\\$ \[$(tput sgr0)\]"

# ┌─────────────────────────────────────────────────────────────────┐
# │ Source Other Files                                              │
# ├─────────────────────────────────────────────────────────────────┤
# │ Let Bash Variables come first to use within every area.         │
# └─────────────────────────────────────────────────────────────────┘
if [ -f ~/.bash_vars ]; then source ~/.bash_vars; fi
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi
if [ -f ~/.bash_vendors ]; then source ~/.bash_vendors; fi
if [ -f ~/.dockerrc ]; then source ~/.dockerrc; fi

# For private exports [Don't place in git]
# ___________________________________________________________________
if [ ! -f ~/.exports_private ]; then
  touch ~/.exports_private
else
  source ~/.exports_private
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Preferences: History                                            │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don"t overwrite it
# ___________________________________________________________________
shopt -s histappend

# Set variable identifying the chroot you work in
#                      (used in the prompt below)
# ___________________________________________________________________
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# ┌─────────────────────────────────────────────────────────────────┐
# │ Bash Completion                                                 │
# ├─────────────────────────────────────────────────────────────────┤
# └─────────────────────────────────────────────────────────────────┘
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Fix $ cd typing errors
# ___________________________________________________________________
shopt -s cdspell


# Make less more friendly for non-text input files, see lesspipe(1)
# ___________________________________________________________________
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

