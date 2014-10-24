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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt
export TERM='xterm-256color'
export COLORTERM='gnome-terminal'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

########################
# Enable nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"  # This loads NVM
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

#########################
# Enable rbenv shims and autocompletion
export PATH=$HOME/.rbenv/bin:$PATH # Using rbenv
eval "$(rbenv init - 2> /dev/null)"

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
export GREP_OPTIONS='--exclude-dir=node_modules --exclude-dir=.bundle --exclude-dir=.git --exclude-dir=coverage -rn'
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/.local/python-libs
export M2_HOME=$HOME/Applications/apache-maven-3.0.5  # Maven home
export GEM_HOME=$HOME/.gems                           # Local system's ruby gem home
export M2=$M2_HOME/bin                                # Maven bin
export IRBRC=$HOME/.irbrc                             # irb config
export CDPATH=$CDPATH:$WORKSPACE                      # workspace on cd
export PATH=$GEM_HOME/bin:$PATH                       # local gem executables
export PATH=$HOME/.local/bin:$PATH                    # local executables
export PATH=$HOME/Applications/sbt/bin:$PATH          # Scala build tool
export PATH=$M2:$PATH                                 # Maven
export PATH="/usr/local/heroku/bin:$PATH"             # Heroku Toolbelt
export PATH=$HOME/Applications/android-sdk-linux/platform-tools:$PATH  # Android
export PATH=$HOME/Applications/apache-jmeter/bin:$PATH                 # JMeter

#########################
# Prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

##########################
# Set vi mode
set -o vi
