" Loading vim
source ~/.vim/vimrc

autocmd FileType coffee set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType js set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" Ignore gems and log for fuzzy find
set wildignore+=.bundle/gems/**,log/**

if has("gui_running")
    colorscheme railscasts2
    if has("gui_gnome")
        set guifont=Monospace\ 8
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    if $COLORTERM == 'gnome-terminal'
        colorscheme railscasts2
    endif
endif
