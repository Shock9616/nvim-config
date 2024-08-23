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
	config = function()
		vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#363a4f" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#363a4f" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#363a4f" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#363a4f" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#363a4f" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#363a4f" })
	end,
}
