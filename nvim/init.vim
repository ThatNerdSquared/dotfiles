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
" actually good syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig' " interact with LSP servers
Plug 'hrsh7th/nvim-cmp' " completion support
Plug 'hrsh7th/cmp-nvim-lsp' " use LSP as a completion source
Plug 'hrsh7th/cmp-buffer' " use buffers as completion source
Plug 'dense-analysis/ale' " linter/formatter integration
Plug 'kana/vim-smartinput' "autopair
" fzf vim integration
Plug 'junegunn/fzf', { 'on': ['Buffers', 'Files', 'Rg'] }
Plug 'junegunn/fzf.vim', { 'on': ['Buffers', 'Files', 'Rg'] }
" Fullscreen the current pane
Plug 'szw/vim-maximizer', { 'on': 'MaximizerToggle' }
call plug#end()
source ~/dotfiles/nvim/treesitter-and-lspconfig.lua

" theming and colours
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#formatter = 'unique_tail'
function GetBranch()
    let l:fp = fnamemodify('%', ':h')
    return trim(system("git -C " . fp . " branch --show-current 2>/dev/null"))
endfunction
autocmd BufEnter * let b:git_branch = GetBranch()
let g:airline_section_b = airline#section#create(['%{b:git_branch}'])
let g:airline_section_z = airline#section#create(['linenr', '/%3L'])
let g:airline_theme='fruit_punch'
set background=light
lua require('rose-pine').setup({ disable_italics = true })
colo rose-pine
set termguicolors

" lsp related
let g:ale_linters_explicit = 1
let g:ale_use_neovim_diagnostics_api = 1
nnoremap Ï :ALEFix<CR> " opt-shift-f
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
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
nnoremap <leader>df :Files ~/dotfiles<CR>
" mistyping :w brings up fzf's :Windows
command -nargs=0 W echoerr "Not an editor cmd: W"
noremap <leader>f :MaximizerToggle<CR>
let g:netrw_liststyle = 3 " filetree config
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
set ignorecase " make search non-case-sensitive
set cursorcolumn " get a sense of where your cursor is without indentline
set cursorline
set splitright " new splits open to right/down - more intuitive
set splitbelow
set signcolumn=yes " always show signcolumn to prevent flickering
" set working dir to dir in argument if provided
if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif

" general bindings
noremap k gk
noremap j gj
noremap <leader>[ gT
noremap <leader>] gt
noremap <leader><leader> :tabnew<CR>
nnoremap <leader>s :&&<CR>
command -nargs=0 Einit tabedit ~/dotfiles/nvim/init.vim
command -nargs=0 Cp silent w !pbcopy
noremap <silent> ˚ :m-2<CR> " opt-k
noremap <silent> ∆ :m+1<CR> " opt-j
autocmd TermOpen term://* startinsert
nnoremap <leader>t :silent tabnew \| term<CR>
nnoremap <leader>r :silent 50vsp \| term<CR>
" fastgit integration
"nnoremap gda :silent exec '!source ~/.zshrc && exec-in-new-iterm-tab fastgit' getcwd()<CR>
nnoremap gda :silent tabnew \| terminal fastgit<CR>
nnoremap gdf :exec 'silent tabnew \| terminal fastgit ' expand('%:p')<CR>
function Check() " toggle markdown checkboxes
    let l:line=getline('.')
    if l:line=~?'\s*-\s*\[\s*\].*'
        s/\[\s*\]/[x]/
    elseif l:line=~?'\s*-\s*\[x\].*'
        s/\[x\]/[ ]/
    endif
endfunction
nnoremap <silent> - :call Check()<CR>
if has("nvim") " this block prevents issues with pressing <Esc> in terminal
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc>
endif

" lang-specific
nnoremap <space>/ I# <esc>
autocmd BufNewFile,BufRead *dart,*.js,*.ts,*.jsx,*.tsx nnoremap <space>/ I//<ESC>

function DartSettings()
    nnoremap Ï :lua vim.lsp.buf.format { async = true }<CR> " opt-shift-f
    set tabstop=2
    set shiftwidth=2
endfunction
autocmd BufNewFile,BufRead *.dart call DartSettings()

function JsSettings()
    let b:ale_fixers = ['eslint', 'prettier']
endfunction
autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx call JsSettings()

autocmd BufNewFile,BufRead *.py let b:ale_fixers = ['pyright', 'flake8', 'black']
