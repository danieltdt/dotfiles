" Loading vim
source ~/.vim/vimrc

autocmd FileType coffee set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType js set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" Ignore gems and log for fuzzy find
set wildignore+=.bundle/gems/**,log/**
