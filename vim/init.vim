execute "source " . fnamemodify($MYVIMRC, ":p:h") . "/vimrc"
execute "source " . fnamemodify($MYVIMRC, ":p:h") . "/treesitter.lua"
syntax off " treesitter or nothin baby
autocmd TermOpen term://* startinsert
" these prevent issues with pressing <Esc> in terminal
au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au! FileType fzf tunmap <buffer> <Esc>
