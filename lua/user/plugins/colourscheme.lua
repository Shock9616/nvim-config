--
-- colourscheme.lua
--
-- Custom colourscheme!
--

return {
	"Shatur/neovim-ayu",
	config = function()
		local colours = require("ayu.colors")
		colours.generate(true)

		require("ayu").setup({
			mirage = true,
			overrides = {
				LineNr = { fg = "#686868" },
			},
		})
		vim.cmd("colorscheme ayu-mirage")
	end,
}
