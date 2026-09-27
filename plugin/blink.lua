--
-- blink.lua
--
-- Simple and fast autocomplete!
--

vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").build():pwait()
require("blink.cmp").setup({
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		menu = { border = "single" },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
			window = { border = "single" },
		},
	},
	snippets = {
		preset = "mini_snippets",
	},
	cmdline = {
		enabled = true,
		completion = {
			menu = {
				auto_show = true,
			},
		},
	},
	signature = { window = { border = "single" } },
})
