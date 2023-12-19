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
" theming
Plug 'vim-airline/vim-airline' " statusline...
Plug 'vim-airline/vim-airline-themes' " ...but make it aesthetic!
Plug 'rose-pine/neovim' " colourscheme of choice
" actually good syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" LSP
Plug 'neovim/nvim-lspconfig' " interact with LSP servers
Plug 'hrsh7th/nvim-cmp' " completion support
Plug 'hrsh7th/cmp-nvim-lsp' " use LSP as a completion source
Plug 'hrsh7th/cmp-buffer' " use buffers as completion source
" tooling
Plug 'junegunn/fzf' " fzf vim integration
Plug 'junegunn/fzf.vim' " fzf vim integration
Plug 'szw/vim-maximizer' " Fullscreen the current pane
Plug 'andweeb/presence.nvim' " Discord RPC integration
call plug#end()

" theming and colours
source ~/dotfiles/nvim/treesitter-config.lua
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['tabline', 'branch']
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = airline#section#create(['linenr', '/%3L'])
let g:airline_theme='fruit_punch'
set background=light
lua require('rose-pine').setup({ disable_italics = true })
colo rose-pine
set termguicolors

" lsp related
source ~/dotfiles/nvim/lsp-config.lua
nnoremap Ï :lua vim.lsp.buf.format { async = true }<CR> " opt-shift-f
nnoremap « :lua vim.diagnostic.goto_next()<CR> " opt-\
nnoremap <space>. :lua vim.lsp.buf.code_action()<CR>
nnoremap qf :lua vim.diagnostic.setqflist()<CR>
nnoremap <leader>d :lua vim.lsp.buf.definition()<CR>
lua vim.diagnostic.config { float = { width = 90, border = "rounded" }, }

" plugin bindings
let g:fzf_buffers_jump = 1
nnoremap <C-p> :Buffers<CR>
nnoremap <C-o> :Files<CR>
nnoremap <C-f> :Rg<CR>
command! -bang Dotfiles call fzf#vim#files('~/dotfiles', <bang>0)
nnoremap <leader>df :Dotfiles<CR>
noremap <leader>f :MaximizerToggle<CR>
command -nargs=0 DiscordStartRPC lua package.loaded.presence:update()<CR>
command -nargs=0 DiscordStopRPC lua package.loaded.presence:cancel()<CR>
" filetree config
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 20
nnoremap <leader>e :Lexplore<CR>

" general sets
set number relativenumber " relative-number line numbers
set tabstop=4 " show tab character as 4 spaces wide
set shiftwidth=4 " show indentation as 4 spaces wide
set expandtab " insert spaces on <Tab>
set foldmethod=indent
set breakindent " when hard-wrapping lines, continue at same visual indent
set lbr " soft-wrap lines at whitespace
set list " show tabchars
set autoindent " when start a new line, use same indent as previous line
set noignorecase " make search case-sensitive
set cursorcolumn " get a sense of where your cursor is without indentline
set cursorline
set splitright "new splits open to right/down - more intuitive
set splitbelow

" general bindings
noremap k gk
noremap j gj
noremap <leader>[ gT
noremap <leader>] gt
noremap <leader><leader> :tabnew<CR>
command -nargs=0 Einit tabedit ~/dotfiles/nvim/init.vim
command -nargs=0 Cp silent w !pbcopy
noremap <silent> ˚ :m-2<CR> " opt-k
noremap <silent> ∆ :m+1<CR> " opt-j
vnoremap <silent> ˚ :m '<-2<CR>gv=gv " opt-k
vnoremap <silent> ∆ :m '>+1<CR>gv=gv " opt-j
function CreateRunPane()
    :50vsp
    :term
    :copen
    :lua vim.diagnostic.setqflist()
endfunction
nnoremap <leader>r :call CreateRunPane()<CR>
if has("nvim") " this block prevents issues with pressing <Esc> in terminal
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc>
endif

" lang-specific
function DartSettings()
    nnoremap <space>/ I//<ESC>
    set tabstop=2
    set shiftwidth=2
endfunction
autocmd BufNewFile,BufRead *.dart call DartSettings()

function JsSettings()
    nnoremap Ï :silent %!npx prettier --stdin-filepath %<CR> " opt-shift-f
    nnoremap <space>/ I//<ESC>
endfunction
autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx call JsSettings()

function PySettings()
    nnoremap <space>/ I# <esc>
    setlocal makeprg=flake8
endfunction
autocmd BufNewFile,BufRead *.py call PySettings()
autocmd BufWritePost *.py silent make! <afile> | silent redraw!