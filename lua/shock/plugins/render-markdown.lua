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
		require("render-markdown").setup({
			latex = {
				enabled = false,
			},
		})

		local colors = require("catppuccin.palettes").get_palette("macchiato")

		vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = colors.surface0 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = colors.surface0 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = colors.surface0 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = colors.surface0 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = colors.surface0 })
		vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = colors.surface0 })
		vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = colors.surface0 })
	end,
}
