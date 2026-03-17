return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            require("mason").setup()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "bashls", "pyright" },
                handlers = {
                    function(server_name)
                        local opts = { capabilities = capabilities }
                        lspconfig[server_name].setup(opts)
                    end,
                },
            })
        end
    },
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = {
				preset = 'none',
				['<Enter>'] = { 'accept', 'fallback' },
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
			},
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    },
}
