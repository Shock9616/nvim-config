--
-- alpha.lua
--
-- Dashboard plugin to make starup more fun
--

local alpha = require("alpha")
local headers = require("user.config.plugins.alpha.headers").portal -- ~/.config/nvim/lua/user/config/plugins/alpha/headers.lua
local quotes = require("user.config.plugins.alpha.quotes").portal -- ~/.config/nvim/lua/user/config/plugins/alpha/quotes.lua

local headerPadding = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.3) }) - 2

alpha.setup({
	layout = {
		{ type = "padding", val = headerPadding },
		{
			type = "text",
			val = headers[math.random(#headers)],
			opts = {
				position = "center",
				hl = "AlphaHeader",
			},
		},
		{ type = "padding", val = 2 },
		{
			type = "text",
			val = quotes[math.random(#quotes)],
			opts = {
				position = "center",
				hl = "AlphaHeaderLabel",
			},
		},
		{ type = "padding", val = 2 },
		{
			type = "button",
			val = "",
			on_press = function()
				-- Clear the start screen and made buffer editable
				vim.cmd("bd")
			end,
			opts = {
				position = "center",
			},
		},
	},
})

vim.cmd("autocmd FileType alpha setlocal nofoldenable")
