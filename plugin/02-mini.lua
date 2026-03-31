--
-- mini.lua
--
-- Config for various mini.nvim modules
--

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- mini.extra
require("mini.extra").setup()

-- mini.files
require("mini.files").setup({
	mappings = {
		close = "<ESC>",
		go_in = "<S-CR>",
		go_in_plus = "<CR>",
		go_out = "-",
		go_out_plus = "_",
	},
})

vim.keymap.set("n", "<leader>fe", function()
	MiniFiles.open()
end)

-- mini.pairs
require("mini.pairs").setup()

-- mini.pick
require("mini.pick").setup()

vim.keymap.set("n", "<leader>ff", function()
	MiniPick.builtin.files()
end)
vim.keymap.set("n", "<leader>fg", function()
	MiniPick.builtin.grep_live()
end)
vim.keymap.set("n", "<leader>fr", function()
	MiniExtra.pickers.oldfiles()
end)
vim.keymap.set("n", "<leader>fd", function()
	MiniExtra.pickers.diagnostic()
end)
vim.keymap.set("n", "<leader>fb", function()
	MiniPick.builtin.buffers()
end)
vim.keymap.set("n", "<leader>fh", function()
	MiniPick.builtin.help()
end)

vim.keymap.set("n", "gd", function()
	MiniExtra.pickers.lsp({ scope = "definition" })
end)
vim.keymap.set("n", "gi", function()
	MiniExtra.pickers.lsp({ scope = "implementation" })
end)
vim.keymap.set("n", "gr", function()
	MiniExtra.pickers.lsp({ scope = "references" })
end)
vim.keymap.set("n", "gD", function()
	MiniExtra.pickers.lsp({ scope = "type_definition" })
end)
vim.keymap.set("n", "gs", function()
	MiniExtra.pickers.lsp({ scope = "document_symbol" })
end)

-- mini.snippets
local gen_loader = require("mini.snippets").gen_loader

require("mini.snippets").setup({
	snippets = {
		gen_loader.from_file("~/.config/nvim/snippets/global.json"),
		gen_loader.from_lang(),
	},
})

-- mini.surround
require("mini.surround").setup()
