--
-- gitsigns.lua
--
-- Sign column/blame git integration
--

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	keys = {
		{
			"<leader>gh",
			"<cmd>Gitsigns preview_hunk<cr>",
			desc = "Preview [H]unk",
		},
		{
			"<leader>gl",
			"<cmd>Gitsigns toggle_current_line_blame<cr>",
			desc = "Toggle Current [L]ine Blame",
		},
		{
			"<leader>gb",
			"<cmd>Gitsigns blame<cr>",
			desc = "[B]lame",
		},
	},
}
