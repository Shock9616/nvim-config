--
-- ultimate-autopair.lua
--
-- Improved autopair for parens, brackets, quotes, etc.
--

return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdLineEnter" },
	opts = {
		cmap = false,
		pair_cmap = false,
	},
}
