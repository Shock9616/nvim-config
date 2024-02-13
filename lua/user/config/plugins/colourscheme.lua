--
-- colourscheme.lua
--
-- Making sure that I get all the pretty colours!
--

require("catppuccin").setup({
    flavour = "macchiato",
    integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = false },
        mason = true,
        treesitter = true,
        rainbow_delimiters = true,
        lsp_trouble = true,
        which_key = true,
    },
})
vim.cmd("colorscheme catppuccin")
