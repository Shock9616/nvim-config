return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		animate = { enabled = false },
		bigfile = {},
		bufdelete = { enabled = false },
		dashboard = {
			preset = {
				header = [[
• ▌ ▄ ·. ▄▄▄ .▄▄▄▄▄▄▄▄▄        ▪  ·▄▄▄▄   ▌ ▐·▪  • ▌ ▄ ·. 
·██ ▐███▪▀▄.▀·▀•██ ▀▀▄ █· ▄█▀▄ ██ ██· ██ ▪█·█▌██ ·██ ▐███▪
▐█ ▌▐▌▐█·▐▀▀▪▄  ▐█.▪▐▀▀▄ ▐█▌.▐▌▐█·▐█▪ ▐█▌▐█▐█•▐█·▐█ ▌▐▌▐█·
██ ██▌▐█▌▐█▄▄▌  ▐█▌·▐█•█▌▐█▌.▐▌▐█▌██. ██  ███ ▐█▌██ ██▌▐█▌
▀▀  █▪▀▀▀ ▀▀▀   ▀▀▀ .▀  ▀ ▀█▄▀▪▀▀▀▀▀▀▀▀• . ▀  ▀▀▀▀▀  █▪▀▀▀
]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
				{
					section = "terminal",
					cmd = "chafa ~/.config/nvim/other/rb.png --format symbols --symbols vhalf --size 50x50",
					pane = 2,
					indent = 8,
					height = 25,
				},
			},
		},
		debug = { enabled = false },
		dim = { enabled = false },
		git = { enabled = false },
		gitbrowse = { enabled = false },
		indent = {
			animate = { enabled = false },
		},
		input = { enabled = false },
		layout = { enabled = false },
		lazygit = { enabled = false },
		notifier = {
			enabled = true,
			style = "compact",
			top_down = false,
		},
		picker = {},
		profiler = { enabled = false },
		quickfile = {},
		rename = { enabled = false },
		scope = {
			cursor = false,
		},
		scratch = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		terminal = { enabled = false },
		toggle = { enabled = false },
		words = { enabled = false },
		zen = { enabled = false },
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
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "[R]ecent Files",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[F]ind [B]uffers",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "[F]ind [H]elp Tags",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Neovim [C]onfig",
		},
	},
}
