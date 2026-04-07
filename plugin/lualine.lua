--
-- lualine.lua
--
-- Custom statusline
--

vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local short_mode = function()
	local modes = {
		n = "N",
		i = "I",
		v = "V",
		V = "L",
		["\22"] = "B",
		c = "C",
		R = "R",
		t = "T",
	}
	local mode = vim.fn.mode()
	return modes[mode]
end

require("lualine").setup({
	options = {
		theme = "catppuccin-nvim",
		component_separators = "",
		section_separators = { left = "", right = "" },
		always_show_tabline = false,
	},
	sections = {
		lualine_a = { { short_mode, padding = { left = 1, right = 0 } } },
		lualine_b = { { "filetype", icon_only = true, padding = { left = 1, right = 0 } }, "filename" },
		lualine_c = {
			{ "branch", icon = "" },
			{ "diff", symbols = { added = " ", modified = " ", removed = " " }, colored = false },
		},
		lualine_x = {
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				update_in_insert = true,
			},
		},
		lualine_y = { "lsp_status" },
		lualine_z = {
			{
				function()
					return " "
				end,
				padding = { left = 0, right = 1 },
			},
		},
	},
})
