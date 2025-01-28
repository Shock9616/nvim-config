--
-- blink.lua
--
-- Simple and fast autocomplete!
--

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	opts = {
		completion = {
			menu = { border = "single" },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = { border = "single" },
			},
			ghost_text = {
				enabled = true,
			},
		},
		signature = { window = { border = "single" } },
	},
}
