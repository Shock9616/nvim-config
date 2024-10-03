--
-- telescope.lua
--
-- Fuzzy finder for ANYTHING!
--

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	opts = {
		defaults = {
			file_ignore_patterns = {
				"lazy%-lock.json",
				"venv/*",
				"%_%_pycache%_%_/*",
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "Live [G]rep",
		},
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "[R]ecent Files",
		},
		{
			"<leader>fd",
			"<cmd>Telescope diagnostics<cr>",
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			desc = "[F]ind [B]uffers",
		},
		{
			"<leader>ft",
			"<cmd>TodoTelescope<cr>",
			desc = "[T]odo Comments",
		},
		{
			"<leader>fh",
			"<cmd>Telescope help_tags<cr>",
			desc = "[F]ind [H]elp Tags",
		},
		{
			"<leader>fc",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Neovim [C]onfig",
		},
	},
}
