--
-- oil.lua
--
-- Best file explorer plugin!
--

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		default_file_explorere = true,
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"<leader>fe",
			"<cmd>Oil<cr>",
			desc = "[F]ile [E]xplorer",
		},
	},
}
