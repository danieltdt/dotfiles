#! /bin/bash

alias b="bundle exec"
alias n='npm_exec'
alias gvim="gvim 2> /dev/null"
alias tm="source ./tmux.sh"

alias productivity="ruby -e '(1..1000).each {|i| sleep i/1000.0; print \"#{%Q{\b} * 100}#{%q{.} * (i.div 10)} (#{i.div 10}%)\" }'"
