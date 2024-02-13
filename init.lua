--
-- init.lua
--
-- Kaleb Rosborough's Neovim config!
--

require("user.config.options") -- ~/.config/nvim/lua/user/config/options.lua
require("user.lazy") -- ~/.config/nvim/lua/user/lazy.lua
require("user.config.plugins.lsp") -- ~/.config/nvim/lua/user/config/plugins/lsp.lua
require("user.config.plugins.treesitter") -- ~/.config/nvim/lua/user/config/plugins/treesitter.lua
require("user.config.plugins.colourscheme") -- ~/.config/nvim/lua/user/config/plugins/colourscheme.lua
require("user.config.plugins.statusbar") -- ~/.config/nvim/lua/user/config/plugins/statusbar.lua

if vim.g.neovide then
    require("user.config.neovide") -- ~/.config/nvim/lua/user/config/neovide.lua
end
