require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "python",
        "rust",
        "swift",
        "c",
        "cpp",
        "java",
        "javascript",
        "html",
        "css",
        "bash",
        "regex",
    };
})