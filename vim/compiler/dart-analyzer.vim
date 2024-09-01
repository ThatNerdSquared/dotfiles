let current_compiler = "dart-analyzer"

CompilerSet makeprg=dart\ analyze\ --format=machine
" exclude errors (shown in custom dart :compiler)
CompilerSet errorformat=%tarning%.%#\|%o\|%f\|%l\|%v\|%.%#\|%m,
            \%tnfo%.%#\|%o\|%f\|%l\|%v\|%.%#\|%m,
            \%-G%trror%.%#\|%o\|%f\|%l\|%v\|%.%#\|%m
" dart analyzer is too slow
let b:force_lsp_diagnostics = 1
