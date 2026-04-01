--
-- trouble.lua
--
-- Nice diagnostics and quickfix list
--

vim.pack.add({
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})

require("trouble").setup()

vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>")
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>")

require("todo-comments").setup()
