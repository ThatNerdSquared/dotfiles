local lspconfig = require('lspconfig')
local cmp = require('cmp')

vim.diagnostic.config {
    float = { width = 90, border = "rounded" },
}

-- init cmp sensibly
cmp.setup({
    window = {
        -- give these popups a fighting chance at being actually readable
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping.confirm({ select = true })
    }),
})

-- Servers from :help lspconfig-all
local lspservers = {
    'dartls',
    'tsserver',
    'eslint',
    'pyright',
    'rust_analyzer',
    'r_language_server',
    'jsonls',
    'emmet_ls',
    'cssls',
    'texlab',
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- disable snippets
capabilities.textDocument.completion.completionItem.snippetSupport = false
-- init server completions
for _, server in pairs(lspservers) do
    lspconfig[server].setup { capabilities = capabilities }
end
