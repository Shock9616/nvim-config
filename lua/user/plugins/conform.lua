return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "clang_format" },
				javascript = { "clang_format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}