--
-- vim-table-mode.lua
--
-- Automatically formatting tables in markdown
--

return {
	"dhruvasagar/vim-table-mode",
	ft = "markdown",
	config = function()
		vim.cmd("TableModeToggle")
	end,
}
