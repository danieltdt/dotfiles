#! /bin/bash

alias b="bundle exec"
alias gvim="gvim 2> /dev/null"
alias tmux="TERM=screen-256color-bce tmux -2"

alias productivity="ruby -e '(1..1000).each {|i| sleep i/1000.0; print \"#{%Q{\b} * 100}#{%q{.} * (i.div 10)} (#{i.div 10}%)\" }'"
alias ff3="/home/daniel/firefox3/run-mozilla.sh /home/daniel/firefox3/firefox"
alias ff17="/home/daniel/firefox17/run-mozilla.sh /home/daniel/firefox17/firefox"
