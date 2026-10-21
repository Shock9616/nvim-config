--
-- unimd.lua
--
-- All-in-one markdown editing improvements
--

vim.pack.add({
	{ src = "file:///Users/kalebrosborough/Documents/Programming/unimd-nvim/", name = "unimd" },
})

require("unimd").setup()
