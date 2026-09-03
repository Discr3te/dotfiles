vim.pack.add({
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
		version = vim.version.range("2.*"),
		name = "gitsigns",
	},
})

local gitsigns = require("gitsigns")
gitsigns.setup({})
