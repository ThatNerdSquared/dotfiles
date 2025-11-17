nmap <S-CR> :call RRepl()<CR>

function RRepl()
    let l:r_file = expand("%:p")
    normal sn
    execute("r! Rscript " . l:r_file)
endfunction
