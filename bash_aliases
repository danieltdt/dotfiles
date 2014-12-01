#! /bin/bash

alias b="bundle exec"
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias n='npm_exec'
alias gvim="gvim 2> /dev/null"
alias tm="source ./tmux.sh"
alias yolo="git ci -am'This is an amazing commit'"
alias productivity="ruby -e '(1..1000).each {|i| sleep i/1000.0; print \"#{%Q{\b} * 100}#{%q{.} * (i.div 10)} (#{i.div 10}%)\" }'"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    options='--exclude-dir=node_modules --exclude-dir=.bundle --exclude-dir=.git --exclude-dir=coverage'
    alias grep="grep --color=auto $options"
    alias fgrep="fgrep --color=auto $options"
    alias egrep="egrep --color=auto $options"
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
