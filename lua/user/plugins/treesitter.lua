--
-- treesitter.lua
--
-- Better syntax highlighting
--

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
        },
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "python",
            "rust",
            "swift",
            "c",
            "c++",
            "bash",
        }
    }
}
