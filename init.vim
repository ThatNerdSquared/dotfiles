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
Plug 'reedes/vim-pencil' " Soft wrap! 
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' } " Autocomplete code
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
Plug 'junegunn/fzf' " Quick file finding
Plug 'junegunn/fzf.vim' " Quick file finding
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'overcache/NeoSolarized'

call plug#end()

" nvim-lsp configuration
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
	snippet = {
	  expand = function(args)
		vim.fn["UltiSnips#Anon"](args.body)
	  end,
	},
	mapping = {
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.close(),
	  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
	  { name = 'nvim_lsp' },
	  { name = 'ultisnips' },
	  { name = 'buffer' },
	}
  })

  -- Setup lspconfig.
  -- Servers: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  require('lspconfig')["arduino_language_server"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require'lspconfig'.arduino_language_server.setup({
	cmd =  {
		"arduino-language-server",
		"-cli-config", "/Users/nathanyeung/Library/Arduino15/arduino-cli.yaml",
		"-cli", "/opt/homebrew/bin/arduino-cli",
		"-clangd", "/opt/homebrew/opt/llvm/bin/clangd"
	},
  })
  require('lspconfig')["bashls"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["clangd"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["cssls"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["gopls"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["html"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["jsonls"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["pyright"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["r_language_server"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["rust_analyzer"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["texlab"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["tsserver"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require('lspconfig')["vimls"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
EOF

" Plugin config

" vim-airline plugin config.
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='fruit_punch'

" Limelight plugin config.
let g:limelight_conceal_ctermfg = 254 " Solarized Base1
let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base1

" YCM plugin config.
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" ALE plugin config.
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" NvimTree plugin config.
let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 0,
	\ 'files': 0,
	\ 'folder_arrows': 0,
	\ }
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names

" Gitgutter plugin config.
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

" fzf.vim plugin config
nnoremap <C-p> :Buffers<CR>
nnoremap <C-o> :Files<CR>
nnoremap <D-p> :Buffers<CR>
nnoremap <D-o> :Files<CR>

" vimtex plugin config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips plugin config
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

" General UI config
set wrap linebreak
set list
set number
set listchars=tab:\|\ 
set tabstop=4
set shiftwidth=4


" General bindings
noremap k gk
noremap j gj
command -nargs=0 Zen Goyo | Limelight
command -nargs=0 Unzen Goyo! \| Limelight!
command -nargs=0 Focus Goyo
command -nargs=0 Unfocus Goyo!
command -nargs=0 Friendly !open -a Typora "%:p"
command -nargs=0 Einit tabedit ~/dotfiles/init.vim
if has("nvim")
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc>
endif

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


" GUI config.
set background=light
colo NeoSolarized
set termguicolors
let g:neovide_input_use_logo=v:true

" JS config.
autocmd BufNewFile,BufRead *.js nnoremap <C-/> I//<esc>

" Markdown nice.
let g:markdown_folding = 1
set foldmethod=indent
inoremap qq QUESTION: 
inoremap dff DEFINITION
inoremap exm EXAMPLE: 
inoremap exx EXCEPTION: 
inoremap hhw HOWEVER:
inoremap ccn CONCLUSION: 
autocmd BufNewFile,BufRead *.md set spell
autocmd BufNewFile,BufRead *.md nnoremap <leader>c :!pandoc "%:p" -o "%:r".pdf &<CR>
autocmd BufNewFile,BufRead *.md nnoremap <leader>p :!pandoc "%:p" -o "%:r".docx &<CR>

" LaTeX also nice.
autocmd BufNewFile,BufRead *.tex nnoremap <leader>c :!pdflatex "%:p"<CR>
autocmd BufNewFile,BufRead *.tex nnoremap <C-e> $a\\
