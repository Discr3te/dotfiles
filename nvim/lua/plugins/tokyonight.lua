vim.pack.add({
	{
		src = "https://github.com/folke/tokyonight.nvim",
		version = "main",
		name = "tokyo-night",
	},
})

local tokyonight = require("tokyonight")
tokyonight.setup({
	transparent = true,
})

vim.cmd([[colorscheme tokyonight-storm]])
