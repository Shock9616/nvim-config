return {
	"echasnovski/mini.files",
	version = "*",
	opts = {},
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
