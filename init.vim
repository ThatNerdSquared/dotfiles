" ThatNerd's init.vim
"
" vim-plug initialization
call plug#begin("~/.config/nvim/plugged")

Plug 'junegunn/goyo.vim' " hide UI for writing/coding
Plug 'junegunn/limelight.vim' " focus line for writing/coding
Plug 'reedes/vim-pencil' " Soft wrap! 
Plug 'ycm-core/YouCompleteMe' " JS Autocomplete
Plug 'peitalin/vim-jsx-typescript' " This and the next are for TSX highlighting.
Plug 'mmai/wikilink' " Wikilink support
Plug 'dense-analysis/ale' " Linting.
Plug 'kyazdani42/nvim-tree.lua' " filetree
Plug 'kyazdani42/nvim-web-devicons' " filetree icons
Plug 'andweeb/presence.nvim' " Discord RPC integration
Plug 'airblade/vim-gitgutter' " Shows git changes in the gutter
Plug 'kana/vim-smartinput' " Autocloses brackets, braces, and more
Plug 'junegunn/fzf' " Quick file finding
Plug 'junegunn/fzf.vim' " Quick file finding

call plug#end()

" Plugin config

" Limelight plugin config.
let g:limelight_conceal_ctermfg = 254 " Solarized Base1
let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base1

" ALE plugin config.
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" NvimTree plugin config.
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names

" Gitgutter plugin config.
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

" fzf.vim plugin config
nnoremap <C-p> :Buffers<CR>
nnoremap <C-o> :Files<CR>


" General UI config
set wrap linebreak
set list
set number
set listchars=tab:\|\ 
set tabstop=4


" General bindings
noremap k gk
noremap j gj
command -nargs=0 Zen Goyo | Limelight
command -nargs=0 Unzen Goyo! \| Limelight!
command -nargs=0 Focus Goyo
command -nargs=0 Unfocus Goyo!


" GUI config.
set background=light
colo iceberg-light
if has("gui_running")
	colorscheme pencil
endif


" Markdown nice.
let g:markdown_folding = 1
set foldmethod=indent
inoremap qq QUESTION: 
inoremap dff DEFINITION
inoremap exm EXAMPLE: 
inoremap exx EXCEPTION: 
inoremap hhw HOWEVER:
inoremap ccn CONCLUSION: 
set spell

