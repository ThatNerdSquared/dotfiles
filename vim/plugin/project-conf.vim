" project-specific configs. also check rust.vim for formatter changes.

let g:cwd_basename = fnamemodify(getcwd(), ':t')

if g:cwd_basename == "ny-www"
    set path+=templates/**,content/**,static/**
endif

if g:cwd_basename == "dotfiles"
    set path+=vim/,vim/after/**,vim/colors/**,vim/compiler/**,vim/plugin/**,vim/spell/**,scripts/**,bindings/**,sioyek/**
endif

if g:cwd_basename == "heart-hands"
    set path+=00.templates/**,02.lists/**,03.projects/**,04.prep-sheets/**,05.plan-sheets/**,06.writing/**,07.slides/**,08.resume/**,99.old/,99.old/tomes/
    set wildignore+=*_files/,*.html
endif

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
