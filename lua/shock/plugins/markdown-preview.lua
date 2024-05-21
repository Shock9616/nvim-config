--
-- markdown-preview.lua
--
-- Live preview of markdown files
--

return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
