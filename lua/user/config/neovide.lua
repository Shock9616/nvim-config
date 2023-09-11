-- Start in home directory by default
if vim.fn.getcwd() == "/" then
	vim.cmd("cd ~")
end

-- Font Settings
vim.o.guifont = "FiraCode NF:h15"

-- Transparency settings
local alpha = function()
	return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.98
vim.g.neovide_background_color = "#1F2430" .. alpha()
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Scroll Animation Length
vim.g.neovide_scroll_animation_length = 0.2

-- Refresh Rate
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5

-- Remember previous window size
vim.g.neovide_remember_window_size = true
