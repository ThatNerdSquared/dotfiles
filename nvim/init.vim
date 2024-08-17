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
Plug 'natebosch/vim-lsc'
Plug 'tpope/vim-dispatch'
Plug 'dhruvasagar/vim-markify'
" fzf vim integration
Plug 'junegunn/fzf', { 'on': ['Buffers', 'Files', 'Rg', 'BLines'] }
Plug 'junegunn/fzf.vim', { 'on': ['Buffers', 'Files', 'Rg', 'BLines'] }
call plug#end()
if has('nvim')
    source ~/dotfiles/nvim/treesitter-and-lspconfig.lua
endif

" theme
set termguicolors

" Vertical bar in insert mode  
let &t_SI = "\<Esc>[6 q"
" Underline in replace mode
let &t_SR = "\<Esc>[4 q"
" Block in other modes
let &t_EI = "\<Esc>[2 q"

try
    set background=light
    colo rosepine_dawn
catch
    set background=dark
    if has("patch-9.0.1488")
        colo wildcharm
    else
        colo elflord
    endif
endtry

" statusline
function GetBranch()
    let l:fp = fnamemodify('%', ':h')
    return trim(system("git -C " . fp . " branch --show-current 2>/dev/null"))
endfunction
set fillchars+=stl:─,stlnc:─
set statusline=%#CurSearch#%{&readonly?'[x]':''} " symbols for readonly, mod
set statusline+=%#SpecialChar#%{&readonly?'':'───'}
set statusline+=%#IncSearch#%{&mod?'[+]':''}%#SpecialChar#%{&mod?'':'───'}
set statusline+=%#Directory#─bn:%n──%f─ " buffer num, filepath
set statusline+=%#SpecialChar#─b:%{GetBranch()}── " current git branch
let g:currentmode={
   \ 'n': 'nor', 'i': 'ins', 'c': 'cmd', 't': 'trm', 'v': 'vis', 'V': 'vli',
   \ "\<C-V>": 'vbl', 'R': 'rep', 'Rv': 'vre',
   \}
set statusline+=tln:%L──%{(g:currentmode[mode()])} " total lines, current mode
autocmd BufWinEnter quickfix,loclist setlocal statusline=%#Directory#%q\ (p:%L)

function FullFileFormat()
    let l:winstate = winsaveview()
    normal gggqG
    if v:shell_error > 0
        silent undo
        redraw
        echoerr 'Formatter could not be applied!'
    endif
    call winrestview(l:winstate)
    echomsg 'formatter "' . &formatprg . '" successfully applied!'
endfunction

" lsp related
" opt-shift-f
nnoremap Ï :call FullFileFormat()<CR>
let g:lsc_autocomplete_length = 1
let g:lsc_diagnostic_highlights = v:false
let g:ts_lsp = 'typescript-language-server --stdio'
let g:lsc_server_commands = {
    \ 'typescript': g:ts_lsp,
    \ 'typescriptreact': g:ts_lsp,
    \ 'javascript': g:ts_lsp,
    \ 'javascriptreact': g:ts_lsp,
    \ 'dart': 'dart language-server',
    \ 'css': 'vscode-css-language-server --stdio'
    \}
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'FindReferences': 'gr',
    \ 'FindCodeActions': '<space>.',
    \ 'ShowHover': v:true,
    \}
nnoremap gD :vertical LSClientGoToDefinitionSplit<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
nnoremap qf :cwindow<CR>
nnoremap qr :lwindow<CR>
set completeopt=menu,menuone,popup
let g:markify_autocmd = 1
let g:markify_error_text = '██'
let g:markify_info_text = '██'



" plugin bindings
let g:fzf_buffers_jump = 1
nnoremap <C-p> :Buffers<CR>
nnoremap <C-o> :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>df :Files ~/dotfiles<CR>
nnoremap eh :silent BLines ^#<CR>
" mistyping :w brings up fzf's :Windows
command -nargs=0 W echoerr "Not an editor cmd: W"
let g:netrw_liststyle = 3 " filetree config
let g:netrw_banner = 0
"let g:netrw_browse_split = 2
let g:netrw_winsize = 20
nnoremap <leader>e :Explore<CR>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" general sets
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has('nvim')
    syntax off " treesitter or nothin baby
else
    syntax on
endif
" allows auto-switching regex engine (prevents hangs when highlighting TS)
set regexpengine=0
set ttimeoutlen=50
set incsearch
set hlsearch
set laststatus=2
set hidden
set nocompatible
set history=10000
set showcmd
set wildmenu
set wildoptions=pum
set listchars=tab:>\ ,trail:•,nbsp:+
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
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
" set working dir to dir in argument if provided
if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif

