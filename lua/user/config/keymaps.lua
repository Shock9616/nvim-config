--
-- keymaps.lua
--
-- Custom global keymaps
--

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right", remap = true })

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
vim.keymap.set("n", "<leader>fe", "<cmd>Oil<cr>", { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

-- Buffer
vim.keymap.set("n", "<leader>bf", "<cmd>lua require('conform').format()<cr>", { desc = "Format Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>ba", "ggVG", { desc = "Select All" })
vim.keymap.set("n", "<leader>bc", "zz", { desc = "Center current line" })

-- Window
vim.keymap.set("n", "<leader>wh", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>w<Up>", "<cmd>resize +10<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader>w<Down>", "<cmd>resize -10<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader>w<Left>", "<cmd>vertical resize -10<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<leader>w<Right>", "<cmd>vertical resize +10<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<leader>wq", "<cmd>:wq<cr>", { desc = "Save & Close Window" })

-- Terminal
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=50 direction=vertical<cr>", { desc = "Vertical" })
vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle" })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Window left", remap = true })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Window down", remap = true })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Window up", remap = true })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Window right", remap = true })

-- LSP
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Buffer Lsp Info" })
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Actions" })
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })

-- Debugging
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle UI" })
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dx", "<cmd>DapTerminate<cr>", { desc = "Terminate Debugger" })
vim.keymap.set("n", "<F9>", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
vim.keymap.set("n", "<F8>", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
vim.keymap.set("n", "<F7>", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dapui').open({ reset = true })<cr>", { desc = "Reset Windows" })

-- Diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle List" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfixes" })
vim.keymap.set("n", "<leader>xn", "<cmd>vim.diagnostic.get_next()", { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>xp", "<cmd>vim.diagnostic.get_prev()", { desc = "Previous Diagnostic" })

-- Git
vim.keymap.set("n", "<leader>gaa", "<cmd>Git add .<cr>", { desc = "Add all" })
vim.keymap.set("n", "<leader>gac", "<cmd>Gwrite<cr>", { desc = "Add current" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push origin main<cr>", { desc = "Push origin main" })
