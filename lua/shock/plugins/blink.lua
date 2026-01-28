--
-- blink.lua
--
-- Simple and fast autocomplete!
--

return {
	"saghen/blink.cmp",
	dependencies = {
		"echasnovski/mini.snippets",
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	version = "*",
	opts = {
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
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
	},
}
