vim.pack.add({ {
	src = "https://github.com/mfussenegger/nvim-lint",
	version = "master",
	name = "nvim-lint",
} })

local lint = require("lint")
lint.linters_by_ft = {
	lua = { "luacheck" },
	bash = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
