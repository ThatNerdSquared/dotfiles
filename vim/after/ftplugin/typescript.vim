nnoremap <leader>o :compiler! eslint<CR>
nnoremap <leader>p :compiler! tsc<CR>
set tabstop=2
setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
set path+=src/**,tests/**
