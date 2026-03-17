return{
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Для иконок файлов
		config = function()
			require("bufferline").setup({
				options = {
					-- Стилизация
					style_preset = {
						require("bufferline.config").buffer_selected_bold,
					},
					-- Отображение закрывающих кнопок (X)
					close_command = "Bdelete! %d", -- Используйте Bdelete, если он у вас есть
					right_mouse_command = "Bdelete! %d",
					-- Скрывать вкладки, когда их слишком много
					offsets = {{
						filetype = "NvimTree",
						text = "File Explorer",
					separator = true,
					}},
				},
			})
		end
	},
	{
    "echasnovski/mini.pairs",
    version = "*",
    config = function()
    	require("mini.pairs").setup()
    end,
	},
}
