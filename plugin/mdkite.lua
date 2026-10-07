--
-- mdkite.lua
--
-- Live markdown preview
--

vim.pack.add({
	"https://github.com/selimacerbas/mdkite.nvim",
	"https://github.com/selimacerbas/kitehost.nvim",
})

require("mdkite").setup()
