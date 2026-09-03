vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		version = vim.version.range("2.*"),
		name = "lspconfig",
	},
})

vim.lsp.enable({
	"lua_ls", -- Lua
	"bashls", -- Bash
	"clangd", -- C
	"marksman", -- Markdown
})
