-- Start in home directory by default
if vim.fn.getcwd() == "/" then
    vim.cmd("cd ~")
end

-- Font Settings
vim.o.guifont = "FiraCode Nerd Font:h15"

-- Transparency settings
vim.g.neovide_transparency = 0.92
vim.g.neovide_window_blurred = true
vim.g.neovide_bgblend = true

-- Scroll Animation Length
vim.g.neovide_scroll_animation_length = 0.2

-- Refresh Rate
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5

-- Remember previous window size
vim.g.neovide_remember_window_size = true

-- Disable floating window drop shadow
vim.g.neovide_floating_shadow = false

-- Add missiong Cmd+C/V/X keybindings
vim.keymap.set("v", "<D-c>", "") -- Copy
vim.keymap.set("n", "<D-v>", "") -- Paste normal mode
vim.keymap.set("v", "<D-v>", "") -- Paste visual mode
vim.keymap.set("c", "<D-v>", "") -- Paste command mode
vim.keymap.set("i", "<D-v>", "") -- Paste insert mode
vim.keymap.set("v", "<D-x>", "") -- Cut

-- Set terminal colours (Catppuccin Macchiato)
vim.g.terminal_color_0 = "#494d64"
vim.g.terminal_color_1 = "#ed8796"
vim.g.terminal_color_2 = "#a6da95"
vim.g.terminal_color_3 = "#eed49f"
vim.g.terminal_color_4 = "#8aadf4"
vim.g.terminal_color_5 = "#f5bde6"
vim.g.terminal_color_6 = "#89dceb"
vim.g.terminal_color_7 = "#b8c0e0"
vim.g.terminal_color_8 = "#5b6078"
vim.g.terminal_color_9 = "#ed8796"
vim.g.terminal_color_10 = "#a6da95"
vim.g.terminal_color_11 = "#eed49f"
vim.g.terminal_color_12 = "#8aadf4"
vim.g.terminal_color_13 = "#f5bde6"
vim.g.terminal_color_14 = "#89dceb"
vim.g.terminal_color_15 = "#a5adcb"
