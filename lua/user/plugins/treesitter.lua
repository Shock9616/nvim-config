--
-- treesitter.lua
--
-- Better syntax highlighting/code context
--

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
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
					"cpp",
					"bash",
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
	},
}
