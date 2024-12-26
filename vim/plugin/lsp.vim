" asyncomplete + vim-lsp settings
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt="menu,menuone,popup,noinsert"
let g:lsp_use_native_client = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
set keywordprg=:LspHover

" preferred mappings
nnoremap gd <plug>(lsp-definition)
nnoremap <silent> gD :rightbelow vertical LspDefinition<CR>
nnoremap gr <plug>(lsp-references)
nnoremap <Space>. <plug>(lsp-code-action-float)

" some LSPs don't provide completion unless you tell them you support
" snippets.
" for details on how i figured this out see:
" - https://github.com/prabirshrestha/vim-lsp/issues/1505#issuecomment-2110455309
" - https://github.com/prabirshrestha/vim-lsp/issues/1056#issuecomment-766236707
function! s:force_snippet_support()
    let l:caps = lsp#default_get_supported_capabilities({})
    let l:caps.textDocument.completion.completionItem.snippetSupport = v:true
    return l:caps
endfunction

au User lsp_setup call s:register_lsp_servers()

" for help setting up new servers check
" https://github.com/prabirshrestha/vim-lsp/wiki/Servers
function! s:register_lsp_servers()
    call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact', 'javascript', 'javascriptreact'],
        \ })

    call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vscode-css-language-server --stdio']},
        \ 'capabilities': s:force_snippet_support(),
        \ 'whitelist': ['css'],
        \ })

    call lsp#register_server({
        \ 'name': 'html-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vscode-html-language-server --stdio']},
        \ 'capabilities': s:force_snippet_support(),
        \ 'whitelist': ['html'],
        \ })

    call lsp#register_server({
        \ 'name': 'dart-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'dart language-server']},
        \ 'whitelist': ['dart'],
        \ })

    call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-remote=auto']},
        \ 'allowlist': ['go', 'gomod'],
        \ })

    call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'jdtls',
        \     '-configuration',
        \     expand('~/jdtls-cache/confs'),
        \     '-data',
        \     expand('~/jdtls-cache/data'),
        \ ]},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.git/'))},
        \ 'whitelist': ['java'],
        \ })

    call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python'],
        \ })

    call lsp#register_server({
        \ 'name': 'astro',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'astro-ls --stdio']},
        \ 'initialization_options': { 'typescript': { 'tsdk': lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json') .. '/node_modules/typescript/lib' } },
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['astro'],
        \ })
endfunction
