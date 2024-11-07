" project-specific configs.

let s:cwd_basename = fnamemodify(getcwd(), ':t')
if s:cwd_basename == "workday-calendar-extension"
    let g:livebuildprg = "yarn dev-firefox"
endif
