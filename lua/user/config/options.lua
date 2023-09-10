--
-- options.lua
--
-- Built-in options configuration
--

-- Set keymap leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Visual options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.showmode = false -- Don't show mode bc we have a statusline
vim.opt.signcolumn = "yes" -- Always show the signcolumn
vim.opt.wrap = false -- Disable line wrap

-- General options
vim.opt.autowrite = true
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = ".nvim/undodir/"
-- vim.opt.undofile = true
-- vim.opt.undolevels = 10000
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer

vim.opt.ignorecase = true
vim.opt.smartcase = true -- don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically

vim.opt.clipboard = "unnamedplus" -- Sync w/ system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.inccommand = "nosplit" -- Preview incremental substitute
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shortmess:append({ W = true, I = true, c = true })

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count forvim.opt.formatoptions = "jcroqlnt"

vim.opt.scrolloff = 8 -- Lines of context
vim.opt.sidescrolloff = 8 -- Columns of context

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

vim.opt.splitbelow = true -- Horizontal split below current window
vim.opt.splitright = true -- Vertical split right of current window

vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.spelllang = { "en" }

-- Set python3 executable
vim.g.python3_host_prog = "~/.config/nvim/py3nvim-3.11.1/bin/python3"

-- Disable unused language providers
vim.g.loaded_perl_provider = 0
