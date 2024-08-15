--
-- which-key.lua
--
-- Keymap cheat-sheet
--

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
			notify = false,
			border = "single",
			icons = {
				mappings = false,
			},
		})

		wk.add({
			{ "<leader>b", desc = "+[B]uffer" },
			{ "<leader>f", desc = "+[F]ile" },
			{ "<leader>l", desc = "+[L]SP" },
			{ "<leader>w", desc = "+[W]indow" },
			{ "<leader>d", desc = "+[D]ebug" },
			{ "<leader>x", desc = "+Diagnosti[x]" },
		})
	end,
}
