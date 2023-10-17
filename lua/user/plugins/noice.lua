--
-- noice.lua
--
-- Cool cmdline and notifications!
--

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true, -- Use bottom cmdline for search
				command_palette = true, -- Position the cmdline and popupmenu together
				long_message_to_split = true, -- Long messages will be sent to a split
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
		require("notify").setup({
			render = "compact",
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
