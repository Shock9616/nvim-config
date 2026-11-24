--
-- comfy-line-numbers.lua
--
-- Replace relative line numbers with only left-hand numbers
--

vim.pack.add({
	"https://github.com/mluders/comfy-line-numbers.nvim",
})

require("comfy-line-numbers").setup()
