nnoremap <leader>p :compiler! tsc<CR>
set tabstop=2
if g:cwd_basename != "solo_nyeung27"
    if g:cwd_basename != "cpsc310-lecture-code"
        nnoremap <leader>o :compiler! eslint<CR>
        setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
    endif
endif
set path+=src/**,tests/**
