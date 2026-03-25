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
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			progress = {
				enabled = false,
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
				input = {
					view = "cmdline",
				},
			},
		},
		presets = {
			bottom_search = true,
			lsp_doc_border = true,
			inc_rename = true,
		},
	},
}
