--
-- treesitter.lua
--
-- Better syntax highlighting/code context
--

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
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
				"javascript",
				"html",
				"css",
				"java",
				"regex",
			},
		})
	end,
}
