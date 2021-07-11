" ThatNerd's init.vim
"
" vim-plug initialization
call plug#begin("~/.config/nvim/plugged")

Plug 'junegunn/goyo.vim' " hide UI for writing/coding
Plug 'junegunn/limelight.vim' " focus line for writing/coding
Plug 'reedes/vim-pencil' " Soft wrap! 
Plug 'ycm-core/YouCompleteMe' " JS Autocomplete
Plug 'leafgarland/typescript-vim' " This and the next are for TSX highlighting.
Plug 'peitalin/vim-jsx-typescript'
Plug 'mmai/wikilink' " Wikilink support
Plug 'jeetsukumaran/vim-buffergator' " Better buffer management

call plug#end()

" Goyo and Limelight Integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" General config
set wrap linebreak
noremap k gk
noremap j gj
set listchars=tab:\|\ 
set list
set number

" Limelight plugin config.
let g:limelight_conceal_ctermfg = 254 " Solarized Base1
let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base1

" GUI config.
set background=light
colo solarized
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


" Netrw open in new tab
function! NetrwOpenMultiTab(current_line,...) range
	" Get the number of lines.
	" let n_lines =  a:lastline - a:firstline + 1
	" This is the command to be built up.
	let command = "normal "

	" Iterator.
	let i = 1

	" Virtually iterate over each line and build the command.
	while i < n_lines
	let command .= "tgT:" . ( a:firstline + i ) . "\<CR>:+tabmove\<CR>"
	let i += 1
	endwhile
	let command .= "tgT"

	" Restore the Explore tab position.
	if i != 1
	let command .= ":tabmove -" . ( n_lines - 1 ) . "\<CR>"
	endif

	" Restore the previous cursor line.
	let command .= ":" . a:current_line  . "\<CR>"

	" Check function arguments
	if a:0 > 0
	if a:1 > 0 && a:1 <= n_lines
	 " The current tab is for the nth file.
	 let command .= ( tabpagenr() + a:1 ) . "gt"
	else
	 " The current tab is for the last selected file.
	 let command .= (tabpagenr() + n_lines) . "gt"
	endif
	endif
	" The current tab is for the Explore tab by default.

	" Execute the custom command.
	execute command
endfunction

" Define mappings.
augroup NetrwOpenMultiTabGroup
	autocmd!
	autocmd Filetype netrw vnoremap <buffer> <silent> <expr> t ":call NetrwOpenMultiTab(" . line(".") . "," . "v:count)\<CR>"
	autocmd Filetype netrw vnoremap <buffer> <silent> <expr> T ":call NetrwOpenMultiTab(" . line(".") . "," . (( v:count == 0) ? '' : v:count) . ")\<CR>"
augroup END
