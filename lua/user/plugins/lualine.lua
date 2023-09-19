--
-- lualine.lua
--
-- Pretty statusline
--

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "ayu_mirage",
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "", right = "" } },
			},
			lualine_b = { "filename", "branch" },
			lualine_c = { "diff" },
			lualine_x = {
				{
					"diagnostics",
					symbols = { error = " ", warn = " ", info = " ", hint = "" },
					update_in_insert = true,
				},
			},
			lualine_y = { "filetype" },
			lualine_z = {
				{ "location", separator = { left = "", right = "" } },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		extensions = { "toggleterm", "trouble" },
	},
}
