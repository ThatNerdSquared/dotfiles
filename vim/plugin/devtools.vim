nnoremap mf :call FullFileFormat()<CR>
nnoremap <Space>m :make<CR>
nnoremap <Space>r :Make<CR>
" nnoremap <Space>l :call GuardedLocalMake()<CR>
" useful for executing a long-running build process
nnoremap <leader>v :exec "silent tabnew \| term " . g:livebuildprg <CR>

" git integration
" git blame command, inspired by romainl's 'super cheap git blame' gist
command! -range GB echo system("git -C " . shellescape(expand('%:p:h')) . " blame -L <line1>,<line2> " . expand('%:t'))

function! FullFileFormat()
    let l:winstate = winsaveview()
    normal gggqG
    if v:shell_error > 0
        silent undo
        redraw
        echoerr 'Formatter could not be applied!'
    endif
    call winrestview(l:winstate)
    echomsg 'formatter "' . &formatprg . '" successfully applied!'
endfunction

function! GuardedLocalMake()
    if exists("b:force_lsp_diagnostics") && b:force_lsp_diagnostics == 1
        LspDocumentDiagnostics
    else
        lmake %
    endif
endfunction
