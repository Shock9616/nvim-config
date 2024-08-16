--
-- bullets.lua
--
-- Autmated bullet points in markdown
--

return {
	"bullets-vim/bullets.vim",
	ft = "markdown",
	config = function()
		vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
	end,
}
