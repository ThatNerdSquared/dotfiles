" project-specific configs. also check rust.vim for formatter changes.

let g:cwd_basename = fnamemodify(getcwd(), ':t')

if g:cwd_basename == "firmware-poc2"
    let g:livebuildprg = "dx serve --package entrypoint"
endif

if g:cwd_basename == "workday-calendar-extension"
    let g:livebuildprg = "yarn dev-firefox"
endif

augroup ProjectSpecific
    autocmd!
    autocmd BufRead 00.scratchpad.qmd setlocal textwidth=0
augroup END
