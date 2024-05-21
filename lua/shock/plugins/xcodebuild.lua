--
-- xcodebuild.lua
--
-- macOS dev tools for Neovim
--

return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"stevearc/oil.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "swift",
	config = function()
		require("xcodebuild").setup({
			code_coverage = {
				enabled = true,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle [X]codebuild [L]ogs" })
		vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build [P]roject" })
		vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build and [R]un Project" })
		vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run [T]ests" })
		vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This [T]est Class" })
		vim.keymap.set("n", "<leader>x", "<cmd>XcodebuildPicker<cr>", { desc = "Show All [X]codebuild Actions" })
		vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select [D]evice" })
		vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test [P]lan" })
		vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code [C]overage" })
		vim.keymap.set(
			"n",
			"<leader>xC",
			"<cmd>XcodebuildShowCodeCoverageReport<cr>",
			{ desc = "Show Code [C]overage Report" }
		)
		vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show [Q]uickFix List" })
	end,
}
