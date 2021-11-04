-- nvim-lsp configuration
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
