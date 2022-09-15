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

" fzf (not necessary on arch)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax
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
Plug 'slim-template/vim-slim'          " slim support
Plug 'kchmck/vim-coffee-script'        " coffeescript support
Plug 'vim-scripts/bats.vim'            " bats (bash) support
Plug 'google/vim-jsonnet'              " jsonnet support
Plug 'dart-lang/dart-vim-plugin'       " dart support
Plug 'thosakwe/vim-flutter'            " flutter support
Plug 'nvim-lua/plenary.nvim'           " akinsho/flutter-tools.nvim dependency
Plug 'akinsho/flutter-tools.nvim'      " additional flutter tools

Plug 'mfussenegger/nvim-dap'           " debug adapter protocol for nvim
Plug 'rcarriga/nvim-dap-ui'            " UI for debugging
Plug 'neovim/nvim-lspconfig'           " configs for built-in neovim LSP
Plug 'hrsh7th/vim-vsnip'               " Snippets plugin
Plug 'hrsh7th/vim-vsnip-integ'         " snippets integration with LSP
Plug 'hrsh7th/nvim-compe'              " auto completion with LSP support

" Coloschemes
Plug 'altercation/vim-colors-solarized'
Plug 'justincampbell/vim-railscasts'
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'EHartC/Spink'
Plug 'vim-scripts/twilight256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/edge'
Plug 'EdenEast/nightfox.nvim'

" Dictionaries
Plug 'guileen/vim-node-dict'

" Tags
" Plug 'ludovicchabant/vim-gutentags'

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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " incremental parsing lib (better highlights)

" For Lisp dialects (emacs flavors)
Plug 'kien/rainbow_parentheses.vim' " highlight parens
Plug 'tpope/vim-fireplace'          " clojure repl integration
Plug 'guns/vim-clojure-static'      " required by guns/vim-clojure-highlight
Plug 'guns/vim-clojure-highlight'   " extends bultin clojure highlight
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'} " paraedit++
Plug 'guns/vim-sexp', {'for': 'clojure'}                       " s-exp support

call plug#end()

source ~/.vimrc
