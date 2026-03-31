--
-- conform.lua
--
-- Auto-format files
--

vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		rust = { "rustfmt" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		java = { "clang_format" },
		json = { "jq" },
		markdown = { "deno_fmt", "injected" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		typst = { "typstyle" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>bf", function()
	require("conform").format()
end)
