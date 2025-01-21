" filetype-specific conf for markdown and friends (quarto, r markdown, etc)

setlocal spell spelllang=en_ca
setlocal spellcapcheck=
let g:livebuildprg = "quarto preview " . expand("%:p")
command! -nargs=0 SetCurrentPreview let g:livebuildprg = "quarto preview " . expand("%:p")
setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
setlocal textwidth=80

" count words in paragraph
nnoremap cw {v}:write !wc -w<CR>
" count words in file
nnoremap caw :!wc -w %<CR>
" count words in selection
vnoremap cw :'<,'>:write !wc -w<CR>
" open corresponding bibtex file for current doc
command! -nargs=0 Bib vsplit %:r.bib
nnoremap <silent> - :call ToggleMarkdownCheckboxes()<CR>
nnoremap sw :exec "Open https://duckduckgo.com/?q=" . expand("<cWORD>")<CR>
nnoremap <Space>pp {jI**QUESTION: <ESC>$a**<ESC>j0v}:norm <<I- <ESC>:w<CR>$<CR>

" toggle markdown checkboxes
function ToggleMarkdownCheckboxes()
    let l:line=getline('.')
    if l:line=~?'\s*-\s*\[\s*\].*'
        substitute/\[\s*\]/[-]/
        write
    elseif l:line=~?'\s*-\s*\[-\].*'
        substitute/\[-\]/[x]/
        write
    elseif l:line=~?'\s*-\s*\[x\].*'
        substitute/\[x\]/[ ]/
        write
    endif
endfunction
