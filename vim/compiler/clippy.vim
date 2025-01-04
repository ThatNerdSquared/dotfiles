runtime compiler/rustc.vim
let current_compiler = "clippy"

CompilerSet makeprg=cargo\ clippy
let b:force_lsp_diagnostics = 1
