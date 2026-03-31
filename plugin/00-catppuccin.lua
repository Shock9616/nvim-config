--
-- catppuccin.lua
--
-- Best colourscheme ever!
--

vim.pack.add({ "https://github.com/catppuccin/nvim" })

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

-- Customize global highlight groups
local colors = require("catppuccin.palettes").get_palette(flavour)

local HlGroups = {
	FloatBorder = {
		fg = colors.overlay2,
	},
	NormalFloat = {
		bg = colors.base,
	},
	FloatTitle = {
		bg = colors.base,
	},
	RenderMarkdownInlineHighlight = {
		bg = colors.yellow,
		fg = colors.mantle,
	},
	MiniPickPrompt = {
		bg = colors.base,
	},
	MiniPickPromptCaret = {
		fg = colors.rosewater,
		bg = colors.base,
	},
	MiniPickPromptPrefix = {
		fg = colors.peach,
		bg = colors.base,
	},
	MiniPickBorderText = {
		fg = colors.mauve,
		bg = colors.base,
	},
}

for hl, color in pairs(HlGroups) do
	vim.api.nvim_set_hl(0, hl, color)
end
