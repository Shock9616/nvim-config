--
-- keymaps.lua
--
-- Custom global keymaps
--

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move between buffers using <Shift> hl keys
if pcall(require, "bufferline.nvim") then
	vim.keymap.set(
		"n",
		"<S-h>",
		"<cmd>BufferLineCyclePrev<cr>",
		{ desc = "Previous buffer", noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<S-l>",
		"<cmd>BufferLineCycleNext<cr>",
		{ desc = "Next buffer", noremap = true, silent = true }
	)
else
	vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
	vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
end

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

-- Helix-like g-prefixed maps
vim.keymap.set("n", "gh", "0", { desc = "Goto line start" })
vim.keymap.set("n", "gl", "$", { desc = "Goto line end" })
vim.keymap.set("n", "gs", "^", { desc = "Goto first non-whitespace character" })

-- ---------- Leader Key Mappins ----------

-- Config
vim.keymap.set("n", "<leader>C", "<cmd>e ~/.config/nvim/init.lua<cr>", { desc = "Edit Config" })

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

-- -- File
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>", { desc = "File Explorer" })

-- Buffer
vim.keymap.set("n", "<leader>bf", "<cmd>Format<cr>", { desc = "Format Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>ba", "ggVG", { desc = "Select All" })

-- Window
vim.keymap.set("n", "<leader>wh", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<laeder>wv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>w<Up>", "<cmd>resize +10<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader>w<Down>", "<cmd>resize -10<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader>w<Left>", "<cmd>vertical resize -10<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<leader>w<Right>", "<cmd>vertical resize +10<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<leader>wq", "<cmd>:q<cr>", { desc = "Close Window" })

-- Terminal
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=50 direction=vertical<cr>", { desc = "Vertical" })
vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle" })

-- LSP
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Buffer Lsp Info" })
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Actions" })
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })

-- Diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle List" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfixes" })
vim.keymap.set("n", "<leader>xn", "<cmd>vim.diagnostic.get_next()", { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>xp", "<cmd>vim.diagnostic.get_prev()", { desc = "Previous Diagnostic" })

-- Harpoon
vim.keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark File" })
vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Quick Menu" })
vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Next File" })
vim.keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Previous File" })

vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "File 1" })
vim.keymap.set("n", "<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "File 2" })
vim.keymap.set("n", "<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "File 3" })
vim.keymap.set("n", "<leader>hf", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "File 4" })