" general bindings
noremap k gk
noremap j gj
noremap gk k
noremap gj j
nnoremap ]] :bn<CR>
nnoremap [[ :bp<CR>
noremap <leader>[ gT
noremap <leader>] gt
noremap <C-u> <C-o> " rebind the previous jump binding bc i use it for fzf
noremap <leader>f <C-W>\| <C-W>_ " maximize the current window
noremap <leader><leader> :tabnew<CR>
nnoremap <silent> '' :enew<CR>
nnoremap <space>/ gcc
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>
nnoremap ˚ :lprevious<CR> " opt-k
nnoremap ∆ :lnext<CR> " opt-j
nnoremap <CR><CR> :cc<CR>
nnoremap cc :silent nohlsearch\| echo "Search cleared!"<CR>
nnoremap <leader>s :%&<CR> " repeat prev. substitution on current line
nnoremap <leader>ss :&&<CR> " repeat prev. substitution on whole file
command -nargs=0 Einit tabedit ~/dotfiles/nvim/init.vim
command -nargs=0 Cp silent w !pbcopy
nnoremap <silent> qq :bp \| bd #<CR>
noremap <silent> <A-Up> :m-2<CR>
noremap <silent> <A-Down> :m+1<CR>
nnoremap <leader>w {v}:w !wc -w<CR>
vnoremap <leader>w :'<,'>:w !wc -w<CR>
if has('nvim')
    autocmd TermOpen term://* startinsert
endif
nnoremap <leader>t :silent tabnew \| term<CR>
" fastgit integration
nnoremap gda :silent tabnew \| terminal fastgit<CR>
nnoremap gdf :exec 'silent tabnew \| terminal fastgit ' expand('%:p')<CR>
function Check() " toggle markdown checkboxes
    let l:line=getline('.')
    if l:line=~?'\s*-\s*\[\s*\].*'
        s/\[\s*\]/[-]/
        w
    elseif l:line=~?'\s*-\s*\[-\].*'
        s/\[-\]/[x]/
        w
    elseif l:line=~?'\s*-\s*\[x\].*'
        s/\[x\]/[ ]/
        w
    endif
endfunction
nnoremap <silent> - :call Check()<CR>
if has("nvim") " this block prevents issues with pressing <Esc> in terminal
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc>
endif
nnoremap <Space>r :Make<CR>
function GuardedLocalMake()
    " oh my god bruh
    " https://github.com/microsoft/TypeScript/issues/27379
    if &makeprg == 'npx tsc'
        echoerr "location list not supported for tsc!"
        LSClientWindowDiagnostics
    else
        lmake %<CR>
    endif
endfunction
nnoremap <Space>l :call GuardedLocalMake()<CR>
nnoremap <leader>v :exec "silent tabnew \| term " . g:livebuildprg <CR>

" lang-specific
function DartSettings() " use lsp formatting + 2-space indent for dart
    set tabstop=2
    set shiftwidth=2
    setlocal formatprg=dart\ format\ -o\ show
endfunction
autocmd BufNewFile,BufRead *.dart call DartSettings()
function WebDevSettings()
    nnoremap <leader>l :compiler eslint<CR>
    " convert to custom compiler later
    nnoremap <leader>r :compiler tsc \| set makeprg=npx\ tsc<CR>
    set tabstop=2
    set shiftwidth=2
    set formatexpr=
    setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
    set path=src/**,tests/**
endfunction
autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx,*.mjs,*.css call WebDevSettings()
autocmd BufNewFile,BufRead *.json setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
autocmd BufNewFile,BufRead *.py setlocal makeprg=python3\ -m\ flake8
autocmd BufNewFile,BufRead *.qmd,*.md setlocal spell
autocmd BufNewFile,BufRead *.qmd,*.md setlocal spellcapcheck=
autocmd BufNewFile,BufRead *.qmd,*.md let g:livebuildprg = "quarto preview " . expand("%:p")
autocmd BufNewFile,BufRead *.qmd,*.md setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
autocmd BufNewFile,BufRead *.qmd,*.md set textwidth=80
autocmd BufNewFile,BufRead *.bib set shiftwidth=2
autocmd BufNewFile,BufRead *.bib set tabstop=2
autocmd BufNewFile,BufRead *.go setlocal formatprg=gofmt
let g:cwd_basename = fnamemodify(getcwd(), ':t')
if g:cwd_basename == "workday-calendar-extension"
    let g:livebuildprg = "yarn dev-firefox"
endif
