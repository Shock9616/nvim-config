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
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("user.config.plugins.lsp") -- ~/.config/nvim/lua/user/config/plugins/lsp.lua
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
		config = function()
			vim.g.rustaceanvim = {
				tools = {
					float_win_config = {
						auto_focus = true,
					},
				},
			}
		end,
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.config.plugins.treesitter") -- ~/.config/nvim/lua/user/config/plugins/treesitter.lua
		end,
	},

	-- Visual/UI Plugins
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("user.config.plugins.catppuccin") -- ~/.config/nvim/lua/user/config/plugins/catppuccin.lua
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("user.config.plugins.lualine") -- ~/.config/nvim/lua/user/config/plugins/lualine.lua
		end,
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
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.g.rainbow_delimiters = {}
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("user.config.plugins.alpha") -- ~/.config/nvim/lua/user/config/plugins/alpha/init.lua
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("user.config.plugins.noice") -- ~/.config/nvim/lua/user/config/plugins/noice.lua
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("user.config.plugins.dap") -- ~/.config/nvim/lua/user/config/plugins/dap.lua
		end,
	},

	-- Utilities
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.config.plugins.conform") -- ~/.config/nvim/lua/user/config/plugins/conform.lua
		end,
	},
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
		event = "VeryLazy",
		opts = {
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("user.config.plugins.whichkey") -- ~/.config/nvim/lua/user/config/plugins/whichkey.lua
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
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
})
