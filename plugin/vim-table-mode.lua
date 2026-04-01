--
-- vim-table-mode.lua
--
-- Automatically format markdown tables
--

vim.pack.add({ "https://github.com/dhruvasagar/vim-table-mode" })

vim.keymap.set("n", "<leader>tm", "<cmd>TableModeToggle<cr>")
