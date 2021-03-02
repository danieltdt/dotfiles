# PS4='+[${SECONDS}s][${BASH_SOURCE}:${LINENO}]: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
# set -x
# If not running interactively, don't do anything (debian way)
[ -z "$PS1" ] && return

# If not running interactively, don't do anything (arch way)
[[ $- != *i* ]] && return

# load system-wide conf
test -r /etc/profile && . /etc/profile

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

##########################
# Set vi mode
set -o vi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Fixes for mac os
if [ "$(uname)" == "Darwin" ]; then
  # enable colors on terminal
  export CLICOLOR=1

  # fix python LANG
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# My custom scripts
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# load bash completion on arch linux
if [ -f /etc/arch-release ]; then
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
      . /etc/bash_completion
  fi
fi

if [ "$(uname)" == "Darwin" ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
  fi
fi

########################
# Enable nvm
if [[ "$(uname -r)" != *-Microsoft ]]; then # Avoid loading nvm on wsl (improve performance)
  if [[ -s /usr/share/nvm/init-nvm.sh ]]; then
    source /usr/share/nvm/init-nvm.sh
  # Homebrew way
  elif [ "$(uname)" == "Darwin" ]; then
    if [ -f `brew --prefix nvm`/nvm.sh ]; then
      export NVM_DIR=~/.nvm
      . $(brew --prefix nvm)/nvm.sh
    fi
  else
    [[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"  # This loads NVM
    [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
  fi
fi

#########################
# fzf bindings
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
  . /usr/share/fzf/key-bindings.bash
fi

if [[ -f /usr/share/fzf/completion.bash ]]; then
  . /usr/share/fzf/completion.bash
fi

#########################
# Enable rbenv shims and autocompletion
if [[ "$(uname -r)" != *-Microsoft ]]; then # Avoid loading rbenv on wsl (improve performance)
  export PATH=$HOME/.rbenv/bin:$PATH # Using rbenv
  eval "$(rbenv init - 2> /dev/null)"
fi

#########################
# Enable pyenv shims and autocompletion
if [[ "$(uname -r)" != *-Microsoft ]]; then # Avoid loading pyenv on wsl (improve performance)
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi

#########################
# Enable jenv shims and autocompletion
if which jenv > /dev/null 2>&1; then eval "$(jenv init -)"; fi

# rbenv prompt (from https://gist.github.com/kyanny/1668822)
__rbenv_ps1 ()
{
  [[ "$(uname -r)" == *-Microsoft ]] && return;
  rbenv_ruby_version=`rbenv version 2> /dev/null | sed -e 's/ .*//'`
  printf $rbenv_ruby_version
}

# nvm prompt
__nvm_ps1 ()
{
  [[ "$(uname -r)" == *-Microsoft ]] && return;
  echo `nvm_ls 'current'`
}

# pyenv prompt
__pyenv_ps1 ()
{
  [[ "$(uname -r)" == *-Microsoft ]] && return;
  echo `pyenv version | cut -d' ' -f 1`
}

if [ -f /usr/share/git/git-prompt.sh ]; then
    . /usr/share/git/git-prompt.sh
fi

#########################
# Load sensitive env vars (like application-specific password for google
# account)
if [ -f ~/.env ]; then
    . ~/.env
fi

#########################
# Defining & redefining some env vars
# export PULSE_LATENCY_MSEC=60 # Uncomment this line if skype sound is distorted
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_COMMAND='ag -g ""'
# dark edge
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#c5cdd9,bg:#262729,hl:#6cb6eb
--color=fg+:#c5cdd9,bg+:#262729,hl+:#5dbbc1
--color=info:#88909f,prompt:#ec7279,pointer:#d38aea
--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1'
# light edge
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--color=fg:#4b505b,bg:#fafafa,hl:#5079be
#--color=fg+:#4b505b,bg+:#fafafa,hl+:#3a8b84
#--color=info:#88909f,prompt:#d05858,pointer:#b05ccc
#--color=marker:#608e32,spinner:#d05858,header:#3a8b84'

export EDITOR='nvim'
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/.local/python-libs:/usr/lib/python3.4/site-packages
#export M2_HOME=/opt/maven                             # Maven home
#export M2=$M2_HOME/bin                                # Maven bin
export IRBRC=$HOME/.irbrc                             # irb config
export DATOMIC_INSTALL_DIR=~/.local/datomic-free-0.9.5697
export CDPATH=$CDPATH:$WORKSPACE                      # workspace on cd
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH           # ruby gems
export PATH=$HOME/.local/bin:$PATH                    # local executables
export PATH=$HOME/Applications/sbt/bin:$PATH          # Scala build tool
#export PATH=$M2:$PATH                                 # Maven
export PATH="/usr/local/heroku/bin:$PATH"             # Heroku Toolbelt
export PATH=$HOME/Applications/android-sdk-linux/platform-tools:$PATH  # Android
export PATH=$HOME/Applications/apache-jmeter/bin:$PATH                 # JMeter

#########################
# Prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

##########################
# load direnv
eval "$(direnv hook bash)"

##########################
# load m-cli (github.com/rgcr/m-cli)
if [ -f /usr/local/m-cli/m ]; then
  export PATH=$PATH:/usr/local/m-cli
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/daniel/.sdkman"
[[ -s "/home/daniel/.sdkman/bin/sdkman-init.sh" ]] && source "/home/daniel/.sdkman/bin/sdkman-init.sh"
