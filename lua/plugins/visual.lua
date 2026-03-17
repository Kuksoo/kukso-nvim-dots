return {
	{ "Mofiqul/dracula.nvim" },
	{ "sainnhe/everforest" },
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
			themes = { "dracula", "everforest"},
				livePreview = true,
			})
		end
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = { "NormalFloat", "NvimTreeNormal" },
			})
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 30, side = "left" },
				filters = { dotfiles = false },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "bash", "hyprlang", "markdown", "markdown_inline", "vim", "vimdoc" },
			highlight = { enable = true },
		},
	},
	{
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        local rb = require('rainbow-delimiters')
        require('rainbow-delimiters.setup').setup({
            strategy = {
                [''] = rb.strategy['global'],
            },
            query = {
                [''] = 'rainbow-delimiters',
            },
            highlight = {
                'RainbowDelimiterYellow',
                'RainbowDelimiterViolet',
                'RainbowDelimiterGreen',
            },
        })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#EBCB8B' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#B48EAD' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen',  { fg = '#A3BE8C' })
    end,
	},
}
