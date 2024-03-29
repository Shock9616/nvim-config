--
-- basic-configs.lua
--
-- For plugins with minimal/no custom configuration
--

return {
	{
		-- Better commenting
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		-- Git gutter
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		-- Nice Markdown syntax
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = "markdown",
		opts = {},
	},
	{
		-- Indent guides
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = { char = "│" },
			})
		end,
	},
	{
		-- Live preview markdown files in browser
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},
	{
		-- Clean notifications
		"vigoux/notifier.nvim",
		opts = {},
	},
	{
		"apple/pkl-neovim",
		lazy = true,
		event = "BufReadPre *.pkl",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		build = function()
			vim.cmd("TSInstall! pkl")
		end,
	},
	{
		-- File management as a buffer
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		-- Discord rich presence because why the heck not?
		"andweeb/presence.nvim",
		opts = {},
	},
	{
		-- Colour-matching parens
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.rainbow_delimiters = {}
		end,
	},
	{
		-- Automatic tables in Markdown
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
		config = function()
			vim.cmd("TableModeToggle")
		end,
	},
	{
		-- Epic fuzzy finder
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		-- Toggleable terminal
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		-- Pretty diagnostics list
		"folke/trouble.nvim",
		opts = {},
	},
	{
		-- Autopairing of parens, quotes, etc.
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {},
	},
}
