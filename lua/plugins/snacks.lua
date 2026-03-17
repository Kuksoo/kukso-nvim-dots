return {
	{
		'nvim-mini/mini.nvim',
		version = '*'
	},
	{
		'nvim-mini/mini.icons',
		version = '*'
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		---@type snacks.config
		opts = {
			-- Твои существующие настройки
			gh        = { enabled = true },
			animate   = { enabled = true },
			git       = { enabled = true },
			gitbrowse = { enabled = true },
			scroll    = { enabled = true },
			debug     = { enabled = true },
			dashboard = { enabled = true },
			image     = { enabled = true },
			input     = { enabled = true },
			notifier  = { enabled = true },
			indent    = { enabled = true },

			-- Добавляем критически важные для "идеала"
			bigfile      = { enabled = true }, -- Оптимизация для тяжелых файлов
			picker       = { enabled = true }, -- Тот самый быстрый поиск
			words        = { enabled = true }, -- Подсветка одинаковых слов под курсором
			scope        = { enabled = true }, -- Визуализация текущего scope кода
			statuscolumn = { enabled = true }, -- Красивые отступы и иконки слева
		},
	},
}
