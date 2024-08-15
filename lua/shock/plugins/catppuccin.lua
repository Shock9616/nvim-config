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
		require("catppuccin").setup({
			flavour = "macchiato",
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
	end,
}
