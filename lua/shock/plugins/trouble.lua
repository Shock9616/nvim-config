return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>td",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[T]oggle [D]iagnostics",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "[T]oggle [S]ymbols",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "[T]oggle [Q]uickfix List",
		},
	},
}
