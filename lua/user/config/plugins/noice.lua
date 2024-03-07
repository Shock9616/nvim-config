--
-- noice.lua
--
-- Config for slightly prettier cmdline and search and fancy notifications
--

require("noice").setup({
    lsp = {
        progress = { enabled = false },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    cmdline = {
        view = "cmdline",
        format = {
            search_down = {
                view = "cmdline",
            },
            search_up = {
                view = "cmdline",
            },
        },
    },
    presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true,  -- add a border to hover docs and signature help
    },
})

require("notify").setup({
    render = "compact",
    top_down = false,
    timeout = 3000,
    background_colour = "#24273a",
    max_height = function()
        return math.floor(vim.o.lines * 0.25)
    end,
    max_width = function()
        return math.floor(vim.o.columns * 0.5)
    end,
})
