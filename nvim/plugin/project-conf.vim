" project-specific configs.

let g:cwd_basename = fnamemodify(getcwd(), ':t')
if g:cwd_basename == "workday-calendar-extension"
    let g:livebuildprg = "yarn dev-firefox"
endif
