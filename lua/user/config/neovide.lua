-- Start in home directory by default
if vim.fn.getcwd() == "/" then
	vim.cmd("cd ~")
end

-- Font Settings
vim.o.guifont = "FiraCode Nerd Font:h15"

-- Transparency settings
-- vim.g.neovide_transparency = 0.85
-- vim.g.neovide_window_blurred = true
vim.g.neovide_bgblend = true

-- Scroll Animation Length
vim.g.neovide_scroll_animation_length = 0.2

-- Refresh Rate
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5

-- Remember previous window size
vim.g.neovide_remember_window_size = true

-- Add missiong Cmd+C/V/X keybindings
vim.keymap.set("v", "<D-c>", "") -- Copy
vim.keymap.set("n", "<D-v>", "") -- Paste normal mode
vim.keymap.set("v", "<D-v>", "") -- Paste visual mode
vim.keymap.set("c", "<D-v>", "") -- Paste command mode
vim.keymap.set("i", "<D-v>", "") -- Paste insert mode
vim.keymap.set("v", "<D-x>", "") -- Cut
