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
	let g:python3_host_prog="/usr/bin/python3"

	" vim-plug initialization
	call plug#begin("~/.config/nvim/plugged")

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/goyo.vim' " hide UI for writing/coding
	Plug 'junegunn/limelight.vim' " focus line for writing/coding
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	Plug 'peitalin/vim-jsx-typescript' " TSX highlighting.
	Plug 'mmai/wikilink' " Wikilink support
	Plug 'dense-analysis/ale' " Linting.
	Plug 'kyazdani42/nvim-tree.lua' " filetree
	Plug 'kyazdani42/nvim-web-devicons' " filetree icons
	Plug 'andweeb/presence.nvim' " Discord RPC integration
	Plug 'airblade/vim-gitgutter' " Shows git changes in the gutter
	Plug 'kana/vim-smartinput' " Autocloses brackets, braces, and more
	" Plug 'junegunn/fzf' " Quick file finding
	" Plug 'junegunn/fzf.vim' " Quick file finding
	Plug 'lervag/vimtex'
	Plug 'sirver/ultisnips'
	Plug 'overcache/NeoSolarized'
    Plug 'thaerkh/vim-indentguides' " Indentation guides for space indents
    Plug 'szw/vim-maximizer'
    " PlantUML support
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'tyru/open-browser.vim'
    Plug 'aklt/plantuml-syntax'
    " Markdown preview support
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'mattn/emmet-vim' "HTML Emmett support
    Plug 'j-hui/fidget.nvim' " A cool LSP progress spinner.
    Plug 'rose-pine/neovim'
    Plug 'tpope/vim-fugitive' " Finally added a full git integration to the config
    " Maybe this will work better than FZF?
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

	call plug#end()

	source ~/dotfiles/lspconfig-script.lua

	" Plugin config

	" vim-airline plugin config.
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_theme='fruit_punch'

	" Limelight plugin config.
	let g:limelight_conceal_ctermfg = 254 " Solarized Base1
	let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base1

	" ALE plugin config.
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'python': ['flake8', 'pyright'],
    \}
	let g:ale_sign_column_always = 1
	nmap <silent> <C-k> <Plug>(ale_previous_wrap)
	nmap <silent> <C-j> <Plug>(ale_next_wrap)
	nmap <silent> <A-i> <Plug>(ale-go-to-definition)
	nmap <silent> <A-d> <Plug>(ale-find-references)

	" NvimTree plugin config.
	let g:nvim_tree_show_icons = {
		\ 'git': 1,
		\ 'folders': 1,
		\ 'files': 1,
		\ 'folder_arrows': 1,
		\ }
	let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
    lua require'nvim-tree'.setup { auto_close = false }
    command Ft NvimTreeToggle
    nnoremap <leader>e :NvimTreeToggle<CR>

	" Gitgutter plugin config.
	let g:gitgutter_signs = 0
	let g:gitgutter_highlight_lines = 1
	let g:gitgutter_highlight_linenrs = 1

	" fzf.vim plugin config
	" nnoremap <C-p> :Buffers<CR>
	" nnoremap <C-o> :Files<CR>
	" nnoremap <D-p> :Buffers<CR>
	" nnoremap <D-o> :Files<CR>

	" vimtex plugin config
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal='abdmg'

	" UltiSnips plugin config
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsEditSplit="vertical"

    " vim-maximizer config
    nnoremap <leader>f :MaximizerToggle<CR>
    vnoremap <leader>f :MaximizerToggle<CR>

    " fidget.nvim config
    lua require"fidget".setup{}

    " telescope config
	nnoremap <C-p> :lua require('telescope.builtin').buffers()<CR>
	nnoremap <C-o> :lua require('telescope.builtin').git_files()<CR>
    nnoremap <Leader>df :lua require('telescope.builtin').git_files({ prompt_title = "< dotfiles >", cwd = '~/dotfiles', hidden = true })<CR>

	" General UI config
	set wrap linebreak
	set list
	set number
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set foldmethod=indent
    setl tw=80

	" General bindings
	noremap k gk
	noremap j gj
	noremap <Tab> gt
	noremap <S-Tab> gT
	command -nargs=0 Friendly !open -a Typora "%:p"
	command -nargs=0 Einit tabedit ~/dotfiles/init.vim
	if has("nvim")
		au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
		au! FileType fzf tunmap <buffer> <Esc>
	endif
    command -nargs=0 Spellen set spell spelllang=en_ca
    command -nargs=0 Spellfr set spell spelllang=fr


	" GUI config.
	set background=light
    colo rose-pine
	set termguicolors
	let g:neovide_input_use_logo=v:true

    " HTML config.
    let g:user_emmet_leader_key='<Tab>'

	" JS config.
	autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx nnoremap <C-\/> I//<esc>
    autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx command Prettier !npx prettier --config .prettierrc 'src/**/*.*' --write
    autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx nnoremap <leader>r :!npx prettier --config .prettierrc 'src/**/*.*' --write &<CR>

    " Python config.
	autocmd BufNewFile,BufRead *.py nnoremap <leader>/ I# <esc>
	autocmd BufNewFile,BufRead *.py command Runpy !python3 "%:p"
	autocmd BufNewFile,BufRead *.py nnoremap <C-m> Runpy !python3 "%:p"

	" Markdown nice.
	let g:markdown_folding = 1
	autocmd BufNewFile,BufRead *.md set spell
	autocmd BufNewFile,BufRead *.md nnoremap <leader>c :!pandoc -f markdown+hard_line_breaks+yaml_metadata_block "%:p" -o "%:r".pdf --template eisvogel &<CR>
	autocmd BufNewFile,BufRead *.md nnoremap <leader>p :!pandoc -f markdown+hard_line_breaks+yaml_metadata_block "%:p" -o "%:r".docx &<CR>
    autocmd BufNewFile,BufRead *.md command -nargs=0 Openpdf !open "%:r".pdf " open the corresponding PDF file
    autocmd BufNewFile,BufRead *.md nnoremap <leader>i :!open "%:r".pdf<CR> " open the corresponding PDF file

	" LaTeX also nice.
	autocmd BufNewFile,BufRead *.tex nnoremap <leader>c :!pdflatex "%:p"<CR>
	autocmd BufNewFile,BufRead *.tex nnoremap <C-e> $a\\

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
endif
