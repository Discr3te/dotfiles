vim.pack.add({ {
	src = "https://github.com/windwp/nvim-ts-autotag",
	version = "main",
	name = "ts-autotag",
} })

local ts_autotag = require("nvim-ts-autotag")
ts_autotag.setup({})
