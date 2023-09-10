--
-- basic-configs.lua
--
-- For plugins with minimal/no custom configuration
--

return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {},
	},
	{
		"andweeb/presence.nvim",
		opts = {},
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {},
	},
	{
		"kaarmu/typst.vim",
		ft = "typst",
		opts = {},
	},
	{
		"tpope/vim-sleuth",
	},
}
