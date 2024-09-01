" filetype-specific conf for markdown and friends (quarto, r markdown, etc)

setlocal spell
setlocal spellcapcheck=
let g:livebuildprg = "quarto preview " . expand("%:p")
setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
setlocal textwidth=80

" count words in paragraph
nnoremap cw {v}:w !wc -w<CR>
" count words in file
nnoremap caw :!wc -w %<CR>
" count words in selection
vnoremap cw :'<,'>:w !wc -w<CR>

" toggle markdown checkboxes
nnoremap <silent> - :call Check()<CR>
function Check()
    let l:line=getline('.')
    if l:line=~?'\s*-\s*\[\s*\].*'
        s/\[\s*\]/[-]/
        w
    elseif l:line=~?'\s*-\s*\[-\].*'
        s/\[-\]/[x]/
        w
    elseif l:line=~?'\s*-\s*\[x\].*'
        s/\[x\]/[ ]/
        w
    endif
endfunction
