# If not running interactively, don't do anything (debian way)
[ -z "$PS1" ] && return

# If not running interactively, don't do anything (arch way)
[[ $- != *i* ]] && return

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

# set a fancy prompt
export TERM='screen-256color'
export COLORTERM='gnome-terminal'

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

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ "$(uname)" == "Darwin" ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
  fi
fi

########################
# Enable nvm
if [[ -s /usr/share/nvm/init-nvm.sh ]]; then
  source /usr/share/nvm/init-nvm.sh
else
  [[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"  # This loads NVM
  [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

# Homebrew way
if [ "$(uname)" == "Darwin" ]; then
  if [ -f `brew --prefix nvm`/nvm.sh ]; then
    export NVM_DIR=~/.nvm
    . $(brew --prefix nvm)/nvm.sh
  fi
fi

#########################
# Enable rbenv shims and autocompletion
export PATH=$HOME/.rbenv/bin:$PATH # Using rbenv
eval "$(rbenv init - 2> /dev/null)"

#########################
# Enable jenv shims and autocompletion
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#########################
# Enable resty functions
[[ -f "$HOME/workspace/resty/resty" ]] && . "$HOME/workspace/resty/resty"

# rbenv prompt (from https://gist.github.com/kyanny/1668822)
__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version 2> /dev/null | sed -e 's/ .*//'`
  printf $rbenv_ruby_version
}

# nvm prompt
__nvm_ps1 ()
{
  echo `nvm_ls 'current'`
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
export EDITOR='vim'
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/.local/python-libs:/usr/lib/python3.4/site-packages
export M2_HOME=/opt/maven                             # Maven home
export M2=$M2_HOME/bin                                # Maven bin
export IRBRC=$HOME/.irbrc                             # irb config
export CDPATH=$CDPATH:$WORKSPACE                      # workspace on cd
export PATH=$HOME/.local/bin:$PATH                    # local executables
export PATH=$HOME/Applications/sbt/bin:$PATH          # Scala build tool
export PATH=$M2:$PATH                                 # Maven
export PATH="/usr/local/heroku/bin:$PATH"             # Heroku Toolbelt
export PATH=$HOME/Applications/android-sdk-linux/platform-tools:$PATH  # Android
export PATH=$HOME/Applications/apache-jmeter/bin:$PATH                 # JMeter
[[ ! -z $WORKSPACE ]] && export PATH=$WORKSPACE/resty:$PATH            # Resty helpers

#########################
# Prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

##########################
# load direnv
eval "$(direnv hook bash)"
