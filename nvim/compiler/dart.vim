let current_compiler = "dart"

CompilerSet makeprg=dart\ analyze\ --format=machine
" exclude warnings/info (shown in custom dart-analyzer :compiler)
CompilerSet errorformat=%trror%.%#\|%o\|%f\|%l\|%v\|%.%#\|%m,
            \%-G%tarning%.%#\|%o\|%f\|%l\|%v\|%.%#\|%m,
            \%-G%tnfo%.%#\|%o\|%f\|%l\|%v\|%.%#\|%m,
" dart analyzer is too slow
let b:force_lsp_diagnostics = 1
