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
