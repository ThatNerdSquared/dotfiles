execute "source " . fnamemodify($MYVIMRC, ":p:h") . "/vimrc"
execute "source " . fnamemodify($MYVIMRC, ":p:h") . "/treesitter.lua"
syntax off " treesitter or nothin baby
augroup NvimAutoCmds
    autocmd!
    autocmd TermOpen term://* startinsert
    " these prevent issues with pressing <Esc> in terminal
    autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    autocmd FileType fzf tunmap <buffer> <Esc>
augroup END
