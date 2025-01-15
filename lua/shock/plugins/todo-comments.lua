--
-- todo-comments.lua
--
-- Highlight todo, fixme, etc. comments
--

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "[T]odo Comments",
		},
	},
}
