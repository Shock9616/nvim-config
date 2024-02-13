--
-- whichkey.lua
--
-- Keybindings cheat sheet
--

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
