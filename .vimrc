" Loading vim
source ~/.vim/vimrc

" Redefining @reu defaults
set wrap
let &showbreak = '↳ '

" Redefine colorschema and fonts
if has("gui_running")
    colorscheme jellybeans
    if has("gui_gnome")
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    if $COLORTERM == 'gnome-terminal'
      colorscheme jellybeans
    endif
endif

" Fix tab for js and coffee
autocmd FileType coffee set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType js set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" Fix IndentGuides for terminal
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#252525 ctermbg=0

" Use system clipboard
set clipboard=unnamedplus

" Ignore gems and log for fuzzy find
set wildignore+=.bundle/gems/**,log/**
