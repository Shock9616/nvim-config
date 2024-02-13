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

    -- Conform
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
})

