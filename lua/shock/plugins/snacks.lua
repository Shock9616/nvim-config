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
		indent = {
			animate = { enabled = false },
		},
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
		-- {
		--     "<leader>ft",
		--     function ()
		--         Snacks.picker.todo()
		--     end,
		--     desc = "[T]odo Comments",
		-- },
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
