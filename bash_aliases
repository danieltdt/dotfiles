#! /bin/bash

alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
alias b="bundle exec"
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias n='npm_exec'
alias gvim="gvim 2> /dev/null"
alias tm="source ./tmux.sh"
alias yolo="git ci -am'This is an amazing commit'"
alias productivity="ruby -e '(1..1000).each {|i| sleep i/1000.0; print \"#{%Q{\b} * 100}#{%q{.} * (i.div 10)} (#{i.div 10}%)\" }'"
alias lein*='docker run --rm -it -w /mnt -v $PWD:/mnt -v clojure-lein-m2:/root/.m2 clojure:lein-2.8.3 lein'
alias pgcli='PYENV_VERSION=system-pgcli pyenv exec pgcli'
alias fdt='flutter pub global run devtools'

# Install 'babashka-bin' from AUR
alias jbq='jet --from json --to edn --keywordize | bb -I --stream'
# cat foo.json | jbq '(-> *input* ...)'

alias bbjq='bb "(json/parse-stream *in* true)" | bb'
# curl -s 'https://api.github.com/repos/borkdude/clj-kondo/commits?per_page=5' | bbjq '(->> *input* (map (comp :login :author)))'

grep_options='--color=auto --exclude-dir=node_modules --exclude-dir=.bundle --exclude-dir=.git --exclude-dir=coverage --exclude-dir=.clj-kondo'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    #grep_options="$grep_options --color=auto"
fi
alias grep="grep $grep_options"
alias fgrep="fgrep $grep_options"
alias egrep="egrep $grep_options"

# some more ls aliases
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'

alias psgrep='ps aux | grep -i'

alias awslocal='aws --profile localstack --endpoint-url http://localhost:4576'
