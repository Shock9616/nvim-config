--
-- colourscheme.lua
--
-- Custom colourscheme!
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
				nvimtree = false,
				treesitter = true,
				rainbow_delimiters = true,
				lsp_trouble = true,
				which_key = true,
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
