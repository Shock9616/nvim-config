--
-- conform.lua
--
-- Setup conform for formatting
--

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "clang_format" },
        javascript = { "clang_format" },
        html = { "djlint" },
        css = { "styelint" },
        markdown = { "deno_fmt" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
