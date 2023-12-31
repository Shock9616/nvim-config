--
-- which-key.lua
--
-- Keybindings cheat sheet
--

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.setup({
			window = {
				border = "single",
			},
			layout = {
				align = "center",
			},
		})

		wk.register({
			["<leader>"] = {
				b = "+Buffer",
				f = "+File",
				l = "+LSP",
				t = "+Terminal",
				w = "+Window",
				x = "+Diagnostics",
				g = {
					"+Git",
					a = "+Add",
				},
				d = "+DAP",
			},
		})
	end,
}
