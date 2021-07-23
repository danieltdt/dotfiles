set nocompatible          " be iMproved, required
set encoding=utf-8        " utf-8 by default

" Enable true color
" from https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" config plugin guns/vim-clojure-static
let g:clojure_maxlines = 0
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

" config plugin bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'edge'

" config plugin lervag/vimtex
let g:tex_flavor = 'latex'

" config plugin sainnhe/edge
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1

" config neovim/nvim-lspconfig
lua << LUA
require'lspconfig'.clojure_lsp.setup{}
LUA

au BufRead,BufNewFile *.es6         set filetype=javascript
au BufRead,BufNewFile *nginx/*.conf set filetype=nginx
au FileType           javascript    set dictionary+=~/.local/share/nvim/plugged/vim-node-dict/dict/node.dict
au FileType           java          set tags=~/.vim/java.tags
au FileType           java          setlocal omnifunc=javacomplete#Complete

" Load rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" UI
set cmdheight=2           " Make the command area one lines high
set shortmess+=c          " Don't give ins-completion-menu messages.
set colorcolumn=+1
set laststatus=2          " Always show the statusline
set list                  " Show invisible characters
set listchars=""          " Reset the listchars
set listchars+=eol:¬      " Show end-of-line as "¬"
set listchars+=extends:>  " The character to show in the last column when wrap is
                          " off and the line continues beyond the right of the screen
set listchars+=precedes:< " The character to show in the last column when wrap is
                          " off and the line continues beyond the left of the screen
set listchars+=tab:\⇥\    " A tab should display as "⇥ ", trailing whitespace as "."
set listchars+=trail:.    " Show trailing spaces as dots
set matchtime=2           " How many tenths of a second to blink
set number                " Line numbers on
set ruler                 " Ruler on
set showbreak=↳\          " Define line break character
set showmatch             " Show matching brackets
set showmode              " Always show the active mode
set textwidth=80          " Make 80th column visible
set wrap                  " Line wrapping on

" Colors
colorscheme edge

set background=dark
set t_Co=256              " Force 256 colors

highlight NonText guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE

" Behaviors
set autoread              " Automatically reload changes if detected
set autowrite             " Writes on make/shell commands
set cf                    " Enable error files & error jumping.
set complete+=k           " Enable dictonary on completion
set foldmethod=syntax     " Enable folding
set formatoptions=tcrq    " t: autowrap text, c: autowrap comments, r: keep on
                          "   comment after hitting <enter>, q: format comments
set hidden                " Change buffer - without saving
set history=768           " Number of things to remember in history.
set iskeyword+=$,@        " Add extra characters that are valid parts of variables
set pastetoggle=<F2>      " Set F2 as paste mode toggler
set timeoutlen=350        " Time to wait for a command (after leader for example)
set updatetime=300        " Better for diagnostic messages
set wildmenu              " Turn on Wild menu
set wildmode=list:full    " show list and complete with next full match

" Text Format
set autoindent            " Copy indent from current line when adding a new one
set backspace=2           " Delete everything with backspace
set expandtab             " Expand <tab> as spaces
set shiftwidth=2          " Columns indented using >> and << or smart indent
set smartindent           " Smart indent like a C-program
set smarttab              " Let <tab> and <bs> check shiftwidth or tabstop
set softtabstop=2         " Number of spaces to count while editing

" Searching
set hlsearch              " Highligh search results
set ignorecase            " Case insensitive search
set incsearch             " Show matching cases while typing
set smartcase             " Override ignorecase if pattern contains upper case chars

set wildignore+=.git,.git/*,.svn,.svn/*                              " version control files
set wildignore+=*.o,*.out,*.obj,*.pyc,*.rbc,*.class,*.jar,*.gem      " compiled files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz              " compressed files
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*
set wildignore+=node_modules,node_modules/*
set wildignore+=bower_components,bower_components/*
set wildignore+=public/assets/*
set wildignore+=__pycache__
set wildignore+=target/*,classes/*,.lein-*,tmp/*

" Mappings
" Use space key as leader
let mapleader = "\<Space>"

" Disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" map paste mode (fixes autoident on terminal)
nnoremap <F2> :set invpaste paste?<CR>

" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tab navigation
nnoremap <tab> :tabnext<cr>
nnoremap <s-tab> :tabprevious<cr>

nnoremap <c-p> :FZF<CR>
nnoremap <leader>b :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'),
                              \ 'sink': 'e', 'down': '30%'})<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" duplicate buffer on new tab
nnoremap <C-w>T :tab split<CR>

" key mapping for moving lines up and down
nnoremap <leader>mj :m .+1<cr>==
nnoremap <leader>mk :m .-2<cr>==
inoremap <leader>mj <Esc>:m .+1<CR>==gi
inoremap <leader>mk <Esc>:m .-2<CR>==gi
vnoremap <leader>mj :m '>+1<CR>gv=gv
vnoremap <leader>mk :m '<-2<CR>gv=gv
