--
-- blink.lua
--
-- Simple and fast autocomplete!
--

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "blink.cmp" and (kind == "install" or kind == "update") then
            vim.notify("Building blink.cmp", vim.log.levels.INFO)
            local obj = vim.system({ "cargo", "build", "--release" },
                { cwd = vim.fn.stdpath("data") .. "/site/pack/core/opt/blink.cmp" }):wait()
            if obj.code == 0 then
                vim.notify("Building blink.cmp done", vim.log.levels.INFO)
            else
                vim.notify("Building blink.cmp failed", vim.log.levels.ERROR)
            end
        end
    end
})

vim.pack.add({
    "https://github.com/saghen/blink.cmp",
    "https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
        menu = { border = "single" },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            window = { border = "single" },
        },
    },
    snippets = {
        preset = "mini_snippets",
    },
    cmdline = {
        enabled = true,
        completion = {
            menu = {
                auto_show = true,
            },
        },
    },
    signature = { window = { border = "single" } },
})

