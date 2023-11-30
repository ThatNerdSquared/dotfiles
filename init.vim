if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
    " ThatNerd's init.vim

    " vim-plug auto install
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    " Set python
    let g:python3_host_prog="/opt/homebrew/bin/python3"

    " vim-plug initialization
    call plug#begin("~/.config/nvim/plugged")

    " Basic theming and statusline.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'thaerkh/vim-indentguides' " Indentation guides for space indents
    Plug 'rose-pine/neovim' " Colourscheme

    " LSP config.
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'dense-analysis/ale' " Linting.
    Plug 'j-hui/fidget.nvim' " A cool LSP progress spinner.

    " Added functionality for code editing.
    Plug 'kyazdani42/nvim-tree.lua' " Filetree
    Plug 'kyazdani42/nvim-web-devicons' " Filetree icons
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-live-grep-args.nvim'
    Plug 'LukasPietzschmann/telescope-tabs'
    Plug 'szw/vim-maximizer' " Fullscreen the current pane
    Plug 'kana/vim-smartinput' " Autocloses brackets, braces, and more
    Plug 'airblade/vim-gitgutter' " Shows git changes in the gutter
    Plug 'tpope/vim-fugitive' " Full git integration
    Plug 'sirver/ultisnips' " Snippets

    " Language-specific support
    Plug 'peitalin/vim-jsx-typescript' " TSX highlighting.
    Plug 'lervag/vimtex' " LaTeX
    Plug 'mattn/emmet-vim' "HTML Emmett support
    Plug 'dcampos/cmp-emmet-vim' " better emmet support?
    Plug 'weirongxu/plantuml-previewer.vim' " PlantUML 
    Plug 'tyru/open-browser.vim'
    Plug 'aklt/plantuml-syntax'
    Plug 'leafOfTree/vim-svelte-plugin' " Svelte
    Plug 'quarto-dev/quarto-nvim'
    Plug 'jmbuhr/otter.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Extra goodies.
    Plug 'junegunn/goyo.vim' " Hide UI for writing/coding
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Markdown preview support
    Plug 'mmai/wikilink' " Wikilink support
    Plug 'andweeb/presence.nvim' " Discord RPC integration
    Plug 'junegunn/limelight.vim' " Focus line for writing/coding

    call plug#end()

    source ~/dotfiles/lspconfig-script.lua
    "source ~/dotfiles/treesitter-config.lua

    " Plugin config

    " vim-airline config.
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_theme='fruit_punch'
    let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rmd|rst|tex|text|qmd'

    " ALE config.
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'python': ['flake8', 'pyright'],
    \}
    let g:ale_sign_column_always = 1
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    nmap <silent> <A-i> <Plug>(ale-go-to-definition)
    nmap <silent> <A-d> <Plug>(ale-find-references)

    " fidget.nvim config
    lua require"fidget".setup{}

    " telescope config
    lua require('telescope').setup({ defaults = { layout_strategy = "vertical", hidden = true, preview_cutoff = "1" } })
    lua require("telescope").load_extension("live_grep_args")
    nnoremap <C-p> :lua require('telescope.builtin').buffers()<CR>
    nnoremap <C-o> :lua require('telescope.builtin').git_files()<CR>
    nnoremap <C-f> :lua require("telescope").extensions.live_grep_args.live_grep_args({prompt_title = "< find >"})<CR>
    nnoremap <leader>df :lua require('telescope.builtin').git_files({ prompt_title = "< dotfiles >", cwd = '~/dotfiles', hidden = true })<CR>
    nnoremap <leader>t :lua require('telescope-tabs').list_tabs()<CR>

    " NvimTree config.
    let g:nvim_tree_show_icons = {
        \ 'git': 1,
        \ 'folders': 1,
        \ 'files': 1,
        \ 'folder_arrows': 1,
        \ }
    let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
    lua require'nvim-tree'.setup { }
    command Ft NvimTreeToggle
    nnoremap <leader>e :NvimTreeToggle<CR>

    " vim-maximizer config
    nnoremap <leader>f :MaximizerToggle<CR>
    vnoremap <leader>f :MaximizerToggle<CR>

    " Gitgutter config.
    "let g:gitgutter_signs = 0
    "let g:gitgutter_highlight_lines = 1
    "let g:gitgutter_set_sign_backgrounds = 1
    "highlight! link SignColumn LineNr
    "highlight GitGutterChange guifg=b4637a ctermfg=Red
    "highlight GitGutterAdd    guifg=#009900 ctermfg=172
    let g:gitgutter_highlight_linenrs = 1
    let g:gitgutter_sign_added = '█'
    let g:gitgutter_sign_modified = '█'
    let g:gitgutter_sign_removed = '█'
    let g:gitgutter_sign_removed_first_line = '█'
    let g:gitgutter_sign_removed_above_and_below = '█'
    let g:gitgutter_sign_modified_removed = '█'

    " UltiSnips config
    let g:UltiSnipsExpandTrigger = '<C-S-tab>'
    let g:UltiSnipsJumpForwardTrigger = '<C-S-tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-S-tab>'
    let g:UltiSnipsEditSplit="vertical"

    " vimtex config
    let g:tex_flavor='latex'
    let g:vimtex_view_method='sioyek'
    let g:vimtex_view_general_viewer = 'sioyek'
    let g:vimtex_view_general_options = '@pdf'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'

    " Limelight config
    let g:limelight_conceal_ctermfg = 254 " Solarized Base1
    let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base1

    " General sets
    set syntax
    set number relativenumber
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set foldmethod=indent
    set breakindent
    set formatoptions=l
    set lbr
    " set wrap linebreak
    set list
    set autoindent
    set noignorecase

    " General bindings
    noremap k gk
    noremap j gj
    noremap <leader>[ gT
    noremap <leader>] gt
    noremap <leader><leader> :tabnew<CR>
    command -nargs=0 Friendly !open -a MacDown "%:p"
    command -nargs=0 Einit tabedit ~/dotfiles/init.vim
    command -nargs=0 Spellen set spell spelllang=en_ca
    command -nargs=0 Spellfr set spell spelllang=fr
    nnoremap Ï :lua vim.lsp.buf.format { async = true }<CR>
    nnoremap [d :lua vim.diagnostic.goto_prev<CR>
    nnoremap ]d :lua vim.diagnostic.goto_next<CR>
    nnoremap <C-S-g> :Git<CR>
    if has("nvim")
        au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
        au! FileType fzf tunmap <buffer> <Esc>
    endif

    " GUI config.
    set background=light
    colo rose-pine
    set termguicolors
    let g:neovide_input_use_logo=v:true

    " HTML config.
    let g:user_emmet_leader_key='<C-S-Tab>'

    " JS config.
    autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx nnoremap <leader>/ I// <esc>
    autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx command Prettier !npx prettier --config .prettierrc 'src/**/*.*' --write
    autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx nnoremap <leader>r :!npx prettier --config .prettierrc 'src/**/*.*' --write &<CR>
    let g:vim_svelte_plugin_load_full_syntax = 1

    " Python config.
    autocmd BufNewFile,BufRead *.py nnoremap <leader>/ I# <esc>
    autocmd BufNewFile,BufRead *.py command Runpy !python3 "%:p"

    " Markdown nice.
    autocmd BufNewFile,BufRead *.md let g:markdown_folding = 1
    autocmd BufNewFile,BufRead *.md setl tw=80
    autocmd BufNewFile,BufRead *.md set spell
    autocmd BufNewFile,BufRead *.md nnoremap <leader>c :!pandoc -f markdown+hard_line_breaks+yaml_metadata_block "%:p" -o "%:r".pdf --template eisvogel &<CR>
    autocmd BufNewFile,BufRead *.md nnoremap <leader>p :!pandoc -f markdown+hard_line_breaks+yaml_metadata_block "%:p" -o "%:r".docx &<CR>
    autocmd BufNewFile,BufRead *.md command -nargs=0 Openpdf !open "%:r".pdf " open the corresponding PDF file
    autocmd BufNewFile,BufRead *.md nnoremap <leader>i :!open "%:r".pdf<CR> " open the corresponding PDF file
    autocmd BufNewFile,BufRead *.md set foldmethod=markdown
    let g:mkdp_command_for_global = 1 " allow markdown preview for all filetypes
    nnoremap <leader>k :s/\[ \]/[x]/<CR>
    nnoremap <leader>l :s/\[x\]/[ ]/<CR>

    " LaTeX also nice.
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>c :!pdflatex "%:p"<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <C-e> $a\\

    " Dart-specific config
    "autocmd BufNewFile,BufRead *.dart set formatexpr='dart format'

    " GUI bindings
    nnoremap <D-t> :tabnew<CR>
    nnoremap <D-w> :tabclose<CR>
    inoremap <D-v> <ESC>"*pi
    nnoremap <D-1> :tabn 1<CR>
    nnoremap <D-2> :tabn 2<CR>
    nnoremap <D-3> :tabn 3<CR>
    nnoremap <D-4> :tabn 4<CR>
    nnoremap <D-5> :tabn 5<CR>
    nnoremap <D-6> :tabn 6<CR>
    nnoremap <D-7> :tabn 7<CR>
    nnoremap <D-8> :tabn 8<CR>
    nnoremap <D-9> :tabn 9<CR>
    nnoremap <D-p> :lua require('telescope.builtin').buffers()<CR>
    nnoremap <D-o> :lua require('telescope.builtin').git_files()<CR>
    nnoremap <leader>v :MarkdownPreview<CR>
endif
