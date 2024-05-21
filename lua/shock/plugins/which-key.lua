--
-- which-key.lua
--
-- Keybindings cheat-sheet
--

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
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
				b = "+[B]uffer",
				f = "+[F]ile",
				l = {
					name = "+[L]SP",
					d = "+[D]ocument",
					w = "+[W]orkspace",
				},
				w = "+[W]indow",
				d = "+[D]ebug/[D]iagnostics",
				x = {
					name = "+[X]code",
					d = "+[D]ebug",
				},
			},
		})
	end,
}
