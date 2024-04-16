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

-- Move to pane in Nvim or multiplexer
vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>NavigatorLeft<cr>", { desc = "Window left", remap = true })
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>NavigatorDown<cr>", { desc = "Window down", remap = true })
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>NavigatorUp<cr>", { desc = "Window up", remap = true })
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>NavigatorRight<cr>", { desc = "Window right", remap = true })

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

-- ---------- Leader Key Mappins ----------

-- Config
vim.keymap.set("n", "<leader>C", "<cmd>e ~/.config/nvim/init.lua<cr>", { desc = "Edit Config" })

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

-- File
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fe", "<cmd>Oil<cr>", { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todo comments" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fc", function()
    local builtin = require("telescope.builtin")
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim config" })

-- Buffer
vim.keymap.set("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format Buffer" })
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
vim.keymap.set("n", "<leader>wq", "<cmd>:wq<cr>", { desc = "Save and Close Window" })

-- LSP
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Buffer Lsp Info" })

-- The below mappings are only loaded when a language server is attached
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto Definition" })
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Goto References" })
        vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto Implementation" })
        vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Actions" })
        vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()", { desc = "Rename" })
        vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })
        vim.keymap.set(
            "n",
            "<leader>lds",
            "<cmd>Telescope lsp_document_symbols<cr>",
            { desc = "Search document symbols" }
        )
        vim.keymap.set(
            "n",
            "<leader>lws",
            "<cmd>Telescope lsp_workspace_symbols<cr>",
            { desc = "Search document symbols" }
        )
        -- Inlay hint mapping in ~/.config/nvim/lua/user/config/plugins/lsp.lua
    end,
})

-- DAP
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle UI" })
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dx", "<cmd>DapTerminate<cr>", { desc = "Terminate Debugger" })
vim.keymap.set("n", "<F9>", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
vim.keymap.set("n", "<F8>", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
vim.keymap.set("n", "<F7>", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dapui').open({ reset = true })<cr>", { desc = "Reset Windows" })

-- Diagnostics
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
vim.keymap.set("n", "<leader>dk", vim.diagnostic.open_float, { desc = "Show current diagnostic" })
