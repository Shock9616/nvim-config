--
-- mini-files.lua
--
-- Awesome file manager!
--

return {
	"echasnovski/mini.files",
	version = "*",
	opts = {
		mappings = {
			close = "<ESC>",
			go_in = "<S-CR>",
			go_in_plus = "<CR>",
			go_out = "-",
			go_out_plus = "_",
		},
	},
	keys = {
		{
			"<leader>fe",
			function()
				MiniFiles.open()
			end,
			desc = "[F]ile [E]xplorer",
		},
	},
}
