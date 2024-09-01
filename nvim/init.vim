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
if has('nvim')
    " actually good syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
Plug 'kana/vim-smartinput' " autopair
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-dispatch'
Plug 'dhruvasagar/vim-markify'
" fzf vim integration
Plug 'junegunn/fzf', { 'on': ['Buffers', 'Files', 'Rg', 'BLines'] }
Plug 'junegunn/fzf.vim', { 'on': ['Buffers', 'Files', 'Rg', 'BLines'] }
call plug#end()

if has('nvim')
    source ~/dotfiles/nvim/treesitter-and-lspconfig.lua
    autocmd TermOpen term://* startinsert
    " these prevents issues with pressing <Esc> in terminal
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc>
    syntax off " treesitter or nothin baby
endif


" PLUGIN CONFIG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{1

" vim-markify config
" ~~~~~~~~~~~~~~~~~~{{{2
let g:markify_autocmd = 1
let g:markify_error_text = '██'
let g:markify_info_text = '██'
" }}}2

" fzf.vim config
" ~~~~~~~~~~~~~~{{{2
let g:fzf_buffers_jump = 1
nnoremap <C-p> :Buffers<CR>
nnoremap <C-o> :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>df :Files ~/dotfiles<CR>
nnoremap eh :silent BLines ^#<CR>
" mistyping :w brings up fzf's :Windows
command -nargs=0 W echoerr "Not an editor cmd: W"
" }}}2

" Netrw config
" ~~~~~~~~~~~~{{{2
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20
nnoremap <leader>e :Explore<CR>
" }}}2
" }}}1


" COLOURSCHEME + VISUALS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{1
set termguicolors
set background=light
colo rosepine_dawn
"other themes i find nice for dark mode
"set background=dark
"colo wildcharm
"colo elflord

" Cursor customization
" ~~~~~~~~~~~~~~~~~~~~{{{2
" Vertical bar in insert mode
let &t_SI = "\<Esc>[6 q"
" Underline in replace mode
let &t_SR = "\<Esc>[4 q"
" Block in other modes
let &t_EI = "\<Esc>[2 q"
" }}}2
" }}}1


" OPTIONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{1

" general options
" ~~~~~~~~~~~~~~~{{{2
set ignorecase " make search non-case-sensitive
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set completeopt=menu,menuone,popup,noinsert
set wildoptions=pum
" }}}2

" UI options
" ~~~~~~~~~~~~~~~{{{2
set number relativenumber " relative-number line numbers
set cursorline
set cursorcolumn " get a sense of where your cursor is without indentline
set splitright " new splits open to right/down - more intuitive
set splitbelow
set signcolumn=yes " always show signcolumn to prevent flickering
set list " show tabchars
set listchars=tab:>\ ,trail:•,nbsp:+
set noshowmode
" }}}2

" indentation options
" ~~~~~~~~~~~~~~~{{{2
set tabstop=4 " show tab character as 4 spaces wide
set shiftwidth=0 " follow tabstop
set expandtab " insert spaces on <Tab>
set foldmethod=indent
set breakindent " when hard-wrapping lines, continue at same visual indent
set autoindent " when start a new line, use same indent as previous line
set lbr " soft-wrap lines at whitespace
" }}}2
" }}}1


" MAPPINGS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{1

" general mappings
" ~~~~~~~~~~~~~~~~{{{2
noremap k gk
noremap j gj
noremap gk k
noremap gj j
" rebind the previous jump binding bc i use it for fzf
noremap <C-u> <C-o>
" maximize the current window
noremap <leader>f <C-W>\| <C-W>_
nnoremap cc :silent nohlsearch\| echo "Search cleared!"<CR>
" }}}2

" editing mappings
" ~~~~~~~~~~~~~~~~{{{2
" repeat prev. substitution on current line
nnoremap <leader>s :%&<CR>
" repeat prev. substitution on whole file
nnoremap <leader>ss :&&<CR>
noremap <silent> <A-Up> :m-2<CR>
noremap <silent> <A-Down> :m+1<CR>
nnoremap <space>/ gcc
" }}}2

" buffer + tab management mappings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{{{2
nnoremap ]] :bn<CR>
nnoremap [[ :bp<CR>
nnoremap <silent> '' :enew<CR>
nnoremap <silent> qq :bp \| bd #<CR>
noremap <leader>[ gT
noremap <leader>] gt
noremap <leader><leader> :tabnew<CR>
" open a terminal tab
nnoremap <leader>t :silent tabnew \| term<CR>
" }}}2

" quickfix + completion mappings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{{{2
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
nnoremap qf :cwindow<CR>
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>
nnoremap <CR><CR> :cc<CR>
nnoremap qr :lwindow<CR>
nnoremap ˚ :lprevious<CR> " opt-k
nnoremap ∆ :lnext<CR> " opt-j
" }}}2
" }}}1


" MISC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{
command -nargs=0 Einit tabedit $MYVIMRC
command -nargs=0 Cp silent w !pbcopy
" set working dir to dir in argument if provided
if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif
" }}}
