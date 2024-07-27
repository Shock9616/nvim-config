--
-- navigator.lua
--
-- Navigating between nvim and multiplexer panes
--

return {
	"numToStr/Navigator.nvim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>NavigatorLeft<cr>", { desc = "Window left", remap = true })
		vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>NavigatorDown<cr>", { desc = "Window down", remap = true })
		vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>NavigatorUp<cr>", { desc = "Window up", remap = true })
		vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>NavigatorRight<cr>", { desc = "Window right", remap = true })

		require("Navigator").setup({})
	end,
}
