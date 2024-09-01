nnoremap <leader>l :compiler eslint<CR>
nnoremap <leader>r :compiler tsc<CR>
set tabstop=2
" https://github.com/vim/vim/issues/11493
set formatexpr=
setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
set path=src/**,tests/**
