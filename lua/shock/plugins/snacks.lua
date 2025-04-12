--
-- snacks.lua
--
-- Better versions of plugins/QOL features
--

return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		bigfile = {},
		image = {
			doc = {
				enabled = true,
				inline = false,
			},
		},
		indent = {
			animate = { enabled = false },
		},
		notifier = {
			enabled = true,
			style = "compact",
			top_down = false,
		},
		picker = {
			exclude = {
				"venv/",
				"__pycache__",
			},
		},
		quickfile = {},
		scope = {
			cursor = false,
		},
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
