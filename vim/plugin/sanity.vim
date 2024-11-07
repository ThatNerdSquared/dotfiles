" options that should be default, but aren't in vim.
" they are in neovim, hence the initial check.

if has('nvim')
    finish
endif

syntax on
set regexpengine=0
set ttimeoutlen=50
set incsearch
set hlsearch
set laststatus=2
set hidden
set mouse=a
set backspace=indent,eol,start
set history=10000
set showcmd
set wildmenu
