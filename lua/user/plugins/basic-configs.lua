--
-- basic-configs.lua
--
-- For plugins with minimal/no custom configuration
--

return {
	{
		-- Better commenting
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	-- {
	--     -- LSP Notifications
	--     "j-hui/fidget.nvim",
	--     tag = "legacy",
	--     event = "LspAttach",
	--     opts = {},
	-- },
	{
		-- Git gutter
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = "markdown",
		opts = {},
	},
	{
		-- Indent guides
		"lukas-reineke/indent-blankline.nvim",
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
		-- Better Rust support
		"simrat39/rust-tools.nvim",
		ft = "rust",
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
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
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {},
	},
}
