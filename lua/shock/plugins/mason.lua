--
-- mason.lua
--
-- Package manager for lsp, dap, formatters, etc.
--

return {
	"williamboman/mason-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
				},
			},
			keys = {
				{
					"<leader>M",
					"<cmd>Mason<cr>",
					desc = "[M]ason",
				},
			},
		},
	},
	lazy = false,
	opts = {
		ensure_installed = {
			-- Python
			"basedpyright",

			-- C/C++
			"clangd",

			-- Lua",
			"lua_ls",
		},
	},
}
