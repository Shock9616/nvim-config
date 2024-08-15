--
-- navigator.lua
--
-- Navigating between nvim and multiplexer panes
--

return {
	"numToStr/Navigator.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<C-h>",
			"<cmd>NavigatorLeft<cr>",
			mode = { "n", "t" },
			desc = "Window left",
		},
		{
			"<C-j>",
			"<cmd>NavigatorDown<cr>",
			mode = { "n", "t" },
			desc = "Window down",
		},
		{
			"<C-k>",
			"<cmd>NavigatorUp<cr>",
			mode = { "n", "t" },
			desc = "Window up",
		},
		{
			"<C-l>",
			"<cmd>NavigatorRight<cr>",
			mode = { "n", "t" },
			desc = "Window right",
		},
	},
}
