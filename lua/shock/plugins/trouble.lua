--
-- trouble.lua
--
-- Nice diagnostics and quickfix list
--

return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle [D]iagnostics",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Toggle [S]ymbols",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Toggle [Q]uickfix List",
		},
		{
			"<leader>xt",
			"<cmd>Trouble todo toggle<cr>",
			desc = "Toggle [T]odo List",
		},
	},
}
