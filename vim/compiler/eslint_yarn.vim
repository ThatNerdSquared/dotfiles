if exists("current_compiler")
  finish
endif
let current_compiler = "eslint_yarn"

CompilerSet makeprg=yarn\ --silent\ eslint\ src\ test\ --format\ stylish\ --ext\ .ts
CompilerSet errorformat=%-P%f,\%\\s%#%l:%c\ %#\ %trror\ \ %m,\%\\s%#%l:%c\ %#\ %tarning\ \ %m,\%-Q,\%-G%.%#,
