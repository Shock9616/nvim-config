--
-- treesitter.lua
--
-- Better syntax highlighting/code context
--

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = {
				enable = true,
			},
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"python",
				"rust",
				"swift",
				"c",
				"c++",
				"bash",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
	},
}
