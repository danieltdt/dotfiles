set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=/usr/share/vim/vimfiles

let &packpath = &runtimepath

" Load plugins
call plug#begin('~/.local/share/nvim/plugged')

" Environment
Plug 'bling/vim-airline'               " better status/tabline
Plug 'scrooloose/nerdtree'             " file finder sidebar
Plug 'nathanaelkane/vim-indent-guides' " visual indent
Plug 'scrooloose/nerdcommenter'        " better commenting
Plug 'tpope/vim-repeat'                " better command repeating with map
Plug 'tpope/vim-surround'              " better 'surrondings'
Plug 'itspriddle/vim-stripper'         " strip trailing whitespace
Plug 'Raimondi/delimitMate'            " delimiter (quotes, parens, etc) completion
Plug 'mattn/emmet-vim'                 " expanding abbreviations
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': '/bin/bash install.sh'
    \ }                                " LSP support (required by haskell ide engine)
Plug 'neoclide/coc.nvim',              {
    \ 'branch': 'release'
    \ }                                " better LSP support and completion
Plug 'neoclide/coc-java',              {
    \ 'do': 'yarn install --frozen-lockfile',
    \ }
Plug 'neoclide/coc-json',              {
    \ 'do': 'yarn install --frozen-lockfile',
    \ }

" fzf (not necessary on arch)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'w0rp/ale'                        " async lint engine
Plug 'editorconfig/editorconfig-vim'   " load code style definitions

" Git
Plug 'tpope/vim-fugitive'              " awesome git wrapper
Plug 'gregsexton/gitv'                 " gitk for vim

" Languages
Plug 'vim-ruby/vim-ruby'               " ruby support
Plug 'jelera/vim-javascript-syntax'    " javascript support
Plug 'tpope/vim-haml'                  " haml support
Plug 'tpope/vim-markdown'              " markdown support
Plug 'tpope/vim-cucumber'              " cucumber support
Plug 'lervag/vimtex'                   " LaTeX support
Plug 'chr4/nginx.vim'                  " nginx support
Plug 'lepture/vim-velocity'            " Apache Velocity support
Plug 'tmux-plugins/vim-tmux'           " vim plugin for tmux.conf
Plug 'amadeus/vim-mjml'                " mjml support
"Plug 'clojure-vim/async-clj-highlight', {'for':
"        \ 'clojure'}                   " clojure support (using acid-vim)
Plug 'brandonvin/vim-clojure-highlight', {'for':
        \ 'clojure'}                   " clojure support (using fireplace)
Plug 'slim-template/vim-slim'          " slim support
Plug 'kchmck/vim-coffee-script'        " coffeescript support
Plug 'vim-scripts/bats.vim'            " bats (bash) support
Plug 'google/vim-jsonnet'              " jsonnet support

" Coloschemes
Plug 'altercation/vim-colors-solarized'
Plug 'justincampbell/vim-railscasts'
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'EHartC/Spink'
Plug 'vim-scripts/twilight256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/edge'

" Dictionaries
Plug 'guileen/vim-node-dict'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Others
Plug 'junegunn/vim-easy-align'         " emacs like align
Plug 'moll/vim-node'                   " node.js tools
Plug 'tpope/vim-rails'                 " rails tools
Plug 'tpope/vim-classpath'             " java classpath support
Plug 'rainerborene/vim-reek'           " ruby code smell detection (requires `reek`)
Plug 'ngmy/vim-rubocop'                " rubocop support
Plug 'wfleming/vim-codeclimate'        " codeclimate support
Plug 'beloglazov/vim-online-thesaurus' " thesaurus online
Plug 'junegunn/vader.vim'              " vimscript test framework
Plug 'mzlogin/vim-markdown-toc'        " table of contents generator

" For Lisp dialects (emacs flavors)
Plug 'guns/vim-clojure-static'         " clojure runtime files (required by vim-clojure-highlight)
Plug 'kien/rainbow_parentheses.vim'    " highlight parens
Plug 'eraserhd/parinfer-rust', {'do':
        \ 'cargo build --release'}
"Plug 'clojure-vim/acid.nvim', {'do':
"        \ ':UpdateRemotePlugin'}       " async clojure interactive development
"
Plug 'tpope/vim-fireplace'           " clojure repl integration
Plug 'Shougo/neco-syntax'            " many languages completion (using syntax keywords)
"Plug 'clojure-vim/async-clj-omni'    " clojure completion (using nrepl-python-client) for coc.nvim and more
Plug 'zchee/deoplete-jedi'           " python completion (using jedi)

call plug#end()

source ~/.vimrc
