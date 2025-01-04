nnoremap <leader>o :compiler! clippy<CR>
nnoremap <leader>p :compiler! cargo<CR>
setlocal formatprg=rustfmt\ --emit\ stdout
set path=src/**
