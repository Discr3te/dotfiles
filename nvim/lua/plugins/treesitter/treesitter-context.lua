vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
		name = "treesitter-context",
		version = "master",
	},
})

local treesitter_context = require("treesitter-context")
treesitter_context.setup({
	enable = true,
})
