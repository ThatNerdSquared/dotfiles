setlocal keywordprg=:LspHover
setlocal formatprg=ruff\ format\ --stdin-filename\ %
nnoremap <leader>o :compiler! ruff<CR>
nnoremap <leader>p :compiler! basedpyright<CR>
nnoremap <Space>i :!ruff check --fix %<CR>
