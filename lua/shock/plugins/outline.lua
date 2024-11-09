return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	opts = {
		icons = {
			File = { icon = " " },
			Namespace = { icon = " " },
			Class = { icon = " " },
			Method = { icon = "󰡱 " },
			Property = { icon = " " },
			Enum = { icon = " " },
			Interface = { icon = " " },
			Function = { icon = "󰡱 " },
			Variable = { icon = "󰫧 " },
			Constant = { icon = "󰏿 " },
			String = { icon = " " },
			Key = { icon = " " },
			Null = { icon = "󰟢 " },
			Struct = { icon = " " },
			Event = { icon = " " },
		},
	},
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
}
