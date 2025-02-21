set nocompatible          " be iMproved, required
set encoding=utf-8        " utf-8 by default

" Enable true color
" from https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" config plugin bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'edge'

" config plugin lervag/vimtex
let g:tex_flavor = 'latex'

" config plugin dart-lang/dart-vim-plugin
"let dart_html_in_string=v:true  " Enable HTML syntax highlighting inside Dart strings (default false).
"let g:dart_style_guide = 2      " Enable Dart style guide syntax (like 2-space indentation)
"let g:dart_format_on_save = 1   " Enable DartFmt execution on buffer save
"let g:dartfmt_options           " Configure DartFmt options (discover formatter options with dartfmt -h)

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
" config plugin sainnhe/edge (colorscheme)
let g:edge_style = 'neon'
let g:edge_better_performance = 1
"let g:edge_disable_italic_comment = 1
"let g:edge_transparent_background = 1

function! s:edge_custom() abort
  " Link a highlight group to a predefined highlight group.
  " See `colors/edge.vim` for all predefined highlight groups.
  "" clojure builtin groups
  "highlight! link clojureDefine   Purple
  "highlight! link clojureFunc     Blue
  "highlight! link clojureMacro    Purple
  "highlight! link clojureVariable White

  " Initialize the color palette.
  " The first parameter is a valid value for `g:edge_style`,
  " the second parameter is a valid value for `g:edge_dim_foreground`,
  " and the third parameter is a valid value for `g:edge_colors_override`.
  let l:palette = edge#get_palette('neon', 0, {})

  " Define a highlight group.
  " The first parameter is the name of a highlight group,
  " the second parameter is the foreground color,
  " the third parameter is the background color,
  " the fourth parameter is for UI highlighting which is optional,
  " and the last parameter is for `guisp` which is also optional.
  " See `autoload/edge.vim` for the format of `l:palette`.
  call edge#highlight('groupE', l:palette.red, l:palette.none, 'undercurl', l:palette.red)
endfunction

augroup EdgeCustom
  autocmd!
  autocmd ColorScheme edge call s:edge_custom()
augroup END

colorscheme edge

set background=dark
set t_Co=256              " Force 256 colors

highlight NonText guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE

" Behaviors
set autoread                     " Automatically reload changes if detected
set autowrite                    " Writes on make/shell commands
set cf                           " Enable error files & error jumping.
set complete+=k                  " Enable dictonary on completion
set foldmethod=syntax            " Enable folding
set formatoptions=tcrq           " t: autowrap text, c: autowrap comments, r: keep on
                                 "   comment after hitting <enter>, q: format comments
set hidden                       " Change buffer - without saving
set history=768                  " Number of things to remember in history.
set iskeyword+=$,@               " Add extra characters that are valid parts of variables
set pastetoggle=<F2>             " Set F2 as paste mode toggler
set timeoutlen=350               " Time to wait for a command (after leader for example)
set updatetime=300               " Better for diagnostic messages
set wildmenu                     " Turn on Wild menu
set wildmode=list:full           " show list and complete with next full match

" Text Format
set autoindent                   " Copy indent from current line when adding a new one
set backspace=2                  " Delete everything with backspace
set expandtab                    " Expand <tab> as spaces
set shiftwidth=2                 " Columns indented using >> and << or smart indent
set smartindent                  " Smart indent like a C-program
set smarttab                     " Let <tab> and <bs> check shiftwidth or tabstop
set softtabstop=2                " Number of spaces to count while editing

" Searching
set hlsearch                     " Highligh search results
set ignorecase                   " Case insensitive search
set incsearch                    " Show matching cases while typing
set smartcase                    " Override ignorecase if pattern contains upper case chars

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
"let mapleader = "\<Space>"

" Disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" map paste mode (fixes autoident on terminal)
nnoremap <F2> :set invpaste paste?<CR>

" Identify the syntax highlighting group used at the cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <F10> :call SynStack()<CR>
nnoremap <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tab navigation
nnoremap <tab> :tabnext<cr>
nnoremap <s-tab> :tabprevious<cr>

nnoremap <c-p> :FZF<CR>
nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>b :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'),
"                              \ 'sink': 'e', 'down': '30%'})<CR>

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

" config hrsh7th/vim-vsnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

lua << LUA
local lspconfig = require('lspconfig')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "ts_ls", "clojure_lsp" }
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    highlight = true,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

--
-- config hrsh7th/nvim-cmp plugin
--
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

--
-- config akinsho/flutter-tools.nvim plugin
--
require("flutter-tools").setup{
  debugger = { enabled = true },
  dev_tools = {
    autostart = true,
    auto_open_browser = true
  },
  outline = {
    auto_open = true
  },
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities
  }
}

--
-- config nvim-treesitter plugin
--
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "clojure", "dart" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "clojure" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

--
-- Global mappings.
--
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
LUA
