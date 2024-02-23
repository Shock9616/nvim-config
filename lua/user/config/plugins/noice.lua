--
-- noice.lua
--
-- Config for slightly prettier cmdline and search
--

require("noice").setup({
	messages = {
		enabled = false,
	},
	cmdline = {
		view = "cmdline",
		format = {
			search_down = {
				view = "cmdline",
			},
			search_up = {
				view = "cmdline",
			},
		},
	},
})
