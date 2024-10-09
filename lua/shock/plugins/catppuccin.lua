--
-- catppuccin.lua
--
-- Best colourscheme ever!
--

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local flavour = "macchiato"

		require("catppuccin").setup({
			flavour = flavour,
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				indent_blankline = { enabled = false },
				mason = true,
				treesitter = true,
				which_key = true,
			},
			custom_highlights = {
				ColorColumn = { bg = "#303446" },
				LspInlayHint = { bg = "#1e2030" },
			},
		})
		vim.cmd.colorscheme("catppuccin")

		-- Customizing global highlight groups
		local colors = require("catppuccin.palettes").get_palette(flavour)

		local HlGroups = {
			FloatBorder = {
				fg = colors.overlay2,
			},
		}

		for hl, color in pairs(HlGroups) do
			vim.api.nvim_set_hl(0, hl, color)
		end
	end,
}
