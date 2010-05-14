#!/bin/sh

# colored ls output
alias ls="ls -G"

# bash completion, in case this wasn't done in .profile et al
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# add hmansify bin directory to path
export PATH=~/hmansify/bin:$PATH

# awesome git-enabled prompt
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")" 
}
export PS1='\[\033[00;32m\]\u \[\033[00;35m\]\w\[\033[00m\]\[\033[00;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s` \[\033[00m\]\$ '

# memcached wants this
export EVENT_NOKQUEUE=1

# mysql gem wants this
export ARCHFLAGS="-arch x86_64"

# edit stuff in textmate
export EDITOR="/usr/local/bin/mate -w"

# done!
