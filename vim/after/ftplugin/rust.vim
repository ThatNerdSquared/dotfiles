nnoremap <leader>o :compiler! clippy<CR>
nnoremap <leader>p :compiler! cargo<CR>
setlocal formatprg=rustfmt\ --edition\ 2024\ --emit\ stdout
nnoremap <Space>i :!dx fmt -f %<CR>
set path=src/**
