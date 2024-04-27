--
-- colourscheme.lua
--
-- Making sure that I get all the pretty colours!
--

require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = false },
        mason = true,
        treesitter = true,
        which_key = true,
    },
    custom_highlights = {
        ColorColumn = { bg = "#303446" },
        LspInlayHint = { bg = "#1e2030" },
    },
})
vim.cmd("colorscheme catppuccin")
