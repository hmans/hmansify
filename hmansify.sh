#!/bin/sh

# colored ls output
alias ls="ls -G"

# bundle exec shortcut
alias be='bundle exec'

# edit a bundled gem
function mategem {
  gemlocation=`bundle show $1`
  if [ -d "$gemlocation" ]; then
    echo "mate $gemlocation"
    mate $gemlocation
  else
    echo "gem $1 not found in current bundle."
  fi
}

# homebrew bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# add hmansify bin directory to path
export PATH=~/hmansify/bin:$PATH

# add homebrew bin path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# awesome git-enabled prompt
function bundler_prompt {
  if [ -n "${BUNDLE_GEMFILE:+x}" ]; then
    echo '[B] '
  else
    echo ''
  fi
}
export PS1='\[\033[00;32m\]\u \[\033[00;35m\]\w\[\033[00m\]\[\033[00;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s` \[\033[36m\]$(bundler_prompt)\[\033[00m\]\$ '

# memcached wants this
export EVENT_NOKQUEUE=1

# mysql gem wants this
export ARCHFLAGS="-arch x86_64"

# edit stuff in textmate
export EDITOR="mate -w"

# rvm!
[[ -s "/Users/hmans/.rvm/scripts/rvm" ]] && source "/Users/hmans/.rvm/scripts/rvm"

# done!
