--
-- conform.lua
--
-- Auto-format files
--

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_fix" },
			swift = { "swift-format" },
			rust = { "rustfmt" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			java = { "clang_format" },
			-- javascript = { "clang_format" },
			json = { "jq" },
			markdown = { "deno_fmt", "cbfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
