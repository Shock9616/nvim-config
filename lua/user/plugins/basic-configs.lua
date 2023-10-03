--
-- basic-configs.lua
--
-- For plugins with minimal/no custom configuration
--

return {
	{
		-- Automatic pairing of parens/quotes/etc.
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{
		-- Better commenting
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		-- LSP Notifications
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {},
	},
	{
		-- Git gutter
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		-- Quick file switching
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
	{
		-- Indent guides
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		-- Live preview markdown files in browser
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		-- File explorer
		"nvim-tree/nvim-tree.lua",
		opts = {},
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
		-- Better Rust support
		"simrat39/rust-tools.nvim",
		ft = "rust",
	},
	{
		-- Epic fuzzy finder
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
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
		-- Typst support
		"kaarmu/typst.vim",
		ft = "typst",
		opts = {},
	},
	{
		-- Language-specific indent width
		"tpope/vim-sleuth",
	},
}
