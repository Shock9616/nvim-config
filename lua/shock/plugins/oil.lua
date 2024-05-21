--
-- oil.lua
--
-- Best file explorer plugin!
--

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("oil").setup({
			default_file_explorere = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
		})

		vim.keymap.set("n", "<leader>fe", "<cmd>Oil<cr>", { desc = "[F]ile [E]xplorer" })
	end,
}
