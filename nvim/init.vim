" ThatNerd's init.vim 2.0

" vim-plug auto install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set python
let g:python3_host_prog="/opt/homebrew/bin/python3"

" vim-plug initialization
call plug#begin("~/.config/nvim/plugged")
Plug 'vim-airline/vim-airline' " statusline...
Plug 'vim-airline/vim-airline-themes' " ...but make it aesthetic!
Plug 'rose-pine/neovim' " colourscheme of choice
Plug 'junegunn/fzf' " fzf vim integration
Plug 'junegunn/fzf.vim' " fzf vim integration
" actually good syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" theming and colours
source ~/dotfiles/nvim/treesitter-config.lua
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='fruit_punch'
set background=light
lua require('rose-pine').setup({ disable_italics = true })
colo rose-pine
set termguicolors

" fzf bindings
let g:fzf_buffers_jump = 1
nnoremap <C-p> :Buffers<CR>
nnoremap <C-o> :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap ƒ :BLines<CR>
command! -bang Dotfiles call fzf#vim#files('~/dotfiles', <bang>0)
nnoremap <leader>df :Dotfiles<CR>

" filetree config
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15
nnoremap <leader>e :Lexplore<CR>

" general sets
set syntax " enable syntax highlighting
set number relativenumber " relative-number line numbers
set tabstop=4 " show tab character as 4 spaces wide
set shiftwidth=4 " show indentation as 4 spaces wide
set expandtab " insert spaces on <Tab>
set foldmethod=indent
set breakindent
set formatoptions=l
set lbr
set list
set autoindent " when start a new line, use same indent as previous line
set noignorecase " make search case-sensitive
" these two give you a sense of where your cursor is in the file
" which is really helpful to compare indentation (without need for
" indentlines)
set cursorcolumn
set cursorline

" general bindings
noremap k gk
noremap j gj
noremap <leader>[ gT
noremap <leader>] gt
noremap <leader><leader> :tabnew<CR>
command -nargs=0 Einit tabedit ~/dotfiles/nvim/init.vim
command -nargs=0 Cp w !pbcopy
nnoremap <silent> <A-Up> :m-2<CR>
nnoremap <silent> <A-Down> :m+1<CR>
if has("nvim")
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc>
endif
