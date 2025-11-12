--
-- rustowl.lua
--
-- Rust ownership and lifetime visualization
--

return {
    "cordx56/rustowl",
    version = "*",
    build = "cargo install rustowl",
    lazy = false,
    opts = {
        client = {
            on_attach = function(_, buffer)
                vim.keymap.set("n", "<leader>ro", function()
                    require("rustowl").toggle(buffer)
                end, { buffer = buffer, desc = "Toggle [R]ust[O]wl" })
            end
        }
    }
}
