--
-- mini-snippets.lua
--
-- Snippet engine
--

return {
	"echasnovski/mini.snippets",
	version = "*",
	config = function()
		local gen_loader = require("mini.snippets").gen_loader

		require("mini.snippets").setup({
			snippets = {
				gen_loader.from_file("~/.config/nvim/snippets/global.json"),
				gen_loader.from_lang(),
			},
		})
	end,
}
