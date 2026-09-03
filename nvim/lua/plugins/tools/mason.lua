vim.pack.add({
	{
		src = "https://github.com/mason-org/mason.nvim",
		version = vim.version.range("2.*"),
		name = "mason",
	},
})

local mason = require("mason")
mason.setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

local merge_tables = function(...)
	local merged_tables = {}
	for _, currentTable in ipairs({ ... }) do
		for _, value in ipairs(currentTable) do
			table.insert(merged_tables, value)
		end
	end
	return merged_tables
end

local mason_ensure_installed = function()
	local registry = require("mason-registry")
	local lsp = {
		"lua-language-server", -- lua
		"marksman", -- Markdown
		"bash-language-server", -- bash
		"clangd", -- c
		"pyright", -- python
		"typescript-language-server", -- JS/TS
		"html-lsp", -- html
		"css-lsp", -- css
		"json-lsp", -- json
		"sqlls", -- sql
	}
	local dap = {}
	local linters = {
		"luacheck", -- lua
		"shellcheck", -- bash
		"stylelint", -- css
		"jsonlint", -- json
		"sqlfluff", -- sql
	}
	local formatters = {
		"stylua", -- lua
		"shfmt", -- bash
		"clang-format", -- c
		"prettier", -- html, css, JS/TS, json
		"sql-formatter", -- sql
	}

	local ensure_installed = merge_tables(lsp, dap, linters, formatters)

	registry.refresh(function()
		for _, tool in ipairs(ensure_installed) do
			if not registry.is_installed(tool) then
				registry.get_package(tool):install()
			end
		end
	end)
end

mason_ensure_installed()
