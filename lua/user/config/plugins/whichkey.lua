--
-- whichkey.lua
--
-- Keybindings cheat sheet
--

local wk = require("which-key")

wk.setup({
    window = {
        border = "single",
    },
    layout = {
        align = "center",
    },
})

wk.register({
    ["<leader>"] = {
        b = "+Buffer",
        f = "+File",
        l = "+LSP",
        w = "+Window",
        x = "+Diagnostics",
    },
})
