vim.pack.add({
	{
		src = "https://github.com/j-hui/fidget.nvim",
		version = "main",
		name = "fidget",
	},
})

local fidget = require("fidget")
fidget.setup({
	notification = {
		view = {
			stack_upwards = false,
		},

		window = {
			align = "bottom",
		},
	},
})
vim.notify = fidget.notify
