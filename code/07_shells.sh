#!/bin/bash

# Check login status
shopt -q login_shell && echo login \
    || echo non-login

# Check interaction status
echo $-
[[ $- == *i* ]] && echo interact \
    || echo non-interact

# Trigger .bashrc from .bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc

# Set global
export FOO=bar

# Update path
PATH=${PATH}:\
/new/path/a:\
/net/path/b

export PATH

# Update PS1
PS1='\e[0;36m[\u: \W]$\e[m'

# Set aliases
alias nb='nano ~/.bashrc'
alias sb='. ~/.bashrc'
alias cl='clear; ls'
alias my_proj='cd /to/my/project/dir; ls'