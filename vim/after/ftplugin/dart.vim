set tabstop=2
set path=lib/**,test/**,,,
nnoremap <leader>l :compiler dart-analyzer<CR>
nnoremap <leader>r :compiler dart<CR>
setlocal formatprg=dart\ format\ -o\ show
