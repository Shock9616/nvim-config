--
-- lazy.lua
--
-- Plugins!
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
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("shock.config.plugins.cmp") -- ~/.config/nvim/lua/shock/config/plugins/cmp.lua
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("shock.config.plugins.lsp") -- ~/.config/nvim/lua/shock/config/plugins/lsp.lua
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
		config = function()
			require("shock.config.plugins.rustaceanvim") -- ~/.config/nvim/lua/shock/config/plugins/rustaceanvim.lua
		end,
	},

	-- DAP
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		event = "VeryLazy",
		config = function()
			require("shock.config.plugins.dap") -- ~/.config/nvim/lua/shock/config/plugins/dap.lua
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("shock.config.plugins.treesitter") -- ~/.config/nvim/lua/shock/config/plugins/treesitter.lua
		end,
	},

	-- Visual/UI Plugins
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("shock.config.plugins.catppuccin") -- ~/.config/nvim/lua/shock/config/plugins/catppuccin.lua
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("shock.config.plugins.lualine") -- ~/.config/nvim/lua/shock/config/plugins/lualine.lua
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
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
				highlight = { "Function", "Label" },
				priority = 500,
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("shock.config.plugins.noice") -- ~/.config/nvim/lua/shock/config/plugins/noice.lua
		end,
	},

	-- Utilities
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("shock.config.plugins.conform") -- ~/.config/nvim/lua/shock/config/plugins/conform.lua
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdLineEnter" },
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("oil").setup({
				default_file_explorere = true,
				delete_to_trash = true,
				view_options = {
					show_hidden = true,
				},
			})

			vim.keymap.set("n", "<leader>fe", "<cmd>Oil<cr>", { desc = "[F]ile [E]xplorer" })
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "lazy%-lock.json" },
				},
			})

			-- Set Telescope keymaps
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live [G]rep" })
			vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "[R]ecent Files" })
			vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "[F]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "[B]uffers" })
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[T]odo Comments" })
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[H]elp Tags" })
			vim.keymap.set("n", "<leader>fc", function()
				local builtin = require("telescope.builtin")
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Neovim [C]onfig" })
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("shock.config.plugins.whichkey") -- ~/.config/nvim/lua/shock/config/plugins/whichkey.lua
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"numToStr/Navigator.nvim",
		config = function()
			vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>NavigatorLeft<cr>", { desc = "Window left", remap = true })
			vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>NavigatorDown<cr>", { desc = "Window down", remap = true })
			vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>NavigatorUp<cr>", { desc = "Window up", remap = true })
			vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>NavigatorRight<cr>", { desc = "Window right", remap = true })

			require("Navigator").setup({})
		end,
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

	-- Mac/iOS Development
	{
		"wojciech-kulik/xcodebuild.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"stevearc/oil.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = "swift",
		config = function()
			require("shock.config.plugins.xcodebuild") -- ~/.config/nvim/lua/shock/config/plugins/xcodebuild.lua
		end,
	},

	-- Other
	{
		"mrquantumcodes/configpulse",
		event = "VeryLazy",
		config = function()
			vim.cmd([[command! ConfigPulse lua require("configpulse").find_time()]])
		end,
	},
}, {
	-- Configure Lazy itself
	ui = {
		border = "rounded",
	},
})

-- Set keymap to open Lazy UI
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
