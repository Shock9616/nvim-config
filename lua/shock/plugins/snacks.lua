return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		animate = { enabled = false },
		bigfile = {},
		bufdelete = { enabled = false },
		dashboard = { enabled = false },
		debug = { enabled = false },
		dim = {},
		git = {},
		gitbrowse = { enabled = false },
		indent = {},
		input = { enabled = false },
		layout = { enabled = false },
		lazygit = { enabled = false },
		notifier = { enabled = false },
		picker = {},
		profiler = { enabled = false },
		quickfile = {},
		rename = { enabled = false },
		scope = {},
		scratch = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = {},
		terminal = { enabled = false },
		toggle = {},
		words = {},
		zen = {},
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live [G]rep",
		},
	},
}
