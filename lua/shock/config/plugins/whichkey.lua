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
		l = {
			name = "+LSP",
			d = "[D]ocument",
			w = "[W]orkspace",
		},
		w = "+Window",
		d = "+Debug/Diagnostics",
		x = {
			name = "+Xcode",
			d = "+Debug",
		},
	},
})
