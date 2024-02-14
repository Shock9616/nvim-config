--
-- plugins.lua
--
-- Plugin manager
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- LSP/CMP/Snippets
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Visual/UI Plugins
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			scope = {
				enabled = true,
				highlight = { "Function", "Label" },
				priority = 500,
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.rainbow_delimiters = {}
		end,
	},

	-- Conform
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Utilities
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdLineEnter" },
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"akinsho/toggleterm.nvim",
		config = true,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- Markdown
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = "markdown",
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
		config = function()
			vim.cmd("TableModeToggle")
		end,
	},

	-- Other
	{
		"andweeb/presence.nvim",
		event = "VeryLazy",
		opts = {},
	},
})
