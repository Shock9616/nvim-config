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
            ["cmp.entry.get_documentation"] = true,
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
        long_message_to_split = true,
        lsp_doc_border = true,
    },
    lsp = {
        progress = {
            enabled = true,
        },
    },
    messages = {
        enabled = true,
    },
    views = {
        mini = {
            win_options = {
                winblend = 0,
            },
        },
    },
})
