--
-- lazy.lua
--
-- Plugins!
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("shock.plugins", {
	-- Configure Lazy itself
	ui = {
		border = "rounded",
	},
})

-- Set keymap to open Lazy UI
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "[L]azy" })
