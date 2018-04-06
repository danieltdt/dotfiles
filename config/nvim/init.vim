set runtimepath^=~/.vim runtimepath+=~/.vim/after
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

" Syntax
Plug 'w0rp/ale'                        " async lint engine

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

" Coloschemes
Plug 'altercation/vim-colors-solarized'
Plug 'justincampbell/vim-railscasts'
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'EHartC/Spink'
Plug 'vim-scripts/twilight256.vim'
Plug 'nanotech/jellybeans.vim'

" Dictionaries
Plug 'guileen/vim-node-dict'

" Others
Plug 'moll/vim-node'                   " node.js tools
Plug 'tpope/vim-rails'                 " rails tools
Plug 'tpope/vim-classpath'             " java classpath support
Plug 'rainerborene/vim-reek'           " ruby code smell detection (requires `reek`)
Plug 'ngmy/vim-rubocop'                " rubocop support
Plug 'wfleming/vim-codeclimate'        " codeclimate support
Plug 'beloglazov/vim-online-thesaurus' " thesaurus online
Plug 'clojure-vim/acid.nvim'           " async clojure interactive development
Plug 'kovisoft/paredit', { 'for': ['closure'] } " paredit mode: sexprs

" Completion
Plug 'roxma/nvim-completion-manager'   " completion framework for nvim
Plug 'clojure-vim/async-clj-omni'      " clojure support
Plug 'roxma/ncm-rct-complete'          " ruby support
call plug#end()

source ~/.vimrc
