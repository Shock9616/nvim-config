--
-- noice.lua
--
-- Nicer looking cmdline, search, and notifications
--

return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	event = "VeryLazy",
	opts = {
		lsp = {
			progress = {
				enabled = true,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		cmdline = {
			view = "cmdline",
			format = {
				search_down = {
					view = "cmdline",
				},
				search_up = {
					view = "cmdline",
				},
			},
		},
		presets = {
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		messages = {
			enabled = true,
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},
}
