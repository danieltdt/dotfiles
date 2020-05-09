set nocompatible          " be iMproved, required
set encoding=utf-8        " utf-8 by default

" Enable true color
" from https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" config clojure
let g:clojure_maxlines = 0
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

" Plugins modification
let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'edge'
let g:gutentags_cache_dir = '~/.vim/gutentags/'
let g:LanguageClient_rootMarkers = { 'haskell': ['*.cabal', 'stack.yaml'] }
let g:ale_python_pylint_executable = 'pyenv exec pylint'
let g:ale_haskell_cabal_ghc_options = '-dynamic -fno-code -v0'
let g:ale_haskell_ghc_options= '-dynamic -fno-code -v0'

let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1

let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'],
                                      \ }
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

" Haskell IDE Engine recommended key bindings
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" Clojure-lsp
function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

nnoremap <silent> crcc :call LanguageClient#workspace_executeCommand('cycle-coll', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap <silent> crth :call LanguageClient#workspace_executeCommand('thread-first', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap <silent> crtt :call LanguageClient#workspace_executeCommand('thread-last', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap <silent> crtf :call LanguageClient#workspace_executeCommand('thread-first-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap <silent> crtl :call LanguageClient#workspace_executeCommand('thread-last-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap <silent> crml :call LanguageClient#workspace_executeCommand('move-to-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
nnoremap <silent> cril :call LanguageClient#workspace_executeCommand('introduce-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
nnoremap <silent> crel :call LanguageClient#workspace_executeCommand('expand-let', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
nnoremap <silent> cram :call LanguageClient#workspace_executeCommand('add-missing-libspec', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>

" coc.nvim config
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

"" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
