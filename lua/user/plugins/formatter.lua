--
-- formatter.lua
--
-- Setup language formatters
--

return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					require("formatter.filetypes.python").black,
					require("formatter.filetypes.python").isort,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				c = {
					require("formatter.filetypes.c").clang_format,
				},
				cpp = {
					require("formatter.filetypes.cpp").clang_format,
				},
				java = {
					require("formatter.filetypes.java").clang_format,
				},
				javascript = {
					require("formatter.filetypes.javascript").clang_format,
				},
				sh = {
					require("formatter.filetypes.sh").shfmt,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
