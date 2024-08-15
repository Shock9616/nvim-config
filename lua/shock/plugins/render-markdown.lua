--
-- render-markdown.lua
--
-- Pretty markdown syntax
--

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	main = "render-markdown",
	ft = { "markdown" },
	opts = {},
}
