--
-- telescope.lua
--
-- Fuzzy finder for ANYTHING!
--

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "lazy%-lock.json" },
			},
		})

		-- Set Telescope keymaps
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live [G]rep" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "[R]ecent Files" })
		vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "[B]uffers" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[T]odo Comments" })
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[H]elp Tags" })
		vim.keymap.set("n", "<leader>fc", function()
			local builtin = require("telescope.builtin")
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Neovim [C]onfig" })
	end,
}
