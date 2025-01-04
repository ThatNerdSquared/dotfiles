set tabstop=2
set path=lib/**,test/**,,,
nnoremap <leader>o :compiler! dart-analyzer<CR>
nnoremap <leader>p :compiler! dart<CR>
setlocal formatprg=dart\ format\ -o\ show
