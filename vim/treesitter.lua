require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", -- necessary for treesitter
        "dart", "typescript", "python", "markdown_inline", "rust", "r", "go"
    },
    sync_install = false, -- install parsers asynchronously
    auto_install = true, -- auto-install parsers when opening buffer
    highlight = {
        enable = true, -- enable syntax highlighting
        disable = function(lang, bufnr) -- prevent latency on 10MB json files
            return vim.api.nvim_buf_line_count(bufnr) > 10000
        end,
    }
}
