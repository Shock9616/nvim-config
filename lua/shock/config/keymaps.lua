--
-- keymaps.lua
--
-- Custom general keymaps (non-plugin dependant)
--

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move between buffers using <Shift> hl keys
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move selected text up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Down

-- Keep cursor in the same place when using 'J' keymap
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the center when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Open config
vim.keymap.set("n", "<leader>C", "<cmd>e ~/.config/nvim/init.lua<cr>", { desc = "Edit [C]onfig" })

-- File
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "[N]ew [F]ile" })

-- Buffer
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "[F]ormat Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "[D]elete Buffer" })
vim.keymap.set("n", "<leader>ba", "ggVG", { desc = "Select [A]ll" })
vim.keymap.set("n", "<leader>bc", "zz", { desc = "[C]enter current line" })

-- Window
vim.keymap.set("n", "<leader>w-", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>w\\", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>w<Up>", "<cmd>resize +10<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader>w<Down>", "<cmd>resize -10<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader>w<Left>", "<cmd>vertical resize -10<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<leader>w<Right>", "<cmd>vertical resize +10<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and Close Window" })

-- LSP
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Buffer Lsp [I]nfo" })

-- Diagnostics
vim.keymap.set("n", "d]", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
vim.keymap.set("n", "d[", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
vim.keymap.set("n", "dk", vim.diagnostic.open_float, { desc = "Show current diagnostic" })
