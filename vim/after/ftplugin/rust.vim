nnoremap <leader>l :compiler! clippy<CR>
nnoremap <leader>r :compiler! cargo<CR>
setlocal formatprg=rustfmt\ --emit\ stdout
set path=src/**
