--
-- init.lua
--
-- Kaleb Rosborough's Neovim Config
--

require("user.config.options")  -- ~/.config/nvim/lua/user/config/options.lua
require("user.lazy")            -- ~/.config/nvim/lua/user/lazy.lua
require("user.config.keymaps")  -- ~/.config/nvim/lua/user/config/keymaps.lua
require("user.config.autocmds") -- ~/.config/nvim/lua/user/config/autocmds.lua

if vim.g.neovide then
	require("user.config.neovide") -- ~/.config/nvim/lua/user/config/neovide.lua
end
