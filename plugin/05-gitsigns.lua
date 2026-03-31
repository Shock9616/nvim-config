--
-- gitsigns.lua
--
-- Sign column/blame git integration
--

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup()

vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>")
